import assert from 'node:assert/strict';
import {DEFS} from '../target/temple-run/web/src/game/obstacles/catalog';
import {collisionWouldHit} from '../target/temple-run/web/src/game/obstacles/collision';
const runner={prevDistance:19.9,distance:20,laneIndex:1,side:0,jumpY:0,jumpV:0,slideRemaining:0,lastJumpAt:-10,lastSlideAt:-10,now:10,jumpWindow:1,slideWindow:.75};
assert.equal(collisionWouldHit({def:DEFS.towerArch,lane:1,distance:20},runner),false,'run/scenery arch must never trip player');
assert.equal(collisionWouldHit({def:DEFS.treeSlide,lane:1,distance:20},runner),true);
assert.equal(collisionWouldHit({def:DEFS.treeSlide,lane:1,distance:20},{...runner,slideRemaining:.2}),false);
console.log('Walk-through scenery does not collide; slide-only gameplay obstacle still does.');
