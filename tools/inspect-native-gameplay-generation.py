"""Static IL2CPP generation audit: metadata names, method RVAs, field offsets, verified defaults.
Usage: python3 tools/inspect-native-gameplay-generation.py BASE.apk libil2cpp.so
Never loads or executes the native library. Runtime remote-config probabilities remain unresolved.
"""
import contextlib, hashlib, io, json, runpy, struct, subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
with contextlib.redirect_stdout(io.StringIO()):
    d=runpy.run_path(str(ROOT/'tools/inspect-native-runtime-methods.py'))
binary,off=d['binary'],d['off']
ti=next(i for i,t in enumerate(d['ts']) if d['st'](t[0])=='PathElement')
t=d['ts'][ti]; pointer=d['r'][d['fieldTable']+ti*8]; fields={}
for j,i in enumerate(range(t[8],t[8]+t[18])):
    name,_,_=struct.unpack_from('<3i',d['m'],d['h'][24]+i*12)
    name=d['st'](name)
    if name.startswith('s'): fields[name]=hex(struct.unpack_from('<i',binary,off(pointer+j*4))[0])
def word(a):return struct.unpack_from('<I',binary,off(a))[0]
assert struct.unpack_from('<2i',binary,off(0x6973c0))==(6,2)
assert struct.unpack_from('<2i',binary,off(0x696d30))==(6,5)
assert word(0x12e8d60)==0xfc02c120 # first literal pair -> fields2c/30
assert word(0x12e8d74)==0xb900192a #50 -> field18
assert word(0x12e8d7c)==0xf803412a #6 and zero -> fields34/38
assert word(0x12e8d84)==0xfc03c120 # second literal pair -> fields3c/40
# AddBonusItems uses config positivity as an enable flag, then50% gate+uniform type.
for address,expected in {
 0x12e6104:0x1e202008,0x12e6108:0x5400014d,
 0x12e6118:0x5280008a,0x12e616c:0x528000ab,0x12e61b8:0x528000cb,0x12e6204:0x528000e9,
 0x12e6220:0x52800041,0x12e6224:0x2a1f03e0,0x12e6230:0x34000300,
 0x12e6290:0x2a1503e1,0x12e62b0:0xb9402114,
 0x12e6004:0x540013ad}.items():assert word(address)==expected,hex(address)
def branch_target(a):
 ins=word(a);assert ins&0xfc000000==0x94000000
 delta=ins&0x3ffffff
 if delta&(1<<25):delta-=1<<26
 return a+delta*4
assert branch_target(0x12e622c)==branch_target(0x12e6298)==0x24b3ee8
assert fields['sProbabilityCoinBonus']=='0x1c' and fields['sProbabilityBoost']=='0x28'
out=ROOT/'target/temple-run/analysis/native-generation';out.mkdir(exist_ok=True)
names={'.cctor','GetRandomPathElementForSide','AddRandomPath','AddBonusItems','AddCoins'}
records={}
for i in range(t[9],t[9]+t[16]):
    definition=struct.unpack_from('<7i4H',d['m'],d['h'][12]+i*36)
    name=d['st'](definition[0])
    if name not in names:continue
    address=d['r'][d['methods']+8*((definition[6]&0xffffff)-1)]
    end=next(a for a in d['addresses'] if a>address)
    asm=subprocess.run(['/usr/bin/objdump','-d','--start-address='+hex(address),'--stop-address='+hex(end),__import__('sys').argv[2]],check=True,capture_output=True,text=True).stdout
    (out/('PathElement.'+name+'.asm')).write_text(asm)
    records[name]=dict(address=hex(address),end=hex(end),sha256=hashlib.sha256(binary[off(address):off(end)]).hexdigest())
result=dict(binarySHA256=d['record']['binarySHA256'],methods=records,staticFieldOffsets=fields,
 verifiedConstructorDefaults=dict(sMinSpaceBetweenTurns=6,sMaxBackToBackObstacles=2,sMinSpaceBetweenObstacles=6,sDoubleObstaclePercent=0,sMinSpacesBetweenCoinRuns=6,sMaxCoinsPerRun=5,sMinSpacesBetweenBonusItems=50),
 verifiedBonusSelection=dict(configInterpretation='positive enables candidate; magnitude is not used as a weight',candidateEnums=[4,5,6,7],gate='Range(0,2)==0',choice='Range(0,enabledCount)',randomRangeInt='0x24b3ee8',spacing='strictly greater than sMinSpacesBetweenBonusItems',webAdaptation='all four enabled; safe lane and height1.35; geometry protections approximate original tile predicates'),
 limitations=['Static defaults can be overwritten by GameController configuration.','Road branching weights and length distribution remain undecoded; runtime bonus enable configuration has not been recovered.','Web gapJitter24, gem14% and theme schedule are not proven native rules; bonus selection now follows the verified gate and enabled pool.'])
(out/'source.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:result[k] for k in ['methods','verifiedConstructorDefaults','verifiedBonusSelection','limitations']},indent=2))
