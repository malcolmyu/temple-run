"""Static character achievement ownership counts/divisors;no APK execution."""
import sys,struct,json,hashlib,subprocess
from pathlib import Path
p=Path(__file__).with_name('inspect-native-runtime-methods.py');n={'__file__':str(p)}
exec(compile(p.read_text().split('for typeName,methodName in ')[0],str(p),'exec'),n)
b,off=n['binary'],n['off'];checks={0x1275884:0x52800202,0x12758a0:0x52800222,0x1275a2c:0x710002bf,0x1275a3c:0x7100071f,0x1275ac8:0x1e2c1000,0x1275ad8:0xf9440273,0x1275df4:0x1e2a1000,0x1276120:0x1e231000}
for a,v in checks.items():assert struct.unpack_from('<I',b,off(a))[0]==v,hex(a)
def literal(got):
 v=struct.unpack_from('<Q',b,off(n['r'][got]))[0];assert v>>29==5
 size,pos=struct.unpack_from('<II',n['m'],n['h'][2]+8*((v>>1)&0xfffffff))
 return n['m'][n['h'][4]+pos:n['h'][4]+pos+size].decode()
ids=[literal(g)for g in [0x2862800,0x2862940,0x28628f8]];assert ids==['character2','character4','character6'],ids
out=Path('target/temple-run/analysis/native-character-objectives');out.mkdir(exist_ok=True)
(out/'CharacterObjectives.asm').write_text(subprocess.check_output(['/usr/bin/objdump','-d','--start-address=0x1275844','--stop-address=0x12761d4',sys.argv[2]],text=True))
record=dict(binarySHA256=hashlib.sha256(b).hexdigest(),ids=ids,targets=[2,4,6],nativeCharacterTypes=[16,17,18,19,20,22,28,29,30,31,32,33,34,35],rule='count positive character unlock levels;count/target*100;uses ownership rather than active character',instructionChecks={hex(a):hex(v)for a,v in checks.items()},limits=['Web counts its nine available asset-backed characters;not a complete mapping of original native character roster.','Web character prices/currencies remain assumptions.','No currency reward inferred.'])
(out/'source.json').write_text(json.dumps(record,indent=2));print(json.dumps(record,indent=2))
