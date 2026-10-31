"""Verify12 pickup-count achievement branches and actual pickup increments."""
import sys,re,struct,json,hashlib
from pathlib import Path
reader=Path(__file__).with_name('inspect-native-session-objectives.py');s={'__file__':str(reader)}
exec(compile(reader.read_text().split('records=[]')[0],str(reader),'exec'),s)
b,off=s['b'],s['off'];mapping={'magnets':('magnet',0x174),'boosts':('boost',0x178),'invisibilityBonuses':('shield',0x17c),'coinBonuses':('bonus',0x180)};records=[]
for bi,(index,name,got)in enumerate(s['blocks']):
 m=re.fullmatch(r'(magnets|boosts|invisibilityBonuses|coinBonuses)(5|10|20)',name)
 if not m:continue
 part=s['lines'][index:s['blocks'][bi+1][0]if bi+1<len(s['blocks'])else len(s['lines'])]
 load=next(re.search(r'([0-9a-f]+):.*ldr\s+s0, \[x28, #0x([0-9a-f]+)\]',line)for line in part if re.search(r'ldr\s+s0, \[x28, #0x',line))
 kind,offset=mapping[m[1]];assert int(load[2],16)==offset
 threshold=next(re.search(r'([0-9a-f]+):.*fmov\s+s1, #([0-9.]+)',line)for line in part if re.search(r'fmov\s+s1, #',line))
 count=int(m[2]);assert float(threshold[2])==count
 assert struct.unpack_from('<I',b,off(int(threshold[1],16)))[0]=={5:0x1e229001,10:0x1e249001,20:0x1e269001}[count]
 records.append(dict(id=name,kind=kind,threshold=count,field=hex(offset),loadAddress='0x'+load[1]))
assert len(records)==12
checks={0x12711f8:0xb94182a8,0x12711fc:0x11000508,0x1271200:0xb90182a8,0x1271254:0xb9417ea8,0x1271258:0x11000508,0x127125c:0xb9017ea8,0x12712b0:0xb94176a8,0x12712b4:0x11000508,0x12712b8:0xb90176a8,0x12712e8:0xb9417aa8,0x12712ec:0x11000508,0x12712f0:0xb9017aa8}
for a,v in checks.items():assert struct.unpack_from('<I',b,off(a))[0]==v
n=s['n'];fields={};ti,t=next((i,t)for i,t in enumerate(n['ts'])if n['st'](t[0])=='GameController');ptr=n['r'][n['r'][0x27d43f0]+ti*8]
for j,i in enumerate(range(t[8],t[8]+t[18])):
 name=n['st'](struct.unpack_from('<3i',n['m'],n['h'][24]+i*12)[0]);offset=struct.unpack_from('<i',b,off(ptr+j*4))[0]
 if name in ['NumMagnetBonusesPickedUp','NumBoostsPickedUp','NumInvisibilityBonusesPickedUp','NumMegaCoinsPickedUp']:fields[name]=hex(offset)
assert set(fields.values())=={'0x174','0x178','0x17c','0x180'}
result=dict(binarySHA256=hashlib.sha256(b).hexdigest(),fields=fields,records=records,pickupIncrementChecks={hex(a):hex(v)for a,v in checks.items()},rule='Session pickup count /5,10,20 *100. Increment in HandleBonusItemPickup; activating or refreshing a timed effect alone is not a pickup.',limits=['Web best-per-kind record updates at final settlement; complete native runtime completion timing remains pending.','Controlled20-per-kind test does not prove natural20-per-kind reachability.'])
Path('target/temple-run/analysis/native-objectives/power-pickups.json').write_text(json.dumps(result,indent=2));print(json.dumps(records,indent=2))
