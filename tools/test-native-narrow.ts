import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import * as THREE from 'three';
import {OBJLoader} from 'three/addons/loaders/OBJLoader.js';
import {attachNativeLightmapUV} from '../target/temple-run/web/src/game/nativeLightmap';
import {buildNativeNarrowFloor,buildObstacle} from '../target/temple-run/web/src/game/render';
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
 if(def.id.endsWith('A')||def.id.endsWith('B')){
   const z=def.id.endsWith('B')?5.9:-5.9;
   const capFloor=new THREE.Raycaster(new THREE.Vector3(unsafeX,.1,z),new THREE.Vector3(0,-1,0),0,.3).intersectObject(mesh,true);
   assert.ok(capFloor.some(h=>Math.abs(h.point.y)<.08),'native endcap mesh restores the otherwise missing side at its full-width end');
 }
 assert.deepEqual(def.surfaceCut,[-6,6]);
}
assert.equal(insideGroundSupport(DEFS.narrowWallLeft.groundSupportRegion,.4,0),true,'boundary included');
assert.equal(insideGroundSupport(DEFS.narrowWallLeft.groundSupportRegion,.399,0),false);
assert.equal(insideGroundSupport(DEFS.narrowBeamLeft.groundSupportRegion,0,5.8),true,'short notch preserves approach rim');
assert.equal(insideGroundSupport(DEFS.narrowBeamLeft.groundSupportRegion,0,0),false,'short notch removes centre only near its apex');
for(const[cap,missing]of [[DEFS.narrowWallLeftB,-1.3],[DEFS.narrowWallRightB,1.3]]as const){assert.equal(insideGroundSupport(cap.groundSupportRegion,missing,5.9),true);assert.equal(insideGroundSupport(cap.groundSupportRegion,missing,0),false);}
for(const[cap,missing]of [[DEFS.narrowWallLeftA,-1.3],[DEFS.narrowWallRightA,1.3]]as const){assert.equal(insideGroundSupport(cap.groundSupportRegion,missing,-5.9),true);assert.equal(insideGroundSupport(cap.groundSupportRegion,missing,0),false);}
console.log('Native narrow: eight full prefab TRS meshes, correct support strips/concave notches, strict ground support and airborne crossing.');

const floorMaterial=new THREE.MeshBasicMaterial();let sampled=0;
for(const def of Object.values(DEFS).filter(d=>d.id.startsWith('narrow'))){
 const shape=def as typeof DEFS.narrowBeamLeft;
 const floor=buildNativeNarrowFloor(shape,floorMaterial);floor.updateMatrixWorld(true);
 for(let z=-5.8;z<6;z+=.4)for(let x=-1.3;x<1.4;x+=.65){
  const hit=new THREE.Raycaster(new THREE.Vector3(x,.2,z),new THREE.Vector3(0,-1,0),0,.4).intersectObject(floor,true).length>0;
  assert.equal(hit,insideGroundSupport(shape.groundSupportRegion,x,z),`${def.id} visible support polygon ${x}/${z}`);sampled++;
 }
}
console.log(`Narrow floor adapter: ${sampled} ground points match native support including entry/exit rims.`);

for(const def of [DEFS.narrowBeamLeft,DEFS.narrowBeamRight]){
 const source=new OBJLoader().parse(readFileSync(`target/temple-run/web/public/assets/obstacles/${def.prefabs[0]}.obj`,'utf8'));
 attachNativeLightmapUV(source,JSON.parse(readFileSync(`target/temple-run/web/public/assets/obstacles/${def.prefabs[0]}.uv1.json`,'utf8')));
 const mat=new THREE.ShaderMaterial();source.traverse(o=>{if((o as THREE.Mesh).isMesh)(o as THREE.Mesh).material=mat;});
 const floor=buildNativeNarrowFloor(def,floorMaterial,source);
 assert.equal(floor.material,mat,'supplement uses the source native shader');
 assert.ok(floor.userData.nativeUVProjection>0);assert.equal(floor.geometry.getAttribute('uv1').count,floor.geometry.getAttribute('position').count);
 assert.ok(Array.from(floor.geometry.getAttribute('uv1').array).every(Number.isFinite));
}
console.log('Narrow UV: native source shader and projected UV0/UV1 replace generic full-atlas mapping.');

// Weak-network rendering must keep the same support contract without native ornament meshes.
const quickAssets={quick:true,obstacles:{},material:{stone:new THREE.MeshBasicMaterial({side:THREE.DoubleSide})},texture:{}} as any;
for(const def of [DEFS.narrowBeamLeft,DEFS.narrowBeamRight,DEFS.narrowWallLeft,DEFS.narrowWallRight,DEFS.narrowWallLeftA,DEFS.narrowWallLeftB,DEFS.narrowWallRightA,DEFS.narrowWallRightB,DEFS.pitLongA,DEFS.pitLongB]){
 const visual=buildObstacle(quickAssets,def,def.prefabs[0]);visual.updateMatrixWorld(true);
 for(let x=-1.7;x<1.8;x+=.4)for(let z=-5.3;z<5.4;z+=1.1){
  const points=def.groundSupportRegion!;
  if(points.some(([ax,az],i)=>{const [bx,bz]=points[(i+1)%points.length];return Math.abs((x-ax)*(bz-az)-(z-az)*(bx-ax))<1e-5&&x>=Math.min(ax,bx)-1e-5&&x<=Math.max(ax,bx)+1e-5&&z>=Math.min(az,bz)-1e-5&&z<=Math.max(az,bz)+1e-5;}))continue; // ray/edge floating-point ambiguity
  const support=insideGroundSupport(def.groundSupportRegion,x,z);
  const visible=new THREE.Raycaster(new THREE.Vector3(x,.2,z),new THREE.Vector3(0,-1,0),0,.3).intersectObject(visual,true).length>0;
  assert.equal(visible,support,`${def.id}: quick floor and physics disagree at ${x},${z}`);
 }
}
console.log('Quick mode:10 narrow/long-hole support polygons match actual rendered triangles across sampled lanes/depths.');
