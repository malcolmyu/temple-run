"""Static AddCoins gate evidence; does not execute native code."""
import sys,struct,json,hashlib
from pathlib import Path
reader=Path(__file__).with_name('inspect-native-runtime-methods.py');n={'__file__':str(reader)}
exec(compile(reader.read_text().split('for typeName,methodName in ')[0],str(reader),'exec'),n)
b,off=n['binary'],n['off'];checks={0x12e4d40:0xb9408b75,0x12e4d54:0xb9404109,0x12e4d58:0x6b0902bf,0x12e4d5c:0x54fffc2a,0x12e4d64:0xb9408775,0x12e4d78:0xb9403d09,0x12e4d7c:0x6b0902bf,0x12e4d80:0x54fffb0d}
for a,v in checks.items():assert struct.unpack_from('<I',b,off(a))[0]==v
fields={};ti,t=next((i,t)for i,t in enumerate(n['ts'])if n['st'](t[0])=='PathElement');ptr=n['r'][n['r'][0x27d43f0]+ti*8]
for j,i in enumerate(range(t[8],t[8]+t[18])):
 name=n['st'](struct.unpack_from('<3i',n['m'],n['h'][24]+i*12)[0]);offset=struct.unpack_from('<i',b,off(ptr+j*4))[0]
 if name in ['SpacesSinceLastCoinRun','CoinRunCount','sMinSpacesBetweenCoinRuns','sMaxCoinsPerRun']:fields[name]=hex(offset)
assert fields=={'SpacesSinceLastCoinRun':'0x84','CoinRunCount':'0x88','sMinSpacesBetweenCoinRuns':'0x3c','sMaxCoinsPerRun':'0x40'}
record=dict(binarySHA256=hashlib.sha256(b).hexdigest(),fields=fields,rule='AddCoins rejects CoinRunCount>=sMaxCoinsPerRun and SpacesSinceLastCoinRun<=sMinSpacesBetweenCoinRuns. Eligibility requires strict greater-than spacing; other geometry/config filters also apply.',limits=['Native per-element counter propagation and max-run counting not yet ported.','Web adapter uses complete12m empty cells between emitted run endpoints;Existing5-coin web layout,2m spacing and6m corner margin are web choices, not recovered native values.'],instructionChecks={hex(a):hex(v)for a,v in checks.items()})
Path('target/temple-run/analysis/native-coin-run-gate.json').write_text(json.dumps(record,indent=2));print(json.dumps(record,indent=2))
