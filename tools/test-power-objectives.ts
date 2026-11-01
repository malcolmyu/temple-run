import assert from 'node:assert/strict';
import {createPowerPickupCounts,countPowerPickup,sanitizePowerPickupCounts} from '../target/temple-run/web/src/game/nativePowerPickups';
const counts=createPowerPickupCounts();countPowerPickup(counts,'coin');countPowerPickup(counts,'gem');assert.deepEqual(counts,createPowerPickupCounts());
for(const kind of ['magnet','boost','shield','bonus']){for(let i=0;i<20;i++)countPowerPickup(counts,kind);assert.equal(counts[kind],20);}
assert.deepEqual(sanitizePowerPickupCounts({magnet:-1,boost:NaN,shield:'20',bonus:5.9,unknown:99}),{magnet:0,boost:0,shield:0,bonus:5});
Object.assign(globalThis,{localStorage:{getItem:()=>JSON.stringify({bestDistance:10000,upgrades:{boost:5}}),setItem:()=>{}}});
const p=await import('../target/temple-run/web/src/game/progress');const o=await import('../target/temple-run/web/src/game/objectives');
const {NATIVE_POWER_OBJECTIVES}=await import('../target/temple-run/web/src/game/nativePowerObjectives');
assert.deepEqual({...p.progress.bestPowerPickups},createPowerPickupCounts(),'old totals/upgrades do not imply pickups');
for(const row of NATIVE_POWER_OBJECTIVES){
 p.progress.bestPowerPickups[row.kind]=row.target-1;assert.equal(o.claim(row.id),false);
 p.progress.bestPowerPickups[row.kind]=row.target;const before=o.nextRunScoreMultiplier(),coins=p.progress.coins;
 assert.ok(o.claim(row.id));assert.equal(o.claim(row.id),false);assert.equal(o.nextRunScoreMultiplier(),before);assert.equal(p.progress.coins,coins);
}
p.progress.bestPowerPickups=createPowerPickupCounts();
p.recordRun(100,0,0,1000,undefined,{magnet:3,boost:2,shield:1,bonus:0});
p.recordRun(200,0,0,2000,undefined,{magnet:2,boost:4,shield:0,bonus:5});
assert.deepEqual({...p.progress.bestPowerPickups},{magnet:3,boost:4,shield:1,bonus:5},'take independent per-kind session maxima, never sum games');
console.log('All12 power goals:5/10/20 thresholds, no inferred pickups, no double confirmation/currency, sanitized legacy data and per-session maxima pass.');
