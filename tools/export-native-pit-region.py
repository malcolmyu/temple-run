"""Read the standard hole's safe Region2D rims directly from the APK."""
import json,struct,zipfile,hashlib,sys
from pathlib import Path
import UnityPy
z=zipfile.ZipFile(sys.argv[1]);key='2a052f8803046414384e6fe85578292b';raw=z.read('assets/bin/Data/'+key);objects={o.path_id:o for o in UnityPy.load(raw).objects};scripts={o.path_id:o for o in UnityPy.load(z.read('assets/bin/Data/globalgamemanagers.assets')).objects};regions=[]
for o in objects.values():
 if o.type.name!='MonoBehaviour':continue
 d=o.read_typetree(check_read=False);ref=d['m_Script']
 if ref['m_FileID']!=1 or ref['m_PathID']not in scripts or scripts[ref['m_PathID']].read_typetree()['m_ClassName']!='Region2D':continue
 b=o.get_raw_data();n=struct.unpack_from('<I',b,32)[0];assert len(b)==36+n*8+32
 points=[list(struct.unpack_from('<ff',b,36+i*8))for i in range(n)]
 regions.append(dict(pathID=o.path_id,points=points,height=struct.unpack_from('<f',b,36+n*8+12)[0]))
assert len(regions)==2
intervals=sorted([min(p[0]for p in r['points']),max(p[0]for p in r['points'])]for r in regions)
assert intervals==[[-30,-25],[25,30]]
result=dict(prefab=key,prefabName='templeStraightHoleHorz_prefab',prefabSHA256=hashlib.sha256(raw).hexdigest(),safeRegions=regions,scale=.2,tileSpan=[-6,6],unsupportedSpan=[-5,5],note='Region2D virtual support Height=0; authored sloped rock rim vertices are below that plane. Native long-hole variants are not covered by this record.')
p=Path(__file__).resolve().parents[1]/'target/temple-run/analysis/native-pit-region-source.json';p.write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
