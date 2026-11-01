"""Export the native plankStraightTowerVert prefab with its complete transform chain and UV1."""
import json,sys,zipfile,hashlib,struct
from pathlib import Path
import UnityPy
from UnityPy.helpers.MeshHelper import MeshHandler
root=Path(__file__).resolve().parents[1];z=zipfile.ZipFile(sys.argv[1]);prefab='8c7332108b6e1445380f44f706ae3e99';raw=z.read('assets/bin/Data/'+prefab);env=UnityPy.load(raw);obs={o.path_id:o for o in env.objects};file=next(iter(env.files.values()));mf=next(o.read_typetree()for o in obs.values()if o.type.name=='MeshFilter');ref=mf['m_Mesh'];source=file.externals[ref['m_FileID']-1].path;mesh=next(o.read()for o in UnityPy.load(z.read('assets/bin/Data/'+source)).objects if o.path_id==ref['m_PathID']);handler=MeshHandler(mesh);handler.process()
go=obs[mf['m_GameObject']['m_PathID']].read_typetree();tid=next(c['component']['m_PathID']for c in go['m_Component']if obs[c['component']['m_PathID']].type.name=='Transform');chain=[]
while tid:
 t=obs[tid].read_typetree();chain.append(t);tid=t['m_Father']['m_PathID']
def cross(a,b):return[a[1]*b[2]-a[2]*b[1],a[2]*b[0]-a[0]*b[2],a[0]*b[1]-a[1]*b[0]]
def transform(v,normal=False):
 v=[-v[0],v[1],v[2]]
 for t in chain:
  if not normal:v=[v[i]*t['m_LocalScale'][c]for i,c in enumerate('xyz')]
  q=t['m_LocalRotation'];a=[q[c]for c in 'xyz'];b=cross(a,v);d=cross(a,b);v=[v[i]+2*(q['w']*b[i]+d[i])for i in range(3)]
  if not normal and t['m_Father']['m_PathID']!=0:v=[v[i]+t['m_LocalPosition'][c]for i,c in enumerate('xyz')]
 return[-v[0],v[1],v[2]]
lines=['# Native plankStraightTowerVert prefab; complete Unity TRS; scale .2; authored floor Y=-15.25 aligned to0.'];uv=[]
for line in mesh.export().splitlines():
 f=line.split()
 if f and f[0]in ['v','vn']:
  normal=f[0]=='vn';v=transform(list(map(float,f[1:4])),normal)
  if not normal:v=[v[0]*.2,(v[1]+15.25)*.2,v[2]*.2]
  line=f[0]+' '+' '.join(f'{x:.8f}'for x in v)
 if f and f[0]=='f':
  for c in f[1:]:uv.extend(handler.m_UV1[int(c.split('/')[0])-1][:2])
 lines.append(line)
p=root/'target/temple-run/web/public/assets/obstacles/plank-beam.obj';p.write_text('\n'.join(lines)+'\n');p.with_suffix('.uv1.json').write_text(json.dumps(uv,separators=(',',':'))+'\n')
scripts={o.path_id:o for o in UnityPy.load(z.read('assets/bin/Data/globalgamemanagers.assets')).objects}
regions=[]
for o in obs.values():
 if o.type.name=='MonoBehaviour':
  script=o.read_typetree(check_read=False)['m_Script']
  if script['m_FileID']!=1 or script['m_PathID'] not in scripts or scripts[script['m_PathID']].read_typetree()['m_ClassName']!='Region2D':continue
  b=o.get_raw_data()
  if len(b)>36:
   n=struct.unpack_from('<I',b,32)[0]
   if 3<=n<=16 and len(b)==36+n*8+32:regions.append(dict(pathID=o.path_id,points=[list(struct.unpack_from('<ff',b,36+i*8))for i in range(n)],height=struct.unpack_from('<f',b,36+n*8+12)[0]))
flags=struct.unpack_from('<3i',obs[14].get_raw_data(),32);assert flags==(1,1,1)
result=dict(obstaclePathID=14,flags=dict(MustJumpOver=bool(flags[0]),MustSlideUnder=bool(flags[1]),DoesKill=bool(flags[2])),rootPlacementExcluded=True,prefab=prefab,mesh=source,meshName=mesh.m_Name,meshSHA256=hashlib.sha256(z.read('assets/bin/Data/'+source)).hexdigest(),prefabSHA256=hashlib.sha256(raw).hexdigest(),transforms=chain,regions=regions,expandedVertices=len(uv)//2)
(root/'target/temple-run/analysis/plank-beam-source.json').write_text(json.dumps(result,indent=2)+'\n');print('Native plank beam exported',mesh.m_Name,'regions',regions)
