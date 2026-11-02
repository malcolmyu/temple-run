import {readFile,writeFile,mkdir} from 'node:fs/promises';
import {execFileSync} from 'node:child_process';
import {createHash} from 'node:crypto';
import {encodeToKTX2} from 'ktx2-encoder';
const pub='target/temple-run/web/public/';
const keys=['wallTexture','treeTexture','lightMapTexture','terrainTexture','leafTexture'];
const textures:Record<string,unknown>={};
for(const name of keys){
 const source=pub+'assets/apk/'+name+'.webp';
 const data=execFileSync('python3',['-c',`from PIL import Image
import sys
im=Image.open(sys.argv[1]).convert('RGBA');im.thumbnail((512,512));sys.stdout.buffer.write(im.width.to_bytes(4,'little')+im.height.to_bytes(4,'little')+im.tobytes())`,source],{maxBuffer:20*1024*1024});
 const width=data.readUInt32LE(0),height=data.readUInt32LE(4),rgba=data.subarray(8);
 const isUASTC=name==='leafTexture'||name==='lightMapTexture';
 const ktx=await encodeToKTX2(rgba,{imageDecoder:async()=>({data:rgba,width,height}),isUASTC,isKTX2File:true,qualityLevel:220,compressionLevel:2,generateMipmap:true,isYFlip:true,isPerceptual:true,isSetKTX2SRGBTransferFunc:true,needSupercompression:isUASTC,enableDebug:false});
 const hash=createHash('sha256').update(ktx).digest('hex').slice(0,12),path=`assets/runtime/${name}.${hash}.ktx2`;await writeFile(pub+path,ktx);
 textures['assets/apk/'+name+'.webp']={path,width,height,bytes:ktx.length,mode:isUASTC?'UASTC':'ETC1S',sourceHash:createHash('sha256').update(await readFile(source)).digest('hex')};
 console.log(name,ktx.length);
}
const decoderRoot='node_modules/three/examples/jsm/libs/basis/';const js=await readFile(decoderRoot+'basis_transcoder.js'),wasm=await readFile(decoderRoot+'basis_transcoder.wasm');
const decoderHash=createHash('sha256').update(js).update(wasm).digest('hex').slice(0,12);
await writeFile('target/temple-run/web/src/game/ktxAssets.generated.json',JSON.stringify({textures,decoderPath:`assets/basis/${decoderHash}/`})+'\n');
