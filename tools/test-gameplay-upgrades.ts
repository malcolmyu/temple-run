import assert from 'node:assert/strict';
const saved=new Map<string,string>();
Object.assign(globalThis,{localStorage:{getItem:(k:string)=>saved.get(k)??null,setItem:(k:string,v:string)=>saved.set(k,v)}});
const {progress}=await import('../target/temple-run/web/src/game/progress');
const u=await import('../target/temple-run/web/src/game/upgrades');
progress.coins=10000;
assert.equal(u.magnetDuration(),15);
assert.equal(u.shieldDuration(),15,'default shield must not inherit a max-level video character');
assert.equal(u.coinBonusReward(),50);
const before=progress.coins;
assert.ok(u.purchase('magnet'));assert.equal(u.magnetDuration(),20);assert.equal(progress.coins,before-200);
assert.ok(u.purchase('magnet'));assert.equal(u.magnetDuration(),25);
assert.equal(u.purchase('magnet'),false,'max-level repeat must not charge');
assert.ok(u.purchase('shield'));assert.equal(u.shieldDuration(),17.5);
assert.ok(u.purchase('bonus'));assert.equal(u.coinBonusReward(),75);
assert.ok(u.purchase('coin'));assert.equal(u.coinMultiplier(),1.25);
const stored=JSON.parse(saved.get('temple.v2.progress')!);
assert.equal(stored.upgrades.shield,1);assert.equal(stored.upgrades.bonus,1);
progress.coins=0;const level=u.levelOf('shield');
assert.equal(u.purchase('shield'),false);assert.equal(u.levelOf('shield'),level);
assert.equal(u.purchase('invalid'),false);
progress.upgrades.magnet=3;assert.equal(u.levelOf('magnet'),2);assert.equal(u.magnetDuration(),25,'old saves keep the highest useful effect');
console.log('Upgrade economy: paid effects, native duration/reward values, persistence, max-level and insufficient-funds guards pass.');

assert.equal(u.boostProgress(),250);progress.coins=10000;
for(const expected of [375,500,625,750]){assert.ok(u.purchase('boost'));assert.equal(u.boostProgress(),expected);}
const boostCoins=progress.coins;assert.equal(u.purchase('boost'),false);assert.equal(progress.coins,boostCoins);
assert.equal(JSON.parse(saved.get('temple.v2.progress')!).upgrades.boost,4);
console.log('Boost upgrades: native250/375/500/625/750, costs, persistence and max-level guard pass.');

progress.coins=10000;
for(let level=1;level<=5;level++){assert.ok(u.purchase('coinSpawn'));assert.equal(u.levelOf('coinSpawn'),level);}
const highCoinBank=progress.coins;assert.equal(u.purchase('coinSpawn'),false);assert.equal(progress.coins,highCoinBank);
assert.equal(JSON.parse(saved.get('temple.v2.progress')!).upgrades.coinSpawn,5);
console.log('High-value coin upgrade: all5 tiers, persistence and max-level guards pass.');
