"""Verify boost mechanics from static IL2CPP instructions. Never executes native code."""
import contextlib,hashlib,io,json,runpy,struct,subprocess,sys
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
with contextlib.redirect_stdout(io.StringIO()):d=runpy.run_path(str(ROOT/'tools/inspect-native-runtime-methods.py'))
binary,off=d['binary'],d['off']
def w(a):return struct.unpack_from('<I',binary,off(a))[0]
checks={0x126a178:0x52a86f48,0x126a184:0xb9016268, #250 into controller160
 0x1298d14:0x52a84908,0x1298d20:0x1e212901,0x1298d24:0xbd017a61, #+50 budget
 0x1299334:0xb9018268, #ctor slowdown50
 0x126e468:0xbd417900,0x126e46c:0x1e283800,0x126e470:0xbd017900, #subtract metric s8
 0x126fc64:0x52a862c8,0x126fc88:0x52b862c8, #raw forces+/-150
 0x1298344:0x3945d408,0x1298364:0x1e202800, #normal boost doubles max run speed
 0x1298d08:0x1e221000, #4 seconds initial invincibility
 0x1297360:0x540002a5} #remaining>=50 skips invincibility countdown
for a,expected in checks.items():assert w(a)==expected,hex(a)
fields={}
for typeName in ['GameController','CharacterPlayer']:
 ti=next(i for i,t in enumerate(d['ts']) if d['st'](t[0])==typeName);t=d['ts'][ti];pointer=d['r'][d['fieldTable']+ti*8]
 for j,i in enumerate(range(t[8],t[8]+t[18])):
  name,_,_=struct.unpack_from('<3i',d['m'],d['h'][24]+i*12);name=d['st'](name)
  if 'Boost' in name:fields[typeName+'.'+name]=hex(struct.unpack_from('<i',binary,off(pointer+j*4))[0])
assert fields['CharacterPlayer.BoostDistanceLeft']=='0x178'
out=ROOT/'target/temple-run/analysis/native-boost-rules';out.mkdir(exist_ok=True)
records={}
for name,a,b in [('StartBoost',0x1298cc8,0x1298d44),('ComputeDistanceTraveled',0x126e458,0x126e474),('HandleControlsBoostForce',0x126fc40,0x126fc90),('BoostInvincibilityClock',0x129733c,0x1297378),('GetMaxRunVelocity',0x129833c,0x129836c)]:
 asm=subprocess.run(['/usr/bin/objdump','-d','--start-address='+hex(a),'--stop-address='+hex(b),sys.argv[2]],capture_output=True,text=True,check=True).stdout
 (out/(name+'.asm')).write_text(asm);records[name]=dict(start=hex(a),end=hex(b),sha256=hashlib.sha256(binary[off(a):off(b)]).hexdigest())
result=dict(binarySHA256=d['record']['binarySHA256'],fields=fields,methods=records,
 verified=dict(baseBudget=250,brakingAllowance=50,progressUnit='ComputeDistanceTraveled metric delta, not scaled physical metres',firstInvincibilitySeconds=4,clockPausedWhileRemainingAtLeast=50,normalBoostMaxSpeedMultiplier=2,rawAccelerationForce=150,rawBrakingForce=-150,webWorldAcceleration=30,refresh='replace budget, preserve pre-boost speed; do not restart4s while already boosting'),
 limits=['Remote config and boost upgrade overrides not decoded.','Mega boost multiplier2.5 is outside the normal pickup implementation.','Automatic selected-exit queueing is a web playability adapter; exact native graph-following transition has not been independently ported.'])
(out/'source.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result['verified'],indent=2))
