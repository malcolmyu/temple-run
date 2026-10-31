import assert from 'node:assert/strict';
import {conservativeJumpDistance,longGapSafety,validateEncounterLayout,MIN_LONG_GAP_SPEED} from '../target/temple-run/web/src/game/encounterSafety';
import {CoursePlan} from '../target/temple-run/web/src/game/coursePlan';
assert.ok(Math.abs(conservativeJumpDistance(35)-24.5)<1e-8);
assert.equal(longGapSafety(35).allowed,false,'landing step is not airborne travel');
assert.equal(longGapSafety(37).allowed,false);assert.equal(longGapSafety(MIN_LONG_GAP_SPEED).allowed,true);
assert.equal(longGapSafety(NaN).allowed,false);assert.equal(longGapSafety(0).allowed,false);
const group={from:0,to:144,obstacles:[],narrows:[],branches:[]};
assert.deepEqual(validateEncounterLayout(group),[]);
const near={distance:60,defId:'pitLongB' as const,prefab:'pit-long-b'},far={distance:72,defId:'pitLongA' as const,prefab:'pit-long-a'};
assert.deepEqual(validateEncounterLayout({...group,obstacles:[near,far]}),[]);
assert.ok(validateEncounterLayout({...group,obstacles:[near]}).includes('incomplete-gap-pair'));
assert.ok(validateEncounterLayout({...group,obstacles:[near,{...far,distance:84}]}).includes('incomplete-gap-pair'));
assert.ok(validateEncounterLayout({...group,obstacles:[{...near,distance:12}]}).includes('junction-clearance'));
assert.ok(validateEncounterLayout({...group,obstacles:[{...near,lane:3}]}).includes('invalid-lane'));
assert.ok(validateEncounterLayout({...group,fastTurn:true,obstacles:[near,far]}).includes('fast-turn-conflict'));
assert.ok(validateEncounterLayout({...group,narrows:[{from:-1,to:80,side:'left'}]}).includes('support-span-outside-group'));
assert.ok(validateEncounterLayout({...group,branches:[{from:42,to:90}],obstacles:[near,far]}).includes('branch-support-conflict'));
assert.deepEqual(validateEncounterLayout({...group,to:NaN}),['invalid-span']);
for(let seed=1;seed<=200;seed++){
 const p=new CoursePlan(seed,0);p.ensureThrough(12000,2000);
 for(const f of p.features){
  assert.deepEqual(validateEncounterLayout({from:f.from,to:f.to,fastTurn:f.fastTurn,obstacles:p.obstacles.filter(o=>o.distance>=f.from&&o.distance<f.to),narrows:p.narrows.filter(n=>n.from>=f.from&&n.from<f.to),branches:p.branches.filter(b=>b.from>=f.from&&b.from<f.to)}),[],`seed${seed} ${f.kind}`);
 }
}
console.log('Encounter safety:20fps positive-airborne budget,35/37 rejection38 acceptance,pair/clearance/support/fast-turn guards and200 generated courses pass');
