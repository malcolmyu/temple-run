"""Static audit only; never execute the native library."""
import contextlib,hashlib,io,json,runpy,struct,subprocess,sys
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
with contextlib.redirect_stdout(io.StringIO()):d=runpy.run_path(str(ROOT/'tools/inspect-native-runtime-methods.py'))
binary,off=d['binary'],d['off']
def word(a):return struct.unpack_from('<I',binary,off(a))[0]
assert word(0x1298c30)==0xbd015800 # own invincibility time158
assert word(0x1298c34)==0x39055008 # own flag154
assert word(0x1298ca0)==0xbd017000 # own vacuum time170
assert word(0x1298ca4)==0x3905b008 # own flag16c
assert word(0x1298ce4)==0x3905d00a # boost flag174
assert word(0x1298d08)==0x1e221000 # first boost starts4-second invincibility
out=ROOT/'target/temple-run/analysis/native-power-stacking';out.mkdir(exist_ok=True)
records={};t=next(t for t in d['ts'] if d['st'](t[0])=='CharacterPlayer')
for i in range(t[9],t[9]+t[16]):
 m=struct.unpack_from('<7i4H',d['m'],d['h'][12]+i*36);a=d['r'][d['methods']+8*((m[6]&0xffffff)-1)]
 if a not in [0x1298c24,0x1298c9c,0x1298cc8]:continue
 name=d['st'](m[0]);end={0x1298c24:0x1298c6c,0x1298c9c:0x1298cb0,0x1298cc8:0x1298d44}[a]
 asm=subprocess.run(['/usr/bin/objdump','-d','--start-address='+hex(a),'--stop-address='+hex(end),sys.argv[2]],capture_output=True,text=True,check=True).stdout
 (out/(name+'.asm')).write_text(asm);records[name]=dict(address=hex(a),end=hex(end),sha256=hashlib.sha256(binary[off(a):off(end)]).hexdigest())
result=dict(binarySHA256=d['record']['binarySHA256'],methods=records,verified=['Vacuum and invincibility have separate flags and remaining times.','Their start methods assign their own timer, not add duration.','StartBoost sets a distinct flag; initial start also calls invincibility with4 seconds.'],limits=['Web boost remains timed5 seconds, not yet ported native distance-based boost.','Web presently preserves the existing shield when starting boost; native4-second replacement behavior requires integration with distance/slowdown rules.'])
(out/'source.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
