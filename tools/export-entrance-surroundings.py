"""Export the native entrance's missing surroundings in the existing facade frame."""
import zipfile,sys,json
from pathlib import Path
import UnityPy
root=Path(__file__).resolve().parents[1];z=zipfile.ZipFile(sys.argv[1]);prefab='80ad52ac73dc44ef9bcff6985db4ee11';env=UnityPy.load(z.read('assets/bin/Data/'+prefab));objects={o.path_id:o for o in env.objects}
a=objects[8].read_typetree();b=objects[12].read_typetree()
# Both children have the same local rotation/scale and identical parent TRS.
assert a['m_LocalRotation']==b['m_LocalRotation'] and a['m_LocalScale']==b['m_LocalScale']
p=objects[a['m_Father']['m_PathID']].read_typetree();q=objects[b['m_Father']['m_PathID']].read_typetree()
for key in ['m_LocalRotation','m_LocalPosition','m_LocalScale']:assert p[key]==q[key]
delta={axis:b['m_LocalPosition'][axis]-a['m_LocalPosition'][axis]for axis in 'xyz'}
source='087b5fd86f7814ef0b9dc5e9ca0637a2';mesh=next(o.read()for o in UnityPy.load(z.read('assets/bin/Data/'+source)).objects if o.type.name=='Mesh')
lines=['# Native entrance surroundings Object12-Pivot, file '+source,'# Same frame as temple-entrance.obj; native child translation delta applied.']
for line in mesh.export().splitlines():
 f=line.split()
 if f and f[0]in ['v','vn']:
  x,y,zz=map(float,f[1:4]);values=(x-560.211731-delta['x'],zz+15+delta['z'],-y+1316.40222-delta['y'])if f[0]=='v'else(x,zz,-y)
  line=f[0]+' '+' '.join(f'{v:.8f}'for v in values)
 lines.append(line)
out=root/'target/temple-run/web/public/assets/track/entrance-surroundings.obj';out.write_text('\n'.join(lines)+'\n')
(root/'target/temple-run/analysis/entrance-surroundings-source.json').write_text(json.dumps(dict(prefab=prefab,mesh=source,facadeTransformPathID=8,surroundingsTransformPathID=12,childTranslationDelta=delta,material='Temple Run Trees Material',note='Preserves existing facade frame; global origin remains the earlier facade alignment approximation.'),indent=2)+'\n');print('Exported native entrance surroundings, delta',delta)
