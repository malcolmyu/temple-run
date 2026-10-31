"""Follow coinYellow_prefab's MeshFilter to recover the native diamond coin.
Usage: UnityPy-python tools/export-coin-reference.py /path/to/base.apk
"""
import json,sys,zipfile
from pathlib import Path
import UnityPy
root=Path(__file__).resolve().parents[1];z=zipfile.ZipFile(sys.argv[1]);prefab=sys.argv[2] if len(sys.argv)>2 else 'b1f5ad1631ff26b4698b6129b04fec5c'
env=UnityPy.load(z.read('assets/bin/Data/'+prefab));serialized=next(iter(env.files.values()))
meshfilter=next(o for o in env.objects if o.type.name=='MeshFilter');ref=meshfilter.read_typetree()['m_Mesh'];path=serialized.externals[ref['m_FileID']-1].path
mesh=next(o for o in UnityPy.load(z.read('assets/bin/Data/'+path)).objects if o.path_id==ref['m_PathID']).read()
lines=mesh.export().splitlines();positions=[list(map(float,l.split()[1:4]))for l in lines if l.startswith('v ')]
output=['# Original coin prefab MeshFilter -> '+path,'# Mesh Box01; UVs reference wallTexture; original pivot, scale .2; Y up.']
for line in lines:
 if line.startswith('v '):line='v '+' '.join(f'{float(v)*.2:.8f}'for i,v in enumerate(line.split()[1:4]))
 output.append(line)
(root/('target/temple-run/web/public/assets/track/'+(sys.argv[3] if len(sys.argv)>3 else 'coin-yellow.obj'))).write_text('\n'.join(output)+'\n');print('Recovered native coin mesh',path)
