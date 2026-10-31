"""Separate recorded score from native progress; estimate motion with explicit assumptions."""
import json, math
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
source = ROOT / 'target/temple-run/analysis/reference-score-observations.json'
observations = json.loads(source.read_text())['observations']
# Two exceptional increments contain 500 points beyond the surrounding rate.
# Their sum also reconciles the independently visible final distance: 2,312.
# Award amount is now verified in BonusItem.Instantiate + AddScore.
# Event timing/type is still inferred from the sampled score increments.
inferred_awards = {146: 500, 182: 500}
rows = []
bonus = 0
estimated_world = -2
# Initial100 is reset-position scoring, not traversal of the road.
initial_score_frames=json.loads((ROOT/'target/temple-run/analysis/reference-opening-exact/first-score/observations.json').read_text())
release_second=next(r['PTS']for r in initial_score_frames['observations']if r['score']==100)
spawn_progress = 5.0
initial_anchor = None
previous = None
for observation in observations:
    score = observation['score']
    if score is None:
        continue
    second = observation['second']
    bonus += inferred_awards.get(second, 0)
    progress = (score - bonus) / 20
    row = dict(videoSecond=second, gameSecond=second-2, score=score,
               inferredCumulativeAward=bonus, progress=progress,
               glyphConfidence=observation['confidence'])
    if previous:
        dt = second - previous['videoSecond']
        delta = progress - previous['progress']
        assert delta >= 0
        # RMS speed from the recovered native formula. Constant speed and
        # smoothDt matching frame time are assumptions, not source facts.
        if previous['videoSecond'] == 2 and second == 3:
            active_dt=second-release_second
            # HUD truncates progress to integers. Use interval midpoint and retain bounds.
            motion_min=progress-spawn_progress
            motion_max=progress+1-spawn_progress
            travel=math.sqrt(48*(motion_min+motion_max)/2*active_dt)
            initial_anchor=dict(releaseVideoSecond=release_second,spawnProgress=spawn_progress,
                spawnPhysicalPosition=-2,activeSeconds=active_dt,motionProgressBounds=[motion_min,motion_max],
                physicalPositionBounds=[-2+math.sqrt(48*p*active_dt)for p in [motion_min,motion_max]],
                status='conditional60Hz spawn metric and approximately constant speed over first active fraction; midpoint estimate')
            row['initialAnchor']=initial_anchor
        else:
            travel = math.sqrt(48 * delta * dt)
        estimated_world += travel
        row.update(progressDelta=delta, intervalSeconds=dt,
                   estimatedRmsWorldSpeed=travel/(initial_anchor['activeSeconds'] if previous['videoSecond']==2 and second==3 else dt),
                   constantSpeedTravelEstimate=travel)
    row['cumulativeConstantSpeedWorldEstimate'] = estimated_world
    rows.append(row)
    previous = row
assert rows[-1]['score'] == 47240
assert rows[-1]['progress'] == 2312
output = dict(
    bvid='BV1ypuKzPErT',
    scoreObservations=str(source.relative_to(ROOT)),
    initialAnchor=initial_anchor,
    inferredAwards=[dict(videoSecond=t, points=p) for t,p in inferred_awards.items()],
    endScreen=dict(image='263.jpg', score=47240, distance=2312, multiplier=20, coins=0),
    assumptions=[
        'native power pickup score25 x multiplier20 =500 verified; event seconds146/182 inferred',
        'score multiplier20 throughout; integer progress quantization remains',
        'smoothDeltaTime approximates actual frame time',
        'constant speed within each one-second interval for travel estimates',
        'initial100 reset-position progress removed from road traversal; first active fraction starts at exact first100-score PTS2.703; quantization midpoint with bounds',
        'RMS speed does not recover turns, acceleration or exact physical path length',
        'do not use these estimates as exact obstacle coordinates'],
    observations=rows)
path = ROOT / 'target/temple-run/analysis/reference-progress-calibration.json'
path.write_text(json.dumps(output, indent=2)+'\n')
runtime = ROOT / 'target/temple-run/web/src/game/referenceWorldCalibration.json'
runtime.write_text(json.dumps(dict(
    source='BV1ypuKzPErT score observations + recovered native progress formula',
    status='estimated physical authoring coordinates; constant speed per sampled interval, not exact source path geometry',
    initialAnchor=initial_anchor,
    knots=[[row['score']/20,0 if row['score']==0 else round(row['cumulativeConstantSpeedWorldEstimate'],6)] for row in rows],
),separators=(',',':'))+'\n')
print(f'{len(rows)} frames; final progress {rows[-1]["progress"]}; '
      f'constant-speed world estimate {estimated_world:.3f}')
