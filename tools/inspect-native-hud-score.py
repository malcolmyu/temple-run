"""Statically resolve and preserve native HUD score evidence; never execute the library."""
import sys,struct,json,hashlib,subprocess
from pathlib import Path
script=Path(__file__).with_name('inspect-native-runtime-methods.py')
scope={'__file__':str(script)}
exec(script.read_text().split('records={}')[0],scope)
ts,m,h,st,r,methods,binary,off,addresses=[scope[k] for k in ['ts','m','h','st','r','methods','binary','off','addresses']]
root=script.resolve().parents[1]/'target/temple-run/analysis';records={}
for ti in range(3465,4160):
 t=ts[ti];type_name=st(t[0])
 if type_name!='GameGUI':continue
 for i in range(t[9],t[9]+t[16]):
  q=struct.unpack_from('<7i4H',m,h[12]+i*36);name=st(q[0])
  if name not in ['Awake','Update','SetScore']:continue
  a=r.get(methods+8*((q[6]&0xffffff)-1))
  if not a:continue
  end=next(v for v in addresses if v>a)
  asm=subprocess.run(['/usr/bin/objdump','-d','--start-address='+hex(a),'--stop-address='+hex(end),sys.argv[2]],check=True,capture_output=True,text=True).stdout
  key=type_name+'.'+name;(root/'native-methods'/f'{key}.asm').write_text(asm)
  records[key]={'address':hex(a),'end':hex(end),'sha256':hashlib.sha256(binary[off(a):off(end)]).hexdigest()}
record={'librarySHA256':hashlib.sha256(binary).hexdigest(),'methods':records,'finding':'Update compares CharacterPlayer.Score at +0x138 against cached score +0x80 each frame, updates immediately when changed; no periodic throttle or smoothing in this path','uncertainty':'UILabel mesh rebuilding and source-frame capture may add a frame; initial 0-to100 visible jump not yet explained'}
(root/'native-hud-score-source.json').write_text(json.dumps(record,indent=2)+'\n')
print(json.dumps(record,ensure_ascii=False))
