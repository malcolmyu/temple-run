import assert from 'node:assert/strict';
import {nativeObstacleEligible as gate} from '../target/temple-run/web/src/game/nativeObstacleGate';
import {CoursePlan} from '../target/temple-run/web/src/game/coursePlan';
let draws=0;const roll=(n:number)=>()=>{draws++;return n;};
assert.equal(gate(1,0,100,2,.2,roll(0)),false);assert.equal(gate(3,2,100,2,.2,roll(0)),false);assert.equal(draws,0);
assert.equal(gate(3,1,2,2,0,roll(999)),true);assert.equal(draws,0);
assert.equal(gate(3,1,1,2,.2,roll(199)),true);assert.equal(gate(3,1,1,2,.2,roll(200)),false);
assert.equal(gate(3,1,1,2,0,roll(0)),false);
assert.equal(gate(3,1,3,4,.05,roll(49)),true);assert.equal(gate(3,1,3,4,.05,roll(50)),false);
let count=0;
for(let seed=1;seed<=100;seed++){
 const p=new CoursePlan(seed,489);p.ensureThrough(10000,2000);
 for(const f of p.features.filter(f=>f.extraObstacleAt!==undefined)){
  count++;assert.ok(!f.fastTurn);assert.ok(f.to-f.extraObstacleAt!>=36);
  const obs=p.obstacles.filter(o=>o.distance>f.from&&o.distance<f.to);
  assert.equal(obs.length,2);assert.equal(obs[1].distance-obs[0].distance,36);assert.equal(obs[1].defId,obs[0].defId);
 }
}
assert.ok(count>100);console.log('Native obstacle gate: no-draw exclusions, exact spacing/probability boundaries,100-seed compatible pairs and36m corner clearance pass; pairs='+count);
