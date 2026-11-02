import manifest from './startupAssets.generated.json';
export type StartupPack={rig:Record<string,unknown>;models:Record<string,{obj:string;uv:number[]|null}>;textures:Record<string,string>};
let pending:Promise<StartupPack>|null=null;
export function loadStartupPack():Promise<StartupPack>{
 if(!pending)pending=fetch(`${import.meta.env.BASE_URL}${manifest.pack}`).then(r=>{if(!r.ok)throw Error(`Opening pack:${r.status}`);return r.json();}).catch(e=>{pending=null;throw e;});
 return pending;
}
export function useQuickStart():boolean {
 const quality=new URLSearchParams(location.search).get('quality');
 return quality==='quick'||quality!=='native'&&(innerWidth<=700||matchMedia('(pointer:coarse)').matches);
}
