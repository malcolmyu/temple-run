"""Recover the native playerGlowTexture used by the invisibility effect."""
import json,sys,zipfile,hashlib
from pathlib import Path
import UnityPy
root=Path(__file__).resolve().parents[1];z=zipfile.ZipFile(sys.argv[1]);parts=sorted((n for n in z.namelist()if '/sharedassets0.assets.split'in n),key=lambda n:int(n.rsplit('split',1)[1]));raw=b''.join(z.read(n)for n in parts);env=UnityPy.load(raw)
obj=next(o for o in env.objects if o.type.name=='Texture2D' and o.read().m_Name=='playerGlowTexture');out=root/'target/temple-run/web/public/assets/apk/playerGlowTexture.webp';obj.read().image.save(out,lossless=True)
(root/'target/temple-run/analysis/invincibility-texture-source.json').write_text(json.dumps(dict(name='playerGlowTexture',pathID=obj.path_id,sharedAssetsSHA256=hashlib.sha256(raw).hexdigest(),outputSHA256=hashlib.sha256(out.read_bytes()).hexdigest()),indent=2)+'\n');print(out)
