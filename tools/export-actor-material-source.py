"""Record the actual character shader behavior instead of saved unused colors."""
import sys,json,hashlib,lz4.block
from pathlib import Path
import UnityPy
root=Path(__file__).resolve().parents[1];raw=Path(sys.argv[1]).read_bytes();objects={o.path_id:o for o in UnityPy.load(raw).objects};materials={o.read_typetree()['m_Name']:(o.path_id,o.read_typetree())for o in objects.values()if o.type.name=='Material'}
shader=objects[113].read_typetree();blob=bytes(shader['compressedBlob']);offset=shader['offsets'][0][0];length=shader['compressedLengths'][0][0];code=lz4.block.decompress(blob[offset:offset+length],uncompressed_size=shader['decompressedLengths'][0][0]);start=code.index(b'#ifdef VERTEX');end=code.index(b'\0',start);glsl=code[start:end].decode();assert 'SV_Target0 = u_xlat10_0;' in glsl and '_Color' not in glsl
analysis=root/'target/temple-run/analysis';(analysis/'actor-unlit-original.glsl').write_text(glsl+'\n');result={}
for p in (root/'target/temple-run/web/public/assets/characters').glob('rig-*.json'):
 rig=json.loads(p.read_text());name=rig.get('material');entry=materials.get(name)
 if not entry:continue
 path_id,data=entry
 assert data['m_Shader']=={'m_FileID':0,'m_PathID':113},name
 result[p.stem]=dict(material=name,pathID=path_id,shader=shader['m_ParsedForm']['m_Name'],savedColors=data['m_SavedProperties']['m_Colors'],renderedColor='MainTex only; _Color unused',texture=rig.get('texture'))
(analysis/'actor-material-source.json').write_text(json.dumps(dict(sharedAssetsSHA256=hashlib.sha256(raw).hexdigest(),shaderPathID=113,shaderGLSLSHA256=hashlib.sha256(glsl.encode()).hexdigest(),actors=result),indent=2)+'\n');print('Verified native unlit actor materials:',len(result))
