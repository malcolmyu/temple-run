"""Compare deployed standard pit vertices to complete native prefab TRS; static only."""
import zipfile,sys,json,hashlib
from pathlib import Path
import numpy as np,UnityPy
from UnityPy.helpers.MeshHelper import MeshHandler
root=Path(__file__).resolve().parents[1];z=zipfile.ZipFile(sys.argv[1]);key='2a052f8803046414384e6fe85578292b';raw=z.read('assets/bin/Data/'+key);env=UnityPy.load(raw);objects={o.path_id:o for o in env.objects};f=next(iter(env.files.values()));mf=objects[8].read_typetree();ref=mf['m_Mesh'];meshFile=f.externals[ref['m_FileID']-1].path;mesh=next(o.read()for o in UnityPy.load(z.read('assets/bin/Data/'+meshFile)).objects if o.path_id==ref['m_PathID']);v=[]
chain=[];tid=5
while tid:
 t=objects[tid].read_typetree();chain.append(t);tid=t['m_Father']['m_PathID']
for line in mesh.export().splitlines():
 p=line.split()
 if not p or p[0]!='v':continue
 a=np.array([-float(p[1]),float(p[2]),float(p[3])])
 for t in chain:
  a*=np.array([t['m_LocalScale'][c]for c in 'xyz']);q=t['m_LocalRotation'];axis=np.array([q[c]for c in 'xyz']);a=a+2*(q['w']*np.cross(axis,a)+np.cross(axis,np.cross(axis,a)))
  if t['m_Father']['m_PathID']:a+=np.array([t['m_LocalPosition'][c]for c in 'xyz'])
 v.append([a[2]*.2,a[1]*.2,a[0]*.2])
native=np.array(v);old=np.array([[float(c)for c in line.split()[1:4]]for line in (root/'target/temple-run/web/public/assets/obstacles/pit.obj').read_text().splitlines()if line.startswith('v ')])*.2;old[:,[0,2]]*=-1
candidates=[]
for mirror in [1,-1]:
 for turn in range(4):
  a=native.copy();a[:,0]*=mirror
  for _ in range(turn):a[:,[0,2]]=np.column_stack([a[:,2],-a[:,0]])
  d=((old[:,None,:]-a[None,:,:])**2).sum(2).min(1)**.5;candidates.append(dict(mirrorX=mirror,quarterTurns=turn,RMS=float(np.sqrt((d*d).mean())),max=float(d.max())))
candidates.sort(key=lambda r:r['RMS']);out=dict(prefab=key,SHA256=hashlib.sha256(raw).hexdigest(),mesh=meshFile,nativeBounds=[native.min(0).tolist(),native.max(0).tolist()],deployedBounds=[old.min(0).tolist(),old.max(0).tolist()],nearestVertexCandidates=candidates,scope='vertex positions only; does not verify face winding/UV/normal or placement')
(root/'target/temple-run/analysis/native-standard-pit-trs-audit.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2))
