"""Read-only verification of native level change gates, literals and transition graph."""
import struct,json,hashlib,subprocess
from pathlib import Path
reader=Path(__file__).with_name('inspect-native-runtime-methods.py');n={'__file__':str(reader)}
exec(compile(reader.read_text().split('for typeName,methodName in ')[0],str(reader),'exec'),n)
b,off=n['binary'],n['off']
checks={0x126eb24:0xbd413261,0x126eb28:0x7100093f,0x126eb38:0x5400012d,0x126eb3c:0x52800081,0x126eb48:0xb901327f,0x126eb50:0x7100081f,0x126eb54:0x5400004c,0x126eb58:0x9400104a,0x126eddc:0xfd417180,0x126edf8:0xfd009660,0x126f158:0xfd403d40,0x126f168:0xfd009660,0x1272cc8:0xb9404509,0x1272cec:0x52800054,0x1272cf4:0x52800041,0x1272d14:0x1a881514,0x1272d1c:0x52800041,0x1272d38:0x52800068,0x1272d3c:0x1a9f1514,0x1272d64:0xb9004514}
for address,value in checks.items():assert struct.unpack_from('<I',b,off(address))[0]==value,hex(address)
assert struct.unpack_from('<2f',b,off(0x6972e0))==(450.,250.)
assert struct.unpack_from('<2f',b,off(0x697078))==(375.,300.)
root=Path('target/temple-run/analysis')
(root/'native-methods/GameController.ChangeLevel.asm').write_text(subprocess.check_output(['/usr/bin/objdump','-d','--start-address=0x1272c80','--stop-address=0x1272d74',n['sys'].argv[2]],text=True))
result=dict(binarySHA256=hashlib.sha256(b).hexdigest(),gate='elapsed>threshold, reset elapsed before Range(0,4); rolls0/1/2 change,3 does not',levels={'1':'plank','2':'temple','3':'cliff'},transitions={'1':[2],'2':[1,3],'3':[2,1]},thresholds={'sceneDefault':{'temple':500,'other':200},'1000+':{'temple':450,'other':250},'4500+':{'temple':375,'other':300}},instructionChecks={hex(a):hex(v)for a,v in checks.items()},limits=['Runtime uses metric progress, not physical track metres.','Web safe group append, lookahead360,120m transition clearance and seeded independent RNG are adapters.','Original cliff road mesh and level-specific candidate probabilities remain incomplete.','Native gate executes before pacing threshold writes; same-frame stage ordering is not reproduced.'])
(root/'native-theme-pacing.json').write_text(json.dumps(result,indent=2));print('Verified native theme gates, two float pairs and ChangeLevel graph; wrote native-theme-pacing.json')
