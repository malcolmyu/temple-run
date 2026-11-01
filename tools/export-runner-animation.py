"""Export the default Jhony prefab's native run/jump/slide-start/slide-loop curves.
Usage: UnityPy-python tools/export-runner-animation.py /path/to/base.apk
"""
import json,sys,zipfile,hashlib
from pathlib import Path
import UnityPy
root=Path(__file__).resolve().parents[1];z=zipfile.ZipFile(sys.argv[1]);parts=sorted((n for n in z.namelist()if '/sharedassets0.assets.split'in n),key=lambda n:int(n.rsplit('split',1)[1]));raw=b''.join(z.read(n)for n in parts);objects={o.path_id:o for o in UnityPy.load(raw).objects}
owner=next(o for o in objects.values()if o.type.name=='GameObject' and o.read().m_Name=='Jhony_Export3')
anim=next(objects[c['component']['m_PathID']]for c in owner.read_typetree()['m_Component']if objects[c['component']['m_PathID']].type.name=='Animation')
clips={};sources={};mapping={'Run':'run','Jump':'jump','Slide Start':'slide','Slide Loop':'slideLoop','Stumble':'stumble'}
for ref in anim.read_typetree()['m_Animations']:
 if not ref['m_PathID']:continue
 clip=objects[ref['m_PathID']].read_typetree();name=mapping.get(clip['m_Name'])
 if not name:continue
 assert not clip['m_CompressedRotationCurves']
 tracks={};duration=0
 for field,kind,components in [('m_RotationCurves','rotation','xyzw'),('m_PositionCurves','position','xyz')]:
  for curve in clip[field]:
   keys=curve['curve']['m_Curve'];bone=curve['path'].split('/')[-1]
   if not keys:continue
   duration=max(duration,keys[-1]['time']);assert all(k.get('weightedMode',0)==0 for k in keys), 'Weighted curves need a separate evaluator'
   tracks.setdefault(bone,{})[kind]={'times':[k['time']for k in keys],'values':[[k['value'][c]for c in components]for k in keys],
    'inSlopes':[[k['inSlope'][c]for c in components]for k in keys],
    'outSlopes':[[k['outSlope'][c]for c in components]for k in keys]}
 clips[name]={'duration':duration,'tracks':tracks};sources[name]=ref['m_PathID']
assert len(clips)==5
p=root/'target/temple-run/web/public/assets/characters/rig-orig_02___Default.json';data=json.loads(p.read_text());data['clips']=clips;data['animationSource']={'owner':owner.read().m_Name,'animationPathID':anim.path_id,'clips':sources,'sharedAssetsSHA256':hashlib.sha256(raw).hexdigest()};p.write_text(json.dumps(data,separators=(',',':'))+'\n');print(sources,{n:c['duration']for n,c in clips.items()})
