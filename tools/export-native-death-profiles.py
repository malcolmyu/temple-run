"""Export verified character-specific death cards from ImageData and scene refs.
Usage: python export-native-death-profiles.py BASE.apk libil2cpp.so
Selection of first/water candidate is explicit web presentation policy.
"""
import sys,json,hashlib,re,struct,zipfile
from pathlib import Path
import UnityPy
root=Path(__file__).resolve().parents[1];z=zipfile.ZipFile(sys.argv[1])
reader=Path(__file__).with_name('inspect-native-runtime-methods.py');native={'__file__':str(reader)}
exec(compile(reader.read_text().split('for typeName,methodName in ')[0],str(reader),'exec'),native)
checks={0x12bc9c4:0xb9418915,0x12bc9dc:0x940dafa0,0x12bc9e4:0x7200001f,0x12bc9e8:0x1a9f12a1,0x12bca08:0x9447dd38}
for a,v in checks.items():assert struct.unpack_from('<I',native['binary'],native['off'](a))[0]==v
parts=sorted((p for p in z.namelist()if '/sharedassets0.assets.split'in p),key=lambda p:int(p.rsplit('split',1)[1]))
shared=b''.join(z.read(p)for p in parts);objects={o.path_id:o for o in UnityPy.load(shared).objects}
asset=next(o for o in objects.values()if o.type.name=='TextAsset'and o.read().m_Name=='ImageData');text=asset.read().m_Script
if isinstance(text,bytes):text=text.decode()
pools={};death=None;character=None
for line in text.splitlines():
 line=line.strip()
 if line.startswith('deathtype '):death=line.split()[1];pools.setdefault(death,{})
 elif line.startswith('character '):character=int(line.split()[1]);pools[death].setdefault(character,[])
 elif line.startswith('image '):pools[death][character].append(line.split()[1])
scene=json.loads((root/'target/temple-run/analysis/character-player-scene-source.json').read_text())
raw=next(o for o in UnityPy.load(z.read('assets/bin/Data/level0')).objects if o.path_id==scene['componentPathID']).get_raw_data()
assert hashlib.sha256(raw).hexdigest()==scene['componentSHA256']
f=next(f for f in scene['fields']if f['name']=='Characters');count=struct.unpack_from('<i',raw,f['offset'])[0]
refs=[list(struct.unpack_from('<iq',raw,f['offset']+4+12*i))for i in range(count)];assert refs==f['value']
characters=[objects[ref[1]].read().m_Name for ref in refs];assert all(ref[0]==2 for ref in refs)
verified={'scarlett':(1,'girl_Export1_prefab'),'karma':(3,'china_Export1_prefab'),'barry':(4,'indi_Export1_prefab'),'conquistador':(5,'conquis_Export1_prefab')}
assert characters[0]=='Jhony_Export3_prefab'
for skin,(i,name)in verified.items():assert characters[i]==name
categories={'tree':'kDeathTypeTree','slide':'kDeathTypeSlide','burnt':'kDeathTypeBurnt','fall':'kDeathTypeLedge','water':'kDeathTypeFall','caught':'kDeathTypeEaten'}
profiles={};selections=[]
for skin,(i,name)in verified.items():
 profiles[skin]={}
 for group,dt in categories.items():
  selectedId=i if i in pools[dt]else 0;pool=pools[dt][selectedId]
  image=next((p for p in pool if 'Water'in p),pool[0])if group=='water'else pool[0]
  profiles[skin][group]=image
  selections.append({'skin':skin,'nativeId':i,'prefab':name,'group':group,'nativeDeathType':dt,'selectedCharacterId':selectedId,'candidatePool':pool,'selected':image})
needed={s['selected'][:-4]for s in selections};sources={}
for path in z.namelist():
 if re.fullmatch(r'assets/bin/Data/[0-9a-f]{32}',path):
  blob=z.read(path)
  matches=needed&{s.decode()for s in re.findall(rb'[A-Za-z0-9_]*[Dd]eath[Ii]llustration[A-Za-z0-9_@]*',blob)}
  if matches:
   env=UnityPy.load(blob)
   for obj in env.objects:
    if obj.type.name!='Texture2D':continue
    t=obj.read()
    if t.m_Name not in needed:continue
    out=root/'target/temple-run/web/public/assets/ui'/(t.m_Name+'.png');t.image.save(out)
    sources[t.m_Name]={'asset':path,'assetSHA256':hashlib.sha256(blob).hexdigest(),'pngSHA256':hashlib.sha256(out.read_bytes()).hexdigest(),'width':t.m_Width,'height':t.m_Height}
assert set(sources)==needed,needed-set(sources)
(root/'target/temple-run/web/src/game/nativeDeathProfiles.json').write_text(json.dumps(profiles,indent=2)+'\n')
(root/'target/temple-run/analysis/native-death-image-data.txt').write_text(text)
record={'binarySHA256':hashlib.sha256(native['binary']).hexdigest(),'nativeUIInstructionChecks':{hex(a):hex(v)for a,v in checks.items()},'imageDataPathID':asset.path_id,'imageDataSHA256':hashlib.sha256(text.encode()).hexdigest(),'sceneComponentSHA256':scene['componentSHA256'],'characters':characters,'selections':selections,'textures':sources,'policy':'First candidate, prefer Water-named candidate for water/missed; deterministic web presentation, not native random choice. Unknown web skin IDs use existing default cards.','limits':['Native scene prefab order confirms four web rig families; unrelated modern web skins are not guessed.','Native AssignDeathDetails uses character0 fallback and random candidate choice; this exporter preserves pools but web chooses deterministic representatives.']}
(root/'target/temple-run/analysis/native-death-profile-source.json').write_text(json.dumps(record,indent=2)+'\n')
manifest=root/'target/temple-run/analysis/asset-manifest.json';manifestData=json.loads(manifest.read_text());names=set(sources)
manifestData['ui']=[r for r in manifestData['ui']if r['name']not in names]
for name,entry in sources.items():
 file=root/'target/temple-run/web/public/assets/ui'/(name+'.png')
 manifestData['ui'].append({'name':name,'file':'assets/ui/'+file.name,'w':entry['width'],'h':entry['height'],'bytes':file.stat().st_size})
manifest.write_text(json.dumps(manifestData,indent=2)+'\n')
print(json.dumps({'profiles':len(profiles),'selections':len(selections),'textures':len(sources),'nativeCharacterPrefabs':{k:v[1]for k,v in verified.items()}}))
