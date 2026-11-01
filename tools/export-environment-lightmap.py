"""Extend original UV1 to trees, gates, parapets and native obstacle meshes."""
import sys,json,re,zipfile,hashlib
from pathlib import Path
import UnityPy
from UnityPy.helpers.MeshHelper import MeshHandler
root=Path(__file__).resolve().parents[1];assets=root/'target/temple-run/web/public/assets';z=zipfile.ZipFile(sys.argv[1]);manifest=json.loads((root/'target/temple-run/analysis/obstacle-manifest.json').read_text());sources={}
for item in manifest['files']:
 source=item['source']['mesh_files']
 if len(source)==1 and re.fullmatch('[0-9a-f]{32}',source[0]):sources['obstacles/'+item['file'][:-4]]=source[0]
for name in ['decor-tree-a','track-gate-a','track-wall-straight-a']:
 text=(assets/'track'/f'{name}.obj').read_text();sources['track/'+name]=re.search(r'file ([0-9a-f]{32})',text).group(1)
sources['track/temple-entrance']='3b2c1504a7d5e43878b4afd4e594403e'
sources['track/entrance-surroundings']='087b5fd86f7814ef0b9dc5e9ca0637a2'
result={}
for name,source in sources.items():
 mesh=next(o.read()for o in UnityPy.load(z.read('assets/bin/Data/'+source)).objects if o.type.name=='Mesh');h=MeshHandler(mesh);h.process();obj=assets/(name+'.obj');lines=obj.read_text().splitlines();verts=sum(l.startswith('v ')for l in lines);assert verts==len(h.m_Vertices),(name,verts,len(h.m_Vertices))
 vt=[list(map(float,line.split()[1:3]))for line in lines if line.startswith('vt ')]
 assert len(vt)==verts
 for actual,original in zip(vt,h.m_UV0):assert max(abs(a-b)for a,b in zip(actual,original))<2e-5,(name,actual,original)
 assert len(h.m_UV1)==verts,name
 uv=[]
 for line in lines:
  if line.startswith('f '):
   face=line.split()[1:];assert len(face)==3
   for corner in face:uv.extend(h.m_UV1[int(corner.split('/')[0])-1][:2])
 out=assets/(name+'.uv1.json');out.write_text(json.dumps(uv,separators=(',',':'))+'\n');result[name]=dict(source=source,vertices=verts,expandedVertices=len(uv)//2,UV0OrderVerified=True,uvSHA256=hashlib.sha256(out.read_bytes()).hexdigest())
(root/'target/temple-run/analysis/environment-lightmap-source.json').write_text(json.dumps(dict(treeMaterial='378718e809cc74cd9a149200cb727b5c',shader='Imangi/MachuLightmap/Opaque VertexFog',detailTexture='21e49f16813d84341b4c805079bed1ae',meshes=result),indent=2)+'\n');print('UV1 exported with UV0 ordering verified:',len(result),'models')
