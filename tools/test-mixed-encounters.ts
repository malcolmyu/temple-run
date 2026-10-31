import assert from 'node:assert/strict';
import {CoursePlan} from '../target/temple-run/web/src/game/coursePlan';
import {validateEncounterLayout} from '../target/temple-run/web/src/game/encounterSafety';
const counts={repeat:0,'jump-slide':0,'slide-jump':0,'dodge-jump':0,'dodge-slide':0};
for(let seed=1;seed<=200;seed++){
 const p=new CoursePlan(seed,0);p.ensureThrough(12000,2000);
 assert.equal(p.rejectedEncounters.length,0);
 const seen=new Set<string>();
 for(const f of p.features){
  const obs=p.obstacles.filter(o=>o.distance>=f.from&&o.distance<f.to);
  if(!f.combo){seen.add(f.kind);continue;}
  assert.ok(seen.has(f.kind),'first exposure must be single');
  assert.ok(seen.has(obs[1].defId),'second mechanic must already be practised');
  counts[f.combo]++;assert.equal(obs.length,2);assert.equal(obs[1].distance-obs[0].distance,48);
  assert.deepEqual(validateEncounterLayout({from:f.from,to:f.to,obstacles:obs,narrows:[],branches:[]}),[]);
  if(f.combo==='jump-slide'){assert.ok(['treeJump','treeTrip'].includes(obs[0].defId));assert.equal(obs[1].defId,'treeSlide');}
  if(f.combo==='slide-jump'){assert.equal(obs[0].defId,'treeSlide');assert.equal(obs[1].defId,'treeJump');}
  if(f.combo.startsWith('dodge-')){assert.equal(obs[0].defId,'stonePedestal');assert.equal(obs[0].lane,1);assert.equal(obs[1].defId,f.combo==='dodge-jump'?'treeJump':'treeSlide');}
  if(f.combo!=='repeat')assert.equal(f.surface,'stone');
  seen.add(f.kind);
 }
 const q=new CoursePlan(seed,0);q.ensureThrough(12000,2000);assert.deepEqual(q.obstacles,p.obstacles,'same seed replay');
}
for(const kind of ['repeat','jump-slide','slide-jump'] as const)assert.ok(counts[kind]>100);
assert.ok(counts['dodge-jump']>20&&counts['dodge-slide']>20);
console.log('Mixed encounters:200 deterministic courses,both action orders,repeat retention,theme and safety constraints pass',counts);
