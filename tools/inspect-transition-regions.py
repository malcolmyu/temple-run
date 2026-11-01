"""Record native Region2D data for transition/road prefabs, without guessing height rules."""
import json,struct,sys,zipfile,hashlib
from pathlib import Path
import UnityPy
root=Path(__file__).resolve().parents[1];z=zipfile.ZipFile(sys.argv[1]);scripts={o.path_id:o for o in UnityPy.load(z.read('assets/bin/Data/globalgamemanagers.assets')).objects}
metadata=z.read('assets/bin/Data/Managed/Metadata/global-metadata.dat')
header=struct.unpack_from('<50I',metadata)
assert header[1]==31
strings=metadata[header[6]:header[6]+header[7]]
name_index=strings.index(b'\0Region2D\0')+1
found=None
for offset in range(header[40],header[40]+header[41],88):
 entry=struct.unpack_from('<16i8H2I',metadata,offset)
 if entry[0]==name_index:found=entry;break
assert found is not None
fields=[]
for i in range(found[8],found[8]+found[18]):
 name=struct.unpack_from('<i',metadata,header[24]+i*12)[0]
 fields.append(strings[name:].split(b'\0')[0].decode())
assert fields==['Points','TestPoint','Height','testProjectedPoint','testIsIn']
prefabs={'capA':'ec2ac1073385a4e75a471af09c40a587','capB':'78cb6eeafe4a343ea91773d6fba74641','plankStraight':'7c51a770016fb4d14a0753900a147fc8','stoneStraight':'2e264130d2f724b88884e268337c7894'};result={}
for label,identifier in prefabs.items():
 raw=z.read('assets/bin/Data/'+identifier);env=UnityPy.load(raw);regions=[]
 for o in env.objects:
  if o.type.name!='MonoBehaviour':continue
  header=o.read_typetree(check_read=False);ref=header['m_Script']
  if ref['m_FileID']!=1 or ref['m_PathID']not in scripts:continue
  script=scripts[ref['m_PathID']].read_typetree()
  if script['m_ClassName']!='Region2D':continue
  data=o.get_raw_data();count=struct.unpack_from('<I',data,32)[0]
  assert 3<=count<=64 and 36+count*8<=len(data)
  points=[list(struct.unpack_from('<ff',data,36+i*8))for i in range(count)]
  tail_offset=36+count*8
  assert len(data)-tail_offset==32 # Null TestPoint PPtr, Height, projected point and bool slot.
  height=struct.unpack_from('<f',data,tail_offset+12)[0]
  regions.append(dict(pathID=o.path_id,script='Region2D',metadataFieldOrder=fields,pointsInOriginalUnits=points,heightOriginalUnits=height,heightAtCurrentScale=height*.2,remainingBytesHex=data[tail_offset:].hex()))
 result[label]=dict(prefab=identifier,sha256=hashlib.sha256(raw).hexdigest(),regions=regions)
output=root/'target/temple-run/analysis/transition-region-source.json';output.write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
