"""Export actual decoded source frames, exact PTS and body contact sheet for pose review."""
from pathlib import Path
import argparse,subprocess,json,hashlib
from PIL import Image,ImageDraw
p=argparse.ArgumentParser();p.add_argument('start',type=float);p.add_argument('end',type=float);p.add_argument('--name',required=True);p.add_argument('--stride',type=int,default=1);a=p.parse_args()
root=Path(__file__).resolve().parents[1];video=root/'target/temple-run/analysis/reference-media/BV1ypuKzPErT-video.m4s';out=root/'target/temple-run/analysis'/a.name;out.mkdir(exist_ok=True)
probe=json.loads(subprocess.check_output(['/opt/homebrew/bin/ffprobe','-v','error','-select_streams','v:0','-show_frames','-show_entries','frame=best_effort_timestamp_time','-of','json',str(video)]))
selected=[(i,float(f['best_effort_timestamp_time']))for i,f in enumerate(probe['frames'])if a.start<=float(f['best_effort_timestamp_time'])<=a.end and i%a.stride==0]
subprocess.run(['/opt/homebrew/bin/ffmpeg','-v','error','-y','-i',str(video),'-vf',f"select='between(t,{a.start},{a.end})*not(mod(n,{a.stride}))',scale=414:896",'-fps_mode','passthrough','-frames:v',str(len(selected)),str(out/'%03d.png')],check=True)
rows=[];cols=6;sheet=Image.new('RGB',(cols*180,((len(selected)+cols-1)//cols)*350),(20,20,20));draw=ImageDraw.Draw(sheet)
for j,(index,pts)in enumerate(selected,1):
 file=out/f'{j:03}.png';rows.append(dict(frameIndex=index,PTS=pts,file=file.name,SHA256=hashlib.sha256(file.read_bytes()).hexdigest()))
 image=Image.open(file).crop((90,420,330,880));image.thumbnail((180,325));x=(j-1)%cols*180;y=(j-1)//cols*350;sheet.paste(image,(x,y+22));draw.text((x+3,y+3),f'{index}: {pts:.6f}',fill='white')
sheet.save(out/'contact.png');(out/'observations.json').write_text(json.dumps(dict(videoSHA256=hashlib.sha256(video.read_bytes()).hexdigest(),selection=f'source frames {a.start}..{a.end}, n modulo{a.stride}=0; no interpolation',crop=[90,420,330,880],observations=rows),indent=2)+'\n');print(out, len(rows))
