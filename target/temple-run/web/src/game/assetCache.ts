/** Hash-addressed payload cache; HTTP remains the fallback when storage is unavailable. */
const PREFIX='temple-payload-v2-';const LIMIT=32*1024*1024;
export const assetCacheStats={hits:0,misses:0,writes:0,evicted:0,errors:0,bytes:0};
if(typeof window!=='undefined')(window as unknown as Record<string,unknown>).__assetCache=assetCacheStats;
let store:Promise<Cache|null>|undefined;let writes=Promise.resolve();
function currentVersion():string{return (window as unknown as {__startupTiming?:{version:string}}).__startupTiming?.version??'development';}
async function storage():Promise<Cache|null>{
 if(!store)store=(async()=>{try{if(!('caches'in globalThis))return null;const name=PREFIX+currentVersion();
 const all=await caches.keys();await Promise.all(all.filter(n=>n.startsWith(PREFIX)&&n!==name).map(n=>caches.delete(n)));
 const cache=await caches.open(name);const keys=await cache.keys();
 const sizes=await Promise.all(keys.map(async key=>Number((await cache.match(key))?.headers.get('x-temple-bytes')??0)));
 assetCacheStats.bytes=sizes.reduce((n,size)=>n+size,0);return cache;}catch{assetCacheStats.errors++;return null;}})();return store;
}
function eligible(url:string):boolean{return /\/assets\/(runtime\/[^/?]+\.[a-f0-9]{12}\.(json|webp|ktx2)|basis\/[a-f0-9]{12}\/basis_transcoder\.(js|wasm))$/.test(url);}
async function trim(cache:Cache,incoming:number):Promise<void>{
 const keys=await cache.keys();let total=0;const rows=[];
 for(const key of keys){const r=await cache.match(key);const bytes=Number(r?.headers.get('x-temple-bytes')??0);total+=bytes;rows.push({key,bytes});}
 while(total+incoming>LIMIT&&rows.length){const oldest=rows.shift()!;await cache.delete(oldest.key);total-=oldest.bytes;assetCacheStats.evicted++;}
 assetCacheStats.bytes=total;
}
export async function cachedResponse(input:string):Promise<Response>{
 if(typeof document==='undefined')return fetch(input);
 const url=new URL(input,document.baseURI).href;
 if(!eligible(url)||new URLSearchParams(location.search).get('cache')==='off')return fetch(url);
 // Storage failures or a slow storage subsystem must never gate playability.
 const cache=await Promise.race([storage(),new Promise<null>(resolve=>setTimeout(()=>resolve(null),200))]);
 const state=window as unknown as {__earlyOpening?:{url:string;hit:boolean;promise:Promise<Response|null>}};
 const early=state.__earlyOpening?.url===url?state.__earlyOpening:undefined;
 const prefetched=early?await early.promise:null;if(early)delete state.__earlyOpening;
 if(prefetched?.ok&&early?.hit){assetCacheStats.hits++;return prefetched;}
 if(!prefetched&&cache)try{const hit=await Promise.race([cache.match(url),new Promise<undefined>(resolve=>setTimeout(()=>resolve(undefined),200))]);if(hit){assetCacheStats.hits++;return hit;}}catch{assetCacheStats.errors++;}
 assetCacheStats.misses++;const response=prefetched??await fetch(url);if(!response.ok||!cache)return response;
 const copy=response.clone();writes=writes.then(async()=>{try{
 const blob=await copy.blob();if(blob.size>LIMIT)return;
 await trim(cache,blob.size);const headers=new Headers(copy.headers);headers.set('x-temple-bytes',String(blob.size));headers.delete('content-encoding');headers.delete('content-length');
 const value=new Response(blob,{status:200,headers});
 try{await cache.put(url,value.clone());}catch{const keys=await cache.keys();if(keys[0])await cache.delete(keys[0]);await cache.put(url,value);}
 assetCacheStats.writes++;assetCacheStats.bytes+=blob.size;
 }catch{assetCacheStats.errors++;}});return response;
}
export function flushAssetCache():Promise<void>{return writes;}
if(typeof window!=='undefined')(window as unknown as Record<string,unknown>).__flushAssetCache=flushAssetCache;
