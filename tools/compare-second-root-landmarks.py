"""Fixed, manually selected bent-root ROIs; no translation/scale optimization."""
from pathlib import Path
from PIL import Image
import numpy as np,json
root=Path(__file__).resolve().parents[1];rows=[]
for time,roi in [(18,(220,265,277,340)),(19,(260,420,310,560))]:
 source=np.asarray(Image.open(root/f'docs/screenshots/BV1ypuKzPErT/{time:03}.jpg').convert('RGB').crop(roi),dtype=float).mean(2);source-=source.mean()
 for distance in [360,363,366,369]:
  candidate=np.asarray(Image.open(root/f'docs/screenshots/second-root-right-{time}-{distance}.png').convert('RGB').resize((414,896)).crop(roi),dtype=float).mean(2);candidate-=candidate.mean()
  score=float((candidate*source).sum()/np.sqrt((candidate*candidate).sum()*(source*source).sum()))
  rows.append(dict(time=time,root=distance,ROI=roi,NCC=score))
(root/'target/temple-run/analysis/second-root-fixed-landmark-check.json').write_text(json.dumps(dict(scope='manual fixed image ROIs, approximate tilt/pose; landmark only, not full scene similarity',results=rows),indent=2)+'\n')
print(rows)
