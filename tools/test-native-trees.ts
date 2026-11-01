import assert from 'node:assert/strict';
import{readFileSync}from'node:fs';
import*as THREE from'three';
import{OBJLoader}from'three/addons/loaders/OBJLoader.js';
import{DEFS}from'../target/temple-run/web/src/game/obstacles/catalog';
import{collisionWouldHit}from'../target/temple-run/web/src/game/obstacles/collision';
const state={prevDistance:99.9,distance:100,laneIndex:1,side:0,jumpY:0,jumpV:0,slideRemaining:0,lastJumpAt:-10,lastSlideAt:-10,now:10,jumpWindow:1,slideWindow:1};
const left={def:DEFS.treeTrip,lane:1,distance:100};
assert.equal(collisionWouldHit(left,state),true);
assert.equal(collisionWouldHit(left,{...state,side:-1.3}),false,'native Up root leaves opposite strip clear');
assert.equal(collisionWouldHit(left,{...state,jumpY:.2}),false,'native trip threshold is .2m');
assert.equal(collisionWouldHit(left,{...state,prevDistance:99.6,distance:99.7}),false,'no invented longitudinal body padding');
assert.equal(collisionWouldHit(left,{...state,prevDistance:99,distance:101}),true,'swept native line cannot tunnel through thin root');
assert.equal(collisionWouldHit(left,{...state,prevDistance:99.9,distance:100.1,prevSide:-1.3,side:1.3}),true,'lateral swept segment also intersects');
const right={...left,def:{...DEFS.treeTrip,hitbox:DEFS.treeTrip.variantHitboxes['tree-trip-right']}};
assert.equal(collisionWouldHit(right,{...state,side:1.3}),false);
assert.equal(collisionWouldHit(right,{...state,side:-1.3}),true);
const high={def:DEFS.treeJump,lane:1,distance:100};
assert.equal(DEFS.treeJump.kill,true);assert.equal(DEFS.treeTrip.kill,false);
assert.equal(collisionWouldHit(high,{...state,prevDistance:100.6,distance:100.7}),true);
assert.equal(collisionWouldHit(high,{...state,prevDistance:100.6,distance:100.7,jumpY:1.2}),false);
assert.equal(collisionWouldHit(high,{...state,prevDistance:100.6,distance:100.7,lastJumpAt:10}),true,'button grace cannot clear a fatal high root');
for(const name of ['tree-trip-left','tree-trip-right','tree-jump-left','tree-jump-right']){
 const mesh=new OBJLoader().parse(readFileSync(`target/temple-run/web/public/assets/obstacles/${name}.obj`,'utf8'));
 const bounds=new THREE.Box3().setFromObject(mesh);assert.ok(bounds.max.y>30&&bounds.max.y<32,'original world-scale canopy height');
 assert.ok(!('surfaceCut'in(name.includes('trip')?DEFS.treeTrip:DEFS.treeJump)),'separate source road was not exported; retain base floor');
}
console.log('Native trees: full hierarchy/world scale, exact .2/1.2m trip/jump regions, variant lateral strips, swept point collision and native fatal flags.');
