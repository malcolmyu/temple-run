"""Follow enemy -> parent Animation -> native Run in the reference APK.
Usage: UnityPy-python tools/export-enemy-animation.py /path/to/base.apk
"""
import json,sys,zipfile,hashlib
from pathlib import Path
import UnityPy
root=Path(__file__).resolve().parents[1]
z=zipfile.ZipFile(sys.argv[1]);parts=sorted((n for n in z.namelist() if '/sharedassets0.assets.split' in n),key=lambda n:int(n.rsplit('split',1)[1]))
raw=b''.join(z.read(n) for n in parts);env=UnityPy.load(raw);objects={o.path_id:o for o in env.objects}
enemy=next(o for o in objects.values() if o.type.name=='GameObject' and o.read().m_Name=='enemy')
transform=next(objects[c['component']['m_PathID']] for c in enemy.read_typetree()['m_Component'] if objects[c['component']['m_PathID']].type.name=='Transform')
parent=objects[transform.read_typetree()['m_Father']['m_PathID']].read_typetree()
owner=objects[parent['m_GameObject']['m_PathID']]
anim=next(objects[c['component']['m_PathID']] for c in owner.read_typetree()['m_Component'] if objects[c['component']['m_PathID']].type.name=='Animation')
clip_id=anim.read_typetree()['m_Animation']['m_PathID'];clip=objects[clip_id].read_typetree()
assert not clip['m_CompressedRotationCurves'], 'Native curve decompression required'
tracks={};duration=0
for field,kind,components in [('m_RotationCurves','rotation','xyzw'),('m_PositionCurves','position','xyz')]:
 for curve in clip[field]:
  keys=curve['curve']['m_Curve'];name=curve['path'].split('/')[-1]
  if not keys:continue
  duration=max(duration,keys[-1]['time'])
  assert all(k.get('weightedMode',0)==0 for k in keys), 'Weighted curves need a separate evaluator'
  tracks.setdefault(name,{})[kind]={'times':[k['time']for k in keys],'values':[[k['value'][c]for c in components]for k in keys],
   'inSlopes':[[k['inSlope'][c]for c in components]for k in keys],
   'outSlopes':[[k['outSlope'][c]for c in components]for k in keys]}
p=root/'target/temple-run/web/public/assets/characters/rig-enemy.json';data=json.loads(p.read_text())
data['clips']={'run':{'duration':duration,'tracks':tracks}}
data['animationSource']={'owner':owner.read().m_Name,'animationPathID':anim.path_id,'clipPathID':clip_id,'clipName':clip['m_Name'],'sharedAssetsSHA256':hashlib.sha256(raw).hexdigest()}
p.write_text(json.dumps(data,separators=(',',':'))+'\n')
print(json.dumps(data['animationSource']),len(tracks),'tracks',duration,'seconds')
