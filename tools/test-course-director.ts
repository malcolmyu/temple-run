import assert from 'node:assert/strict';
import {CourseDirector} from '../target/temple-run/web/src/game/courseDirector';
import {CoursePlan} from '../target/temple-run/web/src/game/coursePlan';
const coverage=new Set<string>();let rests=0,combos=0;
for(let seed=1;seed<=100;seed++){
 const a=new CourseDirector(seed),b=new CourseDirector(seed);let pressure=0,last='';const seen=new Set<string>();
 for(let i=0;i<120;i++){
  const level=([2,1,3] as const)[Math.floor(i/20)%3];
  const beat=a.choose(level,2000,2000+i*180);assert.deepEqual(beat,b.choose(level,2000,2000+i*180));
  if(beat.kind==='recovery'||beat.kind==='cliffStraight'){pressure=0;rests++;}
  else{assert.ok(++pressure<=3);assert.notEqual(beat.kind,last);last=beat.kind;}
  if(!seen.has(beat.kind))assert.equal(beat.allowCombination,false);
  seen.add(beat.kind);coverage.add(beat.kind);a.record(beat.kind);b.record(beat.kind);
 }
 const p=new CoursePlan(seed,0);p.ensureThrough(16000,2000);
 assert.equal(p.rejectedEncounters.length,0);
 for(const f of p.features){
  if(f.combo){combos++;assert.equal(f.beatIntent,'practised');}
  if(f.beatIntent==='recovery')assert.equal(p.obstacles.some(o=>o.distance>=f.from&&o.distance<f.to),false);
 }
}
for(const k of ['longGap','narrowSmall','narrowLong','branch','plankPit','plankBeam','stonePedestal','treeSlide','flameTower','cliffGap'])assert.ok(coverage.has(k),k);
assert.ok(rests>100&&combos>100);
const early=new CourseDirector(1);for(let i=0;i<100;i++){const d=early.choose(2,0,600);assert.ok(!['treeSlide','flameTower','narrowSmall','narrowLong','longGap'].includes(d.kind));assert.equal(d.allowCombination,false);early.record(d.kind);}
console.log('Director:theme pools,novice gates,first exposure,no immediate repeats,max3 pressure,recovery,seed replay and100 courses pass',{rests,combos});

const whole=new CoursePlan(75,0),chunked=new CoursePlan(75,0);whole.ensureThrough(12000,2000);
for(let d=600;d<=12000;d+=120)chunked.ensureThrough(d,2000);
assert.deepEqual(chunked.features,whole.features,'generation batching cannot change beat decisions');
assert.deepEqual(chunked.obstacles,whole.obstacles);
