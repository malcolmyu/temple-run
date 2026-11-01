"""Preserve camera inheritance/serialization evidence; do not infer private field slots."""
import json, struct, zipfile, hashlib, sys
from pathlib import Path
import UnityPy
z=zipfile.ZipFile(sys.argv[1]); raw=z.read('assets/bin/Data/level0')
objects={o.path_id:o for o in UnityPy.load(raw).objects}
m=z.read('assets/bin/Data/Managed/Metadata/global-metadata.dat');h=struct.unpack_from('<50I',m)
assert h[1]==31
strings=m[h[6]:h[6]+h[7]]
def string(i):return strings[i:strings.find(b'\0',i)].decode()
types=[struct.unpack_from('<16i8H2I',m,i) for i in range(h[40],h[40]+h[41],88)]
def describe(name):
 t=next(t for t in types if string(t[0])==name)
 parent=next((string(p[0]) for p in types if p[2]==t[4]),None)
 fields=[]
 for i in range(t[8],t[8]+t[18]):
  n,ty,token=struct.unpack_from('<3i',m,h[24]+i*12)
  fields.append(dict(name=string(n),typeIndex=ty,token=token))
 return dict(parent=parent,fields=fields)
b=objects[6397].get_raw_data()
refs=[]
for offset in (112,124,136):
 file_id,path_id=struct.unpack_from('<iq',b,offset);obj=objects[path_id]
 refs.append(dict(offset=offset,fileID=file_id,pathID=path_id,type=obj.type.name,header=obj.read_typetree(check_read=False)))
values=list(struct.unpack_from('<9f',b,164))
assert values==[35,35,6,50,50,60,20,20,14]
# Android arm64 library is extracted from config.arm64_v8a.apk. Resolve ELF
# RELATIVE relocations rather than treating on-disk null pointers as data.
if len(sys.argv) > 2:
 binary=Path(sys.argv[2]).read_bytes()
 ph=struct.unpack_from('<Q',binary,32)[0];pe,pn=struct.unpack_from('<HH',binary,54)
 segments=[struct.unpack_from('<II6Q',binary,ph+i*pe) for i in range(pn)]
 def offset(address):
  segment=next(p for p in segments if p[0]==1 and p[3]<=address<p[3]+p[5])
  return segment[2]+address-segment[3]
 relocations={};sh=struct.unpack_from('<Q',binary,40)[0];se,sn=struct.unpack_from('<HH',binary,58)
 for i in range(sn):
  section=struct.unpack_from('<II4QII2Q',binary,sh+i*se)
  if section[1]==4:
   for p in range(section[4],section[4]+section[5],section[9]):
    address,kind,addend=struct.unpack_from('<QQq',binary,p)
    if kind&0xffffffff==1027:relocations[address]=addend
 # This APK's MetadataRegistration, validated against its type-definition count.
 assert struct.unpack_from('<Q',binary,offset(0x27d43e8))[0]==len(types)
 table=relocations[0x27d43d0]
 own=describe('GameCamera')['fields'];cursor=112
 for field in own:
  pointer=relocations[table+field['typeIndex']*8]
  data,bits=struct.unpack_from('<QI',binary,offset(pointer))
  attrs=bits&65535;kind=(bits>>16)&255
  field.update(attributes=attrs,typeKind=kind)
  # All private fields in this component are unannotated runtime state;
  # skipping these and static fields yields an exact end-to-end scene layout.
  if attrs&0x10 or attrs&7!=6:continue
  size={0x12:12,0x0c:4,0x02:4,0x11:12}[kind]
  field['serializedOffset']=cursor
  field['rawHex']=b[cursor:cursor+size].hex()
  cursor+=size
 assert cursor==len(b),(cursor,len(b))
 assert next(f for f in own if f['name']=='FollowHeightRun')['serializedOffset']==164
 verified=dict(binarySHA256=hashlib.sha256(binary).hexdigest(),metadataRegistration='0x27d43a8',serializedStart=112,serializedEnd=cursor,fields=own)
else:verified=None
result=dict(levelSHA256=hashlib.sha256(raw).hexdigest(),metadataSHA256=hashlib.sha256(m).hexdigest(),componentPathID=6397,componentBytes=len(b),fieldLayoutVerification=verified,types={n:describe(n) for n in ('GameCamera','MovingObject')},references=refs,followParameterCandidate=dict(offset=164,raw=values,scale=.2,groupedCandidate=dict(height=values[:3],distance=values[3:6],focusHeight=values[6:]),status='Field grouping verified by IL2CPP public/static attributes and exact serialized extent.' if verified else 'Candidate grouping; provide arm64 library to verify attributes.'),rawHex=b.hex())
p=Path(__file__).resolve().parents[1]/'target/temple-run/analysis/camera-follow-source.json';p.write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:result[k] for k in ('componentPathID','componentBytes','followParameterCandidate')},indent=2))
