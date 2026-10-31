"""Read native UISpriteFrameAnimation and UIAtlas safety-net frame rectangles."""
import json,sys,zipfile,struct,hashlib
from pathlib import Path
import UnityPy
z=zipfile.ZipFile(sys.argv[1]);parts=sorted((n for n in z.namelist()if '/sharedassets0.assets.split'in n),key=lambda n:int(n.rsplit('split',1)[1]));raw=b''.join(z.read(n)for n in parts);objects={o.path_id:o for o in UnityPy.load(raw).objects};atlas=objects[1957].get_raw_data();animation=objects[1966].get_raw_data();frames=[]
for i in range(1,6):
 name=f'safetyNet{i}.png';start=atlas.index(name.encode());offset=(start+len(name)+3)//4*4;x,y,w,h=struct.unpack_from('<4f',atlas,offset);frames.append(dict(name=name,x=x,y=y,width=w,height=h))
first,last,fps=struct.unpack_from('<iif',animation,56)
assert (first,last,fps)==(1,5,15.0)
result=dict(sharedAssetsSHA256=hashlib.sha256(raw).hexdigest(),atlasPathID=1957,animationPathID=1966,firstFrame=first,lastFrame=last,fps=fps,frames=frames,worldSizeAtCurrentScale=[4,12])
output=Path(__file__).resolve().parents[1]/'target/temple-run/analysis/safety-net-source.json';output.write_text(json.dumps(result,indent=2)+'\n');print(output)
