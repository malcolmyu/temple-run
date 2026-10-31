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
 limitations=['Static defaults can be overwritten by GameController configuration.','Method bodies extracted; branching weights, length distribution and runtime probabilities not yet decoded.','Web gapJitter24, gem14%, equal power weights and theme schedule are not proven native rules.'])
(out/'source.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:result[k] for k in ['methods','verifiedConstructorDefaults','limitations']},indent=2))
