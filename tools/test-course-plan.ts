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
