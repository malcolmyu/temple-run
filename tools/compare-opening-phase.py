"""Bound screenshot phase effects without selecting production camera parameters."""
import json,hashlib
from pathlib import Path
import numpy as np
from PIL import Image,ImageDraw
root=Path(__file__).resolve().parents[1]
scope={'__file__':str(root/'tools/compare-opening-mouth.py')}
exec((root/'tools/compare-opening-mouth.py').read_text().split('a,sa=aperture(source)')[0],scope)
aperture=scope['aperture'];folder=root/'target/temple-run/analysis/reference-opening-exact'
source=folder/'013.jpg';target,source_stats=aperture(source);rows=[]
meta=json.loads((folder/'current-phase/observations.json').read_text())
for entry in meta:
 path=folder/f"current-phase/{entry['frame']}.png";mask,stats=aperture(path)
 rows.append(dict(frame=entry['frame'],elapsed=entry['state']['runElapsed'],score=entry['state']['score'],**stats,IoU=float(np.logical_and(target,mask).sum()/np.logical_or(target,mask).sum()),SHA256=hashlib.sha256(path.read_bytes()).hexdigest()))
result=dict(sourcePTS=2.703,source=source_stats,rows=rows,scope='compare one source frame against all7 current100-score frames; phase sensitivity only, not a proof of matching engine clocks',finding='best within sampled frames is a diagnostic, not an authorized parameter fit')
(folder/'phase-comparison.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result))
