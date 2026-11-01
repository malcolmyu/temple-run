import assert from 'node:assert/strict';
import {CoursePlan} from '../target/temple-run/web/src/game/coursePlan';
import {CourseCoinDirector} from '../target/temple-run/web/src/game/courseCoins';
import {DEFS} from '../target/temple-run/web/src/game/obstacles/catalog';
import {collisionWouldHit} from '../target/temple-run/web/src/game/obstacles/collision';
const variants=new Set<string>();let collected=0;
for(let seed=1;seed<=100;seed++){
 const course=new CoursePlan(seed,0);course.ensureThrough(20000,2500);
 const coins=new CourseCoinDirector().takeThrough(19500,course);
 for(const coin of coins){
  const span=course.narrows.find(n=>coin.distance>=n.from&&coin.distance<n.to);if(!span)continue;
  collected++;variants.add(`${span.side}:${span.to-span.from}`);
  assert.equal(coin.lane,span.side==='left'?0:2);assert.equal(coin.height,.6);
  for(const o of course.obstacles.filter(o=>Math.abs(o.distance-coin.distance)<=6)){
   assert.equal(collisionWouldHit({def:DEFS[o.defId],distance:o.distance,lane:o.lane??1},{prevDistance:coin.distance,distance:coin.distance,laneIndex:coin.lane,side:coin.side,jumpY:0,jumpV:0,slideRemaining:0,lastJumpAt:-Infinity,lastSlideAt:-Infinity,now:0,jumpWindow:0,slideWindow:0}),false,'coin is reachable with grounded feet at its exact lateral position');
  }
 }
}
assert.ok(collected>100,'safe narrow paths have natural coin rows, not only rows before/after the obstacle');
assert.equal(variants.size,8,'both sides of short/36/48/60m paths covered');
console.log('Narrow coins:100 seeds, native-ground-supported low rows, both sides/all four lengths pass',{collected,variants:[...variants].sort()});
