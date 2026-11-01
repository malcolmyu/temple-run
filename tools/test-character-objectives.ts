import assert from 'node:assert/strict';
Object.assign(globalThis,{localStorage:{getItem:()=>null,setItem:()=>{}}});
const p=await import('../target/temple-run/web/src/game/progress');
const {SKINS}=await import('../target/temple-run/web/src/game/skins');
const {unlockedCharacterCount}=await import('../target/temple-run/web/src/game/nativeCharacterObjectives');
const {OBJECTIVES,claim,nextRunScoreMultiplier}=await import('../target/temple-run/web/src/game/objectives');
assert.equal(unlockedCharacterCount(['jhony','jhony','unknown']),1);
p.progress.coins=10000;p.progress.gems=100;
for(let count=1;count<=6;count++){
 assert.equal(unlockedCharacterCount(p.progress.owned),count);
 for(const target of [2,4,6])assert.equal(OBJECTIVES.find(o=>o.id===`character${target}`)!.done(),count>=target);
 const before=p.progress.coins;p.equipSkin('jhony');assert.equal(unlockedCharacterCount(p.progress.owned),count);assert.equal(p.progress.coins,before);
 if(count<6){const id=SKINS[count].id;assert.ok(p.buySkin(id));const bank=p.progress.coins;assert.equal(p.buySkin(id),false);assert.equal(p.progress.coins,bank);}
}
for(const target of [2,4,6]){
 const before={coins:p.progress.coins,gems:p.progress.gems,m:nextRunScoreMultiplier()};
 assert.ok(claim(`character${target}`));assert.equal(claim(`character${target}`),false);
 assert.equal(p.progress.coins,before.coins);assert.equal(p.progress.gems,before.gems);assert.equal(nextRunScoreMultiplier(),before.m);
}
console.log('Native character goals:2/4/6 ownership thresholds,real purchase progression,duplicate/unknown exclusion,equipping and repeat purchase do not inflate,no extra reward pass');
