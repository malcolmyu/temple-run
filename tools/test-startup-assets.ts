import {readFileSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {gzipSync} from 'node:zlib';
import assert from 'node:assert/strict';
import * as THREE from 'three';
import {OBJLoader} from 'three/addons/loaders/OBJLoader.js';
import {applyQuickCliffSupport} from '../target/temple-run/web/src/game/quickCliffSupport';
import manifest from '../target/temple-run/web/src/game/startupAssets.generated.json';
const pub='target/temple-run/web/public/';
const raw=readFileSync(pub+manifest.pack);const pack=JSON.parse(raw.toString());
assert.ok(manifest.pack.includes(createHash('sha256').update(raw).digest('hex').slice(0,12)));
assert.ok(gzipSync(raw).length<125000,'Opening pack must fit the measured transfer budget');
for(const [path,hash]of Object.entries(manifest.sources))assert.equal(createHash('sha256').update(readFileSync(pub+path)).digest('hex'),hash);
for(const [path,value]of Object.entries(pack.models)as Array<[string,{obj:string;uv:number[]|null}]>){
 const source=readFileSync(pub+path,'utf8');
 const points=source.split('\n').filter(l=>l.startsWith('v ')).map(l=>l.split(/\s+/).slice(1,4).map(Number));
 const authored=new Set(points.map(p=>p.map(n=>Math.round(n*1e4)/1e4).join(',')));
 for(const line of value.obj.split('\n').filter(l=>l.startsWith('v ')))assert.ok(authored.has(line.split(/\s+/).slice(1,4).map(n=>Math.round(Number(n)*1e4)/1e4).join(',')),`Unsupported new vertex:${path}`);
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
  if(name==='cliff-road-tile'&&!groups[1].getObjectByName('quick-native-cliff-support')){const slots={cliffTile:groups[1]};applyQuickCliffSupport(slots);groups[1]=slots.cliffTile;groups[1].updateMatrixWorld(true);}
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
console.log('Opening pack: hashed payload <125KB gzip, source texture hashes, native-only vertices, UV1 order and structural floors pass.');
