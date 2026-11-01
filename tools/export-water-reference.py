"""Recover Water's actual texture from the APK's numbered sharedassets splits.
Usage: UnityPy-python tools/export-water-reference.py /path/to/base.apk
"""
import hashlib,json,sys,zipfile
from pathlib import Path
import UnityPy
root=Path(__file__).resolve().parents[1]
z=zipfile.ZipFile(sys.argv[1])
parts=sorted((n for n in z.namelist() if '/sharedassets0.assets.split' in n),key=lambda n:int(n.rsplit('split',1)[1]))
raw=b''.join(z.read(n)for n in parts)
env=UnityPy.load(raw);objects={o.path_id:o for o in env.objects}
material=next(o for o in objects.values() if o.type.name=='Material' and o.read().m_Name=='Water')
tree=material.read_typetree()
main=next(v for k,v in tree['m_SavedProperties']['m_TexEnvs'] if k=='_MainTex')['m_Texture']
assert main['m_FileID']==0
texture=objects[main['m_PathID']].read()
output=root/'target/temple-run/web/public/assets/apk/terrainTexture.webp'
texture.image.save(output,lossless=True)
manifest=dict(material='Water',materialPathID=material.path_id,texture=texture.m_Name,texturePathID=main['m_PathID'],parts=len(parts),sharedAssetsSHA256=hashlib.sha256(raw).hexdigest(),outputSHA256=hashlib.sha256(output.read_bytes()).hexdigest())
(root/'target/temple-run/analysis/water-source.json').write_text(json.dumps(manifest,indent=2)+'\n')
print(json.dumps(manifest,indent=2))
