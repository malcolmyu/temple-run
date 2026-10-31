"""Export all four authored native turn prefabs for alignment audit, not guessed mirrors."""
import sys,json,hashlib,zipfile
from pathlib import Path
import UnityPy
from UnityPy.helpers.MeshHelper import MeshHandler
root=Path(__file__).resolve().parents[1];z=zipfile.ZipFile(sys.argv[1]);out=root/'target/temple-run/analysis/native-cliff-corners';out.mkdir(exist_ok=True)
keys={'A':'62f36bc5a3c0340f9bc4643017af7b39','B':'732ec9cfbf87f4f63926361f3c99db21','C':'4d541c46389f840b7818666ab11b1cee','D':'59f84ed3fc44142ecbf27c0ede344e16'}
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
 obj=out/f'turn-{label.lower()}.obj';obj.write_text('\n'.join(lines)+'\n');uvfile=obj.with_suffix('.uv1.json');uvfile.write_text(json.dumps(uv,separators=(',',':'))+'\n')
 for l in lines:
  if not l.startswith('f '):continue
  a,b,c=[positions[int(x.split('/')[0])-1]for x in l.split()[1:]]
  if max(v[1]for v in [a,b,c])-min(v[1]for v in [a,b,c])>.01:continue
  n=cross([b[i]-a[i]for i in range(3)],[c[i]-a[i]for i in range(3)])[1];up+=n>1e-8;down+=n<-1e-8
 records[label]=dict(prefab=key,prefabSHA256=hashlib.sha256(raw).hexdigest(),mesh=source,transforms=chain,bounds=[[min(v[i]for v in positions),max(v[i]for v in positions)]for i in range(3)],vertices=len(positions),expandedUV1Vertices=len(uv)//2,horizontalUp=up,horizontalDown=down,objSHA256=hashlib.sha256(obj.read_bytes()).hexdigest(),uv1SHA256=hashlib.sha256(uvfile.read_bytes()).hexdigest())
(out/'source.json').write_text(json.dumps(dict(worldScale=.2,rootTranslationExcluded=True,productionIntegrated=True,runtimeVariants=['A','B'],runtimeTranslationY=-3,runtimeParentTranslationY=3,limits=['C/D exported for audit only;A/B are canonical incoming+Z corner variants.','Connectors still use the existing web global grid;parent groups now restore native3m ground;exact native grid placement is not recovered.'],records=records),indent=2)+'\n');print(json.dumps({k:{n:v[n]for n in ['bounds','horizontalUp','horizontalDown']}for k,v in records.items()}))

public=root/'target/temple-run/web/public/assets/track'
for label in keys:
 for suffix in ['.obj','.uv1.json']:
  (public/f'cliff-turn-{label.lower()}{suffix}').write_bytes((out/f'turn-{label.lower()}{suffix}').read_bytes())
