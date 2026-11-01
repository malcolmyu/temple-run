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

// Full-width gap envelopes must remain independent of other action/support
// challenges. This conservative web policy also includes supported endcaps.
const wide={from:0,to:360,obstacles:[],narrows:[],branches:[]};
const pair=[{...near,distance:120},{...far,distance:132}];
const arch={distance:126,defId:'treeSlide' as const,prefab:'tree-slide'};
assert.ok(validateEncounterLayout({...wide,obstacles:[...pair,arch]}).includes('gap-obstacle-conflict'));
assert.ok(validateEncounterLayout({...wide,obstacles:pair,narrows:[{from:108,to:144,side:'left'}]}).includes('gap-support-conflict'));
assert.ok(validateEncounterLayout({...wide,obstacles:pair,branches:[{from:96,to:180}]}).includes('gap-support-conflict'));
assert.deepEqual(validateEncounterLayout({...wide,obstacles:pair}),[],'matching endcaps remain legal');
assert.deepEqual(validateEncounterLayout({...wide,obstacles:[...pair,{...arch,distance:240}]}),[],'separate action remains legal');
assert.ok(validateEncounterLayout({...wide,branches:[{from:60,to:180},{from:120,to:240}]}).includes('overlapping-branches'));
assert.deepEqual(validateEncounterLayout({...wide,to:420,branches:[{from:60,to:180},{from:180,to:300}]}),[],'touching branch endpoints do not overlap');
console.log('Composition safety: gap/action and gap/support conflicts, overlapping forks rejected; independent layouts retained');
