import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
Object.assign(globalThis,{localStorage:{getItem:()=>null,setItem:()=>{}}});
const p=await import('../target/temple-run/web/src/game/progress');
const {OBJECTIVES,claim,nextRunScoreMultiplier}=await import('../target/temple-run/web/src/game/objectives');
const {NATIVE_LIFETIME_OBJECTIVES}=await import('../target/temple-run/web/src/game/nativeLifetimeObjectives');
for(const row of NATIVE_LIFETIME_OBJECTIVES) {
 const goal=OBJECTIVES.find(o=>o.id===row.id)!;
 p.progress[row.metric]=row.target-1;
 assert.equal(goal.done(),false);assert.equal(claim(row.id),false);
 p.recordRun(row.metric==='totalDistance'?1:0,row.metric==='lifetimeCoins'?1:0,0,0);
 assert.equal(goal.done(),true);assert.equal(goal.current(),row.target);
 const before={coins:p.progress.coins,gems:p.progress.gems,m:nextRunScoreMultiplier()};
 assert.ok(claim(row.id));assert.equal(claim(row.id),false);
 assert.equal(p.progress.coins,before.coins);assert.equal(p.progress.gems,before.gems);assert.equal(nextRunScoreMultiplier(),before.m);
}
const before={runs:p.progress.runs,coins:p.progress.lifetimeCoins,distance:p.progress.totalDistance};
p.claimObjective('test-web-reward',1000000,2);
assert.equal(p.progress.lifetimeCoins,before.coins,'reward must not inflate lifetime collection');
p.progress.coins=2000000;p.buyUpgrade('coin');
assert.equal(p.progress.lifetimeCoins,before.coins,'shop spending must not reduce lifetime collection');
assert.equal(p.progress.runs,before.runs);assert.equal(p.progress.totalDistance,before.distance);
const catalog=JSON.parse(readFileSync('target/temple-run/analysis/native-objectives/catalog.json','utf8'));
const missing=catalog.records.filter((row:{id:string})=>!OBJECTIVES.some(o=>o.id===row.id)).map((row:{id:string})=>row.id);
console.log('Eight native lifetime objectives:exact boundary via settlement,no double confirmation/currency,no reward/shop inflation pass');
assert.deepEqual(missing,[],'all55 native ids must remain registered');
console.log('All55 native catalogue ids registered;behaviour verification is separate.');
