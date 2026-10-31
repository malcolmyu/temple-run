"""Recover normal pacing gates from static IL2CPP; never execute native code.
The table follows a normal monotonically increasing run, excluding fast-turn overrides.
"""
import sys,struct,json,hashlib
from pathlib import Path
reader=Path(__file__).with_name('inspect-native-runtime-methods.py');n={'__file__':str(reader)}
exec(compile(reader.read_text().split('for typeName,methodName in ')[0],str(reader),'exec'),n)
b,off=n['binary'],n['off'];w=lambda a:struct.unpack_from('<I',b,off(a))[0]
checks={0x12e3f74:0xb9402d29,0x12e3f7c:0x1a9fb7fd,0x12e3fb8:0xb940314b,0x12e3fc0:0x1a9fa7eb,0x12e3fe0:0x6b0902ff,0x12e3fe4:0x540002aa,0x12e3fe8:0x52807d01,0x12e4028:0x1e220800,0x12e4030:0x54000048,0x12e44e0:0x2a1803e1,0x12e44e8:0x94473e80,0x126ebf0:0xb9002d2d,0x126ec38:0xb9002d2a,0x126ec3c:0xb900352b,0x126ec88:0xb9002d2b,0x126ec94:0xf803412d,0x126edf4:0xb9002d2b,0x126ee4c:0xb9002d2c,0x126eecc:0xb9002d2b}
for a,word in checks.items():assert w(a)==word,(hex(a),hex(w(a)))
assert struct.unpack_from('<2i',b,off(0x6973c8))==(12,5)
assert struct.unpack_from('<f',b,off(0x6975f8))[0]==1500
assert struct.unpack_from('<f',b,off(0x697580))[0]==3250
assert struct.unpack_from('<f',b,off(0x697584))[0]==4500
# Confirm the field names rather than interpreting offsets by visual guesses.
m,h,st=n['m'],n['h'],n['st'];ti,t=next((i,t)for i,t in enumerate(n['ts'])if st(t[0])=='PathElement');ptr=n['r'][n['r'][0x27d43f0]+ti*8];fields={}
for j,i in enumerate(range(t[8],t[8]+t[18])):
 name=st(struct.unpack_from('<3i',m,h[24]+i*12)[0]);offset=struct.unpack_from('<i',b,off(ptr+j*4))[0]
 if name in ['SpacesSinceLastTurn','SpacesSinceLastObstacle','BackToBackObstacleCount']:fields[name]=hex(offset)
assert fields=={'SpacesSinceLastTurn':'0x78','SpacesSinceLastObstacle':'0x7c','BackToBackObstacleCount':'0x80'}
def packed(addresses):
 value=0
 for address in addresses:
  instruction=w(address);shift=((instruction>>21)&3)*16;immediate=(instruction>>5)&65535
  value=(value&~(65535<<shift))|(immediate<<shift)
 return value
obstacle500,double500=struct.unpack('<If',struct.pack('<Q',packed([0x126ec6c,0x126ec70,0x126ec80])))
obstacle1500,double1500=struct.unpack('<If',struct.pack('<Q',packed([0x126ee2c,0x126ee30,0x126ee40])))
double2000,coin2000=struct.unpack('<fI',struct.pack('<Q',packed([0x126ee7c,0x126ee80,0x126ee84])))
double3250,coin3250=struct.unpack('<fI',struct.pack('<Q',packed([0x126eeb8,0x126eebc,0x126eec0])))
assert obstacle500==4 and abs(double500-.05)<1e-7
assert obstacle1500==3 and abs(double1500-.1)<1e-7
assert coin2000==coin3250==6 and abs(double2000-.15)<1e-7 and abs(double3250-.175)<1e-7
stages=[]
for lo,hi,turn,obstacle,coin,double in [(0,250,12,6,12,0),(250,500,10,5,10,0),(500,1000,8,4,9,.05),(1000,1500,6,4,8,.05),(1500,2000,5,3,7,.1),(2000,3250,4,3,6,.15),(3250,4500,3,3,6,.175)]:
 stages.append(dict(fromProgress=lo,toProgressExclusive=hi,minTurnSpaces=turn,minObstacleSpaces=obstacle,minCoinRunSpaces=coin,doubleObstaclePercent=double))
record=dict(binarySHA256=hashlib.sha256(b).hexdigest(),counterFields=fields,decodedPackedValues=dict(stage500=[obstacle500,double500],stage1500=[obstacle1500,double1500],stage2000=[double2000,coin2000],stage3250=[double3250,coin3250]),gridWorldMetres=12,normalMonotonicRunStages=stages,spacingGate='turns enabled AND SpacesSinceLastTurn>=sMinSpaceBetweenTurns; obstacle gate requires SpacesSinceLastTurn!=1 and BackToBackObstacleCount<sMaxBackToBackObstacles(2); if gap<minimum retain only when Range(0,1000)<doublePercent*1000',candidateChoice='Range(0,eligibleCount) at12e44e8; eligible list is built first, not a fixed global weight table',limits=['Some later stage entries inherit values set by earlier normal-run stages.','At4500+ control branches past these writes; fast-turn sections, remote overrides and full candidate filtering remain unaudited.','Minimum spacing is not a fixed road-length distribution.','Current CoursePlan coverage bag,144/168/192 groups, theme cadence and T25% remain explicit web assumptions.'],instructionChecks={hex(a):hex(v)for a,v in checks.items()})
out=Path(__file__).resolve().parents[1]/'target/temple-run/analysis/native-path-pacing.json';out.write_text(json.dumps(record,indent=2));print(json.dumps(record,indent=2))
