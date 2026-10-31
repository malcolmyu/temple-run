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
# Native Start branch thresholds and conditional variant draws; do not infer resource names from Type alone.
for address,value in [(0x12f6a00,0x7100281f),(0x12f6a08,0x7100381f),(0x12f6a10,0x7100401f),(0x12f6a18,0x7100481f),(0x12f6ad4,0x52800028),(0x12f6b68,0x52800048),(0x12f6bfc,0x52800068),(0x12f6d00,0x52800088),(0x12f6a48,0x528000a8)]:assert word(address)==value
record=dict(librarySHA256=hashlib.sha256(b).hexdigest(),methods=records,gridCount=[19,19],poolSize=361,rawCellSize=60,worldCellSize=12,rawRadius=540,worldRadius=108,quantization='truncate(camera raw X/Z /60)*60, not floor',defaultDensity=.25,jitterRawRange=[-10,10],jitterWorldRange=[-2,2],RNG=rng+'(int,int), helper24b3ee8; shared runtime state; original seed/state not recovered',sentinel='-99999 initializes previous grid coordinates, NOT a random seed',scope='source evidence only; native grid/occupancy/pool distribution and scenery collision integration remain pending; current opening tree placements are fitted')
def literal(got):
 address=s['r'][got];encoded=struct.unpack_from('<Q',b,off(address))[0]
 assert encoded>>29==5
 index=(encoded>>1)&0xfffffff
 length,data=struct.unpack_from('<II',s['m'],s['h'][2]+8*index)
 return s['m'][s['h'][4]+data:s['h'][4]+data+length].decode()
resourceGroups=[['Trees/treeAlone','Trees/treeAlone2','Trees/treeAlone3','Trees/treeAlone4'],['Trees/rock','Trees/rock2','Trees/rock3'],['Trees/cliff','Trees/cliff2','Trees/cliff3'],['Trees/overgrowthTrees'],['Trees/templeHead'],['Trees/groundPatchTemple']]
gotGroups=[[0x2866840,0x2866898,0x2866888,0x2866830],[0x2866858,0x2866850,0x2866868],[0x2866880,0x2866878,0x28668a0],[0x2866870],[0x2866838],[0x2866848]]
assert [[literal(a)for a in group]for group in gotGroups]==resourceGroups
record['resourceStringProof']=[dict(got=hex(a),literal=literal(a))for group in gotGroups for a in group]
record['initialPoolResources']=[dict(roll=[0,10],type=1,variants=4),dict(roll=[11,14],type=2,variants=3),dict(roll=[15,16],type=3,variants=3),dict(roll=[17,18],type=1,variants=1,note='fixed resource distinct from four trees'),dict(roll=[19,19],type=5,variants=1),dict(roll=[20,20],type=4,variants=1)]
for group,resources in zip(record['initialPoolResources'],resourceGroups):group['resources']=resources
record['resourceLifetime']='Start selects once per pool slot; Simulate repositions but does not reselect. Only variants>1 consume an additional Range call. All resource names decoded from IL2CPP encoded string literals.'
(root/'native-scenery-manager-source.json').write_text(json.dumps(record,indent=2)+'\n');print({k:v for k,v in record.items()if k!='methods'})
