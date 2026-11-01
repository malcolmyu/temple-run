"""Reproducible delivery derivatives; original APK/UI files are never overwritten."""
from pathlib import Path
import json,hashlib,gzip
from PIL import Image,ImageChops,ImageStat
root=Path(__file__).resolve().parents[1];public=root/'target/temple-run/web/public';out=public/'assets/runtime';out.mkdir(exist_ok=True)
mapping={};records=[]
report=root/'target/temple-run/analysis/loading139-runtime-assets.json'
previous=json.loads(report.read_text()) if report.exists() else {}
previousBySource={r['source']:r for r in previous.get('textures',[])}
# Original UI and character textures stay full-size and lossless, including glyph alpha.
paths=list((public/'assets/ui').glob('*.png'))+list((public/'assets/characters').glob('tex-*.png'))+list((public/'assets/apk').glob('*.webp'))
for p in sorted(paths):
 key=p.relative_to(public).as_posix();sourceSha=hashlib.sha256(p.read_bytes()).hexdigest()
 old=previousBySource.get(key)
 if old and old.get('sourceSha256')==sourceSha and previous.get('pipelineVersion')==1 and (public/old['runtime']).exists():
  mapping[key]=old['runtime'];records.append(old);continue
 im=Image.open(p);original=im.copy();name=p.stem;size=im.size;lossless=True
 if name in ['wallTexture','treeTexture']:
  im=im.resize((512,512),Image.Resampling.LANCZOS);lossless=False
 if name=='lightMapTexture':
  # Opaque native shader samples RGB only; alpha is never used for compositing.
  im=im.convert('RGB');lossless=False
 if name=='EffectsTexture2x':lossless=False
 temp=out/(name+'.tmp.webp');im.save(temp,'WEBP',lossless=lossless,quality=94,method=6)
 b=temp.read_bytes();dest=out/(name+'.'+hashlib.sha256(b).hexdigest()[:12]+'.webp');temp.replace(dest)
 key=p.relative_to(public).as_posix();mapping[key]=dest.relative_to(public).as_posix()
 decoded=Image.open(dest).convert('RGBA');reference=original.resize(decoded.size,Image.Resampling.LANCZOS).convert('RGBA')
 diff=ImageStat.Stat(ImageChops.difference(decoded,reference)).rms
 records.append({'source':key,'sourceSha256':sourceSha,'runtime':mapping[key],'sourceBytes':p.stat().st_size,'runtimeBytes':len(b),'sourceSize':size,'runtimeSize':decoded.size,'lossless':lossless,'rgbaRms':diff})
# One compressed response carries the exact OBJ text and UV arrays, no geometry quantisation.
pack={}
modelPaths=list((public/'assets/track').glob('*.obj'))+list((public/'assets/obstacles').glob('*.obj'))+[public/'assets/apk/mesh-96-enemy.obj']
for p in sorted(modelPaths):
 if p.name.startswith('decor-scenery-'):continue # diagnostic-only scenery is loaded on demand
 key=p.relative_to(public).as_posix();uv=p.with_suffix('.uv1.json')
 pack[key]={'obj':p.read_text(),'uv':json.loads(uv.read_text()) if uv.exists() else None}
b=json.dumps(pack,separators=(',',':')).encode();p=out/('world.'+hashlib.sha256(b).hexdigest()[:12]+'.json');p.write_bytes(b)
rigs={};rigRecords=[]
for source in sorted((public/'assets/characters').glob('rig-*.json')):
 raw=source.read_bytes();encoded=json.dumps(json.loads(raw),separators=(',',':'),ensure_ascii=False).encode()
 dest=out/(source.stem+'.'+hashlib.sha256(encoded).hexdigest()[:12]+'.json');dest.write_bytes(encoded)
 key=source.relative_to(public).as_posix();rigs[key]=dest.relative_to(public).as_posix()
 rigRecords.append({'source':key,'runtime':rigs[key],'sourceSha256':hashlib.sha256(raw).hexdigest(),'sourceBytes':len(raw),'runtimeBytes':len(encoded)})
manifest={'textures':mapping,'rigs':rigs,'worldPack':p.relative_to(public).as_posix()}
(root/'target/temple-run/web/src/game/runtimeAssets.generated.json').write_text(json.dumps(manifest,separators=(',',':'))+'\n')
css=[]
for selector,file in [('relic-vines','hud-vines.png'),('relic-left','hud-left.png'),('relic-right','hud-right.png'),('relic-score strong','hud-score.png')]:
 css.append('.'+selector+" { background-image:url('/"+mapping['assets/ui/'+file]+"'); }")
(root/'target/temple-run/web/src/ui/runtime-assets.generated.css').write_text('/* Generated lossless HUD delivery URLs. */\n'+'\n'.join(css)+'\n')
(root/'target/temple-run/analysis/loading139-runtime-assets.json').write_text(json.dumps({'pipelineVersion':1,'textures':records,'rigs':rigRecords,'models':{'count':len(pack),'bytes':len(b),'gzipBytes':len(gzip.compress(b,mtime=0)),'path':manifest['worldPack']}},indent=2)+'\n')
# Prune only stale reproducible files from the dedicated derivative directory.
keep=set(mapping.values())|set(rigs.values())|{manifest['worldPack']}
for p in out.iterdir():
 if p.relative_to(public).as_posix() not in keep:p.unlink()
print(json.dumps({'textures':len(records),'models':len(pack),'modelGzipBytes':len(gzip.compress(b,mtime=0))}))
