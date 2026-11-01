"""Recover native lightmap texture, UV1 companions and embedded shader evidence."""
import sys,zipfile,json,hashlib,lz4.block
from pathlib import Path
import UnityPy
from UnityPy.helpers.MeshHelper import MeshHandler
root=Path(__file__).resolve().parents[1];z=zipfile.ZipFile(sys.argv[1]);public=root/'target/temple-run/web/public/assets';analysis=root/'target/temple-run/analysis'
def load(name):return UnityPy.load(z.read('assets/bin/Data/'+name))
e=load('21e49f16813d84341b4c805079bed1ae');tex=next(o.read()for o in e.objects if o.type.name=='Texture2D');out=public/'apk/lightMapTexture.webp';tex.image.save(out,lossless=True)
def prefab_mesh(name):
 e=load(name);f=next(iter(e.files.values()));r=next(o.read_typetree()['m_Mesh']for o in e.objects if o.type.name=='MeshFilter');return f.externals[r['m_FileID']-1].path
sources={'temple-road-tile':prefab_mesh('2e264130d2f724b88884e268337c7894'),'plank-road-tile':'c4e9b0aa32add4ca3b868191238efa2f','plank-corner':'605dac492cb28411ba5c1a63b87668a2','track-wall-corner-a':'f2b43b62951944519b8ca7f1e4ae47a7'};result={}
for name,source in sources.items():
 mesh=next(o.read()for o in load(source).objects if o.type.name=='Mesh');h=MeshHandler(mesh);h.process();obj=public/'track'/f'{name}.obj';lines=obj.read_text().splitlines();assert sum(line.startswith('v ')for line in lines)==len(h.m_Vertices)
 expanded=[]
 for line in lines:
  if not line.startswith('f '):continue
  face=line.split()[1:];assert len(face)==3
  for corner in face:expanded.extend(h.m_UV1[int(corner.split('/')[0])-1][:2])
 output=public/'track'/f'{name}.uv1.json';output.write_text(json.dumps(expanded,separators=(',',':'))+'\n')
 result[name]=dict(source=source,mesh=mesh.m_Name,vertices=len(h.m_Vertices),expandedVertices=len(expanded)//2,objSHA256=hashlib.sha256(obj.read_bytes()).hexdigest(),uvSHA256=hashlib.sha256(output.read_bytes()).hexdigest())
obs={o.path_id:o for o in UnityPy.load('/tmp/temple-sharedassets0.assets').objects};d=obs[108].read_typetree();blob=bytes(d['compressedBlob']);off=d['offsets'][0][0];size=d['compressedLengths'][0][0];decoded=lz4.block.decompress(blob[off:off+size],uncompressed_size=d['decompressedLengths'][0][0]);start=decoded.index(b'#ifdef VERTEX',decoded.index(b'IMANGI_VERTEXFOG_ON'));end=decoded.index(b'\0',start);shader=decoded[start:end].decode();(analysis/'machu-lightmap-original.glsl').write_text(shader+'\n')
first=decoded.index(b'#ifdef VERTEX');first_end=decoded.index(b'\0',first)
no_fog=decoded[first:first_end].decode()
assert 'unity_FogColor' not in no_fog and 'SV_Target0 = u_xlat10_0 * u_xlat10_1;' in no_fog
(analysis/'machu-lightmap-no-fog-original.glsl').write_text(no_fog+'\n')
assert 'SV_Target0 = u_xlat10_0 * u_xlat10_1;' in decoded.decode(errors='ignore')
manifest=dict(material='Temple Run Material',shader='Imangi/MachuLightmap/Opaque VertexFog',operation='MainTex(UV0) * DetailTex(UV1), radial linear vertex fog',fogOriginalUnits=[100,400],fogAtCurrentScale=[20,80],fogRGB=[50,82,86],textureSHA256=hashlib.sha256(out.read_bytes()).hexdigest(),meshes=result)
(analysis/'native-lightmap-source.json').write_text(json.dumps(manifest,indent=2)+'\n');print(json.dumps(manifest,indent=2))
