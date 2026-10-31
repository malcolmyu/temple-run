"""Read10FPS opening samples using the verified HUD glyph matcher, no temporal score edits."""
import importlib.util,json,sys
from pathlib import Path
root=Path(__file__).resolve().parents[1];spec=importlib.util.spec_from_file_location('reference_scores',root/'tools/read-reference-scores.py');mod=importlib.util.module_from_spec(spec);spec.loader.exec_module(mod)
folder=Path(sys.argv[1]);rows=[]
for i,path in enumerate(sorted(folder.glob('[0-9][0-9][0-9].jpg'))):
 value,anchor,chars=mod.read(path);confidence=min((c[1]for c in chars),default=0)
 rows.append(dict(videoSecond=round(1.5+i*.1,3),frame=path.name,score=value,confidence=confidence,review=[]if value is not None and value%20==0 and confidence>=.8 else['review']))
(root/'target/temple-run/analysis/opening-score-timing.json').write_text(json.dumps(dict(source='BV1ypuKzPErT',sampleRate=10,clipSeek=1.5,frameTimestampConvention='fps samples are centred in.1s bins; +/-.05s phase remains',observations=rows),indent=2)+'\n')
print('samples',len(rows),'flagged',sum(bool(r['review'])for r in rows));print([(r['videoSecond'],r['score'],round(r['confidence'],2))for r in rows[:35]])
