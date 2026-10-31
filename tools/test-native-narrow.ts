import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import * as THREE from 'three';
import {OBJLoader} from 'three/addons/loaders/OBJLoader.js';
import {DEFS} from '../target/temple-run/web/src/game/obstacles/catalog';
import {collisionWouldHit,insideGroundSupport} from '../target/temple-run/web/src/game/obstacles/collision';
const runner={prevDistance:99.8,distance:100,laneIndex:1,side:0,jumpY:0,jumpV:0,slideRemaining:0,lastJumpAt:10,lastSlideAt:10,now:10,jumpWindow:1,slideWindow:1};
for(const[def,safeX,unsafeX]of [[DEFS.narrowWallLeft,1,-1],[DEFS.narrowWallRight,-1,1],[DEFS.narrowBeamLeft,1,-1],[DEFS.narrowBeamRight,-1,1],[DEFS.narrowWallLeftA,1,-1],[DEFS.narrowWallLeftB,1,-1],[DEFS.narrowWallRightA,-1,1],[DEFS.narrowWallRightB,-1,1]]as const){
 const obstacle={def,lane:1,distance:100};
 assert.equal(collisionWouldHit(obstacle,{...runner,side:safeX}),false,'native side strip supplies support');
 assert.equal(collisionWouldHit(obstacle,{...runner,side:unsafeX}),true,'missing native support falls despite recent input');
 assert.equal(collisionWouldHit(obstacle,{...runner,side:unsafeX,jumpY:.01}),false,'airborne feet may cross');
 assert.equal(collisionWouldHit(obstacle,{...runner,distance:106.1}),false,'past tile end support resumes');
 assert.equal(insideGroundSupport(def.groundSupportRegion,safeX,0),true);
 const mesh=new OBJLoader().parse(readFileSync(`target/temple-run/web/public/assets/obstacles/${def.prefabs[0]}.obj`,'utf8'));
 mesh.traverse((o:any)=>{if(o.isMesh)o.material.side=THREE.DoubleSide});mesh.updateMatrixWorld(true);
 const floor=new THREE.Raycaster(new THREE.Vector3(safeX,.1,0),new THREE.Vector3(0,-1,0),0,.3).intersectObject(mesh,true);
 assert.ok(floor.some(h=>Math.abs(h.point.y)<.08),'exported full TRS retains the actual safe floor at y0');
 assert.deepEqual(def.surfaceCut,[-6,6]);
}
assert.equal(insideGroundSupport(DEFS.narrowWallLeft.groundSupportRegion,.4,0),true,'boundary included');
assert.equal(insideGroundSupport(DEFS.narrowWallLeft.groundSupportRegion,.399,0),false);
assert.equal(insideGroundSupport(DEFS.narrowBeamLeft.groundSupportRegion,0,5.8),true,'short notch preserves approach rim');
assert.equal(insideGroundSupport(DEFS.narrowBeamLeft.groundSupportRegion,0,0),false,'short notch removes centre only near its apex');
for(const[cap,missing]of [[DEFS.narrowWallLeftB,-1.3],[DEFS.narrowWallRightB,1.3]]as const){assert.equal(insideGroundSupport(cap.groundSupportRegion,missing,5.9),true);assert.equal(insideGroundSupport(cap.groundSupportRegion,missing,0),false);}
for(const[cap,missing]of [[DEFS.narrowWallLeftA,-1.3],[DEFS.narrowWallRightA,1.3]]as const){assert.equal(insideGroundSupport(cap.groundSupportRegion,missing,-5.9),true);assert.equal(insideGroundSupport(cap.groundSupportRegion,missing,0),false);}
console.log('Native narrow: eight full prefab TRS meshes, correct support strips/concave notches, strict ground support and airborne crossing.');
