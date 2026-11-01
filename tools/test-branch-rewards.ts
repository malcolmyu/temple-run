import assert from 'node:assert/strict';
import {CoursePlan} from '../target/temple-run/web/src/game/coursePlan';
import {validateEncounterLayout} from '../target/temple-run/web/src/game/encounterSafety';
import {branchRewardChoice,branchRewards} from '../target/temple-run/web/src/game/branchRewards';
import {TrackGraph} from '../target/temple-run/web/src/game/trackGraph';
let gemForks=0,coinForks=0;
for(let seed=1;seed<=200;seed++){
 const plan=branchRewards(seed,100,136);assert.deepEqual(plan,branchRewards(seed,100,136));
 const graph=new TrackGraph(),base=graph.active.clone(),fork=graph.forkLateral(100,0,136);
 const gems=plan.filter(p=>p.kind==='gem');assert.ok(gems.length<=1);if(gems.length)gemForks++;else coinForks++;
 for(const side of ['left','right'] as const){
  const rows=plan.filter(p=>p.branch===side);assert.ok([1,5,9].includes(rows.length));
  for(const r of rows){
   assert.ok(r.distance>=112&&r.distance<=124);
   const anchor=base.at(r.distance,r.side),selected=fork[side].at(r.distance,r.side),other=fork[side==='left'?'right':'left'].at(r.distance,-r.side);
   assert.ok(Math.hypot(anchor.x-selected.x,anchor.z-selected.z)<1e-8);
   assert.ok(Math.hypot(anchor.x-other.x,anchor.z-other.z)>2.5,'opposite arm must remain separate');
  }
 }
}
assert.ok(gemForks>20&&coinForks>20);
console.log('Branch rewards:stable seed,coin/gem choices,both arms,full separation and base-anchor world positions pass',{gemForks,coinForks});

let riskyForks=0;
for(let seed=1;seed<=200;seed++){
 const p=new CoursePlan(seed,0);p.ensureThrough(12000,2000);
 assert.equal(p.rejectedEncounters.length,0);
 for(const b of p.branches){
  if(!b.riskyArm)continue;riskyForks++;
  assert.equal(b.to-b.from,132);
  assert.equal(b.riskyArm,branchRewardChoice(seed,b.from).special);
  const hazards=p.obstacles.filter(o=>o.branch&&o.distance>b.from&&o.distance<b.to);
  assert.equal(hazards.length,1);assert.equal(hazards[0].branch,b.riskyArm);
  assert.equal(hazards[0].defId,'fireWall');assert.equal(hazards[0].distance,b.from+54);
  const rewards=branchRewards(seed,b.from,b.to),safe=rewards.filter(r=>r.branch!==b.riskyArm),risk=rewards.filter(r=>r.branch===b.riskyArm);
  assert.equal(safe.length,5);assert.ok(risk.length===9||risk.length===1&&risk[0].kind==='gem');
  assert.ok(rewards.every(r=>r.distance>=hazards[0].distance+44&&r.distance<=b.to-12));
  const bad={...hazards[0],branch:b.riskyArm==='left'?'right' as const:'left' as const};
  assert.ok(validateEncounterLayout({from:b.from-6,to:b.to+6,obstacles:[bad],narrows:[],branches:[b]}).includes('invalid-branch-hazard'));
 }
 const novice=new CoursePlan(seed,0);novice.ensureThrough(3000,600);assert.ok(novice.branches.every(b=>!b.riskyArm));
}
assert.ok(riskyForks>100);
console.log('Risk forks:200 courses,one rich-arm hazard,safe arm,post-jump rewards,novice gate and invalid ownership rejection pass',{riskyForks});

// The central opening stays in world space; connected aprons let either branch merge safely.
const {branchGapRange,branchHasCenterGapAt}=await import('../target/temple-run/web/src/game/sidePath');
assert.deepEqual(branchGapRange({from:100,to:136}),[106,130]);
assert.equal(branchHasCenterGapAt({from:100,to:136},105.99),false);
assert.equal(branchHasCenterGapAt({from:100,to:136},106),true);
assert.equal(branchHasCenterGapAt({from:100,to:136},129.99),true);
assert.equal(branchHasCenterGapAt({from:100,to:136},130),false);
const staticGraph=new TrackGraph(),staticFork=staticGraph.forkLateral(100,1.9,136);
for(const side of ['left','right'] as const){
 staticGraph.choose(staticFork,side);
 for(let at=100;at<=136;at+=.25){
  const path=staticGraph.active,lateral=path.lateralAt(at);
  const base=path.at(at,-lateral),original=staticFork.node.at;
  assert.equal(original,100);assert.ok(Math.abs(base.x)<1e-9,'road anchor must not inherit the selected actor lateral');
  if(branchHasCenterGapAt({from:100,to:136},at))assert.ok(Math.abs(lateral)>=.55,'chosen path centre stays on one surviving arm');
 }
}
console.log('Fork geometry:static world anchors,shared centre-gap interval,entry/merge support for both arms pass');
