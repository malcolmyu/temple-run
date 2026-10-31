"""Read-only fast-turn evidence from IL2CPP instructions and serialized controller."""
import sys,struct,json,hashlib
from pathlib import Path
reader=Path(__file__).with_name('inspect-native-runtime-methods.py');n={'__file__':str(reader)}
exec(compile(reader.read_text().split('for typeName,methodName in ')[0],str(reader),'exec'),n)
b,off=n['binary'],n['off'];w=lambda a:struct.unpack_from('<I',b,off(a))[0]
checks={0x126eefc:0x540001ac,0x126ef2c:0x5400024d,0x126ef30:0x52800081,0x126ef3c:0xb9013e7f,0x126ef48:0x7100081f,0x126ef4c:0x5400014c,0x126ef6c:0x5200014a,0x126efc4:0x1e210800,0x126efc8:0x1e38000a,0x126effc:0x5280004a,0x126f01c:0xb9003d1f,0x126e438:0x1e202900,0x126e43c:0xbd013e60,0x126e6a8:0xb9013e7f,0x126ede0:0x5290000c,0x126edec:0x72a88a8c,0x126edfc:0xb901366c,0x126f15c:0x5290000a,0x126f160:0x72a8876a,0x126f164:0xb901366a}
for a,v in checks.items():assert w(a)==v,(hex(a),hex(w(a)))
fields={};ti,t=next((i,t)for i,t in enumerate(n['ts'])if n['st'](t[0])=='GameController');ptr=n['r'][n['r'][0x27d43f0]+ti*8]
for j,i in enumerate(range(t[8],t[8]+t[18])):
 name=n['st'](struct.unpack_from('<3i',n['m'],n['h'][24]+i*12)[0]);offset=struct.unpack_from('<i',b,off(ptr+j*4))[0]
 if name in ['DistanceToTurnSection','DistanceToTurnSectionEnd','DistanceTraveledSinceLastTurnSection']:fields[name]=hex(offset)
assert fields=={'DistanceToTurnSection':'0x134','DistanceToTurnSectionEnd':'0x138','DistanceTraveledSinceLastTurnSection':'0x13c'}
scale=struct.unpack_from('<f',b,off(0x6975f0))[0];assert abs(scale-.65)<1e-7
scene=json.loads(Path('target/temple-run/analysis/game-controller-scene-source.json').read_text())
def walk(x):
 if isinstance(x,dict):
  if x.get('name') in fields and 'value' in x:yield x['name'],x['value']
  for v in x.values():yield from walk(v)
 elif isinstance(x,list):
  for v in x:yield from walk(v)
defaults=dict(walk(scene));assert defaults['DistanceToTurnSection']==1000 and defaults['DistanceToTurnSectionEnd']==100
record=dict(binarySHA256=hashlib.sha256(b).hexdigest(),fields=fields,serializedDefaults=defaults,scaleFloat32=scale,rule='Accumulate metric delta. If elapsed strictly exceeds inactive/active threshold, reset elapsed to0, roll integer Range(0,4), toggle only roll<=2. Fast state overrides normal turn spaces=max(2,trunc(float32(normal*scale))) and coin-run spaces=0.',verifiedLateInactiveThreshold=750,limits=['Serialized defaults require existing scene exporter evidence.','Normal pacing writes inactive threshold850 at1000..1500 and750 at4500+. Intermediate inheritance and resets need integration audit.','Pure state model is not yet integrated with grouped CoursePlan;120m safety floor remains.'],instructionChecks={hex(a):hex(v)for a,v in checks.items()})
out=Path('target/temple-run/analysis/native-fast-turn.json');out.write_text(json.dumps(record,indent=2));print(json.dumps(record,indent=2))
