import assert from 'node:assert/strict';
import {branchRewards} from '../target/temple-run/web/src/game/branchRewards';
import {TrackGraph} from '../target/temple-run/web/src/game/trackGraph';
let gemForks=0,coinForks=0;
for(let seed=1;seed<=200;seed++){
 const plan=branchRewards(seed,100,136);assert.deepEqual(plan,branchRewards(seed,100,136));
 const graph=new TrackGraph(),base=graph.active.clone(),fork=graph.forkLateral(100,1.9,136);
 const gems=plan.filter(p=>p.kind==='gem');assert.ok(gems.length<=1);if(gems.length)gemForks++;else coinForks++;
 for(const side of ['left','right'] as const){
  const rows=plan.filter(p=>p.branch===side);assert.ok([1,5,9].includes(rows.length));
  for(const r of rows){
   assert.ok(r.distance>=112&&r.distance<=124);
   const anchor=base.at(r.distance,r.side),selected=fork[side].at(r.distance,0),other=fork[side==='left'?'right':'left'].at(r.distance,0);
   assert.ok(Math.hypot(anchor.x-selected.x,anchor.z-selected.z)<1e-8);
   assert.ok(Math.hypot(anchor.x-other.x,anchor.z-other.z)>3.7,'opposite arm must remain separate');
  }
 }
}
assert.ok(gemForks>20&&coinForks>20);
console.log('Branch rewards:stable seed,coin/gem choices,both arms,full separation and base-anchor world positions pass',{gemForks,coinForks});
