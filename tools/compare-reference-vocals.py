"""Waveform-match native vocals in a local reference window; no inferred gameplay edits."""
import json,subprocess,argparse
from pathlib import Path
import numpy as np
p=argparse.ArgumentParser();p.add_argument('--start',type=float,default=18.5);p.add_argument('--duration',type=float,default=6);p.add_argument('--output',default='second-root-exit-vocal-match.json');args=p.parse_args()
root=Path(__file__).resolve().parents[1];rate=16000;start=args.start;duration=args.duration
ff='/opt/homebrew/bin/ffmpeg'
def samples(path,offset=None,length=None):
 args=[ff,'-hide_banner','-loglevel','error']
 if offset is not None:args+=['-ss',str(offset)]
 args+=['-i',str(path)]
 if length is not None:args+=['-t',str(length)]
 return np.frombuffer(subprocess.check_output(args+['-ac','1','-ar',str(rate),'-f','f32le','pipe:1']),dtype='<f4').astype(float)
def filtered(a):
 f=np.fft.rfft(a);freq=np.fft.rfftfreq(len(a),1/rate);f[(freq<350)|(freq>5000)]=0;return np.fft.irfft(f,n=len(a))
x=filtered(samples('/tmp/temple-reference.mp4',start,duration));result={}
for name in ['gruntTrip','gruntJump','gruntJumpLand','monkeys','monkeyRoar','gruntTrip+monkeys']:
 pieces=[samples(root/f'target/temple-run/web/public/assets/audio/{part}.wav')for part in name.split('+')]
 mixed=np.zeros(max(map(len,pieces)))
 for piece in pieces:mixed[:len(piece)]+=piece
 t=filtered(mixed);t-=t.mean();n=len(t);fft=1<<(len(x)+n-1).bit_length();corr=np.fft.irfft(np.fft.rfft(x,fft)*np.fft.rfft(t[::-1],fft),fft)[n-1:len(x)]
 energy=np.concatenate([[0],np.cumsum(x*x)]);den=np.sqrt(np.maximum(1e-15,(energy[n:]-energy[:-n])*sum(t*t)));scores=corr/den
 peaks=[];work=scores.copy()
 for _ in range(5):
  i=int(np.argmax(np.abs(work)));peaks.append(dict(videoSecond=start+i/rate,correlation=float(work[i])));lo=max(0,i-int(rate*.15));hi=min(len(work),i+int(rate*.15));work[lo:hi]=0
 result[name]=dict(templateSeconds=n/rate,peaks=peaks)
out=dict(windowStart=start,windowDuration=duration,method='350..5000Hz bandlimited normalized waveform cross-correlation at16kHz; no time scaling; voice/music/codec mixing can reduce match',results=result)
(root/'target/temple-run/analysis'/args.output).write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(result,indent=2))
