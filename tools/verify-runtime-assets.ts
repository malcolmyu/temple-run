import {readFileSync,existsSync} from 'node:fs';
import {createHash} from 'node:crypto';
import assert from 'node:assert/strict';
const base='target/temple-run/web/public/';
const manifest=JSON.parse(readFileSync('target/temple-run/web/src/game/runtimeAssets.generated.json','utf8'));
const report=JSON.parse(readFileSync('target/temple-run/analysis/loading139-runtime-assets.json','utf8'));
const hash=(bytes:Buffer)=>createHash('sha256').update(bytes).digest('hex');
for(const row of report.textures){
 assert.equal(hash(readFileSync(base+row.source)),row.sourceSha256,`Stale derivative: ${row.source}; run temple:assets`);
 assert.equal(manifest.textures[row.source],row.runtime);
 if(row.lossless)assert.ok(row.rgbaRms.every((v:number)=>v===0),`Lossless pixels differ: ${row.runtime}`);
 const digest=row.runtime.split('.').at(-2);
 assert.ok(hash(readFileSync(base+row.runtime)).startsWith(digest),`Delivery digest: ${row.runtime}`);
}
for(const row of report.rigs){
 assert.equal(hash(readFileSync(base+row.source)),row.sourceSha256,`Stale rig: ${row.source}`);
 assert.equal(manifest.rigs[row.source],row.runtime);
 assert.deepEqual(JSON.parse(readFileSync(base+row.source,'utf8')),JSON.parse(readFileSync(base+row.runtime,'utf8')),`Rig changed: ${row.source}`);
}
const modelFile=manifest.worldPack;
assert.ok(hash(readFileSync(base+modelFile)).startsWith(modelFile.split('.').at(-2)));
const models=JSON.parse(readFileSync(base+modelFile,'utf8'));
for(const [path,row]of Object.entries(models) as Array<[string,{obj:string;uv:unknown}]>){
 assert.equal(row.obj,readFileSync(base+path,'utf8'),`OBJ changed: ${path}`);
 const uv=base+path.replace(/\.obj$/,'.uv1.json');
 assert.deepEqual(row.uv,existsSync(uv)?JSON.parse(readFileSync(uv,'utf8')):null,`UV changed: ${path}`);
}
console.log(`Runtime assets: ${report.textures.length} source hashes and delivery hashes, ${Object.keys(models).length} exact OBJ/UV pairs pass.`);
