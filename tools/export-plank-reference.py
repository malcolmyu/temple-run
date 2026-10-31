"""Recover a plank prefab native mesh with authored transforms."""
import sys,zipfile,json
from pathlib import Path
import UnityPy
root=Path(__file__).resolve().parents[1];z=zipfile.ZipFile(sys.argv[1]);prefab=sys.argv[2] if len(sys.argv)>2 else '7c51a770016fb4d14a0753900a147fc8';env=UnityPy.load(z.read('assets/bin/Data/'+prefab));objects={o.path_id:o for o in env.objects};file=next(iter(env.files.values()))
mf=next(o.read_typetree()for o in objects.values()if o.type.name=='MeshFilter');ref=mf['m_Mesh'];meshpath=file.externals[ref['m_FileID']-1].path;mesh=next(o.read()for o in UnityPy.load(z.read('assets/bin/Data/'+meshpath)).objects if o.path_id==ref['m_PathID'])
go=objects[mf['m_GameObject']['m_PathID']].read_typetree();tid=next(c['component']['m_PathID']for c in go['m_Component']if objects[c['component']['m_PathID']].type.name=='Transform');chain=[]
while tid:
 t=objects[tid].read_typetree();chain.append(t);tid=t['m_Father']['m_PathID']
def cross(a,b):return [a[1]*b[2]-a[2]*b[1],a[2]*b[0]-a[0]*b[2],a[0]*b[1]-a[1]*b[0]]
def rotate(v,q):
 a=[q[c]for c in 'xyz'];c=cross(a,v);d=cross(a,c);return [v[i]+2*(q['w']*c[i]+d[i])for i in range(3)]
def transform(v,normal=False):
 v=[-v[0],v[1],v[2]] # Undo UnityPy OBJ reflection before applying Unity TRS.
 for t in chain:
  if not normal:v=[v[i]*t['m_LocalScale'][c]for i,c in enumerate('xyz')]
  v=rotate(v,t['m_LocalRotation'])
  if not normal:v=[v[i]+t['m_LocalPosition'][c]for i,c in enumerate('xyz')]
 return [-v[0],v[1],v[2]]
name=objects[1].read().m_Name
lines=['# Native '+name+' -> '+meshpath,'# Full Unity child/parent TRS baked; .2 world scale; authored road Y=-15.25 aligned to 0.']
for line in mesh.export().splitlines():
 fields=line.split()
 if fields and fields[0]in ['v','vn']:
  normal=fields[0]=='vn';v=transform(list(map(float,fields[1:4])),normal)
  if not normal:v=[v[0]*.2,(v[1]+15.25)*.2,v[2]*.2]
  line=fields[0]+' '+' '.join(f'{n:.8f}'for n in v)
 lines.append(line)
output=sys.argv[3] if len(sys.argv)>3 else 'plank-road-tile.obj'
out=root/(output if output.startswith('target/') else 'target/temple-run/web/public/assets/track/'+output);out.parent.mkdir(parents=True,exist_ok=True);out.write_text('\n'.join(lines)+'\n');print(mesh.m_Name,out)
