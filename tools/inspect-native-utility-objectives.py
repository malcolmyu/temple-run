"""Recover utility achievement fields and thresholds,without native execution."""
import sys,struct,json,hashlib,subprocess
from pathlib import Path
p=Path(__file__).with_name('inspect-native-runtime-methods.py');n={'__file__':str(p)}
exec(compile(p.read_text().split('for typeName,methodName in ')[0],str(p),'exec'),n)
b,off=n['binary'],n['off'];checks={0x12751e0:0xbd414500,0x12751e4:0x1e229001,0x12752bc:0xbd40f380,0x1275390:0xbd40f380,0x1275394:0x1e2c1001,0x127546c:0x3943d388,0x1275474:0x3943d788,0x1273a5c:0xbd412780,0x1273a60:0x52a87f48}
for a,v in checks.items():assert struct.unpack_from('<I',b,off(a))[0]==v
fields={}
for typeName,wanted in [('CharacterPlayer',[0x144]),('GameController',[0xf0,0xf4,0xf5,0x124])]:
 ti,t=next((i,t)for i,t in enumerate(n['ts'])if n['st'](t[0])==typeName);ptr=n['r'][n['r'][0x27d43f0]+ti*8]
 for j,i in enumerate(range(t[8],t[8]+t[18])):
  name=n['st'](struct.unpack_from('<3i',n['m'],n['h'][24]+i*12)[0]);a=struct.unpack_from('<i',b,off(ptr+j*4))[0]
  if a in wanted:fields[typeName+'.'+name]=hex(a)
out=Path('target/temple-run/analysis/native-utility-objectives');out.mkdir(exist_ok=True)
for name,start,end in [('UtilityObjectives',0x12751a8,0x127550c),('Distance500',0x1273a28,0x1273b08)]:
 (out/(name+'.asm')).write_text(subprocess.check_output(['/usr/bin/objdump','-d','--start-address='+hex(start),'--stop-address='+hex(end),sys.argv[2]],text=True))
result=dict(binarySHA256=hashlib.sha256(b).hexdigest(),fields=fields,conditions={'totemFull':'maximum meter level>=5;four fills from initiallevel1','resurrection':'resurrection count>=1','resurrection2':'same-run resurrection count>=2','headstart':'normal OR mega headstart-used flag','distance500':'distance>=500'},instructionChecks={hex(a):hex(v)for a,v in checks.items()},limits=['Web persists summaries at final settlement.','Only actual wing revivals count;web gem-based revive is an extra system.','No retrospective inference from lifetime coin totals/inventory/bank.'])
(out/'source.json').write_text(json.dumps(result,indent=2));print(json.dumps(result,indent=2))
