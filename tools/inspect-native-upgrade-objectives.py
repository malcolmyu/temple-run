"""Audit both upgrade-achievement branches; static binary/metadata only."""
import sys,struct,json,hashlib,subprocess
from pathlib import Path
p=Path(__file__).with_name('inspect-native-runtime-methods.py');n={'__file__':str(p)}
exec(compile(p.read_text().split('for typeName,methodName in ')[0],str(p),'exec'),n)
b,off=n['binary'],n['off']
def literal(got):
 v=struct.unpack_from('<Q',b,off(n['r'][got]))[0];assert v>>29==5
 length,data=struct.unpack_from('<II',n['m'],n['h'][2]+8*((v>>1)&0xfffffff))
 return n['m'][n['h'][4]+data:n['h'][4]+data+length].decode()
assert literal(0x2862950)=='upgrade1' and literal(0x2862860)=='upgrade5'
checks={0x1275544:0x528000c2,0x1275560:0x528000e2,0x1275580:0x52800102,0x12755a0:0x528000a2,0x12755e0:0x52800122,0x12755bc:0x7100027f,0x12755cc:0x710006bf,0x12755d4:0x710002df,0x12755dc:0x7100001f,0x12755f8:0x7100001f,0x1275600:0x1e229000,0x1275758:0x7100127f,0x1275768:0x710016bf,0x1275770:0x710012df,0x1275778:0x7100101f,0x1275794:0x7100101f,0x127579c:0x1e229000}
for a,v in checks.items():assert struct.unpack_from('<I',b,off(a))[0]==v,hex(a)
out=Path('target/temple-run/analysis/native-upgrade-objectives');out.mkdir(exist_ok=True)
for name,start,end in [('UpgradeAchievements',0x1275514,0x1275844),('GetStoreItemMaxLevel',0x128e5d8,0x128e5fc),('StoreItem.BuyItem',0x12d4f60,0x12d5e3c)]:
 (out/(name+'.asm')).write_text(subprocess.check_output(['/usr/bin/objdump','-d','--start-address='+hex(start),'--stop-address='+hex(end),sys.argv[2]],text=True))
record=dict(binarySHA256=hashlib.sha256(b).hexdigest(),objectives=[dict(id='upgrade1',threshold=1),dict(id='upgrade5',threshold=5)],types=[6,7,8,5,9],formula='count of native upgrade levels >=threshold /5 *100',instructionChecks={hex(a):hex(v)for a,v in checks.items()},storeStateTable=list(struct.unpack_from('<10i',b,off(0x6b79fc))),limits=['Web achievement evaluation uses persisted upgrades;native evaluation is during UpdateAchievementRecords.','GetFullLevel is not GetStoreItemMaxLevel:store-state table includes8;BuyItem6->7 and7->6 branches exist.No extra effect/reward inferred.','Web legacy coin-value upgrade excluded;no currency reward invented.'])
(out/'source.json').write_text(json.dumps(record,indent=2));print(json.dumps(record,indent=2))
