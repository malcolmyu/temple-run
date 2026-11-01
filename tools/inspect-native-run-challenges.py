"""Verify coin-free prefix and sticky stumble gates from static IL2CPP."""
import sys,struct,json,hashlib
from pathlib import Path
reader=Path(__file__).with_name('inspect-native-runtime-methods.py');n={'__file__':str(reader)}
exec(compile(reader.read_text().split('for typeName,methodName in ')[0],str(reader),'exec'),n)
b,off=n['binary'],n['off'];checks={0x126e474:0xbd40fa60,0x126e47c:0x540000c1,0x126e480:0xb9414908,0x126e490:0xbd00fa60,0x1272260:0xb9414908,0x1272264:0x35000068,0x127226c:0xbd00fa60,0x1297a54:0x39049268,0x126c770:0x3905926a,0x1274030:0x39459388,0x1274034:0x35000e28,0x1274114:0x39459388,0x1274118:0x35000708,0x1273b38:0xbd40fb80,0x1273b3c:0x52a87f48,0x1273cf0:0xbd40fb80,0x1273cf4:0x52a88f48}
for a,v in checks.items():assert struct.unpack_from('<I',b,off(a))[0]==v,(hex(a),hex(struct.unpack_from('<I',b,off(a))[0]))
assert struct.unpack_from('<f',b,off(0x69763c))[0]==5000
assert struct.unpack_from('<f',b,off(0x697654))[0]==2500
fields={}
for typeName,wanted in [('GameController',['MaxDistanceWithoutCoins','DidStumble','DistanceTraveled']),('CharacterPlayer',['DidStumble','CoinCountTotal'])]:
 ti,t=next((i,t)for i,t in enumerate(n['ts'])if n['st'](t[0])==typeName);ptr=n['r'][n['r'][0x27d43f0]+ti*8]
 for j,i in enumerate(range(t[8],t[8]+t[18])):
  name=n['st'](struct.unpack_from('<3i',n['m'],n['h'][24]+i*12)[0]);offset=struct.unpack_from('<i',b,off(ptr+j*4))[0]
  if name in wanted:fields[typeName+'.'+name]=hex(offset)
assert fields['GameController.MaxDistanceWithoutCoins']=='0xf8' and fields['GameController.DidStumble']=='0x164'
def literal(got):
 encoded=struct.unpack_from('<Q',b,off(n['r'][got]))[0];assert encoded>>29==5
 length,data=struct.unpack_from('<II',n['m'],n['h'][2]+8*((encoded>>1)&0xfffffff))
 return n['m'][n['h'][4]+data:n['h'][4]+data+length].decode()
assert [literal(got)for got in [0x28628e0,0x28628c8,0x28628b0,0x2862880]]==['distance500NoCoins','distance1000NoCoins','notrip2500','notrip5000']
result=dict(binarySHA256=hashlib.sha256(b).hexdigest(),fields=fields,verified=dict(coinFree='ComputeDistanceTraveled locks MaxDistanceWithoutCoins when first coin total>=1; HandleEndGame uses full DistanceTraveled when total0. Conditions divide this opening prefix by500/1000.',noTrip='CharacterPlayer.Stumble sets DidStumble before fatal check; controller copies to sticky flag. Both2500/5000 branches skip when controller DidStumble true.'),limits=['Web persists records at final settlement. Earlier runtime native completion updates and compound interaction timings remain incompletely ported.','A clean segment later in a stumbled run is not used to satisfy the clean-run gate.','Legacy aggregate bestDistance cannot infer either condition.'],instructionChecks={hex(a):hex(v)for a,v in checks.items()})
Path('target/temple-run/analysis/native-objectives/run-challenges.json').write_text(json.dumps(result,indent=2));print(json.dumps(result,indent=2))
