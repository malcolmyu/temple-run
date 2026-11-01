"""Landmark-only gate projection audit. NCC/size is not full-scene similarity."""
from pathlib import Path
from PIL import Image,ImageFilter,ImageDraw
import numpy as np,json
root=Path(__file__).resolve().parents[1];src=Image.open(root/'docs/screenshots/BV1ypuKzPErT/021.jpg').convert('RGB');box=[112,201,137,249];template=src.crop(tuple(box)).convert('L')
def corr(region,t):
 h,w=t.shape;H,W=region.shape;N=h*w
 def sums(x):
  c=np.pad(x,((1,0),(1,0))).cumsum(0).cumsum(1);return c[h:,w:]-c[:-h,w:]-c[h:,:-w]+c[:-h,:-w]
 energy=np.maximum(sums(region*region)-sums(region)**2/N,1e-9);t=t-t.mean();shape=(1<<(H+h-2).bit_length(),1<<(W+w-2).bit_length());cross=np.fft.irfft2(np.fft.rfft2(region,shape)*np.fft.rfft2(t[::-1,::-1],shape),s=shape)[h-1:H,w-1:W];return cross/(np.sqrt(energy)*np.linalg.norm(t)+1e-9)
records=[]
for name,file,roi,second,sourceBox in [('before','straight-gate-position-before.png',[50,175,160,420],21,[112,201,137,249]),('after','straight-gate-source-21.png',[115,155,190,310],21,[112,201,137,249]),('after22','straight-gate-source-22.png',[65,180,165,390],22,[48,229,81,314]),('afterRightLean','straight-gate-source-21-right-lean.png',[90,155,155,310],21,[112,201,137,249]),('afterRightLean22','straight-gate-source-22-right-lean.png',[20,180,105,390],22,[48,229,81,314])]:
 src=Image.open(root/f'docs/screenshots/BV1ypuKzPErT/{second:03}.jpg').convert('RGB');template=src.crop(tuple(sourceBox)).convert('L')
 im=Image.open(root/'docs/screenshots'/file).convert('RGB').resize((414,896));gray=np.array(im.convert('L').filter(ImageFilter.GaussianBlur(.5)),float);region=gray[roi[1]:roi[3],roi[0]:roi[2]];best=(-2,None)
 for h in range(30,141):
  for aspect in [.9,1,1.1,1.2,1.3,1.4,1.5,1.6]:
   w=round(h*template.width/template.height*aspect)
   if h>region.shape[0]or w>region.shape[1]:continue
   t=np.array(template.resize((w,h)).filter(ImageFilter.GaussianBlur(.5)),float)
   for mirror in [False,True]:
    q=corr(region,t[:,::-1]if mirror else t);y,x=np.unravel_index(q.argmax(),q.shape);value=float(q[y,x]);
    if value>best[0]:best=(value,dict(x=int(x)+roi[0],y=int(y)+roi[1],width=w,height=h,mirror=mirror))
 record=dict(case=name,file=file,ncc=best[0],match=best[1],sourceSecond=second,sourceBox=sourceBox);records.append(record)
 d=ImageDraw.Draw(im);b=best[1];d.rectangle((b['x'],b['y'],b['x']+b['width'],b['y']+b['height']),outline='red',width=2);im.crop((0,150,414,500)).save(root/f'target/temple-run/analysis/gate-panel-{name}-match.png')
(root/'target/temple-run/analysis/straight-gate-panel-comparison.json').write_text(json.dumps(dict(method='manual source glyph ROI + multiscale normalized cross correlation, resized414x896; restricted gate ROI; both mirror candidates',sourceSecond=21,sourceBox=box,records=records,limits=['only glyph-panel landmark','ROI manually selected; no full-frame similarity claim','source camera lateral position and physical authoring anchor still estimated']),indent=2)+'\n');print(records)
