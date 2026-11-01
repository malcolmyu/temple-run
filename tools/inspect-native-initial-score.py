"""Statically resolve and preserve native score initialization evidence; never execute the library."""
import sys,struct,json,hashlib,subprocess
from pathlib import Path
script=Path(__file__).with_name('inspect-native-runtime-methods.py')
scope={'__file__':str(script)}
exec(script.read_text().split('records={}')[0],scope)
ts,m,h,st,r,methods,binary,off,addresses=[scope[k] for k in ['ts','m','h','st','r','methods','binary','off','addresses']]
root=script.resolve().parents[1]/'target/temple-run/analysis';records={}
for ti in range(3465,4160):
 t=ts[ti];type_name=st(t[0])
 if type_name not in ['CharacterPlayer','CommonPlayer','GameController']:continue
 for i in range(t[9],t[9]+t[16]):
  q=struct.unpack_from('<7i4H',m,h[12]+i*36);name=st(q[0])
  if (type_name,name) not in [('CharacterPlayer','Reset'),('CharacterPlayer','AddScore'),('CommonPlayer','Update'),('GameController','LoadLevelInformation'),('GameController','GameStart'),('GameController','ComputeDistanceTraveled')]:continue
  a=r.get(methods+8*((q[6]&0xffffff)-1))
  if not a:continue
  end=next(v for v in addresses if v>a)
  asm=subprocess.run(['/usr/bin/objdump','-d','--start-address='+hex(a),'--stop-address='+hex(end),sys.argv[2]],check=True,capture_output=True,text=True).stdout
  key=type_name+'.'+name;(root/'native-methods'/f'{key}.asm').write_text(asm)
  records[key]={'address':hex(a),'end':hex(end),'sha256':hashlib.sha256(binary[off(a):off(end)]).hexdigest()}
callers=[]
for ti in range(3465,4160):
 t=ts[ti]
 for i in range(t[9],t[9]+t[16]):
  q=struct.unpack_from('<7i4H',m,h[12]+i*36);a=r.get(methods+8*((q[6]&0xffffff)-1))
  if not a:continue
  end=next((v for v in addresses if v>a),a)
  if end-a>100000:continue
  for pc in range(a,end,4):
   ins=struct.unpack_from('<I',binary,off(pc))[0]
   if ins>>26!=0b100101:continue
   imm=ins&0x3ffffff;imm=imm-(1<<26)if imm&(1<<25)else imm
   if pc+imm*4==0x1298a8c:callers.append(dict(method=st(t[0])+'.'+st(q[0]),callAddress=hex(pc)))
record={'librarySHA256':hashlib.sha256(binary).hexdigest(),'methods':records,'resetScore':0,'resetScoreEvidence':'CharacterPlayer.Reset12983e4','resetPreviousLocation':'CharacterPlayer.Reset12984e8..ec caches current transform XYZ','perFramePreviousLocation':'CommonPlayer.Update1297e68..6c caches transform before MovingObject.Simulate','addScoreFormula':'if integerDelta>=1: Score += integerDelta*ScoreMultiplier','directAddScoreCallers':callers,'callerScanScope':'direct BL only, Assembly-CSharp methods3465..4159','spawnPositionRaw':[0,0,-10],'spawnEvidence':'LoadLevelInformation126a634..644 sets origin;126a678..680 virtual Reset;126a70c..71c sets Z=-10 after Reset caches PreviousLocation','runClockEvidence':'GameController.Update126c998..126c9b0 loads f32+0xd0, adds smoothDeltaTime via FADD s0,s8,s0 and stores f32; GameStart126b328 zeroes +0xd0','releaseOrder':'CharacterPlayer220 remains held; Controller280 releases Hold and computes distance using cached origin before next actor movement','firstReleaseWorldDisplacement':2,'conclusion':'Spawn displacement yields100 points at60FPS via ordinary distance formula; initial video-clock phase still approximate.'}
(root/'native-initial-score-source.json').write_text(json.dumps(record,indent=2)+'\n')
print(json.dumps(record,ensure_ascii=False))
