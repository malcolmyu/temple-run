"""Fit fixed HUD totem scale/translation using opaque atlas pixels in multiple video frames."""
from pathlib import Path
import numpy as np,json,hashlib
from PIL import Image
root=Path(__file__).resolve().parents[1];sprite=Image.open(root/'target/temple-run/web/public/assets/ui/hud-left.png').convert('RGBA')
frames=[21,22,30];sources=[np.asarray(Image.open(root/f'docs/screenshots/BV1ypuKzPErT/{n:03}.jpg').convert('RGB'),dtype=np.float32)for n in frames]
best=[]
for frame,src in zip(frames,sources):
 candidates=[]
 for width in range(90,151,2):
  height=round(width*sprite.height/sprite.width);a=np.asarray(sprite.resize((width,height),Image.Resampling.LANCZOS));ys,xs=np.nonzero(a[:,:,3]>250)
  keep=np.arange(len(xs))[::max(1,len(xs)//600)];ys=ys[keep];xs=xs[keep];rgb=a[ys,xs,:3].astype(np.float32)
  for oy in range(-20,11,2):
   y=ys+oy;valid=(y>=150)&(y<640);y=y[valid];x=xs[valid];template=rgb[valid]
   offsets=np.arange(-80,7);xx=x[None,:]+offsets[:,None];mask=(xx>=0)&(xx<414);sample=src[y[None,:],np.clip(xx,0,413)]
   errors=np.abs(sample-template[None,:,:]).mean(axis=2);errors=np.where(mask,errors,0);count=mask.sum(axis=1)
   score=errors.sum(axis=1)/np.maximum(count,1);score[count<120]=1e6;i=int(np.argmin(score));candidates.append(dict(width=width,height=height,x=int(offsets[i]),y=oy,meanAbsoluteRGBError=float(score[i]),samples=int(count[i])))
 candidates.sort(key=lambda r:r['meanAbsoluteRGBError']);best.append(dict(frame=frame,best=candidates[:5]))
def error(src,width,height,ox,oy):
 a=np.asarray(sprite.resize((width,height),Image.Resampling.LANCZOS));ys,xs=np.nonzero(a[:,:,3]>250);valid=(ys+oy>=150)&(ys+oy<src.shape[0])&(xs+ox>=0)&(xs+ox<src.shape[1]);ys=ys[valid];xs=xs[valid]
 return float(np.abs(src[ys+oy,xs+ox]-a[ys,xs,:3].astype(np.float32)).mean())
for row,src in zip(best,sources):row['denseOpaquePixelError']=dict(previous=error(src,100,343,0,0),corrected=error(src,126,432,-17,-4))
out=dict(method='opaque-alpha atlas pixels; source y>=150 excludes timer overlay; raw RGB mean absolute error; JPEG/tint differences remain',frames=best)
out['spriteSHA256']=hashlib.sha256((root/'target/temple-run/web/public/assets/ui/hud-left.png').read_bytes()).hexdigest()
out['heldOutFrames']=[]
for n in [11,90,150,250]:
 path=root/f'docs/screenshots/BV1ypuKzPErT/{n:03}.jpg';src=np.asarray(Image.open(path).convert('RGB'),dtype=np.float32)
 out['heldOutFrames'].append(dict(frame=n,sourceSHA256=hashlib.sha256(path.read_bytes()).hexdigest(),previous=error(src,100,343,0,0),corrected=error(src,126,432,-17,-4)))
(root/'target/temple-run/analysis/reference-hud-totem-fit.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(best,indent=2))
