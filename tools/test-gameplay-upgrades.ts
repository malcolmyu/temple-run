import assert from 'node:assert/strict';
const saved=new Map<string,string>();Object.assign(globalThis,{localStorage:{getItem:(k:string)=>saved.get(k)??null,setItem:(k:string,v:string)=>saved.set(k,v)}});
const {progress}=await import('../target/temple-run/web/src/game/progress');
const u=await import('../target/temple-run/web/src/game/upgrades');
const {migrateUpgradeLevels,UPGRADE_SCHEMA}=await import('../target/temple-run/web/src/game/upgradeLevels');
const old=migrateUpgradeLevels({magnet:2,shield:4,boost:4,bonus:4,coinSpawn:5,coin:3});assert.deepEqual(old,{magnet:4,shield:5,boost:5,bonus:5,coinSpawn:5,coin:3});assert.deepEqual(migrateUpgradeLevels(old,UPGRADE_SCHEMA),old);
assert.equal(migrateUpgradeLevels({magnet:3}).magnet,4);assert.equal(migrateUpgradeLevels({boost:Infinity},2).boost,0);
progress.coins=200000;assert.deepEqual(u.powerAvailability(),{bonus:0,shield:0,magnet:0,boost:0});
const effects={magnet:[15,20,20,25,25,25],shield:[15,17.5,20,22.5,25,25],boost:[250,375,500,625,750,750],bonus:[50,75,100,125,150,150]};
const getters={magnet:u.magnetDuration,shield:u.shieldDuration,boost:u.boostProgress,bonus:u.coinBonusReward};
for(const id of ['magnet','shield','boost','bonus']as const){for(let i=0;i<6;i++){const before=progress.coins;assert.equal(u.nextCost(id),[250,1000,2500,5000,7500,25000][i]);assert.ok(u.purchase(id));assert.equal(progress.coins,before-[250,1000,2500,5000,7500,25000][i]);assert.equal(getters[id](),effects[id][i]);assert.equal(u.powerAvailability()[id],1);}const bank=progress.coins;assert.equal(u.purchase(id),false);assert.equal(progress.coins,bank);assert.equal(u.levelOf(id),6);}
for(let i=1;i<=5;i++){assert.ok(u.purchase('coinSpawn'));assert.equal(u.levelOf('coinSpawn'),i);}assert.equal(u.purchase('coinSpawn'),false);
assert.ok(u.purchase('coin'));assert.equal(u.coinMultiplier(),1.25);
const stored=JSON.parse(saved.get('temple.v2.progress')!);assert.equal(stored.upgradeSchema,2);assert.equal(stored.upgrades.magnet,6);
progress.upgrades.boost=0;progress.coins=249;assert.equal(u.purchase('boost'),false);assert.equal(u.levelOf('boost'),0);progress.coins=250;assert.ok(u.purchase('boost'));assert.equal(progress.coins,0);assert.equal(u.boostProgress(),250);assert.equal(u.powerAvailability().boost,1);assert.equal(u.purchase('invalid'),false);
console.log('Native upgrades:unlock gate,four6-tier tables/prices,coinSpawn5,persistence,exact/insufficient funds,max guards and lossless compact migration pass');
