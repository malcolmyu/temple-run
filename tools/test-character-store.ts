import assert from 'node:assert/strict';
const saved = new Map<string,string>([['temple.v2.progress',JSON.stringify({coins:-10,gems:'bad',owned:['removed','selene','selene'],equipped:'ghost',upgrades:{magnet:1}})]]);
Object.assign(globalThis,{localStorage:{getItem:(key:string)=>saved.get(key)??null,setItem:(key:string,value:string)=>saved.set(key,value)}});
const p=await import('../target/temple-run/web/src/game/progress');
const {SKINS}=await import('../target/temple-run/web/src/game/skins');
assert.deepEqual([...p.progress.owned],['jhony','selene']);
assert.equal(p.progress.equipped,'jhony');assert.equal(p.progress.coins,0);assert.equal(p.progress.gems,0);
p.equipSkin('ghost');assert.equal(p.progress.equipped,'jhony');
p.equipSkin('selene');assert.equal(p.progress.equipped,'selene');
assert.equal(p.buySkin('scarlett'),false);assert.equal(p.buySkin('invalid'),false);
p.progress.coins=10000;p.progress.gems=10;
for(const skin of SKINS){
 const already=p.isOwned(skin.id);const coins=p.progress.coins,gems=p.progress.gems;
 assert.equal(p.buySkin(skin.id),!already);
 assert.equal(p.progress.coins,coins-(!already&&skin.currency==='coins'?skin.price:0));
 assert.equal(p.progress.gems,gems-(!already&&skin.currency==='gems'?skin.price:0));
 assert.equal(p.buySkin(skin.id),false,'repeat purchase cannot charge');
 p.equipSkin(skin.id);assert.equal(p.progress.equipped,skin.id);
 const stored=JSON.parse(saved.get('temple.v2.progress')!);
 assert.equal(stored.equipped,skin.id);assert.ok(stored.owned.includes(skin.id));
}
console.log('Character store: all nine skins, both currencies, repeat/insufficient/invalid guards, durable equipment, and invalid-save recovery pass.');
