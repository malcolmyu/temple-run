import * as THREE from 'three';
import {cachedResponse} from './assetCache';
import {optimizedAsset} from './runtimeAssets';
import manifest from './ktxAssets.generated.json';
export const visualTextureStats:Array<Record<string,unknown>>=[];
if(typeof window!=='undefined')(window as unknown as Record<string,unknown>).__visualTextures=visualTextureStats;
export async function imageTexture(url:string):Promise<THREE.Texture>{
 if(url.startsWith('data:'))return new THREE.TextureLoader().loadAsync(url);
 const response=await cachedResponse(optimizedAsset(url));if(!response.ok)throw Error(`Texture ${response.status}: ${url}`);
 const blob=URL.createObjectURL(await response.blob());try{return await new THREE.TextureLoader().loadAsync(blob);}finally{URL.revokeObjectURL(blob);}
}
let ktxLoader:Promise<import('three/addons/loaders/KTX2Loader.js').KTX2Loader>|undefined;
export async function detailTexture(url:string,renderer:THREE.WebGLRenderer):Promise<THREE.Texture>{
 const key=url.slice(url.indexOf('assets/')),row=(manifest.textures as Record<string,{path:string}>)[key];
 const start=performance.now();let texture:THREE.Texture,mode='WebP';
 if(row&&new URLSearchParams(location.search).get('texture')!=='webp')try{
  if(!ktxLoader)ktxLoader=(async()=>{
   const {KTX2Loader}=await import('three/addons/loaders/KTX2Loader.js');
   const blobs:Record<string,string>={};
   try{
    const dependencies=await Promise.allSettled(['basis_transcoder.js','basis_transcoder.wasm'].map(async name=>{
      const r=await cachedResponse(`${import.meta.env.BASE_URL}${manifest.decoderPath}${name}`);if(!r.ok)throw Error('Basis decoder unavailable');
      blobs[name]=URL.createObjectURL(await r.blob());
    }));
    const failed=dependencies.find(row=>row.status==='rejected');if(failed?.status==='rejected')throw failed.reason;
    const manager=new THREE.LoadingManager();manager.setURLModifier(url=>blobs[url.split('/').pop()!]??url);
    const loader=new KTX2Loader(manager).setTranscoderPath(`${import.meta.env.BASE_URL}${manifest.decoderPath}`).setWorkerLimit(1).detectSupport(renderer);
    await loader.init();return loader;
   }finally{for(const blob of Object.values(blobs))URL.revokeObjectURL(blob);}
  })();
  const loader=await ktxLoader,r=await cachedResponse(`${import.meta.env.BASE_URL}${row.path}`);if(!r.ok)throw Error('KTX2 unavailable');
  const bytes=await r.arrayBuffer(),byteLength=bytes.byteLength,decode=performance.now();texture=await new Promise<THREE.CompressedTexture>((resolve,reject)=>loader.parse(bytes,resolve,reject));
  mode=(texture as THREE.CompressedTexture).isCompressedTexture?'KTX2':'KTX2-RGBA';
  visualTextureStats.push({key,mode,transcodeMs:performance.now()-decode,bytes:byteLength});
 }catch(error){console.warn('KTX2 unavailable; using original WebP',key,error);texture=await imageTexture(url);mode='WebP-fallback';}
 else texture=await imageTexture(url);
 texture.colorSpace=THREE.SRGBColorSpace;texture.userData.sourceAsset=key;
 const gl=renderer.getContext() as WebGL2RenderingContext;
 const timer=gl.getExtension('EXT_disjoint_timer_query_webgl2');const query=timer?gl.createQuery():null;
 if(query)gl.beginQuery(timer.TIME_ELAPSED_EXT,query);
 const upload=performance.now();renderer.initTexture(texture);const submitMs=performance.now()-upload;
 if(query)gl.endQuery(timer.TIME_ELAPSED_EXT);
 let gpuUploadMs:number|null=null;
 if(query){const until=performance.now()+1000;while(performance.now()<until){if(gl.getQueryParameter(query,gl.QUERY_RESULT_AVAILABLE)){if(!gl.getParameter(timer.GPU_DISJOINT_EXT))gpuUploadMs=gl.getQueryParameter(query,gl.QUERY_RESULT)/1e6;break;}await new Promise<void>(resolve=>setTimeout(resolve,10));}gl.deleteQuery(query);if(gpuUploadMs===0)gpuUploadMs=null;}
 const compressed=texture as THREE.CompressedTexture;const dimensions=texture.image as {width:number;height:number};
 const gpuBytes=compressed.isCompressedTexture?compressed.mipmaps.reduce((n,m)=>n+m.data.byteLength,0):Math.round(dimensions.width*dimensions.height*4*4/3);
 visualTextureStats.push({key,mode,totalMs:performance.now()-start,uploadSubmitMs:submitMs,gpuUploadMs,gpuBytes,width:dimensions.width,height:dimensions.height});
 return texture;
}
/** Swap shared material texture references, preserving native Gamma and atlas transforms. */
export function replaceVisualTextures(materials:Iterable<THREE.Material>,textures:Map<string,THREE.Texture>):number{
 let swaps=0;const retired=new Set<THREE.Texture>();const replacements=new WeakMap<THREE.Texture,THREE.Texture>();
 const replace=(old:THREE.Texture)=>{
  const source=textures.get(old.userData.sourceAsset);if(!source||old instanceof THREE.CanvasTexture)return old;
  let next=replacements.get(old);if(!next){next=source.clone();next.colorSpace=old.colorSpace;next.wrapS=old.wrapS;next.wrapT=old.wrapT;next.repeat.copy(old.repeat);next.offset.copy(old.offset);next.needsUpdate=true;replacements.set(old,next);retired.add(old);}swaps++;return next;
 };
 for(const material of new Set(materials)){
  const record=material as unknown as Record<string,unknown>;
  for(const [key,value]of Object.entries(record))if(value instanceof THREE.Texture)record[key]=replace(value);
  const shader=material as THREE.ShaderMaterial;if(shader.uniforms)for(const uniform of Object.values(shader.uniforms))if(uniform.value instanceof THREE.Texture)uniform.value=replace(uniform.value);
  material.needsUpdate=true;
 }for(const old of retired)old.dispose();return swaps;
}
