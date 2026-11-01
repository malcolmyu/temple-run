import assert from 'node:assert/strict';

const store = new Map<string,string>();
Object.assign(globalThis,{localStorage:{
  getItem:(key:string)=>store.get(key)??null,
  setItem:(key:string,value:string)=>store.set(key,value),
}});
const {loadProgress,progress,saveProgress,buyHeadStart,buyPermaWings}=await import('../target/temple-run/web/src/game/progress');
const {NATIVE_UTILITY_PRICES}=await import('../target/temple-run/web/src/game/nativeStorePrices');
const key='temple.v2.progress';
const empty=JSON.parse(JSON.stringify(loadProgress()));
const legacy=()=>store.set('atb_temple_run_chars',JSON.stringify({bank:73,gems:0}));

// Old keys deliberately remain after migration. A spent bank must not make
// a later purchase-only v2 profile eligible for importing them again.
for(const [kind,field,price] of [
  ['normal','headStarts',NATIVE_UTILITY_PRICES.headStart],
  ['mega','megaStarts',NATIVE_UTILITY_PRICES.megaStart],
  ['permanent','permaWings',NATIVE_UTILITY_PRICES.permanentWings],
] as const){
  store.clear();legacy();
  Object.assign(progress,JSON.parse(JSON.stringify(empty)),{coins:price});
  assert.equal(kind==='permanent'?buyPermaWings():buyHeadStart(kind),true);
  assert.equal(progress.coins,0);
  assert.equal(progress[field],1);
  const saved=store.get(key);
  const loaded=loadProgress();
  assert.equal(loaded[field],1,`${kind}: purchase survives reload with old keys present`);
  assert.equal(loaded.coins,0,`${kind}: old bank must not reappear`);
  assert.equal(store.get(key),saved,`${kind}: loading must not overwrite current save`);
  store.set(key,JSON.stringify({...loaded,legacyMigrationComplete:false}));
  assert.equal(loadProgress()[field],1,`${kind}: pre-marker inventory also survives`);
  // Before a first run is committed, using the last consumable leaves no
  // positive counters. This is still a legitimate current save.
  progress[field]=0;saveProgress();
  const consumed=loadProgress();
  assert.equal(consumed.coins,0,`${kind}: consuming last item must not revive old bank`);
  assert.equal(consumed[field],0);
}

for(const field of ['lifetimeCoins','bestCoinMeterFills','bestWingResurrections','headStartUsed'] as const){
  store.clear();legacy();store.set(key,JSON.stringify({...empty,[field]:1}));
  assert.equal(loadProgress()[field],1,`${field}: recorded progress prevents reimport`);
}
store.clear();legacy();store.set(key,JSON.stringify(empty));
assert.equal(loadProgress().coins,73,'genuinely empty early v2 profiles still import old progress');
assert.equal(JSON.parse(store.get(key)!).legacyMigrationComplete,true,'successful import is recorded');
store.clear();store.set(key,JSON.stringify({...empty,headStarts:-1,megaStarts:'bad',permaWings:null}));legacy();
assert.equal(loadProgress().coins,73,'invalid inventory must not block legitimate import');
console.log('Progress load: purchase-only inventory and lifetime counters survive reload; empty/invalid profiles still migrate.');
