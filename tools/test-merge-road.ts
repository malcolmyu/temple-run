import assert from 'node:assert/strict';
import {TrackGraph} from '../target/temple-run/web/src/game/trackGraph';
import {CoursePlan} from '../target/temple-run/web/src/game/coursePlan';
// Captured run d1f3a5ae: select at882, prebuild at897, merge918, turn969.
// Local topology regression, not an exact frame/input replay of schema1.
for(const arm of ['left','right'] as const)for(const direction of [-1,1] as const){
 const graph=new TrackGraph(),base=graph.active.clone();
 const lateral=graph.forkLateral(882,1.9,918);graph.choose(lateral,arm);
 const corner=graph.fork(969);graph.choose(corner,direction===-1?'left':'right');
 const before=graph.active.at(981);graph.merge(base);
 assert.deepEqual(graph.active.at(981),before,'merge must retain already-prebuilt corner world pose');
 assert.equal(graph.active.lateral,0);assert.equal(graph.active.branchSpan,null);
 assert.ok(graph.active.nearTurn(969,1),'renderer must retain the same corner as missed-turn logic');
 graph.choose(corner,direction===-1?'right':'left');
 assert.notEqual(graph.active.at(981).heading,before.heading,'T alternate exit remains selectable after merge');
}
// Includes both reported seeds, plus a distribution sweep. Progress is explicit:
// same seed alone is not a captured historical route replay.
for(const seed of [144966157,145073850,...Array.from({length:200},(_,i)=>i+1)]){
 const plan=new CoursePlan(seed,0);
 for(let d=600;d<=14000;d+=60)plan.ensureThrough(d,d*.65);
 for(const b of plan.branches){
  const next=plan.turns.find(t=>t.distance>=b.to)!;
  assert.ok(next.distance-b.to>=96,`seed${seed}: merge${b.to} -> turn${next.distance} needs96m`);
 }
}
console.log('Reported merge topology: both arms/directions preserve corner;202 seeds retain96m merge-to-turn clearance.');
