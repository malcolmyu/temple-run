"""Read recorded HUD scores using native bitmap-glyph templates, preserving uncertainty."""
from pathlib import Path
import numpy as np
from PIL import Image
ROOT=Path(__file__).resolve().parents[1]
GLYPHS=[Image.open(ROOT/f'target/temple-run/web/public/assets/ui/score-arty-{i}.png') for i in range(10)]
CACHE={}
def glyph(d,h):
 key=(d,h)
 if key not in CACHE:
  im=GLYPHS[d];w=round(im.width*h/im.height);a=np.asarray(im.resize((w,h),Image.Resampling.LANCZOS)).astype(float)
  v=a[:,:,1]*a[:,:,3]/255;v-=v.mean();CACHE[key]=(v,np.linalg.norm(v))
 return CACHE[key]
def corr(im,d,h,x,y):
 t,tn=glyph(d,h);patch=im[y:y+h,x:x+t.shape[1]]
 if patch.shape!=t.shape:return -1
 v=patch-patch.mean();return float(np.sum(v*t)/(np.linalg.norm(v)*tn+1e-9))
def read(path):
 a=np.asarray(Image.open(path).convert('RGB')).astype(float)
 im=a[108:148,280:414,1]-.35*a[108:148,280:414,2]
 best=(-1,0,0,0)
 for h in range(22,28):
  for y in range(4,15):
   for x in range(85,118):
    q=corr(im,0,h,x,y)
    if q>best[0]:best=(q,h,x,y)
 quality,h,x,y=best
 if quality<.65:return None,best,[]
 digits=[0];scores=[quality];positions=[x]
 for _ in range(4):
  candidate=(-1,0,0)
  for d in range(10):
   w=glyph(d,h)[0].shape[1]
   for gap in range(-6,8):
    nx=x-w-gap
    if nx<5:continue
    q=max(corr(im,d,h,nx,yy)for yy in range(max(0,y-1),y+2))
    if q>candidate[0]:candidate=(q,d,nx)
  q,d,x=candidate
  if q<.62:break
  digits.insert(0,d);scores.insert(0,q);positions.insert(0,x)
 return int(''.join(map(str,digits))),best,list(zip(digits,scores,positions))
if __name__=='__main__':
 import json,hashlib
 rows=[];previous=None
 for i in range(2,264):
  path=ROOT/f'docs/screenshots/BV1ypuKzPErT/{i:03d}.jpg'
  value,anchor,chars=read(path);flags=[]
  confidence=min((c[1]for c in chars),default=0)
  if value is None:flags.append('unreadable')
  else:
   if value%20:flags.append('not_multiple_of_20')
   if confidence<.8:flags.append('low_match')
   if previous is not None and value<previous:flags.append('decreasing')
   if previous is not None and value-previous>700:flags.append('large_increment')
  rows.append(dict(second=i,image=path.name,score=value,confidence=confidence,anchor=dict(correlation=anchor[0],height=anchor[1],x=anchor[2]+280,y=anchor[3]+108),glyphs=[dict(digit=c[0],correlation=c[1],x=c[2]+280)for c in chars],review=flags))
  if value is not None:previous=value
 output=ROOT/'target/temple-run/analysis/reference-score-observations.json'
 output.write_text(json.dumps(dict(bvid='BV1ypuKzPErT',method='NCC against verified Game GUI UIFont1955 glyphs; no temporal score correction',sourceFontSHA256=hashlib.sha256((ROOT/'target/temple-run/web/src/game/nativeScoreFont.json').read_bytes()).hexdigest(),observations=rows),indent=2)+'\n')
 print('Frames',len(rows),'flagged',sum(bool(r['review'])for r in rows))
 for row in rows:
  if row['review']:print(row['second'],row['score'],round(row['confidence'],3),','.join(row['review']))
