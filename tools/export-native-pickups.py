"""Export native pickup atlas coordinates and prefab dimensions, without repainting."""
import hashlib,json,struct,sys,zipfile
from pathlib import Path
import UnityPy
root=Path(__file__).resolve().parents[1];raw=Path(sys.argv[1]).read_bytes();objects={o.path_id:o for o in UnityPy.load(raw).objects};atlas=objects[1957].get_raw_data();tex=objects[81].read();assert tex.m_Name=='EffectsTexture2x'
names={'magnet':'pickupVacuum.png','shield':'pickupInvincibility.png','boost':'pickupBoost.png','bonus':'pickupCoinBonus.png'}
def rect(name):
 p=atlas.index(name.encode());p=(p+len(name)+3)//4*4
 return list(map(int,struct.unpack_from('<4f',atlas,p)))
frames={k:rect(n)for k,n in names.items()};sparkles=[rect(f'sparkle{i}.png')for i in range(1,12)]
prefabKeys={'magnet':'3c3dd1062b4ec054abc6537a33f1fdb4','shield':'67889826fae00394980b09531ad50e8e','boost':'53b67a9e3e4a2b441935c8b39f299ecf','bonus':'ca1c5ef40178fbf42b358fa5c1aa41b4'}
z=zipfile.ZipFile(sys.argv[2]);prefabs={};iconSizes={}
for kind,key in prefabKeys.items():
 source=z.read('assets/bin/Data/'+key);items={o.path_id:o for o in UnityPy.load(source).objects}
 parent=items[4].read_typetree()['m_LocalScale'];child=items[6].read_typetree()['m_LocalScale']
 animation=next(o.get_raw_data()for o in items.values()if o.type.name=='MonoBehaviour'and o.read_typetree(check_read=False)['m_Script']['m_PathID']==897);assert b'sparkle' in animation
 first,last,fps=struct.unpack_from('<iif',animation,52);assert (first,last,fps)==(1,11,15)
 size=[round(parent[axis]*child[axis]*.2,6)for axis in ('x','y')];iconSizes[kind]=size
 prefabs[kind]=dict(key=key,sha256=hashlib.sha256(source).hexdigest(),parentScale=parent,iconScale=child,worldSize=size,firstFrame=first,lastFrame=last,fps=fps)
sparklePadding=[]
for i,rect_ in enumerate(sparkles,1):
 name=f'sparkle{i}.png';pos=atlas.index(name.encode());pos=(pos+len(name)+3)//4*4
 padding=struct.unpack_from('<4f',atlas,pos+32) # Sprite.paddingLeft/Right/Top/Bottom
 sparklePadding.append([round(padding[j]*rect_[2 if j<2 else 3])for j in range(4)])
assert all([r[2]+p[0]+p[1],r[3]+p[2]+p[3]]==[173,283]for r,p in zip(sparkles,sparklePadding))
data=dict(sparklePadding=sparklePadding,atlasSize=list(tex.image.size),icons=frames,sparkles=sparkles,fps=15,iconSizes=iconSizes,sparkleSize=[1.78,3.58])
(root/'target/temple-run/web/src/game/nativePickupFrames.json').write_text(json.dumps(data,indent=2)+'\n')
(root/'target/temple-run/analysis/native-pickup-source.json').write_text(json.dumps(dict(sharedAssetsSHA256=hashlib.sha256(raw).hexdigest(),atlasPathID=1957,texturePathID=81,shaderPathID=115,shader='Unlit/Premultiplied Alpha/Transparent Colored (+1)',coinBonusPrefab='ca1c5ef40178fbf42b358fa5c1aa41b4',prefabScale=.1,worldScale=.2,sourceIconSize=[160,160],sourceSparkleSize=[89,179],animationFrames=[1,11],prefabs=prefabs,**data),indent=2)+'\n')
for kind,r in frames.items():
 x,y,w,h=r;tex.image.crop((x,y,x+w,y+h)).save(root/f'target/temple-run/web/public/assets/ui/native-pickup-{kind}.png')
print(json.dumps(data))
