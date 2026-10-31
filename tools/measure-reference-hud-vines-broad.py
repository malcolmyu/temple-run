"""Opaque atlas landmark fit with explicit masks for other HUD/video overlays."""
from pathlib import Path
import numpy as np,json,hashlib
from PIL import Image
root=Path(__file__).resolve().parents[1];frames=[21];results={}
for name,widths,offsets,yrange in [('hud-vines',range(300,601,4),np.arange(-160,81,2),range(-40,41,2))]:
 sprite=Image.open(root/f'target/temple-run/web/public/assets/ui/{name}.png').convert('RGBA');rows=[]
 if __import__('sys').argv[-1]=='flip':sprite=sprite.transpose(Image.Transpose.FLIP_LEFT_RIGHT)
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
(root/('target/temple-run/analysis/reference-hud-vines-broad-'+('flip' if __import__('sys').argv[-1]=='flip' else 'normal')+'.json')).write_text(json.dumps(results,indent=2)+'\n');print(json.dumps(results,indent=2))
