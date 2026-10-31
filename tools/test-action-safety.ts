import assert from 'node:assert/strict';
import {actionRecoverySeconds,minimumActionSpacing,repeatActionSpacing,actionSequenceIssues} from '../target/temple-run/web/src/game/actionSafety';
import {CoursePlan} from '../target/temple-run/web/src/game/coursePlan';
for(const id of ['treeJump','treeTrip','treeSlide','flameTower','plankBeam'] as const){
 assert.ok(actionRecoverySeconds(id)>=.9&&actionRecoverySeconds(id)<1);
 assert.ok(minimumActionSpacing(id,id)>36);assert.equal(repeatActionSpacing(id),48);
 assert.ok(actionSequenceIssues([{defId:id,distance:72},{defId:id,distance:108}],0,240).includes('action-recovery-window'));
 assert.deepEqual(actionSequenceIssues([{defId:id,distance:72},{defId:id,distance:120}],0,240),[]);
}
for(const pair of [['treeJump','treeSlide'],['treeSlide','treeJump']] as const){
 assert.ok(actionSequenceIssues([{defId:pair[0],distance:72},{defId:pair[1],distance:96}],0,240).includes('action-recovery-window'));
 assert.deepEqual(actionSequenceIssues([{defId:pair[0],distance:72},{defId:pair[1],distance:120}],0,240),[]);
}
assert.ok(actionSequenceIssues([{defId:'treeJump',distance:24}],0,180).includes('turn-reaction-window'));
assert.deepEqual(actionSequenceIssues([{defId:'narrowWallLeftB',distance:72},{defId:'narrowWallLeft',distance:84},{defId:'narrowWallLeftA',distance:96}],0,240),[],'support segments must not be misclassified as three jumps');
let repeated=0;
for(let seed=1;seed<=200;seed++){
 const p=new CoursePlan(seed,0);p.ensureThrough(12000,2000);
 for(const f of p.features){
  const obstacles=p.obstacles.filter(o=>o.distance>=f.from&&o.distance<f.to);
  assert.deepEqual(actionSequenceIssues(obstacles,f.from,f.to),[]);
  if(f.extraObstacleAt!==undefined){repeated++;assert.equal(obstacles[1].distance-obstacles[0].distance,48);}
 }
}
assert.ok(repeated>100);console.log('Action budgets:jump/slide recovery,mixed transitions,turn reaction,paired-support exclusion and200 courses pass;48m pairs='+repeated);
