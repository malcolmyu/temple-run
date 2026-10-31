import assert from 'node:assert/strict';
import {CoursePlan,setActiveCourse} from '../target/temple-run/web/src/game/coursePlan';
import {CourseCoinDirector} from '../target/temple-run/web/src/game/courseCoins';
import {referenceTurnDirection} from '../target/temple-run/web/src/game/referenceRoute';
import {referenceStraightGate,referenceAmbientTree,referenceJunctionTrees} from '../target/temple-run/web/src/game/referenceScenery';
const fingerprints=new Set<string>(),firstTurns=new Set<number>(),firstDirections=new Set<number>(),firstObstacles=new Set<string>();let earlyCoinCourses=0;
for(let seed=1;seed<=200;seed++){
 const p=new CoursePlan(seed,0),same=new CoursePlan(seed,0);
 assert.equal(p.opening,'generated');assert.equal(p.coinStart,0);assert.deepEqual(p.turns,same.turns);assert.deepEqual(p.obstacles,same.obstacles);
 assert.equal(p.turns.length,3);assert.equal(p.features.length,3);assert.equal(p.obstacles.length,3);assert.equal(p.turns[0].junction,'corner');
 assert.ok(p.turns[0].distance>=153&&p.turns[0].distance<=189);
 for(let i=0;i<3;i++){
  const f=p.features[i],o=p.obstacles[i],t=p.turns[i];
  assert.ok(f.to-f.from>=144);assert.equal(t.distance%12,9);assert.equal(o.distance%12,0);
  assert.ok(['treeTrip','treeJump','pit'].includes(o.defId));
  assert.ok(o.distance>=f.from+36&&o.distance<=f.to-36,'single-action opening has corner/landing clearance');
  assert.equal(f.pathLevel,2);
 }
 fingerprints.add(JSON.stringify([p.turns,p.obstacles]));firstTurns.add(p.turns[0].distance);firstDirections.add(p.turns[0].direction);firstObstacles.add(p.obstacles[0].defId);
 const prefix=JSON.stringify(p.features);p.ensureThrough(3000,200);assert.equal(JSON.stringify(p.features.slice(0,3)),prefix);
 const all=new CourseCoinDirector().takeThrough(1000,p),stream=new CourseCoinDirector();let coins:typeof all=[];
 for(let end=12;end<=1000;end+=12)coins.push(...stream.takeThrough(end,p));coins.push(...stream.takeThrough(1000,p));
 assert.deepEqual(coins,all);if(all.some(c=>c.distance<489))earlyCoinCourses++;
 assert.equal(new Set(all.map(c=>c.distance)).size,all.length);
 setActiveCourse(p);assert.equal(referenceTurnDirection(0,p.turns[0].distance),p.turns[0].direction);
 assert.equal(referenceStraightGate(204),null);assert.equal(referenceAmbientTree(444),undefined);
 assert.deepEqual(referenceJunctionTrees(2,p.turns[2].distance),[{variant:2,ahead:12}]);
}
setActiveCourse(null);
assert.ok(fingerprints.size>150);assert.equal(firstTurns.size,4);assert.equal(firstDirections.size,2);assert.equal(firstObstacles.size,3);assert.ok(earlyCoinCourses>100);
const fixture=new CoursePlan(1,489,'fixture');assert.deepEqual(fixture.turns.map(t=>t.distance),[153,321,489]);assert.equal(fixture.features.length,0);assert.equal(fixture.coinStart,489);
console.log('Generated opening:200 seeds,stable identities,4 first-turn distances,both directions/3 obstacles,safe clearances,streaming coins from start and explicit historical fixture pass');
console.log({uniqueOpenings:fingerprints.size,earlyCoinCourses});
