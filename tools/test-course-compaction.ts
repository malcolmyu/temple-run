import assert from 'node:assert/strict';
import {referenceTurnDirection,referenceNextTurnDistance,referenceJunction} from '../target/temple-run/web/src/game/referenceRoute';
import {surfaceAt,nativeGroundHeightAt,nativeTransitionSupported,nativeTransitionAt,nativeCliffTransitionAt} from '../target/temple-run/web/src/game/surface';
import {CoursePlan,setActiveCourse} from '../target/temple-run/web/src/game/coursePlan';
import {CourseCoinDirector} from '../target/temple-run/web/src/game/courseCoins';
let peak=0;
for(let seed=1;seed<=20;seed++){
 const full=new CoursePlan(seed,0),compact=new CoursePlan(seed,0),a=new CourseCoinDirector(),b=new CourseCoinDirector();
 for(let d=0;d<60000;d+=60){
  if(d>0&&d%6000===0){const level=([1,3,2] as const)[d/6000%3];full.requestTheme(level,d*.8);compact.requestTheme(level,d*.8);}
  full.ensureThrough(d+360,d*.8);compact.ensureThrough(d+360,d*.8);
  assert.deepEqual(b.takeThrough(d+90,compact),a.takeThrough(d+90,full),'coin stream unaffected');
  compact.compactBefore(d-240);peak=Math.max(peak,compact.features.length);
  assert.deepEqual(compact.features,full.features.slice(full.features.length-compact.features.length));
  assert.deepEqual(compact.obstacles,full.obstacles.slice(full.obstacles.length-compact.obstacles.length));
  assert.deepEqual(compact.surfaces,full.surfaces.slice(compact.surfaceOffset));
  assert.deepEqual(compact.turns,full.turns.slice(compact.turnOffset));
  for(let i=compact.turnOffset;i<full.turns.length;i++)assert.deepEqual(compact.turnAt(i),full.turns[i]);
  assert.equal(compact.extent,full.extent);assert.deepEqual(compact.rejectedEncounters,full.rejectedEncounters);
 }
 setActiveCourse(compact);
 for(let i=compact.turnOffset;i<full.turns.length;i++){
  const t=full.turns[i];assert.equal(referenceTurnDirection(i,t.distance),t.direction);assert.equal(referenceJunction(i,t.distance),t.junction);
  if(i>compact.turnOffset)assert.equal(referenceNextTurnDistance(i,full.turns[i-1].distance),t.distance);
 }
 const sample=(d:number)=>({surface:surfaceAt(d),height:nativeGroundHeightAt(d),support:nativeTransitionSupported(d),cap:nativeTransitionAt(d),cliff:nativeCliffTransitionAt(d)});
 for(const d of [59820,59940,59980,60020]){setActiveCourse(full);const expected=sample(d);setActiveCourse(compact);assert.deepEqual(sample(d),expected);}
 setActiveCourse(null);
 assert.ok(compact.features.length<15&&compact.turns.length<15);assert.ok(full.features.length>200);
 const retained=compact.retainedFrom;assert.deepEqual(compact.compactBefore(NaN),{obstacles:0,features:0});assert.equal(compact.retainedFrom,retained);
}
console.log('Course history:20x60000m,theme changes,seed/RNG tail,coin stream,absolute turns and retained obstacles/surfaces match full history',{peak});
