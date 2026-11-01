"""Recover high-confidence native sound occurrences from the full local reference.
Audio onsets are not touch timestamps. No gameplay values are fitted or changed.
"""
import argparse,hashlib,json,subprocess
from pathlib import Path
import numpy as np
root=Path(__file__).resolve().parents[1]
p=argparse.ArgumentParser();p.add_argument('--video',type=Path,default=root/'target/temple-run/analysis/reference-media/BV1ypuKzPErT-audio.m4a');p.add_argument('--output',type=Path,default=root/'target/temple-run/analysis/reference-audio-events.json');a=p.parse_args()
rate=16000;hop=20;ff='/opt/homebrew/bin/ffmpeg'
def decode(path):
 return np.frombuffer(subprocess.check_output([ff,'-hide_banner','-loglevel','error','-i',str(path),'-ac','1','-ar',str(rate),'-f','f32le','pipe:1']),dtype='<f4').astype(float)
def bandpass(x):
 f=np.fft.rfft(x);hz=np.fft.rfftfreq(len(x),1/rate);f[(hz<350)|(hz>5000)]=0;return np.fft.irfft(f,n=len(x))
def digest(path):
 h=hashlib.sha256()
 with path.open('rb')as f:
  while chunk:=f.read(1024*1024):h.update(chunk)
 return h.hexdigest()
configs=[('jump',['gruntJump'],.78),('land',['gruntJumpLand'],.7),('stumble',['gruntTrip','monkeys'],.78),('slide',['slide'],.75),('turn',['footstepsTurn'],.75),('pickup',['bonusPickup'],.75),('splash',['splash'],.75),('splat',['splat'],.75)]
templates={};sources={}
for kind,names,threshold in configs:
 pieces=[];records=[]
 for name in names:
  path=root/f'target/temple-run/web/public/assets/audio/{name}.wav';pieces.append(decode(path));records.append(dict(file=path.name,SHA256=digest(path)))
 t=np.zeros(max(map(len,pieces)))
 for piece in pieces:t[:len(piece)]+=piece
 t=bandpass(t);t-=t.mean();templates[kind]=(t,threshold);sources[kind]=dict(seconds=len(t)/rate,threshold=threshold,files=records)
probe=json.loads(subprocess.check_output(['/opt/homebrew/bin/ffprobe','-v','error','-select_streams','a:0','-show_entries','stream=start_time,duration','-of','json',str(a.video)]))['streams'][0]
mediaStart=float(probe.get('start_time',0));declaredDuration=float(probe['duration'])
decoded=decode(a.video);decodedDuration=len(decoded)/rate
assert abs(decodedDuration-declaredDuration)<.15,f'Incomplete audio: decoded{decodedDuration}s, declared{declaredDuration}s'
x=bandpass(decoded);events=[];maxlen=max(len(v[0])for v in templates.values())
for base in range(0,len(x),hop*rate):
 block=x[base:min(len(x),base+hop*rate+maxlen)];energy=np.r_[0,np.cumsum(block*block)]
 for kind,(t,threshold)in templates.items():
  n=len(t)
  if len(block)<n:continue
  fft=1<<(len(block)+n-1).bit_length();c=np.fft.irfft(np.fft.rfft(block,fft)*np.fft.rfft(t[::-1],fft),fft)[n-1:len(block)]
  norm=np.sqrt(np.maximum(1e-15,(energy[n:]-energy[:-n])*np.sum(t*t)));q=(c/norm)[:min(hop*rate,len(c))];indices=np.flatnonzero(q>=threshold);accepted=[]
  separation=int(rate*max(.12,min(.75,n/rate*.35)))
  for i in indices[np.argsort(-q[indices])]:
   if any(abs(int(i)-j)<separation for j in accepted):continue
   accepted.append(int(i));events.append(dict(kind=kind,audioSecond=mediaStart+(base+int(i))/rate,ncc=float(q[i])))
 print('analysed',round(base/rate,1),'events',len(events),flush=True)
events.sort(key=lambda r:r['audioSecond']);counts={k:sum(r['kind']==k for r in events)for k in templates}
checks=[]
for kind,second in [('jump',9.7154375),('jump',18.974125),('stumble',7.454125),('stumble',20.2114375)]:
 near=[r for r in events if r['kind']==kind and abs(r['audioSecond']-second)<.01];checks.append(dict(kind=kind,knownSecond=second,recovered=near,passed=bool(near)))
result=dict(bvid='BV1ypuKzPErT',sourceMediaSHA256=digest(a.video),sourceVariant='Bilibili DASH30280, cid30965762531',mediaStart=mediaStart,declaredDuration=declaredDuration,decodedDuration=decodedDuration,integrityPassed=True,sampleRate=rate,duration=len(x)/rate,method='350..5000Hz FFT normalized waveform correlation,20s hops with template halo; positive peaks above per-template thresholds; nonmax suppression',templates=sources,counts=counts,positiveControls=checks,events=events,caveats=['audio-video latency is not removed','audio events are not touch timestamps; hidden repeated inputs may be silent/rejected','thresholded detection can miss quiet/mixed effects; absence is not proof of no action','footstepsTurn and collision effects do not by themselves identify a collider or turn gesture','all runs/menu transitions in the full recording are included'])
a.output.write_text(json.dumps(result,indent=2)+'\n');assert all(r['passed']for r in checks);print('COUNTS',counts)
