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
estimated_world = 0
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
        travel = math.sqrt(48 * delta * dt)
        estimated_world += travel
        row.update(progressDelta=delta, intervalSeconds=dt,
                   estimatedRmsWorldSpeed=travel/dt,
                   constantSpeedTravelEstimate=travel)
    row['cumulativeConstantSpeedWorldEstimate'] = estimated_world
    rows.append(row)
    previous = row
assert rows[-1]['score'] == 47240
assert rows[-1]['progress'] == 2312
output = dict(
    bvid='BV1ypuKzPErT',
    scoreObservations=str(source.relative_to(ROOT)),
    inferredAwards=[dict(videoSecond=t, points=p) for t,p in inferred_awards.items()],
    endScreen=dict(image='263.jpg', score=47240, distance=2312, multiplier=20, coins=0),
    assumptions=[
        'native power pickup score25 x multiplier20 =500 verified; event seconds146/182 inferred',
        'score multiplier20 throughout; integer progress quantization remains',
        'smoothDeltaTime approximates actual frame time',
        'constant speed within each one-second interval for travel estimates',
        'RMS speed does not recover turns, acceleration or exact physical path length',
        'do not use these estimates as exact obstacle coordinates'],
    observations=rows)
path = ROOT / 'target/temple-run/analysis/reference-progress-calibration.json'
path.write_text(json.dumps(output, indent=2)+'\n')
runtime = ROOT / 'target/temple-run/web/src/game/referenceWorldCalibration.json'
runtime.write_text(json.dumps(dict(
    source='BV1ypuKzPErT score observations + recovered native progress formula',
    status='estimated physical authoring coordinates; constant speed per sampled interval, not exact source path geometry',
    knots=[[row['score']/20,round(row['cumulativeConstantSpeedWorldEstimate'],6)] for row in rows],
),separators=(',',':'))+'\n')
print(f'{len(rows)} frames; final progress {rows[-1]["progress"]}; '
      f'constant-speed world estimate {estimated_world:.3f}')
