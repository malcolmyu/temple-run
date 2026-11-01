/** Retain exactly one prior set of hashed assets while cached HTML ages out. */
import {readFile,writeFile,readdir,cp,mkdir,rm} from 'node:fs/promises';
import {join,resolve} from 'node:path';
import {pathToFileURL} from 'node:url';
export interface ReleaseMetadata {sourceCommit:string;builtAt:string;immutableAssets:string[];retainedFromPrevious:number;}
const hashed=(p:string)=>!p.includes('\\')&&(/^assets\/[^/]+-[\w-]{8,}\.(js|css)$/.test(p)||/^assets\/runtime\/[^/]+\.[a-f0-9]{12}\.(json|webp)$/.test(p));
async function inventory(root:string,at='assets'):Promise<string[]>{
 const result:string[]=[];let entries;
 try{entries=await readdir(join(root,at),{withFileTypes:true});}catch{return result;}
 for(const e of entries){const path=at+'/'+e.name;if(e.isDirectory())result.push(...await inventory(root,path));else if(e.isFile()&&hashed(path))result.push(path);}
 return result.sort();
}
export async function stageRelease(dist:string,destination:string,commit:string):Promise<ReleaseMetadata>{
 if(resolve(dist)===resolve(destination))throw Error('Source and destination must differ');
 const current=await inventory(dist);if(!current.length)throw Error('Build has no hashed assets');
 let previous:string[];
 try{const metadata=JSON.parse(await readFile(join(destination,'deployment.json'),'utf8'));previous=Array.isArray(metadata.immutableAssets)?metadata.immutableAssets:await inventory(destination);}catch{previous=await inventory(destination);}
 const currentSet=new Set(current),retained=new Map<string,Buffer>();
 for(const path of previous)if(typeof path==='string'&&hashed(path)&&!currentSet.has(path)){
  try{retained.set(path,await readFile(join(destination,path)));}catch{}
 }
 await mkdir(destination,{recursive:true});
 for(const e of await readdir(destination))if(e!=='.git')await rm(join(destination,e),{recursive:true,force:true});
 await cp(dist,destination,{recursive:true});
 for(const [path,data]of retained){await mkdir(resolve(destination,path,'..'),{recursive:true});await writeFile(join(destination,path),data);}
 const metadata={sourceCommit:commit,builtAt:new Date().toISOString(),immutableAssets:current,retainedFromPrevious:retained.size};
 await writeFile(join(destination,'.nojekyll'),'');
 await writeFile(join(destination,'deployment.json'),JSON.stringify(metadata)+'\n');return metadata;
}
if(process.argv[1]&&import.meta.url===pathToFileURL(resolve(process.argv[1])).href){
 const [dist,destination,commit]=process.argv.slice(2);if(!dist||!destination||!commit)throw Error('Usage: stage-pages-release dist checkout commit');
 const result=await stageRelease(dist,destination,commit);console.log(`Staged ${result.immutableAssets.length} current hashed assets; retained ${result.retainedFromPrevious} prior assets.`);
}
