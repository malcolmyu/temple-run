"""Read a persisted fixed-rate video window with raw glyph matches and frame hashes."""
import argparse,importlib.util,json,hashlib
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('frames',type=Path);p.add_argument('output',type=Path);p.add_argument('--start',type=float,required=True);p.add_argument('--fps',type=float,default=10);a=p.parse_args()
root=Path(__file__).resolve().parents[1];spec=importlib.util.spec_from_file_location('glyph_reader',root/'tools/read-reference-scores.py');mod=importlib.util.module_from_spec(spec);spec.loader.exec_module(mod)
rows=[]
for i,path in enumerate(sorted(a.frames.glob('[0-9][0-9][0-9].jpg'))):
 value,anchor,chars=mod.read(path);confidence=min((c[1]for c in chars),default=0)
 rows.append(dict(videoSecond=round(a.start+i/a.fps,4),score=value,confidence=confidence,frame=path.name,SHA256=hashlib.sha256(path.read_bytes()).hexdigest()))
a.output.write_text(json.dumps(dict(bvid='BV1ypuKzPErT',sampleRate=a.fps,seekSecond=a.start,timestampUncertaintySeconds=.5/a.fps,method='raw NCC; no temporal correction',observations=rows),indent=2)+'\n');print('Read',len(rows),'frames')
