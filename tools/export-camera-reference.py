"""Record the reference APK main scene's native game camera component."""
import sys,zipfile,json,hashlib
from pathlib import Path
import UnityPy
z=zipfile.ZipFile(sys.argv[1]);raw=z.read('assets/bin/Data/level0');objects={o.path_id:o for o in UnityPy.load(raw).objects};result=[]
for o in objects.values():
 if o.type.name!='Camera':continue
 data=o.read_typetree();owner=objects[data['m_GameObject']['m_PathID']].read()
 result.append(dict(pathID=o.path_id,owner=owner.m_Name,orthographic=data['orthographic'],fieldOfView=data['field of view'],nearClip=data['near clip plane'],farClip=data['far clip plane'],depth=data['m_Depth'],background=data['m_BackGroundColor']))
root=Path(__file__).resolve().parents[1];out=root/'target/temple-run/analysis/camera-source.json';out.write_text(json.dumps(dict(levelSHA256=hashlib.sha256(raw).hexdigest(),cameras=result),indent=2)+'\n');print(result)
