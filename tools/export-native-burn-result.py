"""Export native fire-death art from the hashed APK asset, no image synthesis.
Usage with existing UnityPy environment: python export-native-burn-result.py BASE.apk
"""
import sys,zipfile,hashlib,json,re
from pathlib import Path
import UnityPy
root=Path(__file__).resolve().parents[1];z=zipfile.ZipFile(sys.argv[1])
# Explicit path checked below; inventory scans hashed serialized files, not only sharedassets0.
source='assets/bin/Data/7823f2684714d08469ff6fb24fb183db'
inventory=[]
for name in z.namelist():
 if re.fullmatch(r'assets/bin/Data/[0-9a-f]{32}',name):
  matches=re.findall(rb'deathIllustration[A-Za-z0-9@]*',z.read(name))
  inventory.extend({'asset':name,'texture':v.decode()}for v in matches)
raw=z.read(source);env=UnityPy.load(raw)
tex=next(o.read()for o in env.objects if o.type.name=='Texture2D'and o.read().m_Name=='deathIllustrationBurnt@2x')
assert (tex.m_Width,tex.m_Height)==(512,256)
out=root/'target/temple-run/web/public/assets/ui/deathIllustrationBurnt@2x.png';tex.image.save(out)
record={'source':source,'assetSHA256':hashlib.sha256(raw).hexdigest(),'texture':tex.m_Name,'width':tex.m_Width,'height':tex.m_Height,'pngSHA256':hashlib.sha256(out.read_bytes()).hexdigest(),'illustrationInventory':inventory,'scope':'classic Burnt illustration used for both web fire hazards; no claim all character-specific cards restored or exact video-version match'}
(root/'target/temple-run/analysis/native-burn-result.json').write_text(json.dumps(record,indent=2)+'\n')
manifest=root/'target/temple-run/analysis/asset-manifest.json';d=json.loads(manifest.read_text());d['ui']=[r for r in d['ui']if r['name']!=tex.m_Name]+[{'name':tex.m_Name,'file':'assets/ui/'+out.name,'w':512,'h':256,'bytes':out.stat().st_size}];manifest.write_text(json.dumps(d,indent=2)+'\n')
print(json.dumps({k:record[k]for k in ['source','texture','width','height','pngSHA256']}))
