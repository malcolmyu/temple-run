import assert from 'node:assert/strict';
import {createRunChallenges,stepRunChallenges,summarizeRunChallenges} from '../target/temple-run/web/src/game/nativeRunChallenges';
const s=createRunChallenges();stepRunChallenges(s,600,0);assert.deepEqual(summarizeRunChallenges(s,600),{coinFreeStart:600,cleanDistance:600});
stepRunChallenges(s,650,1);stepRunChallenges(s,1500,40);assert.equal(summarizeRunChallenges(s,1500).coinFreeStart,650,'later empty windows cannot replace opening record');
s.stumbled=true;assert.equal(summarizeRunChallenges(s,5500).cleanDistance,0,'late stumble disqualifies clean settlement');
stepRunChallenges(s,6000,40);assert.ok(s.stumbled,'continuing/revival does not reset challenge state');
assert.deepEqual(createRunChallenges(),{firstCoinDistance:null,stumbled:false});
Object.assign(globalThis,{localStorage:{getItem:()=>JSON.stringify({bestDistance:10000,bestRunCoins:500}),setItem:()=>{}}});
const p=await import('../target/temple-run/web/src/game/progress');const o=await import('../target/temple-run/web/src/game/objectives');
assert.equal(p.progress.bestCoinFreeStart,0);assert.equal(p.progress.bestCleanRunDistance,0,'old run totals cannot infer unstored action conditions');
for(const [id,metric,target] of [['distance500NoCoins','bestCoinFreeStart',500],['distance1000NoCoins','bestCoinFreeStart',1000],['notrip2500','bestCleanRunDistance',2500],['notrip5000','bestCleanRunDistance',5000]] as const){
 p.progress[metric]=target-1;assert.equal(o.claim(id),false);p.progress[metric]=target;
 const before=o.nextRunScoreMultiplier();assert.ok(o.claim(id));assert.equal(o.claim(id),false);assert.equal(o.nextRunScoreMultiplier(),before);
}
p.progress.bestCoinFreeStart=0;p.progress.bestCleanRunDistance=0;
p.recordRun(6000,10,0,60000,{coinFreeStart:650,cleanDistance:0});
assert.equal(p.progress.bestCoinFreeStart,650);assert.equal(p.progress.bestCleanRunDistance,0);
p.recordRun(5200,0,0,52000,{coinFreeStart:5200,cleanDistance:5200});assert.equal(p.progress.bestCleanRunDistance,5200);
console.log('Run challenges: opening prefix freezes, clean settlement is sticky across revival, old saves not inferred, all4 thresholds/confirmation and independent records pass.');
