from pathlib import Path
import sys,struct,bisect
p=Path('tools/inspect-native-runtime-methods.py').resolve();sys.argv=[str(p),'/tmp/com.imangi.templerun.apk','/tmp/temple-libil2cpp.so'];s=p.read_text();d={'__file__':str(p)};exec(s[:s.index('records={}')],d);b=d['binary'];r=d['r'];off=d['off'];st=d['st'];ts=d['ts'];m=d['m'];h=d['h']
n=b.index(b'UnityEngine.CoreModule.dll\0');seg=next(p for p in d['segments']if p[0]==1 and p[2]<=n<p[2]+p[5]);va=seg[3]+n-seg[2];mod=next(a for a,v in r.items()if v==va and 100<struct.unpack_from('<I',b,off(a+8))[0]<20000);core=r[mod+16];targets={}
for t in ts:
 if st(t[0])not in ['Material','Renderer']or st(t[1])!='UnityEngine':continue
 for i in range(t[9],t[9]+t[16]):
  q=struct.unpack_from('<7i4H',m,h[12]+i*36);name=st(q[0]);a=r.get(core+8*((q[6]&0xffffff)-1),0)
  if name in ['set_shader','set_material','set_sharedMaterial','set_materials','set_sharedMaterials']:targets[a]=st(t[0])+'.'+name
names={}
for t in ts[3465:4160]:
 for i in range(t[9],t[9]+t[16]):
  q=struct.unpack_from('<7i4H',m,h[12]+i*36);a=r.get(d['methods']+8*((q[6]&0xffffff)-1),0)
  if a:names.setdefault(a,[]).append(st(t[0])+'.'+st(q[0]))
addresses=sorted(names);print('targets',targets)
for a in addresses:
 end=next((v for v in d['addresses']if v>a),a)
 if not (0x11a77c4<=a<0x1400000):continue
 for x in range(a,end,4):
  word=struct.unpack_from('<I',b,off(x))[0]
  if word>>26 not in [0b100101,0b000101]:continue
  imm=word&0x3ffffff
  if imm&(1<<25):imm-=1<<26
  target=x+imm*4
  if target in targets:print(names[a],hex(x),targets[target])
