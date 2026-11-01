"""Audit the candidate-building slice of PathElement.GetRandomPathElementForSide.
Usage: python3 tools/inspect-native-path-candidates.py BASE.apk libil2cpp.so
Static inspection only; never loads/executes the APK library. Not a full generator.
"""
import hashlib,json,struct,subprocess,sys
from pathlib import Path
reader=Path(__file__).with_name('inspect-native-runtime-methods.py')
n={'__file__':str(reader)}
exec(compile(reader.read_text().split('for typeName,methodName in ')[0],str(reader),'exec'),n)
b,m,h,off=n['binary'],n['m'],n['h'],n['off']
def word(a):return struct.unpack_from('<I',b,off(a))[0]
checks={
 0x12e4238:0x128001f6,0x12e4248:0x110046d9,
 0x12e425c:0x97fffd49,0x12e4278:0x11003ac8,0x12e427c:0x71001d1f,
 0x12e4280:0x1a9f97e8,0x12e4284:0x0a1a011a,
 0x12e42a4:0x39403d09,0x12e42b0:0x11002aca,0x12e42b4:0x7100055f,
 0x12e42bc:0x7100053f,0x12e42c4:0x2a1f03fa,
 0x12e4384:0x7100093f,0x12e4388:0x110022c9,
 0x12e42cc:0x51007f29,0x12e42d0:0x7100093f,0x12e42d4:0x540001c3,
 0x12e42d8:0x71003b3f,0x12e42e0:0x71002f3f,
 0x12e4364:0x52800041,0x12e4368:0x2a1f03e0,0x12e4370:0x94473ede,
 0x12e4374:0x340004a0,0x12e43f4:0xd2960009,
 0x12e43f8:0xf2a00029,0x12e43fc:0xf2c007c9,
 0x12e4400:0xea09011f,0x12e4404:0x54000460,
 0x12e4408:0x110006d6,0x12e440c:0x710056df,0x12e4410:0x54fff1c1,
 0x12e44a8:0x11000718,0x12e44ac:0xb9002119,
 0x12e44d8:0x34000f78,0x12e44dc:0x2a1f03e0,0x12e44e0:0x2a1803e1,
 0x12e44e8:0x94473e80,0x12e4504:0xb940211a,
}
for a,v in checks.items():assert word(a)==v,(hex(a),hex(word(a)))
def call(a):
 w=word(a);assert w>>26==0x25
 v=w&0x3ffffff
 return a+4*(v-(1<<26) if v&(1<<25) else v)
assert call(0x12e4370)==call(0x12e44e8)==0x24b3ee8
# Resolve enum literals from metadata defaults. All PathType values here use
# one-byte compressed signed positive values (even bytes, value=byte/2).
t=next(t for t in n['ts'] if n['st'](t[0])=='PathType')
defaults={struct.unpack_from('<3i',m,a)[0]:struct.unpack_from('<3i',m,a)[2] for a in range(h[16],h[16]+h[17],12)}
enums={}
for i in range(t[8],t[8]+t[18]):
 name=n['st'](struct.unpack_from('<3i',m,h[24]+i*12)[0])
 if name=='value__':continue
 raw=m[h[18]+defaults[i]];assert raw<128 and raw%2==0
 enums[raw//2]=name
assert set(enums)==set(range(39)) and enums[38]=='kPathMax'
assert enums[3]=='kPathTurnA' and enums[10]=='kPathTDown'
assert enums[31]=='kPathStraightFlameTowerHighHorz' and enums[32]=='kPathStraightFlameTowerHighVert'
# Resolve static field offsets afresh from metadata+binary, not an old report.
ti,t=next((i,t) for i,t in enumerate(n['ts']) if n['st'](t[0])=='PathElement')
ptr=n['r'][n['r'][0x27d43f0]+ti*8];fields={}
for j,i in enumerate(range(t[8],t[8]+t[18])):
 name=n['st'](struct.unpack_from('<3i',m,h[24]+i*12)[0])
 fields[name]=struct.unpack_from('<i',b,off(ptr+j*4))[0]
assert fields['sAllowSidePaths']==15 and fields['Type']==0x30
mask=0
for a in [0x12e43f4,0x12e43f8,0x12e43fc]:
 w=word(a);mask|=((w>>5)&65535)<<(((w>>21)&3)*16)
excluded=[i for i in range(38) if mask>>i&1]
assert excluded==[12,13,15,16,33,34,35,36,37]
# Method names are resolved from tokens too; do not name helper semantics by
# what they appear to do in the caller.
methodNames={}
for i in range(t[9],t[9]+t[16]):
 d=struct.unpack_from('<7i4H',m,h[12]+i*36)
 a=n['r'].get(n['methods']+8*((d[6]&0xffffff)-1))
 if a in [0x12e3780,0x12e3df4,0x12e3e48]:methodNames[hex(a)]=n['st'](d[0])
assert methodNames=={'0x12e3780':'DoesPieceTypeFitOnSide','0x12e3df4':'ACertainTypeCheck','0x12e3e48':'GetRandomPathElementForSide'}
start,end=0x12e3e48,0x12e4bf4
out=Path(__file__).resolve().parents[1]/'target/temple-run/analysis/native-generation'
record={
 'binarySHA256':hashlib.sha256(b).hexdigest(),'metadataSHA256':hashlib.sha256(m).hexdigest(),
 'method':{'start':hex(start),'end':hex(end),'sha256':hashlib.sha256(b[off(start):off(end)]).hexdigest()},
 'verified':{
  'iteration':{'first':1,'lastInclusive':37,'formula':'w22=-16; type=w22+17; increment until w22==21'},
  'turnFilterWhenNotAllowed':{'types':list(range(3,11)),'names':[enums[i] for i in range(3,11)]},
  'sidePathsDisabled':{'parentStraightVert1Rejects':[7,8],'parentStraightHorz2Rejects':[9,10],'staticField':'sAllowSidePaths','offset':15},
  'genericPoolExcluded':{'mask':hex(mask),'types':excluded,'names':[enums[i] for i in excluded]},
  'extraRandomGate':{'types':[11,14,31,32],'names':[enums[i] for i in [11,14,31,32]],'rule':'in the eligible-obstacle branch, Range(0,2)==0 skips this candidate; surviving eligibility still required'},
  'selection':'if count>0, Range(0,count) selects one slot from the constructed int candidate array',
 },
 'resolvedMethodNames':methodNames,'pathTypes':enums,'instructionChecks':{hex(a):hex(v) for a,v in checks.items()},
 'limits':[
  'No unconditional global probabilities: state, direction, occupied neighbours, configuration and extra random gates alter the candidate pool.',
  'This slice does not decode DoesPieceTypeFitOnSide(0x12e3780), ACertainTypeCheck(0x12e3df4), all fallback/assembly paths or post-selection substitutions.',
  'Excluded from this generic pool does not mean absent from the game; long-hole and transition caps have separate assembly.',
  'No native full road-length distribution or universal T-junction percentage inferred. Current web weighted beats, recovery policy and group lengths remain project design.',
  'PathType31/32 names say high flame tower; this does not establish the web low-fire-wall variant as an independent native mechanic.',
 ]}
(out/'path-candidates.json').write_text(json.dumps(record,indent=2)+'\n')
print(json.dumps({'verified':record['verified'],'limits':record['limits']},indent=2))
