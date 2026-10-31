"""Resolve AddCoins' InitializeArray field data through IL2CPP metadata; static only."""
import sys,struct,json,hashlib,subprocess
from pathlib import Path
p=Path(__file__).with_name('inspect-native-runtime-methods.py');n={'__file__':str(p)}
exec(compile(p.read_text().split('for typeName,methodName in ')[0],str(p),'exec'),n)
b,m,h,r,off=n['binary'],n['m'],n['h'],n['r'],n['off']
checks={0x13d7a14:0xb8777b01,0x13d7a18:0x2a1503e2,0x13d7a24:0x370000c0,0x13d7a3c:0x120002c0,0x12e4dd4:0x52800081,0x12e4df4:0x942c0378,0x12e4e0c:0x9403cae7,0x12e4e10:0x3707f680}
for a,v in checks.items():assert struct.unpack_from('<I',b,off(a))[0]==v
slot=r[0x2866280];encoded=struct.unpack_from('<Q',b,off(slot))[0];assert encoded>>29==4
refIndex=(encoded>>1)&0xfffffff;typeIndex,localField=struct.unpack_from('<2i',m,h[46]+refIndex*8)
typePtr=r[n['table']+typeIndex*8];definitionIndex,bits=struct.unpack_from('<QI',b,off(typePtr));assert bits>>16&255==0x12
t=n['ts'][definitionIndex];assert n['st'](t[0])=='<PrivateImplementationDetails>'
fieldIndex=t[8]+localField;nameIndex,_,token=struct.unpack_from('<3i',m,h[24]+fieldIndex*12);fieldName=n['st'](nameIndex)
entry=next(struct.unpack_from('<3i',m,a)for a in range(h[16],h[16]+h[17],12)if struct.unpack_from('<i',m,a)[0]==fieldIndex)
raw=m[h[18]+entry[2]:h[18]+entry[2]+16];excluded=list(struct.unpack('<4i',raw));assert excluded==[9,10,7,8]
assert hashlib.sha256(raw).hexdigest().upper()==fieldName
runtime=Path('target/temple-run/web/src/game/nativeCoinEligibility.json');assert json.loads(runtime.read_text())['excludedPathTypes']==excluded
out=Path('target/temple-run/analysis/native-coin-type-exclusions.json')
out.with_suffix('.membership.asm').write_text(subprocess.run(['/usr/bin/objdump','-d','--start-address=0x13d79a8','--stop-address=0x13d7a5c',sys.argv[2]],capture_output=True,text=True,check=True).stdout)
record=dict(binarySHA256=hashlib.sha256(b).hexdigest(),metadataSHA256=hashlib.sha256(m).hexdigest(),fieldRefIndex=refIndex,typeIndex=typeIndex,definitionIndex=definitionIndex,fieldIndex=fieldIndex,fieldName=fieldName,fieldToken=hex(token),dataIndex=entry[2],bytes=raw.hex(),excludedPathTypes=excluded,rule='AddCoins returns before instantiation for the four T path types7/8/9/10. This is absence by native design,not a missing T coin layout.',limits=['Adjacent straight-arm coins can still appear outside the T node.','This does not restore all remaining AddCoins eligibility or remote configuration.'],instructionChecks={hex(a):hex(v)for a,v in checks.items()})
out.write_text(json.dumps(record,indent=2));print(json.dumps(record,indent=2))
