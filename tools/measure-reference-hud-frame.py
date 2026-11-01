"""Opaque atlas landmark fit with explicit masks for other HUD/video overlays."""
from pathlib import Path
import numpy as np,json,hashlib
from PIL import Image
root=Path(__file__).resolve().parents[1];frames=[21,22,30];results={}
for name,widths,offsets,yrange in [('hud-vines',range(430,451),np.arange(-86,-57),range(-8,5)),('hud-right',range(64,101),np.arange(325,376),range(-12,9))]:
 sprite=Image.open(root/f'target/temple-run/web/public/assets/ui/{name}.png').convert('RGBA');rows=[]
 for frame in frames:
  src=np.asarray(Image.open(root/f'docs/screenshots/BV1ypuKzPErT/{frame:03}.jpg').convert('RGB'),dtype=np.float32);candidates=[]
  for width in widths:
   height=round(width*sprite.height/sprite.width);a=np.asarray(sprite.resize((width,height),Image.Resampling.LANCZOS));ys,xs=np.nonzero(a[:,:,3]>250);take=np.arange(len(xs))[::max(1,len(xs)//500)];ys=ys[take];xs=xs[take];rgb=a[ys,xs,:3].astype(np.float32)
   for oy in yrange:
    y=ys+oy;xx=xs[None,:]+offsets[:,None];yy=np.broadcast_to(y,xx.shape);mask=(yy>=0)&(yy<896)&(xx>=0)&(xx<414)
    if name=='hud-vines':mask&=(xx>=110)&(xx<350)&~((xx<205)&(yy>=48)&(yy<146))
    else:mask&=~((yy>=110)&(yy<175))
    sample=src[np.clip(yy,0,895),np.clip(xx,0,413)];error=np.abs(sample-rgb[None,:,:]).mean(axis=2);count=mask.sum(axis=1);score=np.where(mask,error,0).sum(axis=1)/np.maximum(count,1);score[count<50]=1e6;i=int(np.argmin(score));candidates.append(dict(width=width,height=height,x=int(offsets[i]),y=oy,error=float(score[i]),samples=int(count[i])))
  candidates.sort(key=lambda x:x['error']);rows.append(dict(frame=frame,best=candidates[:4]))
 results[name]=rows
out=dict(method='sparse opaque atlas RGB absolute error; masks exclude totem/timer/score overlays; limited integer search, not full frame similarity',fits=results)
out['decision']=dict(right='consistent83x211 at349,-1; update CSS',vines='refined range after broad300..600 width / -160..80 X search; inspect multi-frame consistency before CSS change')
sprite=Image.open(root/'target/temple-run/web/public/assets/ui/hud-right.png').convert('RGBA')
def denseError(src,w,h,ox,oy):
 a=np.asarray(sprite.resize((w,h),Image.Resampling.LANCZOS));ys,xs=np.nonzero(a[:,:,3]>250);y=ys+oy;x=xs+ox;valid=(x>=0)&(x<414)&(y>=0)&(y<896)&~((y>=110)&(y<175));return float(np.abs(src[y[valid],x[valid]]-a[ys[valid],xs[valid],:3].astype(np.float32)).mean())
out['validation']=[]
for frame in [11,21,22,30,90,150,250]:
 path=root/f'docs/screenshots/BV1ypuKzPErT/{frame:03}.jpg';src=np.asarray(Image.open(path).convert('RGB'),dtype=np.float32)
 out['validation'].append(dict(frame=frame,sourceSHA256=hashlib.sha256(path.read_bytes()).hexdigest(),previous=denseError(src,65,165,349,0),corrected=denseError(src,83,211,349,-1)))
sprite=Image.open(root/'target/temple-run/web/public/assets/ui/hud-vines.png').convert('RGBA')
def vineError(src,w,h,ox,oy):
 a=np.asarray(sprite.resize((w,h),Image.Resampling.LANCZOS));ys,xs=np.nonzero(a[:,:,3]>250);y=ys+oy;x=xs+ox;valid=(x>=110)&(x<350)&(y>=0)&(y<896)&~((x<205)&(y>=48)&(y<146));return float(np.abs(src[y[valid],x[valid]]-a[ys[valid],xs[valid],:3].astype(np.float32)).mean())
out['vineValidation']=[]
for frame in [11,21,22,30,90,150,250]:
 path=root/f'docs/screenshots/BV1ypuKzPErT/{frame:03}.jpg';src=np.asarray(Image.open(path).convert('RGB'),dtype=np.float32)
 out['vineValidation'].append(dict(frame=frame,previous=vineError(src,414,140,0,0),corrected=vineError(src,438,148,-73,-2)))
out['decision']['vines']='normal orientation438x148 at-73,-2; stable neighborhood, all seven dense validations improve; source30 sparse best differs by5px width'
(root/'target/temple-run/analysis/reference-hud-frame-fit.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(results,indent=2))
