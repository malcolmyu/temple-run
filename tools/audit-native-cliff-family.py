"""Inventory native cliff prefab hierarchy, mesh references and serialized support data.
Read only. Does not guess dynamic path orientations or execute any native code.
"""
import sys,json,zipfile,struct,hashlib
from pathlib import Path
import UnityPy
root=Path(__file__).resolve().parents[1];z=zipfile.ZipFile(sys.argv[1]);inventory=json.loads((root/'target/temple-run/analysis/apk-inventory.json').read_text());records=[]
for f in inventory['files']:
 names=[o['name']for o in f['objects']if o['type']=='GameObject' and 'cliff' in (o.get('name')or'').lower() and (o.get('name')or'').endswith('_prefab')]
 if not names:continue
 raw=z.read(f['path']);env=UnityPy.load(raw);objects={o.path_id:o for o in env.objects};file=next(iter(env.files.values()));entry=dict(names=names,path=f['path'],sha256=hashlib.sha256(raw).hexdigest(),meshes=[],regions=[])
 for o in env.objects:
  if o.type.name=='MeshFilter':
   t=o.read_typetree();ref=t['m_Mesh'];entry['meshes'].append(dict(pathID=o.path_id,gameObject=t['m_GameObject'],external=file.externals[ref['m_FileID']-1].path if ref['m_FileID'] else None,meshID=ref['m_PathID']))
  elif o.type.name=='MonoBehaviour':
   b=o.get_raw_data()
   if len(b)<40:continue
   count=struct.unpack_from('<I',b,32)[0]
   # Same polygon component layout verified by native narrow and transition exports.
   if not 3<=count<=32 or len(b)<36+count*8+16:continue
   points=[list(struct.unpack_from('<2f',b,36+i*8))for i in range(count)];height=struct.unpack_from('<f',b,36+count*8+12)[0]
   entry['regions'].append(dict(pathID=o.path_id,pointsRaw=points,heightRaw=height,heightWorld=height*.2,componentSHA256=hashlib.sha256(b).hexdigest()))
 records.append(entry)
assert len(records)>=20
straight=[r for r in records if any(n in ['cliffStraightHorz_prefab','cliffStraightVert_prefab']for n in r['names'])]
assert len(straight)==2 and all(len(r['regions'])==1 and r['regions'][0]['heightWorld']==3 for r in straight)
assert all(sorted(set(abs(v)for p in r['regions'][0]['pointsRaw']for v in p))==[6.5,30.]for r in straight)
result=dict(worldScale=.2,productionIntegrated=False,records=records,verifiedStraightSupport=dict(heightWorld=3,widthWorld=2.6,lengthWorld=12),limits=['Horz and Vert polygons retain original orientation. Native transform/generation orientation must be applied before runtime support tests.','Cliff1/2/3 decorative prefabs are not automatically road candidates.','Full native candidate pools and cap/corner/T orientation remain unresolved.'])
p=root/'target/temple-run/analysis/native-cliff-road/family.json';p.write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(dict(prefabs=len(records),regions=sum(len(r['regions'])for r in records),straight=result['verifiedStraightSupport'],output=str(p))))
