"""Preserve static intro-camera nodes, including runtime/serialized field mapping."""
import sys,struct,json,hashlib
from pathlib import Path
script=Path(__file__).with_name('inspect-native-runtime-methods.py');scope={'__file__':str(script)}
exec(script.read_text().split('records={}')[0],scope)
root=script.resolve().parents[1];binary,off=scope['binary'],scope['off']
scene=json.loads((root/'target/temple-run/analysis/camera-follow-source.json').read_text())
field=next(f for f in scene['fieldLayoutVerification']['fields']if f['name']=='EndLocation')
first=list(struct.unpack('<3f',bytes.fromhex(field['rawHex'])))
last=list(struct.unpack_from('<4f',binary,off(0x698110)))
assert first==[0,10,100] and last==[2.75,-20,45,210]
record=dict(librarySHA256=hashlib.sha256(binary).hexdigest(),firstNodeRaw=dict(time=.25,position=first,source='GameCamera.EndLocation, runtime+0xe0, serializedOffset220; GameStart126b410..126b424'),lastNodeRaw=dict(time=last[0],position=last[1:],source='GameStart126b454..126b464, constant698110'),scale=.2,worldNodes=[[0,2,20],[-4,9,42]],coordinateConvention='absolute path origin corresponds to Unity Z=0; player starts at distance-2, so do not add2 to camera nodes',interpolation=dict(source='MovingObject.Simulate12e053c..12e05c8',nodeEaseFlags=[True,True],formula='u<.5 ? 4*u^3 : 1-4*(1-u)^3',status='native polynomial confirmed; JavaScript arithmetic not bit-identical float32'),limits='Exact source-frame phase and full-image geometry/shading still require visual verification')
(root/'target/temple-run/analysis/native-intro-nodes-source.json').write_text(json.dumps(record,indent=2)+'\n');print(json.dumps(record))
