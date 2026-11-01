"""Export native straight geometry and expanded lightmap UVs together, excluding editor root placement."""
import sys,json,zipfile,hashlib
from pathlib import Path
import UnityPy
root=Path(__file__).resolve().parents[1];z=zipfile.ZipFile(sys.argv[1]);key='2e264130d2f724b88884e268337c7894';raw=z.read('assets/bin/Data/'+key);env=UnityPy.load(raw);objects={o.path_id:o for o in env.objects};file=next(iter(env.files.values()));records={}
def cross(a,b):return[a[1]*b[2]-a[2]*b[1],a[2]*b[0]-a[0]*b[2],a[0]*b[1]-a[1]*b[0]]
for name,tid,mfid in [('temple-straight-authored',5,8)]:
 ref=objects[mfid].read_typetree()['m_Mesh'];source=file.externals[ref['m_FileID']-1].path;mesh=next(o.read()for o in UnityPy.load(z.read('assets/bin/Data/'+source)).objects if o.path_id==ref['m_PathID']);chain=[]
 while tid:
  t=objects[tid].read_typetree();chain.append(t);tid=t['m_Father']['m_PathID']
 def transform(v,normal):
  v=[-v[0],v[1],v[2]] # Undo UnityPy OBJ's X reflection before Unity TRS.
  for t in chain:
   if not normal:v=[v[i]*t['m_LocalScale'][c]for i,c in enumerate('xyz')]
   q=t['m_LocalRotation'];a=[q[c]for c in 'xyz'];b=cross(a,v);d=cross(a,b);v=[v[i]+2*(q['w']*b[i]+d[i])for i in range(3)]
   if not normal and t['m_Father']['m_PathID']!=0:v=[v[i]+t['m_LocalPosition'][c]for i,c in enumerate('xyz')]
  v=[v[0],v[1],-v[2]] # Browser forward is -Z, Unity forward is +Z.
  return v if normal else[x*.2 for x in v]
 lines=['# Full native straight TRS; world scale .2, +UnityZ becomes -browserZ; editor root translation excluded.'];positions=[]
 for line in mesh.export().splitlines():
  f=line.split()
  if f and f[0]in ['v','vn']:
   v=transform(list(map(float,f[1:4])),f[0]=='vn');line=f[0]+' '+' '.join(f'{x:.8f}'for x in v)
   if f[0]=='v':positions.append(v)
  lines.append(line)
 (root/'target/temple-run/web/public/assets/track/temple-road-tile.obj').write_text('\n'.join(lines)+'\n')
 records[name]=dict(mesh=source,transforms=chain,bounds=[[min(v[i]for v in positions),max(v[i]for v in positions)]for i in range(3)])
(root/'target/temple-run/analysis/native-straight-production-source.json').write_text(json.dumps(dict(prefab=key,sha256=hashlib.sha256(raw).hexdigest(),worldScale=.2,editorRootTranslationExcluded=True,records=records),indent=2)+'\n')
print(json.dumps({k:v['bounds']for k,v in records.items()}))

assert all(t['m_LocalScale']==dict(x=1.0,y=1.0,z=1.0)for t in chain)

# UnityPy emits dangling normal indices for this mesh, whose native normal stream is absent.
from UnityPy.helpers.MeshHelper import MeshHandler
h=MeshHandler(mesh);h.process()
path=root/'target/temple-run/web/public/assets/track/temple-road-tile.obj'
lines=path.read_text().splitlines();has_normals=any(l.startswith('vn ')for l in lines);expanded=[];fixed=[]
for line in lines:
 if line.startswith('f '):
  corners=line.split()[1:]
  for corner in corners:expanded.extend(h.m_UV1[int(corner.split('/')[0])-1][:2])
  if not has_normals:line='f '+' '.join('/'.join(c.split('/')[:2])for c in corners)
 fixed.append(line)
path.write_text('\n'.join(fixed)+'\n')
uvpath=path.with_suffix('.uv1.json');uvpath.write_text(json.dumps(expanded,separators=(',',':'))+'\n')
assert len(expanded)==402*3*2
record=json.loads((root/'target/temple-run/analysis/native-straight-production-source.json').read_text());record.update(objSHA256=hashlib.sha256(path.read_bytes()).hexdigest(),uv1SHA256=hashlib.sha256(uvpath.read_bytes()).hexdigest(),nativeNormalsPresent=has_normals,lightmapCornerOrder='same face iteration as emitted OBJ',runtimeTranslationY=0)
(root/'target/temple-run/analysis/native-straight-production-source.json').write_text(json.dumps(record,indent=2)+'\n')
