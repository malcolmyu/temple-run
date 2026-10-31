"""Compare visible entrance aperture at first100, without fitting gameplay constants."""
import json,hashlib,sys
from pathlib import Path
import numpy as np
from PIL import Image,ImageDraw
root=Path(__file__).resolve().parents[1]
source=root/'target/temple-run/analysis/reference-opening-exact/013.jpg'
current=root/(sys.argv[1] if len(sys.argv)>1 else 'docs/screenshots/current-native-intro-alignment.png')
folder=root/'target/temple-run/analysis/reference-opening-exact'
def aperture(path):
 a=np.asarray(Image.open(path).convert('RGB'));mask=np.max(a,axis=2)<35;mask[:390]=False;mask[710:]=False
 seen=np.zeros(mask.shape,dtype=bool);largest=[]
 for y,x in zip(*np.nonzero(mask)):
  if seen[y,x]:continue
  stack=[(int(y),int(x))];seen[y,x]=True;points=[]
  while stack:
   cy,cx=stack.pop();points.append((cy,cx))
   for ny,nx in [(cy-1,cx),(cy+1,cx),(cy,cx-1),(cy,cx+1)]:
    if 0<=ny<mask.shape[0]and 0<=nx<mask.shape[1]and mask[ny,nx]and not seen[ny,nx]:seen[ny,nx]=True;stack.append((ny,nx))
  if len(points)>len(largest):largest=points
 result=np.zeros(mask.shape,dtype=bool);ys,xs=zip(*largest);result[ys,xs]=True
 return result,dict(area=len(largest),bounds=[min(xs),min(ys),max(xs),max(ys)],centroid=[float(np.mean(xs)),float(np.mean(ys))])
a,sa=aperture(source);b,sb=aperture(current);iou=float(np.logical_and(a,b).sum()/np.logical_or(a,b).sum())
record=dict(source=dict(path=str(source.relative_to(root)),PTS=2.703,**sa),current=dict(path=str(current.relative_to(root)),runElapsed=1.0333330631256104,**sb),maskRule='largest4-connected RGB max<35 in y390..709, same414x896 canvas',intersectionOverUnion=iou,limitations=['phase pairing uses first100, current is one60Hz frame after release','recording overlays retained; only dark aperture compared','threshold mask is a silhouette proxy, not full-image equality'])
for name,path in [('source',source),('current',current)]:record[name]['SHA256']=hashlib.sha256(path.read_bytes()).hexdigest()
(folder/'mouth-comparison.json').write_text(json.dumps(record,indent=2)+'\n')
canvas=Image.new('RGB',(828,922),(20,20,20));draw=ImageDraw.Draw(canvas)
for col,(path,title,data)in enumerate([(source,'Source PTS2.703s / score100',sa),(current,'Current elapsed1.033s / score100',sb)]):
 canvas.paste(Image.open(path).convert('RGB'),(col*414,26));draw.text((col*414+8,7),title,fill='white');x0,y0,x1,y1=data['bounds'];draw.rectangle((col*414+x0,y0+26,col*414+x1,y1+26),outline=(255,60,60),width=2)
canvas.save(folder/'mouth-comparison.png');print(json.dumps(record))
