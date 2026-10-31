"""Audit authored tower prefab TRS against normalized production OBJ; static parsing only."""
import zipfile,hashlib,json
from pathlib import Path
import UnityPy,numpy as np
root=Path(__file__).resolve().parents[1];z=zipfile.ZipFile('/tmp/com.imangi.templerun.apk');key='958067d7b5d41492992dab0f64f3d4ac';raw=z.read('assets/bin/Data/'+key);e=UnityPy.load(raw);obs={o.path_id:o for o in e.objects};f=next(iter(e.files.values()));mf=next(o.read_typetree()for o in e.objects if o.type.name=='MeshFilter');tid=next(o.path_id for o in e.objects if o.type.name=='Transform'and o.read_typetree()['m_GameObject']==mf['m_GameObject']);chain=[]
while tid:
 t=obs[tid].read_typetree();chain.append(t);tid=t['m_Father']['m_PathID']
ref=mf['m_Mesh'];source=f.externals[ref['m_FileID']-1].path;m=next(o.read()for o in UnityPy.load(z.read('assets/bin/Data/'+source)).objects if o.path_id==ref['m_PathID']);vertices=[]
for line in m.export().splitlines():
 if not line.startswith('v '):continue
 v=np.array(list(map(float,line.split()[1:])));v[0]*=-1
 for t in chain:
  v*=np.array([t['m_LocalScale'][a]for a in 'xyz']);q=t['m_LocalRotation'];axis=np.array([q[a]for a in 'xyz']);cross=np.cross(axis,v);v+=2*(q['w']*cross+np.cross(axis,cross))
  if t['m_Father']['m_PathID']:v+=np.array([t['m_LocalPosition'][a]for a in 'xyz'])
 v*=.2;v[2]*=-1;vertices.append(v)
a=np.array(vertices);path=root/'target/temple-run/web/public/assets/obstacles/tower-arch.obj';b=np.array([list(map(float,l.split()[1:]))for l in path.read_text().splitlines()if l.startswith('v ')])*.2;b[:,[0,2]]*=-1 # existing render half-turn
variants=[]
for mirror in [1,-1]:
 for turn in range(4):
  angle=turn*np.pi/2;c,s=np.cos(angle),np.sin(angle);v=a.copy();v[:,0]=mirror*(c*a[:,0]+s*a[:,2]);v[:,2]=-s*a[:,0]+c*a[:,2]
  distances=np.sqrt(((v[:,None,:]-b[None,:,:])**2).sum(axis=2)).min(axis=1);variants.append(dict(mirrorX=mirror,quarterTurns=turn,rms=float(np.sqrt((distances**2).mean())),maximum=float(distances.max())))
best=min(variants,key=lambda v:v['rms']);assert best['rms']<.001
record=dict(prefab=key,prefabSHA256=hashlib.sha256(raw).hexdigest(),mesh=source,transforms=chain,nativeWorldScale=.2,oldPresentationScale=.18,objSHA256=hashlib.sha256(path.read_bytes()).hexdigest(),bounds=a.min(axis=0).tolist()+a.max(axis=0).tolist(),orientationCandidates=variants,best=best,finding='Legacy OBJ after half-turn equals mirrored-X native full TRS after path quarter-turn1, RMS1e-6m. Renderer must reflect X and use native.2 scale rather than.18. Face order/normal fidelity not proven by nearest-vertex audit.')
(root/'target/temple-run/analysis/native-tower-scale-audit.json').write_text(json.dumps(record,indent=2)+'\n');print(best);print(record['bounds'])
