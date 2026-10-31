"""Export the installed reference APK's static meshes for visual identification.
Usage: /path/to/UnityPy/python tools/export-entrance-search.py /path/to/base.apk
"""
import json, sys, zipfile
from pathlib import Path
import UnityPy
root=Path(__file__).resolve().parents[1]
dest=root/'target/temple-run/analysis/entrance-search';dest.mkdir(exist_ok=True)
archive=zipfile.ZipFile(sys.argv[1]);inventory=json.loads((root/'target/temple-run/analysis/apk-inventory.json').read_text());manifest=[]
for file in inventory['files']:
    if not any(o['type']=='Mesh' and (o.get('name') or '').startswith('Object') for o in file.get('objects',[])):continue
    env=UnityPy.load(archive.read(file['path']))
    for obj in env.objects:
        if obj.type.name!='Mesh':continue
        mesh=obj.read();name=mesh.m_Name
        if not name.startswith('Object'):continue
        text=mesh.export();identifier=file['path'].split('/')[-1]
        (dest/(identifier+'.obj')).write_text(text)
        manifest.append(dict(id=identifier,name=name))
manifest.sort(key=lambda m:int(''.join(c for c in m['name'].split('-')[0] if c.isdigit()) or 0))
(dest/'manifest.json').write_text(json.dumps(manifest,indent=2))
print('Exported',len(manifest),'static meshes for visual identification')

# Object218 is the beast-mouth facade identified against the video contact sheet.
source=dest/'3b2c1504a7d5e43878b4afd4e594403e.obj'
output=root/'target/temple-run/web/public/assets/track/temple-entrance.obj'
lines=['# Original Object218-Pivot, mesh 3b2c1504a7d5e43878b4afd4e594403e.',
       '# Authored Z-up to Y-up; scene XY offset removed; original road level Z=-15 aligned to y=0.']
for line in source.read_text().splitlines():
    fields=line.split()
    if fields and fields[0] in ('v','vn'):
        x,y,z=map(float,fields[1:4])
        values=(x-560.211731,z+15,-y+1316.40222) if fields[0]=='v' else (x,z,-y)
        line=fields[0]+' '+' '.join(f'{v:.8f}' for v in values)
    lines.append(line)
output.write_text('\n'.join(lines)+'\n')
print('Exported verified entrance:',output)
