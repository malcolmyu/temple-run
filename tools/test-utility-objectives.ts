import assert from 'node:assert/strict';
Object.assign(globalThis,{localStorage:{getItem:()=>JSON.stringify({lifetimeCoins:100000,headStarts:2,wings:2}),setItem:()=>{}}});
const p=await import('../target/temple-run/web/src/game/progress');
const {OBJECTIVES,claim,nextRunScoreMultiplier}=await import('../target/temple-run/web/src/game/objectives');
const {NATIVE_UTILITY_OBJECTIVES}=await import('../target/temple-run/web/src/game/nativeUtilityObjectives');
for(const row of NATIVE_UTILITY_OBJECTIVES)assert.equal(OBJECTIVES.find(o=>o.id===row.id)!.done(),false,'old totals/inventory cannot prove usage');
const summary={coinMeterFills:3,wingResurrections:1,headStartUsed:0};
p.recordRun(499,0,0,0,undefined,undefined,summary);
assert.equal(OBJECTIVES.find(o=>o.id==='distance500')!.done(),false);
assert.equal(OBJECTIVES.find(o=>o.id==='resurrection')!.done(),true);
assert.equal(OBJECTIVES.find(o=>o.id==='resurrection2')!.done(),false);
p.recordRun(500,0,0,0,undefined,undefined,summary);
assert.equal(p.progress.bestWingResurrections,1,'revivals in separate runs must not sum');
assert.equal(OBJECTIVES.find(o=>o.id==='distance500')!.done(),true);
p.recordRun(501,0,0,0,undefined,undefined,{coinMeterFills:4,wingResurrections:2,headStartUsed:1});
for(const row of NATIVE_UTILITY_OBJECTIVES){
 const goal=OBJECTIVES.find(o=>o.id===row.id)!;assert.ok(goal.done());
 const before={coins:p.progress.coins,gems:p.progress.gems,m:nextRunScoreMultiplier()};
 assert.ok(claim(row.id));assert.equal(claim(row.id),false);assert.equal(p.progress.coins,before.coins);assert.equal(p.progress.gems,before.gems);assert.equal(nextRunScoreMultiplier(),before.m);
}
p.recordRun(1,0,0,0,undefined,undefined,{coinMeterFills:0,wingResurrections:0,headStartUsed:0});
assert.equal(p.progress.bestWingResurrections,2);assert.equal(p.progress.bestCoinMeterFills,4);assert.equal(p.progress.headStartUsed,1);
console.log('Native utility objectives:four fills/two same-run wing revivals/either paid start,settlement persistence,no inventory inference,no double rewards pass');
