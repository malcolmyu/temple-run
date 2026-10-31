import assert from 'node:assert/strict';
import{readFileSync}from'node:fs';
import*as THREE from'three';
import{OBJLoader}from'three/addons/loaders/OBJLoader.js';
import{DEFS,PLAYABLE_DEFS}from'../target/temple-run/web/src/game/obstacles/catalog';
import{collisionWouldHit}from'../target/temple-run/web/src/game/obstacles/collision';
import{buildObstacle}from'../target/temple-run/web/src/game/render';
const runner={prevDistance:0,distance:0,laneIndex:1,side:0,jumpY:0,jumpV:0,slideRemaining:0,lastJumpAt:-10,lastSlideAt:-10,now:10,jumpWindow:1,slideWindow:1};
const near={def:DEFS.pitLongB,lane:1,distance:100},far={def:DEFS.pitLongA,lane:1,distance:112};
for(let d=94.1;d<117.9;d+=.1){
 const hit=[near,far].some(o=>collisionWouldHit(o,{...runner,prevDistance:d-.1,distance:d}));
 assert.equal(hit,d>95+1e-7&&d<117-1e-7,`distance ${d}: paired endcaps leave only native near/far rims, no artificial middle floor`);
 assert.equal([near,far].some(o=>collisionWouldHit(o,{...runner,distance:d,jumpY:.01})),false);
}
for(const [def,safe,missing]of [[DEFS.pitLongA,-5.5,0],[DEFS.pitLongB,5.5,0]]as const){
 const mesh=new OBJLoader().parse(readFileSync(`target/temple-run/web/public/assets/obstacles/${def.prefabs[0]}.obj`,'utf8'));
 mesh.traverse((o:any)=>{if(o.isMesh)o.material.side=THREE.DoubleSide});mesh.updateMatrixWorld(true);
 const floor=(z:number)=>new THREE.Raycaster(new THREE.Vector3(0,1,z),new THREE.Vector3(0,-1,0),0,2).intersectObject(mesh,true).some(h=>Math.abs(h.point.y)<.7);
 assert.equal(floor(safe),true);assert.equal(floor(missing),false);
 assert.ok(buildObstacle({obstacles:{[def.prefabs[0]]:mesh}}as any,def,def.prefabs[0]).children.length>0,'native endcaps must render');
 assert.ok(!PLAYABLE_DEFS.some(d=>d.id===def.id),'an unpaired half-gap cannot enter the random pool');
}
console.log('Native long holes: near B/far A full TRS endcaps, 22m unsupported paired span, real rims rendered, no standalone half-gap spawns.');
