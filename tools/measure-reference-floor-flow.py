"""Rectify early reference road to the evidenced native camera ground plane.
Diagnostic only: FOV/height/follow pose assumptions are not fitted from these frames.
"""
from pathlib import Path
import json,subprocess,hashlib
import numpy as np
from PIL import Image,ImageDraw
root=Path(__file__).resolve().parents[1];out=root/'target/temple-run/analysis/reference-floor-flow';out.mkdir(exist_ok=True)
media=Path('/tmp/temple-reference.mp4');start=4.8;fps=30;duration=2.1;w,h=296,640
raw=subprocess.check_output(['/opt/homebrew/bin/ffmpeg','-v','error','-ss',str(start),'-i',str(media),'-t',str(duration),'-vf',f'fps={fps},scale={w}:{h}','-pix_fmt','rgb24','-f','rawvideo','-'])
frames=np.frombuffer(raw,np.uint8).reshape(-1,h,w,3)
# Camera=(0,7,10), focus=(0,4,0), actor=(0,0,0); +ahead is renderer -Z.
resolution=.05;xs=np.arange(-3,-.25,resolution);zs=np.arange(4,32,resolution);xx,zz=np.meshgrid(xs,zs)
f=h/(2*np.tan(np.deg2rad(50)/2));sx=w/2+f*xx*np.sqrt(109)/(10*zz+121);sy=h/2-f*(3*zz-40)/(10*zz+121)
def rectify(frame):
 ix=np.floor(sx).astype(int);iy=np.floor(sy).astype(int);a=sx-ix;b=sy-iy
 assert ix.min()>=0 and ix.max()+1<w and iy.min()>=0 and iy.max()+1<h
 return ((1-a)[...,None]*(1-b)[...,None]*frame[iy,ix]+a[...,None]*(1-b)[...,None]*frame[iy,ix+1]+(1-a)[...,None]*b[...,None]*frame[iy+1,ix]+a[...,None]*b[...,None]*frame[iy+1,ix+1])
rectified=[rectify(frame)for frame in frames];gray=[r@np.array([.299,.587,.114])for r in rectified]
# Compare B(z,x) with A(z+dz,x+dx), using fixed central extent and enough halo.
row0,row1=80,440;col0,col1=7,len(xs)-7
shiftXs=range(-6,7);shiftZs=range(0,71)
def score(a,b):
 a=a-a.mean();b=b-b.mean();return float(np.sum(a*b)/max(1e-9,np.sqrt(np.sum(a*a)*np.sum(b*b))))
def match(a,b,r0=row0,r1=row1):
 target=b[r0:r1,col0:col1];peaks=[]
 for dz in shiftZs:
  for dx in shiftXs:peaks.append((score(a[r0+dz:r1+dz,col0+dx:col1+dx],target),dz,dx))
 peaks.sort(reverse=True);best,dz,dx=peaks[0]
 # Independent 1D parabolic refinement about the winning integer Z shift.
 fractional=0
 if 0<dz<70:
  left=score(a[r0+dz-1:r1+dz-1,col0+dx:col1+dx],target);right=score(a[r0+dz+1:r1+dz+1,col0+dx:col1+dx],target);denom=left-2*best+right
  if denom<0:fractional=float(np.clip(.5*(left-right)/denom,-.5,.5))
 return dict(ncc=best,zPixels=dz+fractional,xPixels=dx,forwardMetres=(dz+fractional)*resolution,sideMetres=dx*resolution,searchBoundary=dz in [0,70]or abs(dx)==6)
# Synthetic known translation verifies search sign and resolution before video measurements.
rng=np.random.default_rng(42);a=rng.normal(size=gray[0].shape);b=np.zeros_like(a);b[:-9,2:]=a[9:,:-2];synthetic=match(a,b);assert abs(synthetic['zPixels']-9)<.02 and synthetic['xPixels']==-2,synthetic
rows=[]
# Three-frame gaps suppress 1px quantization and measure around .1s of travel.
for i in range(len(frames)-3):
 r=match(gray[i],gray[i+3]);r.update(time=start+i/fps,deltaSeconds=3/fps,speed=r['forwardMetres']/(3/fps));rows.append(r)
valid=[r for r in rows if r['ncc']>.9 and not r['searchBoundary']]
depthChecks=[]
for i in range(9,len(frames)-3,6):
 near=match(gray[i],gray[i+3],20,180);far=match(gray[i],gray[i+3],240,400)
 depthChecks.append(dict(time=start+i/fps,near=near,far=far,speedDifference=(near['forwardMetres']-far['forwardMetres'])/.1))
frameDir=out/'frames';frameDir.mkdir(exist_ok=True)
frameHashes=[]
for i,frame in enumerate(frames):
 p=frameDir/f'{i:03d}.png';Image.fromarray(frame).save(p);frameHashes.append(dict(frame=p.name,time=start+i/fps,SHA256=hashlib.sha256(p.read_bytes()).hexdigest()))
scoreSpeed=np.sqrt((860-600)*48/20)
scoreWindow=[r for r in valid if 5.1<=r['time']<6]
scoreComparison=dict(sourceScoreFrames=['docs/screenshots/BV1ypuKzPErT/005.jpg','docs/screenshots/BV1ypuKzPErT/006.jpg'],scores=[600,860],elapsedSeconds=1,multiplier=20,formula='sqrt(scoreDelta*48/(multiplier*dt))',inferredSpeed=float(scoreSpeed),floorMedianSpeed=float(np.median([r['speed']for r in scoreWindow])),limitations='integer20point score quantization and instantaneous velocity changes are not represented by the two-frame slope')
contact=Image.new('RGB',(len([0,15,30,45])*len(xs),len(zs)+25))
for j,i in enumerate([0,15,30,45]):
 im=Image.fromarray(rectified[i].astype('uint8'));contact.paste(im,(j*len(xs),25));ImageDraw.Draw(contact).text((j*len(xs),4),f'{start+i/fps:.1f}s',fill='white')
contact.save(out/'rectified-road-contact.png')
result=dict(sourceMedia=str(media),sourceSHA256=hashlib.sha256(media.read_bytes()).hexdigest(),window=[start,start+duration],fps=fps,frameCount=len(frames),camera=dict(fov=50,height=7,behind=10,focusHeight=4),planeResolutionMetres=resolution,planeXRange=[float(xs[0]),float(xs[-1])],planeAheadRange=[float(zs[0]),float(zs[-1])],synthetic=synthetic,frameHashes=frameHashes,depthChecks=depthChecks,scoreComparison=scoreComparison,validCount=len(valid),medianSpeed=float(np.median([r['speed']for r in valid]))if valid else None,rows=rows,limitations=['uses native fixed follow pose; exact source camera pose not independently measured','reference media low-resolution296x640 and truncated after early video; only4.8..6.9s used','road/wall/obstacle occlusions and lateral motion may bias matches','no production pacing or geometry changed solely from these measurements'])
(out/'measurements.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps({k:result[k]for k in ['frameCount','validCount','medianSpeed','scoreComparison']}));print('first rows',rows[:3])
