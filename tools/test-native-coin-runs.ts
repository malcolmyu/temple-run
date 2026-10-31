import assert from 'node:assert/strict';
import {NativeCoinRunState,NATIVE_STRAIGHT_COIN_OFFSETS} from '../target/temple-run/web/src/game/nativeCoinRuns';
import {CourseCoinDirector} from '../target/temple-run/web/src/game/courseCoins';
import {CoursePlan} from '../target/temple-run/web/src/game/coursePlan';
const state=new NativeCoinRunState();
for(let i=0;i<=12;i++)assert.equal(state.step(true,12),false);
for(let i=0;i<5;i++)assert.equal(state.step(true,12),true);
assert.equal(state.count,5);assert.equal(state.spaces,0);assert.equal(state.step(true,12),false);assert.equal(state.count,0);assert.equal(state.spaces,1);
const interrupted=new NativeCoinRunState();interrupted.spaces=13;assert.ok(interrupted.step(true,12));assert.equal(interrupted.step(false,12),false);assert.equal(interrupted.count,0);assert.equal(interrupted.spaces,14);assert.ok(interrupted.step(true,12));
assert.deepEqual(NATIVE_STRAIGHT_COIN_OFFSETS,[-5,-2.5,0,2.5,5]);
const p=new CoursePlan(1,489);p.features.splice(0,p.features.length,{kind:'cliffStraight',from:489,to:3000,surface:'stone',pathLevel:3,generatedAtProgress:0});p.obstacles.splice(0);p.narrows.splice(0);
const whole=new CourseCoinDirector().takeThrough(2000,p);const stream=new CourseCoinDirector();let streamed:typeof whole=[];
for(let d=500;d<=2000;d+=25)streamed.push(...stream.takeThrough(d,p));assert.deepEqual(streamed,whole);assert.ok(whole.length>=25);
for(let i=0;i<25;i++)assert.equal(whole[i].distance,660+Math.floor(i/5)*12+NATIVE_STRAIGHT_COIN_OFFSETS[i%5]);
const blocked=p.features[0];blocked.kind='transition';assert.deepEqual(new CourseCoinDirector().takeThrough(2000,p),[]);
console.log('Native per-cell coin counters:13 empty cells,5 emitting cells/25coins,interruptions,2.5m arrays,streaming equivalence and unsafe exclusion pass');

const {nativeTreeCoinHeights}=await import('../target/temple-run/web/src/game/nativeCoinRuns');
for(const id of ['treeJump','treeTrip','treeSlide']as const){
 const plan=new CoursePlan(1,489);plan.features.splice(0,plan.features.length,{kind:id,from:489,to:1000,surface:'stone',pathLevel:2,generatedAtProgress:0});plan.obstacles.splice(0,plan.obstacles.length,{distance:660,defId:id,prefab:'test'});
 const coins=new CourseCoinDirector().takeThrough(672,plan).filter(c=>c.distance>=655&&c.distance<=665);
 assert.equal(coins.length,5);assert.deepEqual(coins.map(c=>c.height),nativeTreeCoinHeights(id));
}
assert.equal(nativeTreeCoinHeights('flameTower'),null);
console.log('Tree coin heights: jump/trip native high plateau;slide low row;tree-only height lookup remains separate');
const {nativePickupWithinReach}=await import('../target/temple-run/web/src/game/nativePickupCollision');
for(const height of nativeTreeCoinHeights('treeJump')!){assert.equal(nativePickupWithinReach('coin',1,0,height,0),false);assert.equal(nativePickupWithinReach('coin',1,0,height-2.5,0),true);}
for(const height of nativeTreeCoinHeights('treeSlide')!)assert.equal(nativePickupWithinReach('coin',1,0,height,0),true);
console.log('Original pickup bounds:high tree row needs jump;low slide row remains reachable');

const {nativeFlameCoinHeights}=await import('../target/temple-run/web/src/game/nativeCoinRuns');
assert.deepEqual(nativeFlameCoinHeights(limit=>{assert.equal(limit,2);return 0;}),[.6,.6,.6,.6,.6]);
assert.deepEqual(nativeFlameCoinHeights(()=>1),[3.6,4,4,4,3.6]);assert.deepEqual(nativeFlameCoinHeights(()=>1,false),[.6,.6,.6,.6,.6]);
const variants=new Set<string>();
for(let seed=1;seed<=100;seed++){
 const plan=new CoursePlan(seed,489);plan.features.splice(0,plan.features.length,{kind:'flameTower',from:489,to:1000,surface:'stone',pathLevel:2,generatedAtProgress:0});plan.obstacles.splice(0,plan.obstacles.length,{distance:660,defId:'flameTower',prefab:'flame-tower'});
 const all=new CourseCoinDirector().takeThrough(800,plan);const director=new CourseCoinDirector();const chunked=[...director.takeThrough(600,plan),...director.takeThrough(800,plan)];assert.deepEqual(all,chunked);
 const row=all.filter(c=>c.distance>=655&&c.distance<=665);assert.equal(row.length,5);variants.add(String(row[0].height));
}
assert.deepEqual([...variants].sort(),['0.6','3.6']);
console.log('Flame native Range(0,2),jump-enable gate,both seeded variants and100-seed streaming consistency pass');

const {nativeParallelCoinSide}=await import('../target/temple-run/web/src/game/nativeCoinRuns');
for(const level of [1,2,3])for(const row of [0,1,2]as const){const side=nativeParallelCoinSide(row,level);const lane=row===0?1:row===1?0:2;assert.ok(nativePickupWithinReach('coin',1,side-(lane-1)*1.3,.6,0));assert.ok(Math.abs(side)<=1.4);if(level===3)assert.ok(Math.abs(side)<=1.12);}
assert.equal(nativeParallelCoinSide(1,2),-1.4);assert.equal(nativeParallelCoinSide(2,2),1.4);
const lanes=new Set<number>();for(let seed=1;seed<=100;seed++){const plan=new CoursePlan(seed,489);plan.features.splice(0,plan.features.length,{kind:'cliffStraight',from:489,to:3000,surface:'stone',pathLevel:3,generatedAtProgress:0});plan.obstacles.splice(0);const coins=new CourseCoinDirector().takeThrough(730,plan);assert.equal(coins.length,25);for(let i=5;i<coins.length;i+=5)assert.ok(Math.abs(coins[i].side-coins[i-1].side)<.1);lanes.add(coins[0].lane);}
assert.deepEqual([...lanes].sort(),[0,1,2]);console.log('Parallel coin rows:left/centre/right reachable,authored offsets/cliff scale,original pickup bounds and25-coin endpoint continuity pass');

const {nativeCoinRowCandidates,nativeCoinRowSides,nativeCoinRowEnd}=await import('../target/temple-run/web/src/game/nativeCoinRows');
assert.deepEqual(nativeCoinRowCandidates(null),[0,1,2,3,4,5,6]);assert.deepEqual(nativeCoinRowCandidates(1),[0,3,5]);assert.deepEqual(nativeCoinRowCandidates(2),[1,6]);assert.deepEqual(nativeCoinRowCandidates(3),[2,4]);
const allPatterns=new Set<number>();for(let seed=1;seed<=100;seed++){const plan=new CoursePlan(seed,489);plan.features.splice(0,plan.features.length,{kind:'cliffStraight',from:489,to:3000,surface:'stone',pathLevel:3,generatedAtProgress:0});plan.obstacles.splice(0);const coins=new CourseCoinDirector().takeThrough(2000,plan);for(const c of coins)allPatterns.add(c.pattern);for(let i=0;i<coins.length;i+=5){const row=coins.slice(i,i+5);assert.deepEqual(row.map(c=>c.side),nativeCoinRowSides(row[0].pattern,3));if(i&&row[0].distance-coins[i-1].distance<3)assert.ok(nativeCoinRowCandidates(nativeCoinRowEnd(coins[i-1].pattern)).includes(row[0].pattern));}}
assert.deepEqual([...allPatterns].sort(),[0,1,2,3,4,5,6]);console.log('All7 native rows,endpoint candidate sets,exact float tables,cliff scaling and100-seed slant reachability pass');

const {TrackPath}=await import('../target/temple-run/web/src/game/path');
let cornerCount=0;
for(let seed=1;seed<=100;seed++)for(const direction of [-1,1]as const){
 const p=new CoursePlan(seed,489);p.features.splice(0,p.features.length,{kind:'cliffStraight',from:489,to:705,surface:'stone',pathLevel:3,generatedAtProgress:0},{kind:'cliffStraight',from:705,to:3000,surface:'stone',pathLevel:3,generatedAtProgress:0});p.obstacles.splice(0);p.turns.splice(0,p.turns.length,{distance:705,direction,junction:'corner'});
 const all=new CourseCoinDirector().takeThrough(800,p),split=new CourseCoinDirector();assert.deepEqual([...split.takeThrough(700,p),...split.takeThrough(800,p)],all);
 const corner=all.filter(c=>c.pattern===7);if(!corner.length)continue;cornerCount++;assert.deepEqual(corner.map(c=>c.distance),[700,702.5,705,707.5,710]);
 const path=new TrackPath();path.turn(705,direction);const pivot=path.at(705);for(const c of corner){const pos=path.at(c.distance,c.side);if(c.distance<=705)assert.ok(Math.abs(pos.x-pivot.x)<1e-8);else{assert.ok(Math.abs(pos.z-pivot.z)<1e-8);assert.ok((pos.x-pivot.x)*direction>0);}}
 p.turns[0].junction='tee';assert.equal(new CourseCoinDirector().takeThrough(800,p).filter(c=>c.pattern===7).length,0);
}
assert.ok(cornerCount>0);console.log('Corner native5-point L geometry,both directions,centre predecessor/counter eligibility,T exclusion and streaming order pass');

const {nativePathTypeAllowsCoins}=await import('../target/temple-run/web/src/game/nativeCoinEligibility');
for(const type of [7,8,9,10])assert.equal(nativePathTypeAllowsCoins(type),false);
for(const type of [1,2,3,4,5,6,11,12,13,35,36])assert.equal(nativePathTypeAllowsCoins(type),true);
console.log('Native T coin exclusion:four metadata-backed path types rejected;other eligibility remains separate');
