"""Native support surfaces and full default mesh, reduced texture/animation detail."""
from pathlib import Path
from PIL import Image
import json,hashlib,gzip,base64,io
R=Path(__file__).resolve().parents[1];P=R/'target/temple-run/web/public'
m=json.loads((R/'target/temple-run/web/src/game/runtimeAssets.generated.json').read_text());full=json.loads((P/m['worldPack']).read_text())
# All native road/obstacle families are essential visuals; no support-only cropping.
models=full
# Retain selected triangles; round positions to 0.0001 world units (max error 0.00005).
for record in models.values():
 lines=[]
 for line in record['obj'].splitlines():
  words=line.split()
  if words and words[0]=='vn':continue
  if words and words[0]=='f':line='f '+' '.join('/'.join(w.split('/')[:2]) for w in words[1:])
  if words and words[0] in ['v','vt','vn']:
   precision=4 if words[0]=='v' else 5 if words[0]=='vt' else 3
   line=words[0]+' '+' '.join(format(round(float(n),precision),'.10g') for n in words[1:])
  lines.append(line)
 record['obj']='\n'.join(lines)
 if record['uv']:record['uv']=[round(n,5) for n in record['uv']]
textures={};sources={}
for key in ['assets/apk/'+n+'.webp'for n in ['terrainTexture','wallTexture','treeTexture','leafTexture','playerGlowTexture','lightMapTexture']]+['assets/ui/'+n+'.png'for n in ['fx-flame','coin-face','wings','EffectsTexture2x']]+['assets/characters/tex-orig_02___Default.png']:
 im=Image.open(P/key);limit=512 if any(n in key for n in ['wallTexture','treeTexture']) else 256 if 'lightMapTexture' in key else 128
 im.thumbnail((limit,limit),Image.Resampling.LANCZOS)
 b=io.BytesIO();im.save(b,'WEBP',quality=65,method=6);textures[key]='data:image/webp;base64,'+base64.b64encode(b.getvalue()).decode();sources[key]=hashlib.sha256((P/key).read_bytes()).hexdigest()
def compact(v):
 if isinstance(v,float):return round(v,4)
 if isinstance(v,list):return[compact(a)for a in v]
 if isinstance(v,dict):
  if 'times'in v and 'values'in v:
   n=len(v['times']);ids=sorted(set(list(range(0,n,2))+[n-1])) if n else []
   return{k:compact([a[i]for i in ids]if isinstance(a,list)and len(a)==n else a)for k,a in v.items()}
  return{k:compact(a)for k,a in v.items()}
 return v
rigSource=P/'assets/characters/rig-orig_02___Default.json';rig=compact(json.loads(rigSource.read_text()));sources['assets/characters/rig-orig_02___Default.json']=hashlib.sha256(rigSource.read_bytes()).hexdigest()
data=json.dumps({'models':models,'textures':textures,'rig':rig},separators=(',',':')).encode();name='assets/runtime/opening.'+hashlib.sha256(data).hexdigest()[:12]+'.json';(P/name).write_bytes(data)
manifest={'pack':name,'bytes':len(data),'gzipBytes':len(gzip.compress(data,mtime=0)),'sources':sources,'models':list(models),'quality':'512px wall/tree;256px lightmap;128px other textures;transport normals recomputed;all native road/obstacle meshes and UV1;positions rounded1e-4,UV1e-5;animation curves sampled every2 keys'}
(R/'target/temple-run/web/src/game/startupAssets.generated.json').write_text(json.dumps(manifest,separators=(',',':'))+'\n');print(name,len(data),manifest['gzipBytes'])
