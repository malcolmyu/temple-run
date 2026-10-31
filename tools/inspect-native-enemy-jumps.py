"""Statically resolve and preserve native enemy jump evidence; never execute the library."""
import sys,struct,json,hashlib,subprocess
from pathlib import Path
script=Path(__file__).with_name('inspect-native-runtime-methods.py')
scope={'__file__':str(script)}
exec(script.read_text().split('records={}')[0],scope)
ts,m,h,st,r,methods,binary,off,addresses=[scope[k] for k in ['ts','m','h','st','r','methods','binary','off','addresses']]
root=script.resolve().parents[1]/'target/temple-run/analysis';records={}
for ti in range(3465,4160):
 t=ts[ti];type_name=st(t[0])
 if type_name not in ['Enemy','GameController']:continue
 for i in range(t[9],t[9]+t[16]):
  q=struct.unpack_from('<7i4H',m,h[12]+i*36);name=st(q[0])
  if type_name=='GameController' and name not in ['HandleDelayedJumping','SimulateEnemies']:continue
  a=r.get(methods+8*((q[6]&0xffffff)-1))
  if not a:continue
  end=next(v for v in addresses if v>a)
  asm=subprocess.run(['/usr/bin/objdump','-d','--start-address='+hex(a),'--stop-address='+hex(end),sys.argv[2]],check=True,capture_output=True,text=True).stdout
  key=type_name+'.'+name;(root/'native-methods'/f'{key}.asm').write_text(asm)
  records[key]={'address':hex(a),'end':hex(end),'sha256':hashlib.sha256(binary[off(a):off(end)]).hexdigest()}
record={'librarySHA256':hashlib.sha256(binary).hexdigest(),'methods':records,'delay':'horizontal enemy-player separation / player forward speed','resetJumpVelocityRaw':80,'jumpVelocityRawClamp':[80,100],'jumpVelocityUpdateEvidence':'SimulateEnemies1271a9c..1271ad4: player speed clamped and stored at Enemy+0x80','gravityRaw':250,'worldScale':.2,'groundSnap':'only when IsOverGround and y < GroundHeight; clears jumping and vertical velocity','scope':'flat-road delayed jump integrated; native enemy falling/level changes remain unverified'}
(root/'native-enemy-jump-source.json').write_text(json.dumps(record,indent=2)+'\n')
print(json.dumps(record,ensure_ascii=False))
