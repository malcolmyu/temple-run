"""Diagnostic pitch grid for native trip-vocal matching; weak peaks are not action proof."""
import runpy,sys,json
sys.argv=['tools/compare-reference-vocals.py','--start',sys.argv[1],'--duration','4','--output','vocal-pitch-base.json'];d=runpy.run_path('tools/compare-reference-vocals.py');np=d['np'];x=d['x'];rate=d['rate'];start=d['start'];original=d['samples'](d['root']/'target/temple-run/web/public/assets/audio/gruntTrip.wav');best=[]
for pitch in np.arange(.7,1.301,.005):
 t=np.interp(np.arange(0,len(original)-1,pitch),np.arange(len(original)),original);t=d['filtered'](t);t-=t.mean();n=len(t);fft=1<<(len(x)+n-1).bit_length();corr=np.fft.irfft(np.fft.rfft(x,fft)*np.fft.rfft(t[::-1],fft),fft)[n-1:len(x)];energy=np.r_[0,np.cumsum(x*x)];scores=corr/np.sqrt(np.maximum(1e-15,(energy[n:]-energy[:-n])*sum(t*t)));i=int(np.argmax(scores));best.append(dict(pitch=float(pitch),time=start+i/rate,correlation=float(scores[i])))
best.sort(key=lambda r:-r['correlation']);print('PITCH BEST',json.dumps(best[:10]));out=d['root']/f'target/temple-run/analysis/trip-pitch-window-{start}.json';out.write_text(json.dumps(best,indent=2)+'\n')
