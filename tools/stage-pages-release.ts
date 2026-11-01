/** Retain superseded hashed assets for the Pages 600-second HTML cache window. */
import {readFile,writeFile,readdir,cp,mkdir,rm} from 'node:fs/promises';
import {join,resolve} from 'node:path';
import {fileURLToPath} from 'node:url';
import {realpathSync} from 'node:fs';
export interface ReleaseMetadata {sourceCommit:string;builtAt:string;immutableAssets:string[];retainedFromPrevious:number;retainedAssets:Array<{path:string;expiresAt:number}>;}
const hashed=(p:string)=>!p.includes('\\')&&(/^assets\/[^/]+-[\w-]{8,}\.(js|css)$/.test(p)||/^assets\/runtime\/[^/]+\.[a-f0-9]{12}\.(json|webp)$/.test(p));
async function inventory(root:string,at='assets'):Promise<string[]>{
 const result:string[]=[];let entries;
 try{entries=await readdir(join(root,at),{withFileTypes:true});}catch{return result;}
 for(const e of entries){const path=at+'/'+e.name;if(e.isDirectory())result.push(...await inventory(root,path));else if(e.isFile()&&hashed(path))result.push(path);}
 return result.sort();
}
export async function stageRelease(dist:string,destination:string,commit:string,now=Date.now()):Promise<ReleaseMetadata>{
 if(resolve(dist)===resolve(destination))throw Error('Source and destination must differ');
 const current=await inventory(dist);if(!current.length)throw Error('Build has no hashed assets');
 let previous:string[];let carried:Array<{path:string;expiresAt:number}>=[];
 try{const metadata=JSON.parse(await readFile(join(destination,'deployment.json'),'utf8'));previous=Array.isArray(metadata.immutableAssets)?metadata.immutableAssets:await inventory(destination);carried=Array.isArray(metadata.retainedAssets)?metadata.retainedAssets:[];}catch{previous=await inventory(destination);}
 const currentSet=new Set(current),retained=new Map<string,Buffer>(),expiry=new Map<string,number>();
 for(const path of previous)if(typeof path==='string'&&hashed(path)&&!currentSet.has(path))expiry.set(path,now+600_000);
 for(const row of carried)if(row&&typeof row.path==='string'&&hashed(row.path)&&Number.isFinite(row.expiresAt)&&row.expiresAt>now&&!currentSet.has(row.path))expiry.set(row.path,Math.max(expiry.get(row.path)??0,row.expiresAt));
 for(const path of expiry.keys()){
  try{retained.set(path,await readFile(join(destination,path)));}catch{expiry.delete(path);}
 }
 await mkdir(destination,{recursive:true});
 for(const e of await readdir(destination))if(e!=='.git')await rm(join(destination,e),{recursive:true,force:true});
 await cp(dist,destination,{recursive:true});
 for(const [path,data]of retained){await mkdir(resolve(destination,path,'..'),{recursive:true});await writeFile(join(destination,path),data);}
 const metadata={sourceCommit:commit,builtAt:new Date(now).toISOString(),immutableAssets:current,retainedFromPrevious:retained.size,retainedAssets:[...expiry].map(([path,expiresAt])=>({path,expiresAt}))};
 await writeFile(join(destination,'.nojekyll'),'');
 await writeFile(join(destination,'deployment.json'),JSON.stringify(metadata)+'\n');return metadata;
}
if(process.argv[1]&&realpathSync(fileURLToPath(import.meta.url))===realpathSync(resolve(process.argv[1]))){
 const [dist,destination,commit]=process.argv.slice(2);if(!dist||!destination||!commit)throw Error('Usage: stage-pages-release dist checkout commit');
 const result=await stageRelease(dist,destination,commit);console.log(`Staged ${result.immutableAssets.length} current hashed assets; retained ${result.retainedFromPrevious} prior assets.`);
}
