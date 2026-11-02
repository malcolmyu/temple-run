import {cachedResponse} from './assetCache';
import manifest from './runtimeAssets.generated.json';
type ModelRecord={obj:string;uv:number[]|null};
const redirects:Record<string,string>={...manifest.textures,...manifest.rigs};
let models:Promise<Record<string,ModelRecord>>|null=null;
/** Content-addressed delivery assets; authored source paths remain stable. */
export function optimizedAsset(url:string):string {
 const at=url.indexOf('assets/');if(at<0)return url;
 const key=url.slice(at);
 return redirects[key]?url.slice(0,at)+redirects[key]:url;
}
export function preloadWorldModels():Promise<Record<string,ModelRecord>>{
 if(!models)models=cachedResponse(`${import.meta.env.BASE_URL}${manifest.worldPack}`).then(r=>{if(!r.ok)throw Error(`world pack: ${r.status}`);return r.json()}).catch(error=>{models=null;throw error;});
 return models;
}
export function releaseWorldModelText():void{models=null;}
export async function packedModel(url:string):Promise<ModelRecord|null>{
 if(url.includes('/decor-scenery-'))return null;
 try{return (await preloadWorldModels())[url.slice(url.indexOf('assets/'))]??null;}catch{return null;}
}
