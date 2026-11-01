"""Static magnet multiplier and motion evidence; never runs native code."""
import sys,struct,json,subprocess,hashlib
from pathlib import Path
p=Path(__file__).with_name('inspect-native-runtime-methods.py');n={'__file__':str(p)};exec(compile(p.read_text().split('for typeName,methodName in ')[0],str(p),'exec'),n)
b,off=n['binary'],n['off'];w=lambda a:struct.unpack_from('<I',b,off(a))[0]
checks={0x126a370:0x52800069,0x126a38c:0x52800049,0x126a3a0:0x52800029,0x126a3a8:0xb9015269,0x1271118:0xb94152a8,0x1271134:0x1b087f61,0x1271138:0x94009e5c,0x1270f54:0x1e20282f,0x1270f64:0x1e2021e0,0x127106c:0x1e2f1863,0x1271094:0x1e251008,0x1271098:0x390203b8,0x1296564:0x52a87f48,0x1296574:0x940129f4}
for a,v in checks.items():assert w(a)==v,hex(a)
table=list(b[off(0x6b7882):off(0x6b7882)+6]);assert table==[10,12,5,7,0,0]
levels=[{10:1,12:1,5:2,7:2,0:3}[i]for i in table];assert levels==[1,1,2,2,3,3]
constants={hex(a):struct.unpack_from('<f',b,off(a))[0]for a in [0x697690,0x697568,0x69761c]};assert constants['0x697690']==8100 and constants['0x697568']==10000000
fields={};ti,t=next((i,t)for i,t in enumerate(n['ts'])if n['st'](t[0])=='GameController');ptr=n['r'][n['r'][0x27d43f0]+ti*8]
for j,i in enumerate(range(t[8],t[8]+t[18])):
 name=n['st'](struct.unpack_from('<3i',n['m'],n['h'][24]+i*12)[0]);a=struct.unpack_from('<i',b,off(ptr+j*4))[0]
 if a in [0x150,0x291]:fields[name]=hex(a)
assert fields.get('CoinMagnetMultiplier')=='0x150'
out=Path('target/temple-run/analysis/native-magnet');out.mkdir(exist_ok=True)
for name,a,e in [('HandleBonusItemPickup',0x1270d78,0x12713e4),('MovingObject.Simulate',0x12e0054,0x12e0640),('MovingObject.ApplyForce',0x12e08ec,0x12e0914)]:
 (out/(name+'.asm')).write_text(subprocess.run(['/usr/bin/objdump','-d','--start-address='+hex(a),'--stop-address='+hex(e),sys.argv[2]],capture_output=True,text=True,check=True).stdout)
record=dict(binarySHA256=hashlib.sha256(b).hexdigest(),fields=fields,nativeLevels1Through6=levels,constants=constants,world=dict(scale=.2,radius=18,forceCoefficient=80000,speedCap=100,pickupRadius=2.4),rule='HasVacuum multiplies AddCoins only,not preceding AddScore;coin attraction flag persists after expiration;force queued then velocity/position simulated.',limits=['Web ECS frame ordering and path cleanup are adapters.','Global force-vacuum flag not exposed by the web mode.','Legacy web coin-value upgrade remains an extra multiplier.'],instructionChecks={hex(a):hex(v)for a,v in checks.items()})
(out/'source.json').write_text(json.dumps(record,indent=2));print(json.dumps(record,indent=2))
