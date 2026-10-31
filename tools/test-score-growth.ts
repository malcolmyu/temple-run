import assert from 'node:assert/strict';
const saved=new Map<string,string>();
Object.assign(globalThis,{localStorage:{getItem:(k:string)=>saved.get(k)??null,setItem:(k:string,v:string)=>saved.set(k,v)}});
const {progress}=await import('../target/temple-run/web/src/game/progress');
const o=await import('../target/temple-run/web/src/game/objectives');
const {nativeScoreMultiplier}=await import('../target/temple-run/web/src/game/scoring');
assert.equal(nativeScoreMultiplier(0),10);assert.equal(nativeScoreMultiplier(10),20);
assert.equal(o.nextRunScoreMultiplier(),10);
progress.bestDistance=500;assert.equal(o.nextRunScoreMultiplier(),11);
assert.ok(o.claim('first-500'));assert.equal(o.nextRunScoreMultiplier(),11,'claim is not a second completion');
assert.equal(o.claim('first-500'),false);
progress.lifetimeCoins=200;progress.owned=['jhony','selene','scarlett'];progress.bestDistance=1500;
assert.equal(o.nextRunScoreMultiplier(),15);
progress.claimed.push('unknown','unknown');assert.equal(o.nextRunScoreMultiplier(),15);
assert.equal(nativeScoreMultiplier(NaN),10);
console.log('Native base10 + completed count; web objectives count once before/after rewards; legacy4 and original distance goals and invalid IDs pass.');

for(const target of [1000,2500,5000,10000]){
 progress.bestDistance=target-1;const id='distance'+target;
 assert.equal(o.claim(id),false);progress.bestDistance=target;
 const count=o.nextRunScoreMultiplier(),coins=progress.coins,gems=progress.gems;
 assert.ok(o.claim(id));assert.equal(o.claim(id),false);
 assert.equal(o.nextRunScoreMultiplier(),count);assert.equal(progress.coins,coins);assert.equal(progress.gems,gems);
}
console.log('Native distance goals:exact threshold, zero invented currency, completion/confirmation counted once, durable claim IDs pass.');
