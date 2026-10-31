import assert from 'node:assert/strict';
import {NativeThemePacing,nativeThemeThresholds,nextNativeTheme} from '../target/temple-run/web/src/game/nativeThemePacing';
import {CoursePlan} from '../target/temple-run/web/src/game/coursePlan';
import {SeededRandom} from '../target/temple-run/web/src/game/obstacles/rng';
assert.deepEqual(nativeThemeThresholds(999),{temple:500,other:200});
assert.deepEqual(nativeThemeThresholds(1000),{temple:450,other:250});
assert.deepEqual(nativeThemeThresholds(4499),{temple:450,other:250});
assert.deepEqual(nativeThemeThresholds(4500),{temple:375,other:300});
const state=new NativeThemePacing();let calls=0;
assert.equal(state.advance(500,500,()=>{calls++;return 0}),null);assert.equal(calls,0);
assert.equal(state.advance(.1,500,()=>3),null);assert.equal(state.elapsed,0);assert.equal(state.level,2);
assert.equal(state.advance(501,501,()=>0),1);
assert.equal(state.advance(201,702,limit=>{assert.equal(limit,4);return 0}),2);
assert.equal(nextNativeTheme(2,()=>1),3);assert.equal(nextNativeTheme(3,()=>0),2);assert.equal(nextNativeTheme(3,()=>1),1);
for(let seed=1;seed<=100;seed++){
 const pacing=new NativeThemePacing(),rng=new SeededRandom(seed),plan=new CoursePlan(seed,489);
 let progress=0;const seen=new Set([2]);
 for(let distance=500;distance<20000;distance+=12){
  progress+=9.6;const next=pacing.advance(9.6,progress,limit=>rng.int(limit));
  const oldObstacles=JSON.stringify(plan.obstacles),oldCount=plan.obstacles.length;
  if(next!==null){seen.add(next);plan.requestTheme(next,progress);}
  plan.ensureThrough(distance+360,progress);
  assert.equal(JSON.stringify(plan.obstacles.slice(0,oldCount)),oldObstacles);
 }
 assert.equal(seen.size,3,`seed${seed} visits all native levels`);
 assert.equal(new Set(plan.surfaces.map(s=>s.level)).size,3);
 for(let i=1;i<plan.surfaces.length;i++){
  const a=plan.surfaces[i-1],b=plan.surfaces[i];assert.notEqual(a.level,b.level);assert.ok(a.level!==1||b.level===2,'plank only changes to temple before an upward cliff transition');assert.equal(a.to,b.from);
  assert.equal(b.kind,b.level===1?'wood':'stone');
  const f=plan.features.find(f=>f.kind==='transition'&&f.from<=b.from&&f.to>=b.from)!;
  assert.ok(f&&f.to-f.from>=120);assert.ok(b.from-12-f.from>=36,'departure cap has at least3 clear cells since preceding turn');assert.ok(f.themeRequestedAtProgress!==undefined);
  assert.ok(!plan.obstacles.some(o=>o.distance>f.from&&o.distance<f.to));
 }
}
console.log('Native theme thresholds, strict gate/reset, transition graph and100 streamed seeds passed');
const cliffCourse=new CoursePlan(7,489);cliffCourse.requestTheme(3,2000);cliffCourse.ensureThrough(10000,2000);
const cliffFeatures=cliffCourse.features.filter(f=>f.pathLevel===3&&f.kind!=='transition');
for(const f of cliffFeatures)assert.ok(['treeJump','treeTrip','treeSlide','cliffGap','cliffStraight'].includes(f.kind),f.kind);
assert.ok(cliffFeatures.some(f=>f.kind==='cliffGap'));assert.ok(cliffFeatures.some(f=>f.kind==='treeSlide'));
for(const o of cliffCourse.obstacles.filter(o=>o.defId==='cliffGapA'))assert.ok(cliffCourse.obstacles.some(b=>b.defId==='cliffGapB'&&b.distance===o.distance+12));
assert.ok(cliffCourse.obstacles.filter(o=>o.defId==='treeSlide').every(o=>o.prefab==='cliff-tree-slide'));
console.log('Cliff feature pool excludes unsupported stone pieces;native cap pairs and cliff slide reachable');
