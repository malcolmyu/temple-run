import assert from 'node:assert/strict';
import {DEFS} from '../target/temple-run/web/src/game/obstacles/catalog';
import {collisionWouldHit} from '../target/temple-run/web/src/game/obstacles/collision';
import {CoursePlan} from '../target/temple-run/web/src/game/coursePlan';
const runner={prevDistance:19.9,distance:20,laneIndex:1,side:0,jumpY:0,jumpV:0,slideRemaining:0,lastJumpAt:0,lastSlideAt:0,now:10,jumpWindow:1,slideWindow:.75};
const wall={def:DEFS.fireWall,lane:1,distance:20};
assert.equal(collisionWouldHit(wall,runner),true);
assert.equal(collisionWouldHit(wall,{...runner,slideRemaining:.5}),true);
assert.equal(collisionWouldHit(wall,{...runner,jumpY:1.3}),false);
assert.equal(collisionWouldHit(wall,{...runner,lastJumpAt:9.9}),true,'recent jump cannot bypass strict height');
assert.equal(collisionWouldHit({def:DEFS.flameTower,lane:1,distance:20},{...runner,slideRemaining:.5}),false,'tower retains alternate slide solution');
let count=0;
for(let seed=1;seed<=200;seed++){const p=new CoursePlan(seed,0);p.ensureThrough(12000,2000);for(const f of p.features)if(f.kind==='fireWall'){count++;assert.equal(f.pathLevel,2);assert.equal(f.combo,undefined);assert.ok(f.generatedAtProgress!>=1000);assert.ok(p.obstacles.some(o=>o.defId==='fireWall'&&o.distance>f.from+36&&o.distance<f.to-36));}assert.equal(p.rejectedEncounters.length,0);}
assert.ok(count>100);console.log('Web fire wall:jump-only strict height,tower distinction and200 normal courses pass',{count});
