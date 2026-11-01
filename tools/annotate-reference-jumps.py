"""Preserve manually reviewed visual jump intervals; no inference of exact touch input."""
import json,hashlib
from pathlib import Path
from PIL import Image,ImageDraw
root=Path(__file__).resolve().parents[1];frames=root/'docs/screenshots/BV1ypuKzPErT/first-jumps-10fps';scores=json.loads((root/'target/temple-run/analysis/first-jumps-score-timing.json').read_text());lookup={r['videoSecond']:r for r in scores['observations']};paths=sorted(frames.glob('*.jpg'));assert len(paths)==80
for p,r in zip(paths,scores['observations']):assert Image.open(p).size==(414,896)and hashlib.sha256(p.read_bytes()).hexdigest()==r['SHA256']
intervals=[dict(obstacle='first treeJump',visualTakeoffBracket=[15,15.1],visualLandingBracket=[15.6,15.8],evidenceSeconds=[15,15.1,15.3,15.5,15.7,15.8],confidence='takeoff high; landing medium due enemy occlusion'),dict(obstacle='second treeJump',visualTakeoffBracket=[18.7,18.8],visualLandingBracket=[19.5,19.7],evidenceSeconds=[18.7,18.8,19.1,19.3,19.5,19.7],confidence='takeoff high; landing medium due slide transition')]
intervals.insert(1,dict(obstacle='jump during second corner, not a root crossing',visualTakeoffBracket=[17.1,17.3],visualLandingBracket=[17.8,18.1],evidenceSeconds=[17.1,17.2,17.3,17.5,17.8,18.1],confidence='airborne17.3..17.7 high; exact takeoff/landing medium during camera rotation'))
for row in intervals:row['scoreEvidence']=[lookup[t]for t in row['evidenceSeconds']]
record=dict(bvid='BV1ypuKzPErT',seekSecond=13,sampleRate=10,timestampUncertaintySeconds=.05,frameDirectory=str(frames.relative_to(root)),intervals=intervals,caveats=['These are visually observed pose transitions, not timestamps of invisible touch events.','Short upright transitions13.3/14.1/18.0 between slides are not labelled airborne without visible foot clearance.','Enemy occlusion and camera jump follow make exact landing frames uncertain.','Source scores remain raw NCC readings with confidence, not corrected against expected motion.','Source-input world coordinates must not be inferred solely from currently approximate physical route calibration.'])
(root/'target/temple-run/analysis/reference-first-jump-actions.json').write_text(json.dumps(record,indent=2)+'\n')
for label,offset in [('first',0),('turn',30),('second',50)]:
 out=Image.new('RGB',(825,1428),(25,25,25));draw=ImageDraw.Draw(out)
 for k in range(min(30,len(paths)-offset)):
  i=k+offset;im=Image.open(paths[i]).crop((0,340,414,870)).resize((165,212));x=k%5*165;y=k//5*238;out.paste(im,(x,y+24));draw.text((x+5,y+5),f'{13+i*.1:.1f}s',fill='white')
 out.save(root/f'docs/screenshots/BV1ypuKzPErT/{label}-jump-10fps-contact.png')
print('Verified80 frame hashes; exported3 reviewed jump intervals and contact sheets.')
