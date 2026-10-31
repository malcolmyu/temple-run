import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import * as THREE from 'three';
import {OBJLoader} from 'three/addons/loaders/OBJLoader.js';
import {buildObstacle} from '../target/temple-run/web/src/game/render';
import {DEFS} from '../target/temple-run/web/src/game/obstacles/catalog';
import {collisionWouldHit} from '../target/temple-run/web/src/game/obstacles/collision';
const obstacle={def:DEFS.pit,lane:1,distance:213};
const state={prevDistance:212,distance:213,laneIndex:1,side:0,jumpY:0,jumpV:0,slideRemaining:0,lastJumpAt:9.8,lastSlideAt:-10,now:10,jumpWindow:1,slideWindow:.75};
assert.equal(collisionWouldHit(obstacle,state),true,'recent input cannot support grounded feet over a hole');
assert.equal(collisionWouldHit(obstacle,{...state,jumpY:.02}),false,'any positive airborne clearance avoids ground-support loss');
assert.equal(collisionWouldHit(obstacle,{...state,prevDistance:217.9,distance:218.1}),false,'landing beyond the rim is safe');
assert.equal(collisionWouldHit(obstacle,{...state,prevDistance:217.6,distance:217.9}),true,'landing inside the hole falls');
assert.equal(collisionWouldHit(obstacle,{...state,distance:207.9}),false,'near rim stays walkable');
const mesh=new OBJLoader().parse(readFileSync('target/temple-run/web/public/assets/obstacles/pit.obj','utf8'));
mesh.scale.setScalar(.2);mesh.rotation.y=Math.PI;mesh.traverse((o:any)=>{if(o.isMesh)o.material.side=THREE.DoubleSide;});mesh.updateMatrixWorld(true);
function rimPresent(z:number){return new THREE.Raycaster(new THREE.Vector3(0,1,z),new THREE.Vector3(0,-1,0),0,2).intersectObject(mesh,true).some(h=>h.point.y>-.7);}
assert.equal(rimPresent(-5.5),true);assert.equal(rimPresent(5.5),true);assert.equal(rimPresent(0),false);
const native=JSON.parse(readFileSync('target/temple-run/analysis/native-pit-region-source.json','utf8'));
assert.deepEqual(DEFS.pit.hitbox.z,native.unsupportedSpan);assert.deepEqual(DEFS.pit.surfaceCut,native.tileSpan);
console.log('Native pit: original near/far rims, 10m unsupported region, no landed-input grace, safe far-rim landing.');

const rendered=buildObstacle({obstacles:{pit:mesh}} as any,DEFS.pit,'pit');
assert.ok(rendered.children.length>0,'standard pit must render its original rim/shaft, not an empty placeholder');

const plank=new OBJLoader().parse(readFileSync('target/temple-run/web/public/assets/obstacles/plank-pit.obj','utf8'));
plank.traverse((o:any)=>{if(o.isMesh)o.material.side=THREE.DoubleSide;});plank.updateMatrixWorld(true);
for(let z=-5.8;z<5.8;z+=.2){
 const hits=new THREE.Raycaster(new THREE.Vector3(0,1,z),new THREE.Vector3(0,-1,0),0,7).intersectObject(plank,true);
 assert.ok(!hits.some(h=>h.point.y>-.1),'center of native broken plank tile must remain open');
}
assert.deepEqual(DEFS.plankPit.surfaceCut,[-6,6]);
assert.equal(collisionWouldHit({def:DEFS.plankPit,lane:1,distance:633},{...state,prevDistance:632,distance:633}),true);
assert.equal(collisionWouldHit({def:DEFS.plankPit,lane:1,distance:633},{...state,prevDistance:632,distance:633,jumpY:.1}),false);
assert.equal(collisionWouldHit({def:DEFS.plankPit,lane:1,distance:633},{...state,prevDistance:638.9,distance:639.1}),false);
assert.ok(buildObstacle({obstacles:{'plank-pit':plank}}as any,DEFS.plankPit,'plank-pit').children.length>0);
console.log('Native broken plank: 12m center opening, original mesh rendered, estimated ground-support interval enforced.');
