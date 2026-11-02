"""Native support surfaces and full default mesh, reduced texture/animation detail."""
from pathlib import Path
from PIL import Image
import json,hashlib,gzip,base64,io
R=Path(__file__).resolve().parents[1];P=R/'target/temple-run/web/public'
m=json.loads((R/'target/temple-run/web/src/game/runtimeAssets.generated.json').read_text());full=json.loads((P/m['worldPack']).read_text())
names=['coin-yellow','coin-red','coin-blue','temple-road-tile','stone-turn-a','stone-turn-b','temple-t-junction','tree-jump-left','tree-jump-right','tree-trip-left','tree-trip-right','pit']
models={k:v for k,v in full.items()if any(k.endswith('/'+n+'.obj')for n in names)}
# Later themes retain original upper support triangles, without underside decoration.
# Their physics/Region2D stays unchanged. UV1 follows the selected triangle order.
for name in ['temple-road-tile','stone-turn-a','stone-turn-b','temple-t-junction','pit','plank-road-tile','plank-corner','plank-t-junction','cliff-road-tile','cliff-turn-a','cliff-turn-b','cliff-t-down','cliff-cap-a','cliff-cap-b']:
 key=('assets/obstacles/' if name=='pit' else 'assets/track/')+name+'.obj';record=full[key];verts=[];uv=[];norm=[];faces=[]
 for line in record['obj'].splitlines():
  words=line.split()
  if not words:continue
  if words[0]=='v':verts.append(words[1:])
  elif words[0]=='vt':uv.append(words[1:])
  elif words[0]=='vn':norm.append(words[1:])
  elif words[0]=='f':faces.append(words[1:])
 out=[];outuv=[];count=0
 for fi,face in enumerate(faces):
  refs=[(list(map(int,r.split('/')))+[0,0])[:3]for r in face]
  assert len(refs)==3,name
  ys=[float(verts[r[0]-1][1])for r in refs]
  if not (min(ys)>1.8 if name.startswith('cliff') else max(abs(y)for y in ys)<.08):continue
  for vi,ti,ni in refs:
   out+=['v '+' '.join(verts[vi-1]),'vt '+' '.join(uv[ti-1]),'vn '+' '.join(norm[ni-1] if 0<ni<=len(norm) else ['0','1','0'])]
  out.append('f '+' '.join(f'{i}/{i}/{i}'for i in range(count+1,count+4)));count+=3
  if record['uv']:outuv+=record['uv'][fi*6:fi*6+6]
 models[key]={'obj':'\n'.join(out),'uv':outuv if record['uv'] else None}
# Retain selected triangles; round positions to 0.0001 world units (max error 0.00005).
for record in models.values():
 lines=[]
 for line in record['obj'].splitlines():
  words=line.split()
  if words and words[0] in ['v','vt','vn']:
   precision=4 if words[0]=='v' else 5 if words[0]=='vt' else 3
   line=words[0]+' '+' '.join(format(round(float(n),precision),'g') for n in words[1:])
  lines.append(line)
 record['obj']='\n'.join(lines)
 if record['uv']:record['uv']=[round(n,5) for n in record['uv']]
textures={};sources={}
for key in ['assets/apk/'+n+'.webp'for n in ['terrainTexture','wallTexture','treeTexture','leafTexture','playerGlowTexture','lightMapTexture']]+['assets/ui/'+n+'.png'for n in ['fx-flame','coin-face','wings','EffectsTexture2x']]+['assets/characters/tex-orig_02___Default.png']:
 im=Image.open(P/key);limit=128 if any(n in key for n in ['wallTexture','treeTexture','tex-orig_02']) else 64 if any(n in key for n in ['lightMapTexture','terrainTexture','EffectsTexture']) else 32
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
manifest={'pack':name,'bytes':len(data),'gzipBytes':len(gzip.compress(data,mtime=0)),'sources':sources,'models':list(models),'quality':'32–128px textures,64px effects;native support triangles;decoration omitted;positions rounded1e-4,UV1e-5;animation curves sampled every2 keys'}
(R/'target/temple-run/web/src/game/startupAssets.generated.json').write_text(json.dumps(manifest,separators=(',',':'))+'\n');print(name,len(data),manifest['gzipBytes'])
