"""Decode actual selected video frames and retain exact PTS; no fps-filter resampling."""
import subprocess,json,hashlib,importlib.util
from pathlib import Path
from PIL import Image,ImageDraw
root=Path(__file__).resolve().parents[1]
video=root/'target/temple-run/analysis/reference-media/BV1ypuKzPErT-video.m4s'
out=root/'target/temple-run/analysis/reference-opening-exact';out.mkdir(exist_ok=True)
probe=json.loads(subprocess.check_output(['/opt/homebrew/bin/ffprobe','-v','error','-select_streams','v:0','-read_intervals','%+12','-show_frames','-show_entries','frame=best_effort_timestamp_time','-of','json',str(video)]))
frames=[(i,float(f['best_effort_timestamp_time']))for i,f in enumerate(probe['frames'])]
selected=[(i,t)for i,t in frames if 1.5<=t<=10.5 and i%3==0]
subprocess.run(['/opt/homebrew/bin/ffmpeg','-v','error','-y','-i',str(video),'-vf',"select='between(t,1.5,10.5)*not(mod(n,3))',scale=414:896",'-fps_mode','passthrough','-frames:v',str(len(selected)),str(out/'%03d.jpg')],check=True)
spec=importlib.util.spec_from_file_location('glyph_reader',root/'tools/read-reference-scores.py');mod=importlib.util.module_from_spec(spec);spec.loader.exec_module(mod)
rows=[]
for seq,(index,pts)in enumerate(selected,1):
 path=out/f'{seq:03d}.jpg';value,anchor,chars=mod.read(path);confidence=min((c[1]for c in chars),default=0)
 rows.append(dict(frameIndex=index,PTS=pts,file=path.name,SHA256=hashlib.sha256(path.read_bytes()).hexdigest(),score=value,confidence=confidence))
record=dict(source='BV1ypuKzPErT',videoSHA256=hashlib.sha256(video.read_bytes()).hexdigest(),selection='actual decoder frames n%3==0, 1.5<=PTS<=10.5; no fps interpolation',timestampConvention='ffprobe best_effort_timestamp_time, exact to demux timebase',observations=rows)
(out/'observations.json').write_text(json.dumps(record,indent=2)+'\n')
# Readable opening contact sheet, a subset only; every selected frame remains above.
shown=rows[::5];sheet=Image.new('RGB',(207*6,468*((len(shown)+5)//6)),(24,24,24));draw=ImageDraw.Draw(sheet)
for j,row in enumerate(shown):
 x=j%6*207;y=j//6*468;sheet.paste(Image.open(out/row['file']).resize((207,448)),(x,y+20));draw.text((x+3,y+3),f"{row['PTS']:.4f}s score={row['score']}",fill='white')
sheet.save(out/'contact.jpg',quality=90)
print(json.dumps({'frames':len(rows),'firstNonzero':next((r for r in rows if r['score']and r['confidence']>.8),None),'last':rows[-1]}))
# Full-rate evidence around the visible 0 -> 100 transition, not a decimated inference.
fine=[(i,t)for i,t in frames if 2.5<=t<=2.85]
folder=out/'first-score';folder.mkdir(exist_ok=True)
subprocess.run(['/opt/homebrew/bin/ffmpeg','-v','error','-y','-i',str(video),'-vf',"select='between(t,2.5,2.85)',scale=414:896",'-fps_mode','passthrough','-frames:v',str(len(fine)),str(folder/'%03d.jpg')],check=True)
contact=Image.new('RGB',(414,len(fine)*60));draw=ImageDraw.Draw(contact);fine_rows=[]
for seq,(index,pts)in enumerate(fine,1):
 path=folder/f'{seq:03d}.jpg';value,anchor,chars=mod.read(path)
 fine_rows.append(dict(frameIndex=index,PTS=pts,score=value,file=path.name,SHA256=hashlib.sha256(path.read_bytes()).hexdigest()))
 contact.paste(Image.open(path).crop((280,105,414,160)),(180,(seq-1)*60))
 draw.text((3,(seq-1)*60+15),f'frame {index}: {pts:.6f}s',fill='white')
contact.save(out/'first-score-contact.png')
(folder/'observations.json').write_text(json.dumps(dict(videoSHA256=record['videoSHA256'],selection='all source frames 2.5<=PTS<=2.85',observations=fine_rows),indent=2)+'\n')
