"""Compare diagnostic runtime samples to raw source HUD observations without modifying either."""
from pathlib import Path
import json,hashlib
root=Path(__file__).resolve().parents[1];screens=root/'docs/screenshots';analysis=root/'target/temple-run/analysis'
source=json.loads((analysis/'reference-score-observations.json').read_text());observed={r['second']:r for r in source['observations']};cases={}
for name,file in [('baseline','opening-source-actions.json'),('leftSwipeHypothesis','opening-swipe-hypothesis-left.json'),('rightSwipeHypothesis','opening-swipe-hypothesis-right.json')]:
 path=screens/file;run=json.loads(path.read_text());rows=[]
 for r in run['rows']:
  ref=observed.get(r['videoSecond']);
  if not ref or ref['score']is None:continue
  rows.append(dict(videoSecond=r['videoSecond'],runtimeScore=r['state']['score'],sourceScore=ref['score'],sourceConfidence=ref['confidence'],scoreResidual=r['state']['score']-ref['score'],runtimeCoins=r['state']['coins']))
 cases[name]=dict(runtimeFile=str(path.relative_to(root)),SHA256=hashlib.sha256(path.read_bytes()).hexdigest(),hypothesis=run.get('hypothesis'),rows=rows,finalState=run['state'])
out=dict(scope='opening only; source-constrained diagnostic controls, not original touch recording',cases=cases,limits=['sample phase up to1/60s plus raw1fps source image phase','all source HUD reads retain confidence and no smoothing','left swipe collects6 coins under current fitted pickup layout, inconsistent with source0 but not proof of actual right swipe','neither candidate recovers exact second-stumble score/lateral trajectory','later route/power/results not replayed after coordinate revision'])
(analysis/'opening-source-alignment-comparison.json').write_text(json.dumps(out,indent=2)+'\n');print({k:next((r for r in v['rows']if r['videoSecond']==21),None)for k,v in cases.items()})
