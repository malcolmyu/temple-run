"""Export nine original non-tree scenery prefabs with full authored transforms and UV1."""
import sys,json,hashlib,zipfile
from pathlib import Path
import UnityPy
from UnityPy.helpers.MeshHelper import MeshHandler
root=Path(__file__).resolve().parents[1];z=zipfile.ZipFile(sys.argv[1]);out=root/'target/temple-run/analysis/native-scenery-props';out.mkdir(exist_ok=True)
keys={'rock':'26b84e771b17040b9b546f89fbdfc89e','rock2':'fd8098d50b60742038cb142ca519ef8e','rock3':'fc5ff1666fa294a03b5fcb40b4071568','cliff':'cfadd563bc10a4c9684eda5fff4e2b3e','cliff2':'352206c50c1684eeea73c0b5fdfd7108','cliff3':'a4a2660523150426c84069afb025d299','overgrowthTrees':'73c0bad6734dc4e8a8d62b18f23f3ecc','templeHead':'6a30529f5d9a64daa8b5312619409f53','groundPatchTemple':'dc881563727424107b1d906e597f88af'}
managerRaw=z.read('assets/bin/Data/globalgamemanagers');managerEnv=UnityPy.load(managerRaw);managerFile=next(iter(managerEnv.files.values()));manager=next(o.read_typetree()for o in managerEnv.objects if o.type.name=='ResourceManager');resourceProof={}
for label,key in keys.items():
 resource='prefabs/temple/trees/'+label.lower()+'_prefab'
 refs=[ref for name,ref in manager['m_Container']if name==resource]
 assert refs,resource
 paths={managerFile.externals[ref['m_FileID']-1].path for ref in refs}
 assert paths=={key},(resource,paths,key)
 resourceProof[label]=dict(resource=resource,prefab=key,references=refs)
def cross(a,b):return[a[1]*b[2]-a[2]*b[1],a[2]*b[0]-a[0]*b[2],a[0]*b[1]-a[1]*b[0]]
records={}
for label,key in keys.items():
 raw=z.read('assets/bin/Data/'+key);e=UnityPy.load(raw);objects={o.path_id:o for o in e.objects};file=next(iter(e.files.values()));mf=next(o.read_typetree()for o in e.objects if o.type.name=='MeshFilter');go=mf['m_GameObject'];tid=next(o.path_id for o in e.objects if o.type.name=='Transform'and o.read_typetree()['m_GameObject']==go);chain=[]
 while tid:
  t=objects[tid].read_typetree();chain.append(t);tid=t['m_Father']['m_PathID']
 ref=mf['m_Mesh'];source=file.externals[ref['m_FileID']-1].path;mesh=next(o.read()for o in UnityPy.load(z.read('assets/bin/Data/'+source)).objects if o.path_id==ref['m_PathID']);h=MeshHandler(mesh);h.process();lines=[];positions=[];uv=[];up=down=0
 def transform(v,normal=False):
  v=[-v[0],v[1],v[2]]
  for t in chain:
   if not normal:v=[v[i]*t['m_LocalScale'][c]for i,c in enumerate('xyz')]
   q=t['m_LocalRotation'];a=[q[c]for c in 'xyz'];b=cross(a,v);c=cross(a,b);v=[v[i]+2*(q['w']*b[i]+c[i])for i in range(3)]
   if not normal and t['m_Father']['m_PathID']:v=[v[i]+t['m_LocalPosition'][c]for i,c in enumerate('xyz')]
  return [v[0],v[1],-v[2]]if normal else[v[0]*.2,v[1]*.2,-v[2]*.2]
 original=mesh.export().splitlines();normals=any(l.startswith('vn ')for l in original)
 for line in original:
  p=line.split()
  if p and p[0]in ['v','vn']:
   v=transform(list(map(float,p[1:])),p[0]=='vn');line=p[0]+' '+' '.join(f'{x:.8f}'for x in v)
   if p[0]=='v':positions.append(v)
  if p and p[0]=='f':
   for c in p[1:]:uv.extend(h.m_UV1[int(c.split('/')[0])-1][:2])
   if not normals:line='f '+' '.join('/'.join(c.split('/')[:2])for c in p[1:])
  lines.append(line)
 obj=out/f'decor-scenery-{label.lower()}.obj';obj.write_text('\n'.join(lines)+'\n');uvfile=obj.with_suffix('.uv1.json');uvfile.write_text(json.dumps(uv,separators=(',',':'))+'\n')
 for l in lines:
  if not l.startswith('f '):continue
  a,b,c=[positions[int(x.split('/')[0])-1]for x in l.split()[1:]]
  if max(v[1]for v in [a,b,c])-min(v[1]for v in [a,b,c])>.01:continue
  n=cross([b[i]-a[i]for i in range(3)],[c[i]-a[i]for i in range(3)])[1];up+=n>1e-8;down+=n<-1e-8
 renderer=next(o.read_typetree()for o in e.objects if o.type.name=='MeshRenderer');materials=[dict(reference=ref,path=file.externals[ref['m_FileID']-1].path if ref['m_FileID'] else key)for ref in renderer['m_Materials']]
 for material in materials:
  materialEnv=UnityPy.load(z.read('assets/bin/Data/'+material['path']));materialObject=next(o for o in materialEnv.objects if o.path_id==material['reference']['m_PathID']);material['name']=materialObject.read_typetree()['m_Name']
 records[label]=dict(materials=materials,prefab=key,prefabName=next(o.read_typetree()['m_Name']for o in e.objects if o.type.name=='GameObject'),prefabSHA256=hashlib.sha256(raw).hexdigest(),mesh=source,transforms=chain,bounds=[[min(v[i]for v in positions),max(v[i]for v in positions)]for i in range(3)],vertices=len(positions),expandedUV1Vertices=len(uv)//2,horizontalUp=up,horizontalDown=down,objSHA256=hashlib.sha256(obj.read_bytes()).hexdigest(),uv1SHA256=hashlib.sha256(uvfile.read_bytes()).hexdigest())
(out/'source.json').write_text(json.dumps(dict(worldScale=.2,rootTranslationExcluded=True,productionIntegrated=False,resourcePaths={k:'Trees/'+k for k in keys},resourceManagerSHA256=hashlib.sha256(managerRaw).hexdigest(),resourceProof=resourceProof,records=records),indent=2)+'\n');print(json.dumps({k:{n:v[n]for n in ['bounds','vertices']}for k,v in records.items()}))

public=root/'target/temple-run/web/public/assets/track'
for label in keys:
 for suffix in ['.obj','.uv1.json']:
  (public/f'decor-scenery-{label.lower()}{suffix}').write_bytes((out/f'decor-scenery-{label.lower()}{suffix}').read_bytes())
