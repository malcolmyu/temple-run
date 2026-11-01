"""Read objective labels/descriptions from original Unity localization bundles."""
import sys,zipfile,json,hashlib
from pathlib import Path
import UnityPy
z=zipfile.ZipFile(sys.argv[1]);root=Path('target/temple-run/analysis/native-objectives');catalog=json.loads((root/'catalog.json').read_text())
shared='assets/aa/Android/localization-assets-shared_assets_all.bundle';raw=z.read(shared)
t=next(o.read_typetree()for o in UnityPy.load(raw).objects if o.type.name=='MonoBehaviour' and o.read_typetree().get('m_Entries'))
keys={r['m_Id']:r['m_Key']for r in t['m_Entries']};tables={};sources={shared:hashlib.sha256(raw).hexdigest()}
for locale,name in [('en','english(en)'),('zh','chinese(simplified)(zh)')]:
 path='assets/aa/Android/localization-string-tables-'+name+'_assets_all.bundle';raw=z.read(path);sources[path]=hashlib.sha256(raw).hexdigest()
 t=next(o.read_typetree()for o in UnityPy.load(raw).objects if o.type.name=='MonoBehaviour' and o.read_typetree().get('m_TableData'))
 tables[locale]={keys[r['m_Id']]:r['m_Localized']for r in t['m_TableData']}
for record in catalog['records']:
 record['localized']={locale:{field:table.get(record[field])for field in ['name','before','after']}for locale,table in tables.items()}
catalog['localizationSources']=sources;(root/'localized.json').write_text(json.dumps(catalog,ensure_ascii=False,indent=2))
for record in catalog['records']:
 if record['id'] in ['distance1000','distance2500','distance5000','distance10000']:print(json.dumps(record,ensure_ascii=False))
