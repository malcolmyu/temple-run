"""Record native enemy prefab TRS and verify exported bones against its renderer."""
from pathlib import Path
import json,hashlib,sys,struct
import UnityPy
root=Path(__file__).resolve().parents[1];raw=Path('/tmp/temple-sharedassets0.assets').read_bytes();obs={o.path_id:o for o in UnityPy.load(raw).objects}
r=obs[1940].read_typetree();data=json.loads((root/'target/temple-run/web/public/assets/characters/rig-enemy.json').read_text())
assert len(r['m_Bones'])==len(data['bones'])
maximum=0
for i,ref in enumerate(r['m_Bones']):
 t=obs[ref['m_PathID']].read_typetree()
 for key,sourceKey in [('position','m_LocalPosition'),('rotation','m_LocalRotation'),('scale','m_LocalScale')]:
  maximum=max(maximum,max(abs(a-b)for a,b in zip(data['bones'][i][key],t[sourceKey].values())))
assert maximum==0
transforms=[]
for i in [1054,1405,1072]:
 t=obs[i].read_typetree();transforms.append(dict(pathID=i,name=obs[t['m_GameObject']['m_PathID']].read_typetree()['m_Name'],position=t['m_LocalPosition'],rotation=t['m_LocalRotation'],scale=t['m_LocalScale']))
for t in transforms[:2]:assert list(t['scale'].values())==[1,1,1]and list(t['position'].values())==[0,0,0]
p=root/'tools/inspect-native-runtime-methods.py';s=p.read_text();scope={'__file__':str(p)};exec(s[:s.index('records={}')],scope)
binary=scope['binary'];reloc=scope['r'];off=scope['off'];name=binary.index(b'UnityEngine.AnimationModule.dll\0');seg=next(p for p in scope['segments']if p[0]==1 and p[2]<=name<p[2]+p[5]);va=seg[3]+name-seg[2]
mod=next(a for a,v in reloc.items()if v==va and 20<struct.unpack_from('<I',binary,off(a+8))[0]<1000);methods=reloc[mod+16]
t=next(t for t in scope['ts']if scope['st'](t[0])=='AnimationState'and scope['st'](t[1])=='UnityEngine');resolved={}
for i in range(t[9],t[9]+t[16]):
 q=struct.unpack_from('<7i4H',scope['m'],scope['h'][12]+i*36);address=reloc.get(methods+8*((q[6]&0xffffff)-1),0)
 if address in [0x248d344,0x248d3cc]:resolved[scope['st'](q[0])]=hex(address)
assert resolved['set_normalizedTime']=='0x248d344'and resolved['set_speed']=='0x248d3cc'
result=dict(assetSHA256=hashlib.sha256(raw).hexdigest(),nativeBinarySHA256=hashlib.sha256(binary).hexdigest(),prefab202='monster_prefab',rendererPathID=1940,mesh=r['m_Mesh'],boneCount=len(data['bones']),boneTRSMaxDifference=maximum,transforms=transforms,worldScale=.2,modelOffsetWorld=[0,0,0],animationMethods=resolved,reset='Enemy.Reset12ae0f4 sets random normalizedTime via12ae1a8→248d344; not speed',limitations=['Unity quaternion interpolation remains unverified','per-enemy native random normalizedTime is not reconstructed','enemy simulation jumping/ground callbacks remain approximate'])
(root/'target/temple-run/analysis/native-enemy-transform-source.json').write_text(json.dumps(result,indent=2)+'\n');print('Enemy source hierarchy/bones and AnimationState normalizedTime setter verified.')
