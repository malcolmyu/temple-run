import assert from 'node:assert/strict';
Object.assign(globalThis,{localStorage:{getItem:()=>JSON.stringify({coins:99999,lifetimeCoins:99999,bestScore:0}),setItem:()=>{}}});
const p=await import('../target/temple-run/web/src/game/progress');
const {OBJECTIVES,claim,nextRunScoreMultiplier}=await import('../target/temple-run/web/src/game/objectives');
const {NATIVE_SESSION_OBJECTIVES}=await import('../target/temple-run/web/src/game/nativeSessionObjectives');
assert.equal(p.progress.bestRunCoins,0,'old lifetime coins cannot establish a best session');
for(const row of NATIVE_SESSION_OBJECTIVES){
 const goal=OBJECTIVES.find(o=>o.id===row.id)!;
 p.progress[row.metric]=row.target-1;assert.equal(goal.done(),false);assert.equal(claim(row.id),false);
 p.progress[row.metric]=row.target;assert.equal(goal.done(),true);
 const before={coins:p.progress.coins,gems:p.progress.gems,m:nextRunScoreMultiplier()};
 assert.ok(claim(row.id));assert.equal(claim(row.id),false);assert.equal(p.progress.coins,before.coins);assert.equal(p.progress.gems,before.gems);assert.equal(nextRunScoreMultiplier(),before.m);
}
p.progress.bestRunCoins=0;p.progress.bestScore=0;
p.recordRun(100,100,0,25000);p.recordRun(150,150,0,50000);
assert.equal(p.progress.bestRunCoins,150,'separate runs must not sum into best coins');assert.equal(p.progress.bestScore,50000);
const before=p.progress.bestRunCoins;p.claimObjective('web-reward',1000,1);assert.equal(p.progress.bestRunCoins,before,'reward is not a run pickup');
console.log('All16 native session goals: exact thresholds, old-save non-inference, independent run maxima, no shop/reward inflation, no double confirmation/currency pass.');
