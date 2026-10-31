"""Static IL2CPP Angel Wings evidence. Never execute the native library."""
import sys,struct,json,hashlib
from pathlib import Path
reader=Path(__file__).with_name('inspect-native-runtime-methods.py');n={'__file__':str(reader)}
exec(compile(reader.read_text().split('for typeName,methodName in ')[0],str(reader),'exec'),n)
b,off=n['binary'],n['off'];checks={0x1298c74:0x39058409,0x1298c7c:0xbd016400,0x1298c88:0x52a84689,0x1298c8c:0xb9016809,0x1298c90:0x51000508,0x1298c94:0xb9015c08,0x12776a0:0x1e27d000,0x1297548:0xbd016660,0x1297564:0x7902c27f,0x1297584:0xbd016a60,0x1297590:0xb9016a7f,0x126d3bc:0x39458509}
for a,v in checks.items():assert struct.unpack_from('<I',b,off(a))[0]==v,(hex(a),hex(struct.unpack_from('<I',b,off(a))[0]))
fields={};ti,t=next((i,t)for i,t in enumerate(n['ts'])if n['st'](t[0])=='CharacterPlayer');ptr=n['r'][n['r'][0x27d43f0]+ti*8]
for j,i in enumerate(range(t[8],t[8]+t[18])):
 name=n['st'](struct.unpack_from('<3i',n['m'],n['h'][24]+i*12)[0]);offset=struct.unpack_from('<i',b,off(ptr+j*4))[0]
 if 'AngelWings' in name:fields[name]=hex(offset)
assert fields['AngelWingsCount']=='0x15c' and fields['HasAngelWings']=='0x161' and fields['AngelWingsTimeLeft']=='0x164' and fields['AngelWingsRechargeTimeLeft']=='0x168'
result=dict(binarySHA256=hashlib.sha256(b).hexdigest(),fields=fields,verified=dict(activeSeconds=30,rechargeSeconds=45,consume='one stock on activation, not on death',timers='normal wings active and recharge timers both advance; active clears at<=0, recharge clamps0',death='GameController.Update126d3bc tests HasAngelWings before resurrection flow'),limits=['Permanent wings are not implemented.','Web price500, inventory cap99, HUD button and intro3s guard are adapters; complete native use guards/economy not recovered.','Web reuses existing death delay/resurrection safety clear and native resurrection boost; full original resurrection animation/conditional timing not ported.'],instructionChecks={hex(a):hex(v)for a,v in checks.items()})
Path('target/temple-run/analysis/native-angel-wings.json').write_text(json.dumps(result,indent=2));print(json.dumps(result,indent=2))
