"""Restore native entrance child/parent transforms, excluding editor root placement."""
import sys,json,zipfile,hashlib
from pathlib import Path
import UnityPy
root=Path(__file__).resolve().parents[1];z=zipfile.ZipFile(sys.argv[1]);key='80ad52ac73dc44ef9bcff6985db4ee11';raw=z.read('assets/bin/Data/'+key);env=UnityPy.load(raw);objects={o.path_id:o for o in env.objects};file=next(iter(env.files.values()));records={}
def cross(a,b):return[a[1]*b[2]-a[2]*b[1],a[2]*b[0]-a[0]*b[2],a[0]*b[1]-a[1]*b[0]]
for name,tid,mfid in [('temple-entrance',8,15),('entrance-surroundings',12,16)]:
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
 lines=['# Full native entrance TRS; world scale .2, +UnityZ becomes -browserZ; editor root translation excluded.'];positions=[]
 for line in mesh.export().splitlines():
  f=line.split()
  if f and f[0]in ['v','vn']:
   v=transform(list(map(float,f[1:4])),f[0]=='vn');line=f[0]+' '+' '.join(f'{x:.8f}'for x in v)
   if f[0]=='v':positions.append(v)
  lines.append(line)
 (root/f'target/temple-run/web/public/assets/track/{name}.obj').write_text('\n'.join(lines)+'\n')
 records[name]=dict(mesh=source,transforms=chain,bounds=[[min(v[i]for v in positions),max(v[i]for v in positions)]for i in range(3)])
(root/'target/temple-run/analysis/native-entrance-source.json').write_text(json.dumps(dict(prefab=key,sha256=hashlib.sha256(raw).hexdigest(),worldScale=.2,editorRootTranslationExcluded=True,records=records),indent=2)+'\n')
print(json.dumps({k:v['bounds']for k,v in records.items()}))
