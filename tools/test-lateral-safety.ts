import assert from 'node:assert/strict';
import {lateralSequenceIssues,lateralTravelSeconds} from '../target/temple-run/web/src/game/lateralSafety';
import {CoursePlan} from '../target/temple-run/web/src/game/coursePlan';
const block=(lane:number,distance:number)=>({defId:'stonePedestal' as const,prefab:'stone-pedestal',lane,distance});
assert.ok(lateralTravelSeconds(0,2)>lateralTravelSeconds(0,1));
assert.deepEqual(lateralSequenceIssues([block(1,72)],[],0,180),[]);
assert.deepEqual(lateralSequenceIssues([block(0,72),block(1,72),block(2,72)],[],0,180),['lateral-corridor-blocked']);
// Two blocked lanes force left, then right. A 12m gap is insufficient.
assert.deepEqual(lateralSequenceIssues([block(1,72),block(2,72),block(0,84),block(1,84)],[],0,240),['lateral-transfer-window']);
assert.deepEqual(lateralSequenceIssues([block(1,72),block(2,72),block(0,132),block(1,132)],[],0,240),[]);
// A stone in the only supported corridor cannot be rescued by a jump assumption.
assert.deepEqual(lateralSequenceIssues([block(0,72),block(1,72)],[{from:60,to:84,side:'left'}],0,180),['lateral-corridor-blocked']);
let narrows=0,stones=0;
for(let seed=1;seed<=200;seed++){
 const p=new CoursePlan(seed,0);p.ensureThrough(12000,2000);
 assert.equal(p.rejectedEncounters.length,0,JSON.stringify(p.rejectedEncounters));
 for(const f of p.features){
  const obs=p.obstacles.filter(o=>o.distance>=f.from&&o.distance<f.to),ns=p.narrows.filter(n=>n.from>=f.from&&n.to<=f.to);
  narrows+=ns.length;stones+=obs.filter(o=>o.defId==='stonePedestal').length;
  assert.deepEqual(lateralSequenceIssues(obs,ns,f.from,f.to),[]);
 }
}
assert.ok(narrows>100&&stones>100);
console.log('Lateral safety: blocked corridor, forced opposite lanes, transfer budgets, narrow/stone overlap and 200 courses pass', {narrows,stones});
