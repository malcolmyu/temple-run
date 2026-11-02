import {useQuickStart} from '../target/temple-run/web/src/game/startupAssets';
import {readFileSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {gzipSync} from 'node:zlib';
import assert from 'node:assert/strict';
import * as THREE from 'three';
import {OBJLoader} from 'three/addons/loaders/OBJLoader.js';
import manifest from '../target/temple-run/web/src/game/startupAssets.generated.json';
const pub='target/temple-run/web/public/';
const raw=readFileSync(pub+manifest.pack);const pack=JSON.parse(raw.toString());
assert.ok(manifest.pack.includes(createHash('sha256').update(raw).digest('hex').slice(0,12)));
assert.ok(gzipSync(raw).length<1300000,'Opening pack must fit the complete visual budget');
for(const [path,hash]of Object.entries(manifest.sources))assert.equal(createHash('sha256').update(readFileSync(pub+path)).digest('hex'),hash);
for(const [path,value]of Object.entries(pack.models)as Array<[string,{obj:string;uv:number[]|null}]>){
 const source=readFileSync(pub+path,'utf8');
 const points=source.split('\n').filter(l=>l.startsWith('v ')).map(l=>l.split(/\s+/).slice(1,4).map(Number));
 const authored=new Set(points.map(p=>p.map(n=>Math.round(n*1e4)/1e4).join(',')));
 const src=source.split('\n').filter(l=>l.startsWith('v ')).map(l=>l.split(/\s+/).slice(1,4).map(Number));
 const verts=value.obj.split('\n').filter(l=>l.startsWith('v ')).map(l=>l.split(/\s+/).slice(1,4).map(Number));
 assert.equal(verts.length,src.length,'Complete native vertex list:'+path);
 verts.forEach((v,i)=>v.forEach((n,j)=>assert.ok(Math.abs(n-src[i][j])<=.000051,'Native position tolerance:'+path)));

 const faces=value.obj.split('\n').filter(l=>l.startsWith('f ')).length;
 if(value.uv)assert.equal(value.uv.length,faces*6,`UV1 triangle order:${path}`);
}
for(const name of ['temple-road-tile','stone-turn-a','stone-turn-b','temple-t-junction','plank-road-tile','plank-t-junction','cliff-road-tile','cliff-t-down'])assert.ok(pack.models[`assets/track/${name}.obj`].obj.includes('f '),`Missing structural floor:${name}`);
for(const name of ['temple-road-tile','plank-road-tile','cliff-road-tile']){
 const path=`assets/track/${name}.obj`;
 const groups=[readFileSync(pub+path,'utf8'),pack.models[path].obj].map(text=>{
  const object=new OBJLoader().parse(text);object.traverse((o:any)=>{if(o.isMesh)o.material=new THREE.MeshBasicMaterial({side:THREE.DoubleSide});});object.updateMatrixWorld(true);return object;
 });
 for(const x of [-1.2,-.6,0,.6,1.2])for(const z of [-5.5,-3.1,-.2,2.7,5.5]){
  const ray=new THREE.Raycaster(new THREE.Vector3(x,10,z),new THREE.Vector3(0,-1,0),0,30);
  if(ray.intersectObject(groups[0],true).length)assert.ok(ray.intersectObject(groups[1],true).length,`Quick mode removed support:${name}:${x},${z}`);
 }
}
const originalRig=JSON.parse(readFileSync(pub+'assets/characters/rig-orig_02___Default.json','utf8'));
assert.deepEqual(pack.rig.indices,originalRig.indices,'Default runner keeps every face');
assert.equal(pack.rig.positions.length,originalRig.positions.length);
assert.deepEqual(pack.rig.bones.map(b=>[b.name,b.parent]),originalRig.bones.map(b=>[b.name,b.parent]));
assert.deepEqual(Object.keys(pack.rig.clips),Object.keys(originalRig.clips),'All action clips remain available');
for(const key of Object.keys(originalRig.clips))assert.ok(Math.abs(pack.rig.clips[key].duration-originalRig.clips[key].duration)<.0001);
console.log('Opening pack: hashed payload <1.3MB gzip, source texture hashes, native-only vertices, UV1 order and structural floors pass.');

for(const [search,expected] of [['',true],['?quality=quick',true],['?quality=native',false],['?quality=other',true]] as const){
 Object.defineProperty(globalThis,'location',{value:{search},configurable:true});
 assert.equal(useQuickStart(),expected,'Quick is default even without viewport/pointer APIs');
}

for(const name of ['temple-road-tile','plank-road-tile','cliff-road-tile','track-wall-straight-a','track-gate-a','decor-tree-native-1','stone-turn-a','temple-t-junction']){
 const path='assets/track/'+name+'.obj';assert.ok(pack.models[path]?.obj.includes('f '),'Essential model absent:'+name);
}
for(const name of ['tree-slide','flame-tower','tower-arch','narrow-beam-left','narrow-wall-right','pit-long-a'])assert.ok(pack.models['assets/obstacles/'+name+'.obj'],'Essential obstacle absent:'+name);
