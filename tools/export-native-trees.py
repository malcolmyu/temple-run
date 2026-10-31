"""Export native tree meshes and exact obstacle regions; separate native road meshes remain omitted."""
import sys,json,struct,zipfile,hashlib
from pathlib import Path
import UnityPy
from UnityPy.helpers.MeshHelper import MeshHandler
root=Path(__file__).resolve().parents[1];archive=zipfile.ZipFile(sys.argv[1])
keys={'tree-trip-left':'930d92a79808e410bab3a5e00f656014','tree-trip-right':'3254e9021cd014075a1d826bac34ecbd','tree-jump-left':'55cfaae4a33ae44b5a35038ec89939b8','tree-jump-right':'769742241ca4b4d6cacde69d09eff201'}
def cross(a,b):return[a[1]*b[2]-a[2]*b[1],a[2]*b[0]-a[0]*b[2],a[0]*b[1]-a[1]*b[0]]
records={};regions={}
for name,key in keys.items():
 raw=archive.read('assets/bin/Data/'+key);env=UnityPy.load(raw);obs={o.path_id:o for o in env.objects};file=next(iter(env.files.values()));mf=obs[16].read_typetree();ref=mf['m_Mesh'];source=file.externals[ref['m_FileID']-1].path;mesh=next(o.read()for o in UnityPy.load(archive.read('assets/bin/Data/'+source)).objects if o.path_id==ref['m_PathID']);handler=MeshHandler(mesh);handler.process()
 chain=[];tid=next(o.path_id for o in obs.values()if o.type.name=='Transform'and o.read_typetree()['m_GameObject']==mf['m_GameObject'])
 while tid:
  t=obs[tid].read_typetree();chain.append(t);tid=t['m_Father']['m_PathID']
 def transform(v,normal=False):
  v=[-v[0],v[1],v[2]]
  for t in chain:
   if not normal:v=[v[i]*t['m_LocalScale'][c]for i,c in enumerate('xyz')]
   q=t['m_LocalRotation'];a=[q[c]for c in 'xyz'];b=cross(a,v);d=cross(a,b);v=[v[i]+2*(q['w']*b[i]+d[i])for i in range(3)]
   if not normal and t['m_Father']['m_PathID']!=0:v=[v[i]+t['m_LocalPosition'][c]for i,c in enumerate('xyz')]
  v=[v[2],v[1],v[0]]
  return v if normal else[x*.2 for x in v]
 lines=['# Full native prefab TRS; canonical world scale .2; root global placement excluded.'];uv=[];positions=[]
 for line in mesh.export().splitlines():
  f=line.split()
  if f and f[0]in['v','vn']:
   v=transform(list(map(float,f[1:4])),f[0]=='vn');line=f[0]+' '+' '.join(f'{x:.8f}'for x in v)
   if f[0]=='v':positions.append(v)
  if f and f[0]=='f':
   for c in f[1:]:uv.extend(handler.m_UV1[int(c.split('/')[0])-1][:2])
  lines.append(line)
 p=root/f'target/temple-run/web/public/assets/obstacles/{name}.obj';p.write_text('\n'.join(lines)+'\n');p.with_suffix('.uv1.json').write_text(json.dumps(uv,separators=(',',':'))+'\n')
 b=obs[24].get_raw_data();n=struct.unpack_from('<I',b,32)[0];points=[list(struct.unpack_from('<ff',b,36+i*8))for i in range(n)];height=struct.unpack_from('<f',b,36+n*8+12)[0]
 region=[[round(y*.2,6),round(x*.2,6)]for x,y in points];flags=list(struct.unpack_from('<3i',obs[21].get_raw_data(),32));regions[name]=dict(x=[min(p[0]for p in region),max(p[0]for p in region)],y=[round(height*.2,6),round(height*.2,6)],z=[-max(p[1]for p in region),-min(p[1]for p in region)])
 records[name]=dict(prefab=key,sha256=hashlib.sha256(raw).hexdigest(),mesh=source,regionPathID=24,obstacleFlags=flags,separateFloorMeshFilter15Omitted=True,points=points,worldCollisionRegion=region,height=height,transforms=chain,bounds=[[min(v[i]for v in positions),max(v[i]for v in positions)]for i in range(3)],expandedVertices=len(uv)//2)
(root/'target/temple-run/web/src/game/nativeTreeCollision.json').write_text(json.dumps(regions,indent=2)+'\n')
(root/'target/temple-run/analysis/native-tree-source.json').write_text(json.dumps(records,indent=2)+'\n');print(json.dumps({k:dict(bounds=v['bounds'],collision=v['worldCollisionRegion'])for k,v in records.items()},indent=2))
