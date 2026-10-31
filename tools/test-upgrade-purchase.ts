import assert from 'node:assert/strict';
let writes=0;
Object.assign(globalThis,{localStorage:{getItem:()=>null,setItem:()=>{writes++;}}});
const p=await import('../target/temple-run/web/src/game/progress');
const u=await import('../target/temple-run/web/src/game/upgrades');
const {migrateUpgradeLevels}=await import('../target/temple-run/web/src/game/upgradeLevels');
function unchanged(id:string,cost?:number){const before=JSON.stringify(p.progress),saved=writes;assert.equal(p.buyUpgrade(id,cost),false);assert.equal(JSON.stringify(p.progress),before);assert.equal(writes,saved);}
p.progress.coins=1000000;p.progress.upgrades={};
for(const cost of [-1,0,NaN,Infinity,249,251])unchanged('magnet',cost);
unchanged('unknown',250);unchanged('__proto__',250);
p.progress.coins=249;unchanged('magnet');
p.progress.coins=250;assert.ok(u.purchase('magnet'));assert.equal(p.progress.coins,0);assert.equal(u.levelOf('magnet'),1);assert.equal(u.powerAvailability().magnet,1);assert.equal(u.nextCost('magnet'),1000);
p.progress.coins=1000000;unchanged('magnet',250); // stale first-tier quote
for(const def of u.UPGRADES){
 p.progress.upgrades[def.id]=0;const start=p.progress.coins;
 for(const cost of def.costs){assert.equal(u.nextCost(def.id),cost);assert.ok(p.buyUpgrade(def.id,cost));}
 assert.equal(start-p.progress.coins,def.costs.reduce((a,b)=>a+b,0));assert.equal(u.nextCost(def.id),null);unchanged(def.id);unchanged(def.id,1);
 assert.equal(migrateUpgradeLevels({[def.id]:999},2)[def.id],def.costs.length);
}
p.progress.upgrades.magnet=NaN;unchanged('magnet');p.progress.upgrades.magnet=-1;unchanged('magnet');p.progress.upgrades.magnet=.5;unchanged('magnet');
console.log('Upgrade transactions:catalogue debit,stale/invalid quotes,unknown ids,insufficient funds,all tiers,max caps,unlock eligibility and migration agree');
