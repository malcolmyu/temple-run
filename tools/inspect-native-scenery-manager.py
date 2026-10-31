"""Preserve native scenery-grid evidence; static parse/disassemble only, never execute APK."""
from pathlib import Path
import sys,struct,json,hashlib,subprocess
p=Path(__file__).with_name('inspect-native-runtime-methods.py');s={'__file__':str(p)};exec(p.read_text().split('records={}')[0],s);root=p.resolve().parents[1]/'target/temple-run/analysis';records={}
for t in s['ts'][3465:4160]:
 name=s['st'](t[0])
 if name not in ['SceneryManager','SceneryElement']:continue
 for i in range(t[9],t[9]+t[16]):
  q=struct.unpack_from('<7i4H',s['m'],s['h'][12]+i*36);method=s['st'](q[0]);a=s['r'].get(s['methods']+8*((q[6]&0xffffff)-1))
  if not a:continue
  end=next(v for v in s['addresses']if v>a);asm=subprocess.run(['/usr/bin/objdump','-d','--start-address='+hex(a),'--stop-address='+hex(end),sys.argv[2]],check=True,capture_output=True,text=True).stdout;(root/'native-methods'/f'{name}.{method}.asm').write_text(asm);records[name+'.'+method]=dict(address=hex(a),end=hex(end),sha256=hashlib.sha256(s['binary'][s['off'](a):s['off'](end)]).hexdigest())
b=s['binary'];off=s['off'];word=lambda a:struct.unpack_from('<I',b,off(a))[0]
assert struct.unpack_from('<2q',b,off(0x697d30))==(19,19)
assert word(0x12f61e4)==0x52800789 # raw cell60
assert word(0x12f61ec)==0x1e380008 # truncate towardzero
assert word(0x12f69e0)==0x52802d21 # array361
assert word(0x12f69b0)==0x52a7d00a # density.25 default
assert word(0x12f64d4)==0x51002808 and word(0x12f64d8)==0x51002ac9 # jitter Range(0,21)-10
# Confirm the RNG helper through the CoreModule code-generation table.
offset=b.index(b'UnityEngine.CoreModule.dll\0');segment=next(p for p in s['segments']if p[0]==1 and p[2]<=offset<p[2]+p[5]);va=segment[3]+offset-segment[2]
module=next(a for a,v in s['r'].items()if v==va and 100<struct.unpack_from('<I',b,off(a+8))[0]<30000);table=s['r'][module+16];rng=None
for t in s['ts']:
 if s['st'](t[0])!='Random':continue
 for i in range(t[9],t[9]+t[16]):
  q=struct.unpack_from('<7i4H',s['m'],s['h'][12]+i*36);a=s['r'].get(table+8*((q[6]&0xffffff)-1))
  if a==0x24b3ee8:rng=s['st'](t[1])+'.Random.'+s['st'](q[0])
assert rng=='UnityEngine.Random.Range'
record=dict(librarySHA256=hashlib.sha256(b).hexdigest(),methods=records,gridCount=[19,19],poolSize=361,rawCellSize=60,worldCellSize=12,rawRadius=540,worldRadius=108,quantization='truncate(camera raw X/Z /60)*60, not floor',defaultDensity=.25,jitterRawRange=[-10,10],jitterWorldRange=[-2,2],RNG=rng+'(int,int), helper24b3ee8; shared runtime state; original seed/state not recovered',sentinel='-99999 initializes previous grid coordinates, NOT a random seed',scope='source evidence only; native grid/occupancy/pool distribution and scenery collision integration remain pending; current opening tree placements are fitted')
(root/'native-scenery-manager-source.json').write_text(json.dumps(record,indent=2)+'\n');print({k:v for k,v in record.items()if k!='methods'})
