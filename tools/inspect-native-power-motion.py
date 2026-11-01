"""Capture native power presentation evidence by static parsing only; never run the library."""
import sys,struct,json,hashlib,subprocess
from pathlib import Path
import UnityPy
p=Path(__file__).with_name('inspect-native-runtime-methods.py');s={'__file__':str(p)}
exec(p.read_text().split('records={}')[0],s)
root=p.resolve().parents[1]/'target/temple-run/analysis';records={}
wanted={'BonusItem':['Update','Instantiate'],'FaceCamera':['Update'],'MovingObject':['Update','Simulate'],'UISprite':['MakePixelPerfect'],'UISpriteFrameAnimation':['Start','Update','.ctor']}
for t in s['ts'][3465:4160]:
 name=s['st'](t[0])
 if name not in wanted:continue
 for i in range(t[9],t[9]+t[16]):
  q=struct.unpack_from('<7i4H',s['m'],s['h'][12]+i*36);method=s['st'](q[0])
  if method not in wanted[name]:continue
  a=s['r'].get(s['methods']+8*((q[6]&0xffffff)-1));end=next(v for v in s['addresses']if v>a)
  asm=subprocess.run(['/usr/bin/objdump','-d','--start-address='+hex(a),'--stop-address='+hex(end),sys.argv[2]],check=True,capture_output=True,text=True).stdout
  (root/'native-methods'/f'{name}.{method}.asm').write_text(asm)
  records[name+'.'+method]={'address':hex(a),'end':hex(end),'sha256':hashlib.sha256(s['binary'][s['off'](a):s['off'](end)]).hexdigest()}
assert struct.unpack_from('<I',s['binary'],s['off'](0x129606c))[0]==0x140127f9
prefabs={}
for kind,key in {'magnet':'3c3dd1062b4ec054abc6537a33f1fdb4','shield':'67889826fae00394980b09531ad50e8e','boost':'53b67a9e3e4a2b441935c8b39f299ecf','bonus':'ca1c5ef40178fbf42b358fa5c1aa41b4'}.items():
 raw=s['z'].read('assets/bin/Data/'+key);env=UnityPy.load(raw);f=next(iter(env.files.values()));scripts=UnityPy.load(s['z'].read('assets/bin/Data/'+f.externals[0].path));obs={o.path_id:o for o in scripts.objects};behaviours=[]
 assert not any(o.type.name in ['Animation','Animator']for o in env.objects)
 for o in env.objects:
  if o.type.name!='MonoBehaviour':continue
  d=o.read_typetree(check_read=False);ref=d['m_Script'];assert ref['m_FileID']==1
  behaviours.append(obs[ref['m_PathID']].read_typetree()['m_ClassName'])
 assert set(behaviours)==({'BonusItem','FaceCamera','UISprite','UISpriteFrameAnimation','UIPanel'} if kind in ['boost','bonus'] else {'BonusItem','FaceCamera','UISprite','UISpriteFrameAnimation'})
 prefabs[kind]={'key':key,'sha256':hashlib.sha256(raw).hexdigest(),'behaviours':behaviours,'animationComponents':[]}
assert struct.unpack_from('<I',s['binary'],s['off'](0x12cbd14))[0]==0xa95a8509 # vtable slot7, MakePixelPerfect
# Resolve actual UnityEngine.CoreModule method pointers used by FaceCamera.Update.
b=s['binary'];offset=b.index(b'UnityEngine.CoreModule.dll\0');seg=next(p for p in s['segments']if p[0]==1 and p[2]<=offset<p[2]+p[5]);va=seg[3]+offset-seg[2]
mod=next(a for a,v in s['r'].items()if v==va and 100<struct.unpack_from('<I',b,s['off'](a+8))[0]<30000);table=s['r'][mod+16];calls={}
for t in s['ts']:
 if s['st'](t[0]) not in ['Transform','Camera']:continue
 for i in range(t[9],t[9]+t[16]):
  q=struct.unpack_from('<7i4H',s['m'],s['h'][12]+i*36);a=s['r'].get(table+8*((q[6]&0xffffff)-1))
  if a in [0x24c2674,0x24c2ac8,0x24c3628,0x2494ecc]:calls[hex(a)]=s['st'](t[0])+'.'+s['st'](q[0])
assert calls=={'0x2494ecc':'Camera.get_main','0x24c2674':'Transform.get_position','0x24c2ac8':'Transform.get_up','0x24c3628':'Transform.LookAt'}
obs={o.path_id:o for o in UnityPy.load('/tmp/temple-sharedassets0.assets').objects};state=obs[115].read_typetree()['m_ParsedForm']['m_SubShaders'][0]['m_Passes'][0]['m_State']
assert state['culling']['val']==0
assert struct.unpack_from('<I',s['binary'],s['off'](0x12cbca0))[0]==0x1e203900 # countdown - dt
assert struct.unpack_from('<I',s['binary'],s['off'](0x12cbcc0))[0]==0x1e211841 # 60/fps
assert struct.unpack_from('<I',s['binary'],s['off'](0x12cbcc4))[0]==0x1e221821 # /60
result={'spriteAnimationClock':'Start copies first frame into next frame. Each active Update subtracts Time.deltaTime(f32); if <=0, adds (60/fps)/60(f32), displays next frame and increments once, not a while loop. Constructor direction=+1. Per-instance countdown, no global phase.','faceCameraCalls':calls,'faceCameraMapping':'LookAt(camera world position,camera world up); web negates native Z, so local plane X and crop offsets reflect horizontally. Use unlit double-sided planes, not screen-aligned Sprites.','shaderCullMode':state['culling']['val'],'sparkleFrameSizing':'UISpriteFrameAnimation.Update12cbd14 calls virtual slot7; UISprite.MakePixelPerfect128433c includes Sprite paddingLeft/Right/Top/Bottom. All11 sparkle crops occupy173x283 untrimmed pixels. Renderer preserves each crop size and atlas padding with plane positions.', 'librarySHA256':hashlib.sha256(s['binary']).hexdigest(),'methods':records,'prefabs':prefabs,'finding':'BonusItem.Update tail-calls MovingObject.Update/Simulate; no independent bob function. Prefabs have BonusItem, FaceCamera and sprite/frame animation (boost/bonus also have UIPanel). MovingObject integrates forces/velocity/path, not sinusoidal bob. Ordinary unforced native powers retain authored root height.','limitations':['Reference authored root heights/spawn positions remain fitted.','Magnet attraction is separate.','Native pool activation timing still unverified; inactive instances retain clock state.']}
(root/'native-power-motion-source.json').write_text(json.dumps(result,indent=2)+'\n');print('Captured four original power prefabs and native update chain; no bob animator.')
