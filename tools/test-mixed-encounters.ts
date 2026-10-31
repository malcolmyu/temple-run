import assert from 'node:assert/strict';
import {CoursePlan} from '../target/temple-run/web/src/game/coursePlan';
import {validateEncounterLayout} from '../target/temple-run/web/src/game/encounterSafety';
const counts={repeat:0,'jump-slide':0,'slide-jump':0};
for(let seed=1;seed<=200;seed++){
 const p=new CoursePlan(seed,0);p.ensureThrough(12000,2000);
 assert.equal(p.rejectedEncounters.length,0);
 for(const f of p.features){
  const obs=p.obstacles.filter(o=>o.distance>=f.from&&o.distance<f.to);
  if(!f.combo)continue;
  counts[f.combo]++;assert.equal(obs.length,2);assert.equal(obs[1].distance-obs[0].distance,48);
  assert.deepEqual(validateEncounterLayout({from:f.from,to:f.to,obstacles:obs,narrows:[],branches:[]}),[]);
  if(f.combo==='jump-slide'){assert.ok(['treeJump','treeTrip'].includes(obs[0].defId));assert.equal(obs[1].defId,'treeSlide');}
  if(f.combo==='slide-jump'){assert.equal(obs[0].defId,'treeSlide');assert.equal(obs[1].defId,'treeJump');}
  if(f.combo!=='repeat')assert.equal(f.surface,'stone');
 }
 const q=new CoursePlan(seed,0);q.ensureThrough(12000,2000);assert.deepEqual(q.obstacles,p.obstacles,'same seed replay');
}
for(const count of Object.values(counts))assert.ok(count>100);
console.log('Mixed encounters:200 deterministic courses,both action orders,repeat retention,theme and safety constraints pass',counts);
