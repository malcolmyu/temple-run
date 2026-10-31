import { junctionGapCuts,tJunctionApproachCut,tJunctionExitCut } from '../target/temple-run/web/src/game/junctionCuts';
import { cutSurfaceGeometry } from '../target/temple-run/web/src/game/cutSurface';
import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import * as THREE from 'three';
import {OBJLoader} from 'three/addons/loaders/OBJLoader.js';
import {TrackGraph} from '../target/temple-run/web/src/game/trackGraph';
import {buildTJunction,mergeStaticMeshes} from '../target/temple-run/web/src/game/render';
import {attachNativeLightmapUV} from '../target/temple-run/web/src/game/nativeLightmap';
const material=new THREE.MeshBasicMaterial({side:THREE.DoubleSide});
function load(name:string){const p='target/temple-run/web/public/assets/track/'+name;const obj=new OBJLoader().parse(readFileSync(p+'.obj','utf8'));attachNativeLightmapUV(obj,JSON.parse(readFileSync(p+'.uv1.json','utf8')));obj.traverse((o:any)=>{if(o.isMesh){o.material=material;o.geometry.computeVertexNormals();}});return obj;}
const junction=buildTJunction({tJunction:load('temple-t-junction'),roadTile:load('temple-road-tile')} as any);
mergeStaticMeshes(junction);junction.updateMatrixWorld(true);
for(const side of [-1,1])for(let x=0;x<8.9;x+=.1){
 const hits=new THREE.Raycaster(new THREE.Vector3(side*x,.25,0),new THREE.Vector3(0,-1,0),0,.5).intersectObject(junction,true);
 assert.ok(hits.some(hit=>Math.abs(hit.point.y)<.03),`crossbar floor at ${side*x}`);
}
for(let z=0;z<5.9;z+=.1)assert.ok(new THREE.Raycaster(new THREE.Vector3(0,.25,z),new THREE.Vector3(0,-1,0),0,.5).intersectObject(junction,true).length>0,'incoming stem joins the crossbar');
assert.ok(new THREE.Raycaster(new THREE.Vector3(0,.2,0),new THREE.Vector3(0,0,-1),0,5).intersectObject(junction,true).length>0,'front parapet closes the straight-ahead route');
junction.traverse((o:any)=>{if(o.isMesh)assert.equal(o.geometry.attributes.uv1.count,o.geometry.attributes.position.count);});
console.log('Native T: left/right crossbar support through9m, incoming stem, front parapet and merged UV1 verified.');

const graph=new TrackGraph();const fork=graph.fork(225);graph.choose(fork,'right');
assert.equal(graph.active.segments.length,2);
graph.reset();
assert.equal(graph.forks.length,0);assert.equal(graph.nodes.length,0);assert.equal(graph.active.segments.length,1);
assert.equal(graph.fork(81).node.id,1,'new run has fresh branch history and ids');
console.log('Graph reset removes stale prior-run forks and active path branches.');

const wooden=buildTJunction({plankTJunction:load('plank-t-junction'),plankTile:load('plank-road-tile')}as any,'wood');
mergeStaticMeshes(wooden);wooden.updateMatrixWorld(true);
for(const side of [-1,1]){
 let total=0,supported=0,seam=0,maxSeam=0;
 for(let x=0;x<8.9;x+=.05){
  total++;
  const hit=[-.25,0,.25].some(z=>new THREE.Raycaster(new THREE.Vector3(side*x,.3,z),new THREE.Vector3(0,-1,0),0,.7).intersectObject(wooden,true).some(h=>Math.abs(h.point.y)<.08));
  if(hit){supported++;seam=0;}else {seam+=.05;maxSeam=Math.max(maxSeam,seam);}
 }
 console.log('Wood T coverage',side,supported/total,'max seam',maxSeam);
 assert.ok(supported/total>.65,`wood T arm coverage ${side}: ${supported/total}`);
 assert.ok(maxSeam<.7,`wood T has no extra gap at arm join: ${maxSeam}`);
}
wooden.traverse((o:any)=>{if(o.isMesh)assert.equal(o.geometry.attributes.uv1.count,o.geometry.attributes.position.count);});
assert.equal(wooden.name,'original-plank-t-junction');
console.log('Native plank T preserves both wooden arms, normal board seams and merged UV1.');

for(const surface of ['stone','wood']as const)for(const direction of [-1,1]as const){
 const path=new TrackGraph().active;path.turn(81,1);path.turn(621,direction);
 const cuts=junctionGapCuts(621,path,[{distance:633,interval:[-6,6]},{distance:900,interval:[-6,6]}]);
 assert.equal(cuts.length,1);
 assert.equal(cuts[0][0],'x');
 assert.ok(Math.abs(cuts[0][1]-(direction>0?6:-18))<1e-8);
 assert.ok(Math.abs(cuts[0][2]-(direction>0?18:-6))<1e-8);
 const group=buildTJunction(surface==='wood'?{plankTJunction:load('plank-t-junction'),plankTile:load('plank-road-tile')}as any:{tJunction:load('temple-t-junction'),roadTile:load('temple-road-tile')}as any,surface);
 mergeStaticMeshes(group);
 group.traverse((o:any)=>{if(o.isMesh&&o.userData.walkableSurface)for(const [axis,from,to]of cuts)o.geometry=cutSurfaceGeometry(o.geometry,from,to,axis);});
 group.updateMatrixWorld(true);
 const floor=(x:number)=>[-.25,0,.25].some(z=>new THREE.Raycaster(new THREE.Vector3(x,.3,z),new THREE.Vector3(0,-1,0),0,.5).intersectObject(group,true).some(h=>Math.abs(h.point.y)<.08));
 assert.equal(floor(direction*7),false,`${surface} selected exit must not cover adjacent hole`);
 assert.equal(floor(-direction*7),true,`${surface} unused arm remains intact`);
 assert.equal([4.3,4.5,4.7].some(x=>floor(direction*x)),true,`${surface} near half of selected arm stays supported`);
 group.traverse((o:any)=>{if(o.isMesh)assert.equal(o.geometry.attributes.uv1.count,o.geometry.attributes.position.count);});
}
console.log('Adjacent-hole cuts follow left/right exits in rotated paths, preserve unused arms, near support and UV1.');

// Reproduce the former six-metre approach gap when a turn lands at tile phase3.
for(const at of [495,498,501]){
 const native=buildTJunction({tJunction:load('temple-t-junction'),roadTile:load('temple-road-tile')}as any);
 const tileDistance=Math.floor(at/12)*12;
 const tile=load('temple-road-tile');const cut=tJunctionApproachCut(tileDistance,at);
 if(cut)tile.traverse((o:any)=>{if(o.isMesh)o.geometry=cutSurfaceGeometry(o.geometry,cut[1],cut[2]);});
 tile.position.z=at-tileDistance;native.add(tile);native.updateMatrixWorld(true);
 for(let z=3.2;z<at-tileDistance+5.8;z+=.2){
  const hits=new THREE.Raycaster(new THREE.Vector3(0,.25,z),new THREE.Vector3(0,-1,0),0,.5).intersectObject(native,true).filter(h=>Math.abs(h.point.y)<.03);
  assert.ok(hits.length>0,`no invented approach gap at turn${at},localZ${z}`);
  if(z<5.8)assert.equal(hits.length,1,'authored stem owns approach floor without coplanar duplicate');
 }
}
console.log('Full authored six-metre T stem joins trimmed incoming tiles across three coordinate phases without missing/duplicate floor.');

for(const at of [495,498,501]){
 const cut=tJunctionExitCut(Math.ceil(at/12)*12,at);assert.ok(cut);
 assert.equal(cut[2],100,'exit straight is trimmed behind the authored nine-metre arm');
}
for(const at of [495,498,501])for(const direction of [-1,1]){
 const native=buildTJunction({tJunction:load('temple-t-junction'),roadTile:load('temple-road-tile')}as any);
 const tileDistance=Math.ceil(at/12)*12;
 const tile=load('temple-road-tile');const cut=tJunctionExitCut(tileDistance,at)!;
 tile.traverse((o:any)=>{if(o.isMesh)o.geometry=cutSurfaceGeometry(o.geometry,cut[1],cut[2]);});
 tile.position.x=direction*(tileDistance-at);tile.rotation.y=-direction*Math.PI/2;native.add(tile);native.updateMatrixWorld(true);
 for(let x=3.2;x<tileDistance-at+5.8;x+=.2){
  const hits=new THREE.Raycaster(new THREE.Vector3(direction*x,.25,0),new THREE.Vector3(0,-1,0),0,.5).intersectObject(native,true).filter(h=>Math.abs(h.point.y)<.03);
  assert.ok(hits.length>0,`exit floor continuous at turn${at},side${direction},x${x}`);
  if(x>6.2&&Math.abs(x-9)>.01)assert.equal(hits.length,1,`native arm and outgoing straight overlap at turn${at},side${direction},x${x}; hits${hits.map(h=>h.point.toArray())}`);
 }
}
console.log('Both outgoing exits join without extra missing or overlapping floor across coordinate phases.');
