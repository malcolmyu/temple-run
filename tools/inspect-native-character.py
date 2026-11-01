"""Verify native CharacterPlayer public serialized fields against IL2CPP attributes."""
import sys
import struct,zipfile,UnityPy
from pathlib import Path
z=zipfile.ZipFile(sys.argv[1]);m=z.read('assets/bin/Data/Managed/Metadata/global-metadata.dat');h=struct.unpack_from('<50I',m);s=m[h[6]:h[6]+h[7]]
def st(i):return s[i:s.find(b'\0',i)].decode()
ts=[struct.unpack_from('<16i8H2I',m,p)for p in range(h[40],h[40]+h[41],88)];t=next(t for t in ts if st(t[0])=='GameController');print('parent',[(st(x[0]),x[2])for x in ts if x[2]==t[4]])
binary=Path(sys.argv[2]).read_bytes();ph=struct.unpack_from('<Q',binary,32)[0];pe,pn=struct.unpack_from('<HH',binary,54);segments=[struct.unpack_from('<II6Q',binary,ph+i*pe)for i in range(pn)]
def off(a):
 p=next(p for p in segments if p[0]==1 and p[3]<=a<p[3]+p[5]);return p[2]+a-p[3]
r={};sh=struct.unpack_from('<Q',binary,40)[0];se,sn=struct.unpack_from('<HH',binary,58)
for i in range(sn):
 q=struct.unpack_from('<II4QII2Q',binary,sh+i*se)
 if q[1]==4:
  for p in range(q[4],q[4]+q[5],q[9]):
   a,k,d=struct.unpack_from('<QQq',binary,p)
   if k&0xffffffff==1027:r[a]=d
table=r[0x27d43d0]
t=next(t for t in ts if st(t[0])=='CharacterPlayer');e={o.path_id:o for o in UnityPy.load(z.read('assets/bin/Data/level0')).objects};raw=e[6392].get_raw_data();cursor=128;fields=[]
for i in range(t[8],t[8]+t[18]):
 n,ty,tok=struct.unpack_from('<3i',m,h[24]+i*12);ptr=r[table+ty*8];data,bits=struct.unpack_from('<QI',binary,off(ptr));at=bits&65535;kind=bits>>16&255
 if at&16 or at&7!=6:continue
 name=st(n);start=cursor
 if kind==0x12:val=list(struct.unpack_from('<iq',raw,cursor));cursor+=12
 elif kind in [0x1d,0x15]:
  num=struct.unpack_from('<i',raw,cursor)[0];assert 0<=num<1000,(name,cursor,num);val=[list(struct.unpack_from('<iq',raw,cursor+4+j*12))for j in range(num)];cursor+=4+num*12
 elif kind in [0xc,0x8,0x2,0x11]:
  size=16 if kind==0x11 and st(ts[data][0])=='Color'else 4
  val=struct.unpack_from('<f'if kind==12 else '<i',raw,cursor)[0];cursor+=size
 else:raise Exception((name,kind))
 fields.append(dict(name=name,offset=start,kind=kind,value=val));print(name,start,val)
assert cursor==len(raw),(cursor,len(raw))
import json,hashlib
(Path(__file__).resolve().parents[1]/'target/temple-run/analysis/character-player-scene-source.json').write_text(json.dumps(dict(componentPathID=6392,serializedStart=128,serializedEnd=cursor,componentSHA256=hashlib.sha256(raw).hexdigest(),fields=fields),indent=2)+'\n')
