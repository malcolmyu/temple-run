"""Recover Water Plane geometry/UV and scene height from the original APK."""
import hashlib,json,sys,zipfile
from pathlib import Path
import UnityPy
from UnityPy.helpers.MeshHelper import MeshHandler
root=Path(__file__).resolve().parents[1];raw=Path(sys.argv[1]).read_bytes();shared={o.path_id:o for o in UnityPy.load(raw).objects};z=zipfile.ZipFile(sys.argv[2]);level=z.read('assets/bin/Data/level0');scene={o.path_id:o for o in UnityPy.load(level).objects}
assert scene[3877].read_typetree()['m_Mesh']=={'m_FileID':2,'m_PathID':98}
mesh=shared[98].read();assert mesh.m_Name=='Water_Plane';handler=MeshHandler(mesh);handler.process();transform=scene[1950].read_typetree();scale=.2
vertices=[[-p[0]*scale,p[1]*scale,p[2]*scale]for p in handler.m_Vertices]
uv=[list(p)for p in handler.m_UV0];triangles=handler.get_triangles();indices=[]
for submesh in triangles:
 for a,b,c in submesh:indices.extend([a,c,b])
height=transform['m_LocalPosition']['y']*scale
assert len(vertices)==121 and height==-6.1000000000000005
# Preserve UV0 instead of replacing it with world-space UV plus synthetic drift.
data=dict(positions=vertices,uv=uv,indices=indices,height=round(height,6))
(root/'target/temple-run/web/src/game/nativeWaterPlane.json').write_text(json.dumps(data,separators=(',',':'))+'\n')
record=dict(sharedAssetsSHA256=hashlib.sha256(raw).hexdigest(),levelSHA256=hashlib.sha256(level).hexdigest(),gameObjectPathID=13,transformPathID=1950,meshFilterPathID=3877,meshPathID=98,meshName=mesh.m_Name,scale=scale,transform=transform,vertexCount=len(vertices),indexCount=len(indices),height=data['height'],uvRange=[[min(p[i]for p in uv),max(p[i]for p in uv)]for i in range(2)],note='Original UV0 and relative scene height; camera-follow translation behavior is not recovered here.')
(root/'target/temple-run/analysis/native-water-plane-source.json').write_text(json.dumps(record,indent=2)+'\n');print(json.dumps(record,indent=2))
