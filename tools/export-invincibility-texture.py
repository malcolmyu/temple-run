"""Recover the native playerGlowTexture used by the invisibility effect."""
import json,sys,zipfile,hashlib
from pathlib import Path
import UnityPy
root=Path(__file__).resolve().parents[1];z=zipfile.ZipFile(sys.argv[1]);parts=sorted((n for n in z.namelist()if '/sharedassets0.assets.split'in n),key=lambda n:int(n.rsplit('split',1)[1]));raw=b''.join(z.read(n)for n in parts);env=UnityPy.load(raw)
obj=next(o for o in env.objects if o.type.name=='Texture2D' and o.read().m_Name=='playerGlowTexture');out=root/'target/temple-run/web/public/assets/apk/playerGlowTexture.webp';obj.read().image.save(out,lossless=True)
(root/'target/temple-run/analysis/invincibility-texture-source.json').write_text(json.dumps(dict(name='playerGlowTexture',pathID=obj.path_id,sharedAssetsSHA256=hashlib.sha256(raw).hexdigest(),outputSHA256=hashlib.sha256(out.read_bytes()).hexdigest()),indent=2)+'\n');print(out)

# Shader111 is the serialized CharacterPlayer.InvincibilityShader reference.
import lz4.block
shader=next(o for o in env.objects if o.path_id==111).read_typetree()
blob=bytes(shader['compressedBlob']);offset=shader['offsets'][0][0];length=shader['compressedLengths'][0][0]
code=lz4.block.decompress(blob[offset:offset+length],uncompressed_size=shader['decompressedLengths'][0][0])
start=code.index(b'#ifdef VERTEX');end=code.index(b'\0',start);glsl=code[start:end].decode()
assert 'u_xlat0 = u_xlat10_0 * vs_COLOR0;' in glsl
(root/'target/temple-run/analysis/invincibility-original.glsl').write_text(glsl)
state=shader['m_ParsedForm']['m_SubShaders'][0]['m_Passes'][0]['m_State']
record=dict(shaderPathID=111,shaderName=shader['m_ParsedForm']['m_Name'],shaderSourceSHA256=hashlib.sha256(glsl.encode()).hexdigest(),renderState={k:state[k]for k in ['rtBlend0','zWrite','culling','zTest']},alpha=.5,alphaEvidence='CharacterPlayer.SetInvincibilityTexture 0x1298c10 calls SetAlpha 0x1296ee4',ordinaryColor=[1,1,1],colorEvidence='SetAlpha 0x1296ff8..129700c, ColorDebugging disabled')
record['animation']=dict(warningThresholdSeconds=2.5,alphaMaximum=.5,alphaDecayPerSecond=2,wrapWhen='next <= 0',alphaEvidence='CharacterPlayer.Update 0x1297384..12973b0',cpuUvVelocity=[2,2],renderedUvVelocity=[0,0],shaderIgnoresMainTexST=True,uvEvidence='CharacterPlayer.Update 0x12973f4..129743c',expiryResetOffset=[0,0],resetEvidence='CharacterPlayer restore method 0x1297d48..1297d54',textureWrapU=0,textureWrapV=0)
(root/'target/temple-run/analysis/invincibility-material-source.json').write_text(json.dumps(record,indent=2)+'\n')
