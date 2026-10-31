"""Preserve the default actor's actual renderer hierarchy before changing fitted sizing."""
from pathlib import Path
import hashlib,json,struct
import UnityPy
root=Path(__file__).resolve().parents[1];path=Path('/tmp/temple-sharedassets0.assets');raw=path.read_bytes();obs={o.path_id:o for o in UnityPy.load(raw).objects}
owner=next(o for o in obs.values()if o.type.name=='GameObject'and o.read().m_Name=='Jhony_Export3');go=owner.read_typetree();transform=next(obs[c['component']['m_PathID']]for c in go['m_Component']if obs[c['component']['m_PathID']].type.name=='Transform');ids=set()
def visit(tid):
 ids.add(tid)
 for child in obs[tid].read_typetree()['m_Children']:visit(child['m_PathID'])
visit(transform.path_id);renderers=[]
for tid in ids:
 t=obs[tid].read_typetree();g=obs[t['m_GameObject']['m_PathID']].read_typetree()
 for ref in g['m_Component']:
  o=obs[ref['component']['m_PathID']]
  if o.type.name!='SkinnedMeshRenderer':continue
  r=o.read_typetree();renderers.append(dict(pathID=o.path_id,gameObjectName=g['m_Name'],transformPathID=tid,position=t['m_LocalPosition'],rotation=t['m_LocalRotation'],scale=t['m_LocalScale'],localBounds=r.get('m_AABB'),rootBone=r.get('m_RootBone'),mesh=r['m_Mesh']))
binary=Path('/tmp/temple-libil2cpp.so').read_bytes()
ph=struct.unpack_from('<Q',binary,32)[0];pe,pn=struct.unpack_from('<HH',binary,54)
segments=[struct.unpack_from('<II6Q',binary,ph+i*pe)for i in range(pn)]
def instruction(address):
 seg=next(p for p in segments if p[0]==1 and p[3]<=address<p[3]+p[5])
 return struct.unpack_from('<I',binary,seg[2]+address-seg[3])[0]
def branch_target(address):
 word=instruction(address);assert word>>26==0b100101
 imm=word&0x3ffffff
 if imm&(1<<25):imm-=1<<26
 return address+imm*4
assert instruction(0x12986ec)==0x1e2703e0 # s0=0
assert instruction(0x12986f0)==0x1e2e1001 # s1=1
assert instruction(0x12986f4)==0x1e2703e2 # s2=0
assert branch_target(0x12986fc)==0x24c1e28 # independently resolved Transform.set_localPosition
assert branch_target(0x12986d8)==0x24c2e44 # independently resolved Transform.set_parent
result=dict(sourceSHA256=hashlib.sha256(raw).hexdigest(),animationOwnerPathID=owner.path_id,animationOwner=go['m_Name'],renderers=renderers,worldScale=.2,nativeBinarySHA256=hashlib.sha256(binary).hexdigest(),setupCharacter=dict(address='0x1298500',setParentCall='0x12986d8',setLocalPositionCall='0x12986fc',setLocalPositionTarget='0x24c1e28',positionRaw=[0,1,0],positionWorld=[0,.2,0]),webSizing='default runner now uses original serialized bone TRS, absolute root curves, scale .2 and model Y .2; no posed-height normalization')
(root/'target/temple-run/analysis/native-runner-transform-source.json').write_text(json.dumps(result,indent=2)+'\n');print('native renderer count',len(renderers))
