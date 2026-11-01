"""Export full native flame tower TRS, collision regions and original10-frame UISprite."""
import sys,struct,json,hashlib,zipfile
from pathlib import Path
import UnityPy
from UnityPy.helpers.MeshHelper import MeshHandler
root=Path(__file__).resolve().parents[1];z=zipfile.ZipFile(sys.argv[1]);key='26a99960148bc4182a012f1491c60aba';raw=z.read('assets/bin/Data/'+key);env=UnityPy.load(raw);obs={o.path_id:o for o in env.objects};file=next(iter(env.files.values()));mf=next(o.read_typetree()for o in obs.values()if o.type.name=='MeshFilter');ref=mf['m_Mesh'];source=file.externals[ref['m_FileID']-1].path;mesh=next(o.read()for o in UnityPy.load(z.read('assets/bin/Data/'+source)).objects if o.path_id==ref['m_PathID']);handler=MeshHandler(mesh);handler.process();chain=[];tid=8
while tid:
 t=obs[tid].read_typetree();chain.append(t);tid=t['m_Father']['m_PathID']
def cross(a,b):return[a[1]*b[2]-a[2]*b[1],a[2]*b[0]-a[0]*b[2],a[0]*b[1]-a[1]*b[0]]
def transform(v,normal=False):
 v=[-v[0],v[1],v[2]]
 for t in chain:
  if not normal:v=[v[i]*t['m_LocalScale'][c]for i,c in enumerate('xyz')]
  q=t['m_LocalRotation'];a=[q[c]for c in 'xyz'];b=cross(a,v);d=cross(a,b);v=[v[i]+2*(q['w']*b[i]+d[i])for i in range(3)]
  if not normal and t['m_Father']['m_PathID']!=0:v=[v[i]+t['m_LocalPosition'][c]for i,c in enumerate('xyz')]
 v=[-v[0],v[1],v[2]];v=[v[2],v[1],-v[0]]
 return v if normal else [x*.2 for x in v]
lines=['# Native full flame tower TRS; no global root placement; scale.2; canonical longitudinal-Z.'];uv=[];positions=[]
for line in mesh.export().splitlines():
 f=line.split()
 if f and f[0]in['v','vn']:
  v=transform(list(map(float,f[1:4])),f[0]=='vn');line=f[0]+' '+' '.join(f'{x:.8f}'for x in v)
  if f[0]=='v':positions.append(v)
 if f and f[0]=='f':
  for c in f[1:]:uv.extend(handler.m_UV1[int(c.split('/')[0])-1][:2])
 lines.append(line)
p=root/'target/temple-run/web/public/assets/obstacles/flame-tower.obj';p.write_text('\n'.join(lines)+'\n');p.with_suffix('.uv1.json').write_text(json.dumps(uv,separators=(',',':'))+'\n')
flags=struct.unpack_from('<3i',obs[18].get_raw_data(),32);assert flags==(1,1,1)
regions=[]
for pid in[17,19]:
 b=obs[pid].get_raw_data();n=struct.unpack_from('<I',b,32)[0];regions.append(dict(pathID=pid,points=[list(struct.unpack_from('<ff',b,36+i*8))for i in range(n)],height=struct.unpack_from('<f',b,36+n*8+12)[0]))
shared={o.path_id:o for o in UnityPy.load(Path(sys.argv[2]).read_bytes()).objects};atlas=shared[1957].get_raw_data();tex=shared[81].read();rects=[]
for i in range(1,11):
 name=f'fire{i}.png'.encode();at=atlas.index(name);at=(at+len(name)+3)//4*4;rects.append(list(map(int,struct.unpack_from('<4f',atlas,at))))
assert all(r[2]>0 and r[3]>0 for r in rects),rects
anim=obs[22].get_raw_data();assert struct.unpack_from('<iif',anim,48)==(1,10,15)
spriteParent=obs[10].read_typetree();sprite=obs[12].read_typetree()
# Canonical mapping of Unity prefab position (X,Y,Z) is (Z,Y,X).
assert sprite['m_LocalPosition']==dict(x=0.0,y=0.0,z=0.0)
size=[sprite['m_LocalScale'][c]*spriteParent['m_LocalScale'][c]*.2 for c in 'xy']
p=spriteParent['m_LocalPosition'];position=[p['z']*.2,p['y']*.2,p['x']*.2]
# Source +90Y turns local sprite right toward Unity -Z, canonical -X.
horizontalSign=-1
data=dict(atlasSize=list(tex.image.size),frames=rects,fps=15,size=size,position=position,horizontalSign=horizontalSign)
(root/'target/temple-run/web/src/game/nativeFlameFrames.json').write_text(json.dumps(data,indent=2)+'\n')
x,y,w,h=rects[0];tex.image.crop((x,y,x+w,y+h)).save(root/'target/temple-run/web/public/assets/ui/native-flame-preview.png')
result=dict(prefab=key,prefabSHA256=hashlib.sha256(raw).hexdigest(),mesh=source,flags=dict(MustJumpOver=True,MustSlideUnder=True,DoesKill=True),regions=regions,rootPlacementExcluded=True,worldScale=.2,canonicalRotation='+90Y after source reflection',transforms=chain,bounds=[[min(v[i]for v in positions),max(v[i]for v in positions)]for i in range(3)],expandedVertices=len(uv)//2,**data)
(root/'target/temple-run/analysis/native-flame-tower-source.json').write_text(json.dumps(result,indent=2)+'\n');print('Native flame exported',result['bounds'],regions,data)
