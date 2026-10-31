import assert from 'node:assert/strict';
import {CoursePlan,setActiveCourse,MIN_LONG_GAP_SPEED} from '../target/temple-run/web/src/game/coursePlan';
import {surfaceAt,nativeGroundHeightAt} from '../target/temple-run/web/src/game/surface';
import {stepNativeJump,nativeJumpVelocity} from '../target/temple-run/web/src/game/nativeMotion';
import {TrackGraph} from '../target/temple-run/web/src/game/trackGraph';
for(let seed=1;seed<=100;seed++){
 const plan=new CoursePlan(seed);plan.ensureThrough(12000);
 const same=new CoursePlan(seed);same.ensureThrough(12000);assert.deepEqual(plan.features,same.features);
 assert.ok(plan.surfaces.some(s=>s.kind==='wood'));
 assert.ok(plan.turns.some(t=>t.junction==='tee'&&t.distance>489));
 for(let i=1;i<plan.turns.length;i++)assert.ok(plan.turns[i].distance-plan.turns[i-1].distance>=72);
 for(const obstacle of plan.obstacles){
  assert.ok(Math.min(...plan.turns.map(t=>Math.abs(t.distance-obstacle.distance)))>=36);
  assert.equal(obstacle.distance%12,obstacle.distance<=489?obstacle.distance%12:0);
  if(obstacle.defId==='pitLongB')assert.ok(plan.obstacles.some(o=>o.defId==='pitLongA'&&o.distance===obstacle.distance+12));
  if(obstacle.defId==='pitLongA')assert.ok(plan.obstacles.some(o=>o.defId==='pitLongB'&&o.distance===obstacle.distance-12));
 }
 const kinds=new Set(plan.features.map(f=>f.kind));
 for(const kind of ['longGap','narrowSmall','narrowLong','branch','plankPit','plankBeam','stonePedestal','treeSlide','flameTower'])assert.ok(kinds.has(kind),`seed${seed} missing ${kind}`);
 for(const section of plan.branches)assert.equal(section.to-section.from,36);
 setActiveCourse(plan);
 for(const section of plan.surfaces){assert.equal(surfaceAt(section.from).kind,section.kind);if(section.kind==='wood')assert.equal(nativeGroundHeightAt(section.from),-3);}
}
setActiveCourse(null);
const graph=new TrackGraph();const fork=graph.forkLateral(100,1.9,136);
for(const path of [fork.left,fork.right]){
 assert.equal(Math.abs(path.lateralAt(100)),0);assert.equal(Math.abs(path.lateralAt(136)),0);
 assert.equal(Math.abs(path.lateralAt(118)),1.9);
 assert.ok(Math.abs(path.at(100.001).x-path.at(99.999).x)<.001);
 assert.ok(Math.abs(path.at(136.001).x-path.at(135.999).x)<.001);
 assert.equal(path.clone().lateralAt(118),path.lateralAt(118));
}
console.log('Course:100 seeds, complete obstacle groups, native minimum spacing, biome consistency, feature reachability and continuous branch entry/merge pass.');

for(const dt of [.025,.05]){let y=0,v=nativeJumpVelocity(MIN_LONG_GAP_SPEED),travel=0;for(let i=0;i<100;i++){const next=stepNativeJump(y,v,dt);travel+=MIN_LONG_GAP_SPEED*dt;y=next.y;v=next.v;if(!next.airborne)break;}assert.ok(travel>=26,'long-hole gate must include approach/landing room at20/40fps');}

// Runtime mode: only generate beyond the buffered boundary, using supplied metric
// progress rather than assuming physical metres equal native progress.
for(let seed=1;seed<=100;seed++){
 const plan=new CoursePlan(seed,489);assert.equal(plan.features.length,0);
 for(let distance=0;distance<7200;distance+=48){
  const oldExtent=plan.extent,oldFeatures=JSON.stringify(plan.features),oldTurns=JSON.stringify(plan.turns),count=plan.features.length,turns=plan.turns.length;
  plan.ensureThrough(distance+360,distance*.8);
  assert.equal(JSON.stringify(plan.features.slice(0,count)),oldFeatures,'append cannot rewrite existing feature');
  assert.equal(JSON.stringify(plan.turns.slice(0,turns)),oldTurns,'append cannot move an existing junction');
  assert.ok(plan.extent>=oldExtent&&plan.extent<Math.max(489,distance+360)+200,'no6000m eager generation');
 }
 for(const feature of plan.features){
  assert.ok(feature.to-feature.from>=120);
  if(feature.kind==='flameTower'||feature.kind==='treeSlide')assert.ok(feature.generatedAtProgress!>=500);
  if(feature.kind==='narrowSmall'||feature.kind==='narrowLong')assert.ok(feature.generatedAtProgress!>=1500);
 }
 for(const o of plan.obstacles)assert.ok(Math.min(...plan.turns.map(t=>Math.abs(t.distance-o.distance)))>=36);
}
const early=new CoursePlan(1,489),late=new CoursePlan(1,489);
early.ensureThrough(800,0);late.ensureThrough(800,2000);
assert.ok(early.features[0].to-early.features[0].from>late.features[0].to-late.features[0].from,'native stage uses supplied progress');
console.log('Incremental course:100 runtime sequences, stable prefixes, bounded lookahead, supplied-progress spacing and unlock gates pass.');

import {nativePathPacing} from '../target/temple-run/web/src/game/nativePathPacing';
for(const [at,turns] of [[0,12],[249.99,12],[250,10],[500,8],[1000,6],[1500,5],[2000,4],[3250,3],[4500,2],[100000,2]])assert.equal(nativePathPacing(at).minTurnSpaces,turns);
assert.equal(nativePathPacing(4499).known,true);assert.equal(nativePathPacing(4500).known,true);

assert.equal(nativePathPacing(4500).minObstacleSpaces,2);assert.equal(nativePathPacing(4500).doubleObstaclePercent,.2);

// Short fast-turn groups are appended without putting long-hole/narrow caps
// against a corner. Existing normal groups and theme continuity stay intact.
for(let seed=1;seed<=100;seed++){
 const plan=new CoursePlan(seed,489);plan.ensureThrough(850,1500);
 const prefix=JSON.stringify(plan.features),count=plan.features.length;
 plan.ensureThrough(2000,1500,true);
 assert.equal(JSON.stringify(plan.features.slice(0,count)),prefix);
 const fast=plan.features.filter(f=>f.fastTurn);
 assert.ok(fast.length>0);
 for(const f of fast){
  assert.equal(f.kind,'fastTurn');assert.equal(f.minTurnSpaces,3);
  assert.ok(f.to-f.from>=48&&f.to-f.from<=72);
  assert.equal(plan.obstacles.some(o=>o.distance>f.from&&o.distance<f.to),false);
  assert.equal(plan.surfaces.some(s=>s.from>f.from&&s.from<f.to),false);
 }
 plan.ensureThrough(2500,1500,false);
 assert.ok(plan.features.at(-1)!.to-plan.features.at(-1)!.from>=120);
}
console.log('Fast course:100 seeds, stable prefixes,48–72m isolated short-corner groups, continuous surfaces and normal-group recovery pass.');
