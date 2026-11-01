"""Static lifetime objective IDs, source getters and float divisors."""
import sys,struct,json,hashlib,subprocess
from pathlib import Path
p=Path(__file__).with_name('inspect-native-runtime-methods.py');n={'__file__':str(p)}
exec(compile(p.read_text().split('for typeName,methodName in ')[0],str(p),'exec'),n)
b,off=n['binary'],n['off'];w=lambda a:struct.unpack_from('<I',b,off(a))[0]
def literal(got):
 v=struct.unpack_from('<Q',b,off(n['r'][got]))[0];assert v>>29==5
 size,pos=struct.unpack_from('<II',n['m'],n['h'][2]+8*((v>>1)&0xfffffff))
 return n['m'][n['h'][4]+pos:n['h'][4]+pos+size].decode()
rows=[('lifetimeGames1000','runs',0x28627f0,0x127636c,None,1000),('lifetimeGames5000','runs',0x28628d8,0x1276448,0x69763c,5000),('lifetimeGames10000','runs',0x2862840,0x1276520,0x6975d4,10000),('lifetimeCoins100000','lifetimeCoins',0x2862898,0x1276614,0x6974dc,100000),('lifetimeCoins500000','lifetimeCoins',0x2862870,0x12766ec,0x6975e4,500000),('lifetimeCoins1000000','lifetimeCoins',0x2862890,0x12767c4,0x6976c0,1000000),('lifetimeMeters100000','totalDistance',0x2862838,0x12768d0,0x6974dc,100000),('lifetimeMeters1000000','totalDistance',0x2862868,0x12769a8,0x6976c0,1000000)]
catalog=json.loads(Path('target/temple-run/analysis/native-objectives/localized.json').read_text());labels={r['id']:r['localized']['zh']for r in catalog['records']}
runtime=[];records=[]
for id,metric,got,a,constant,target in rows:
 assert literal(got)==id
 if constant:
  word=w(a);assert word&0xffc003ff==0xbd400100
  assert 0x697000+((word>>10)&0xfff)*4==constant
  threshold=struct.unpack_from('<f',b,off(constant))[0]
 else:
  assert w(a)==0x52a88f48
  threshold=struct.unpack('<f',struct.pack('<I',((w(a)>>5)&0xffff)<<16))[0]
 assert threshold==target
 records.append(dict(id=id,metric=metric,got=hex(got),divisorLoad=hex(a),threshold=threshold))
 runtime.append(dict(id=id,title=labels[id]['name'],detail=labels[id]['before'],metric=metric,target=target))
checks={0x1276330:0x9400551b,0x12765d4:0x9400619b,0x1276890:0x940060f2,0x128b7a8:0xb9402c00,0x128ec4c:0xb9403000,0x128ec64:0xb9403400}
for a,v in checks.items():assert w(a)==v
out=Path('target/temple-run/analysis/native-lifetime-objectives');out.mkdir(exist_ok=True)
asm=subprocess.check_output(['/usr/bin/objdump','-d','--start-address=0x1276320','--stop-address=0x1276b24',sys.argv[2]],text=True);(out/'LifetimeObjectives.asm').write_text(asm)
(out/'source.json').write_text(json.dumps(dict(binarySHA256=hashlib.sha256(b).hexdigest(),records=records,sourceFields={'runs':'PlayerRecord0x2c','lifetimeCoins':'PlayerRecord0x30','totalDistance':'PlayerRecord0x34'},instructionChecks={hex(a):hex(v)for a,v in checks.items()},limits=['Web records lifetime totals at settlement,not native runtime-update timing.','Native has another10million-meter branch but it is absent from recovered registered catalogue;not added here.','No currency reward inferred.']),indent=2))
path=Path('target/temple-run/web/src/game/nativeLifetimeObjectives.ts')
path.write_text('/** Native IDs/getters/divisors:analysis/native-lifetime-objectives/source.json. */\nexport const NATIVE_LIFETIME_OBJECTIVES = '+json.dumps(runtime,ensure_ascii=False,indent=2)+' as const;\n')
print(json.dumps(records,indent=2))
