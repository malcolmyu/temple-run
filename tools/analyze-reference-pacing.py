"""Quantify recorded score-rate changes and replay-policy confounds; no gameplay calibration."""
import json,hashlib
from pathlib import Path
import numpy as np
root=Path(__file__).resolve().parents[1];folder=root/'target/temple-run/analysis'
raw=json.loads((folder/'second-root-exit-score-timing.json').read_text());rows=[r for r in raw['observations']if r['score']is not None and r['confidence']>=.7 and r['score']%20==0 and r['videoSecond']<=23]
x=np.array([r['videoSecond']for r in rows]);y=np.array([r['score']for r in rows]);candidates=[]
for knot in np.arange(19.7,20.601,.01):
 X=np.column_stack([np.ones(len(x)),x-20,np.maximum(0,x-knot)]);coef=np.linalg.lstsq(X,y,rcond=None)[0];rmse=float(np.sqrt(np.mean((X@coef-y)**2)));pre=float(coef[1]);post=float(coef[1]+coef[2]);candidates.append(dict(changeSecond=float(knot),rmsePoints=rmse,beforePointsPerSecond=pre,afterPointsPerSecond=post,beforeRmsSpeed=float(np.sqrt(48*pre/20)),afterRmsSpeed=float(np.sqrt(48*post/20))))
best=min(candidates,key=lambda r:r['rmsePoints']);result=dict(source='BV1ypuKzPErT',observations=len(rows),method='continuous two-line least squares across19.5..23.0; raw20-point quantization retained; knot grid.01s is not source timestamp precision',best=best,caveats=['video fps-bin uncertainty +/- .05s','native distance formula assumes smoothDeltaTime follows actual frame step','rate change does not identify its gameplay cause','trip vocal alone is weak, but simultaneous gruntTrip+monkeys composite matches.954 at20.211s; event cause and audio/video latency remain unresolved'])
(folder/'reference-pacing-change-point.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
# Reviewed visual first-corner jump; hash every supporting still.
corner=json.loads((folder/'first-corner-score-timing.json').read_text());record=dict(bvid=corner['bvid'],seekSecond=9,sampleRate=10,timestampUncertaintySeconds=.05,frameDirectory='docs/screenshots/BV1ypuKzPErT/first-corner-10fps',visualTakeoffBracket=[9.4,9.5],visualLandingBracket=[10.2,10.4],evidence=corner['observations'],audioJumpOnset=9.7154375,audioJumpCorrelation=.9017100081,caveats=['visible jump across first right corner; no obstacle jump is required there','audio onset is later than visual onset; do not use it directly as touch timestamp','world179 in diagnostic replay is an estimated action coordinate, not recovered input'])
(folder/'reference-first-corner-jump.json').write_text(json.dumps(record,indent=2)+'\n')

# Pair detected jump/land effects without inventing missing landing events.
audio=json.loads((folder/'reference-audio-events.json').read_text());jumps=[e for e in audio['events']if e['kind']=='jump'];lands=[e for e in audio['events']if e['kind']=='land'];pairs=[];missing=[]
for i,jump in enumerate(jumps):
 hi=min(jump['audioSecond']+1.2,jumps[i+1]['audioSecond']if i+1<len(jumps)else 999)
 candidates=[land for land in lands if jump['audioSecond']+.12<=land['audioSecond']<hi]
 if candidates:pairs.append(dict(jump=jump['audioSecond'],land=candidates[0]['audioSecond'],duration=candidates[0]['audioSecond']-jump['audioSecond']))
 else:missing.append(jump['audioSecond'])
(folder/'reference-jump-land-pairs.json').write_text(json.dumps(dict(source='reference-audio-events.json',pairs=pairs,unmatchedJumps=missing,caveat='missing land sound is not proof of missing landing; pair windows are diagnostic'),indent=2)+'\n')

pickupTimes=[e['audioSecond']for e in audio['events']if e['kind']=='pickup'];stumbles=[e for e in audio['events']if e['kind']=='stumble'];windows=[dict(start=t,end=t+25)for t in pickupTimes]
inside=[dict(**e,shieldIndex=i+1)for e in stumbles for i,w in enumerate(windows)if w['start']<e['audioSecond']<w['end']]
(folder/'reference-stumbles-and-shields.json').write_text(json.dumps(dict(source='reference-audio-events.json',shieldWindows=windows,stumblesDuringShield=inside,minStumbleSpacing=min(b['audioSecond']-a['audioSecond']for a,b in zip(stumbles,stumbles[1:])),basis='two pickups visually verified as25-second shields; fixed audio/video latency cancels in interval inclusion',inference='ordinary shield-suppressed obstacle/landing collisions cannot alone explain these events; failed swipe input remains a supported mechanism, exact gestures unobserved'),indent=2)+'\n')
