import assert from 'node:assert/strict';
import { openingChaseGap } from '../target/temple-run/web/src/game/chasePresentation';
assert.equal(openingChaseGap(0,11.5),3);
assert.equal(openingChaseGap(2,11.5),3);
assert.ok(openingChaseGap(3,11.5)>6);
assert.equal(openingChaseGap(4,11.5),11.5);
assert.equal(openingChaseGap(10,3),3,'stumble must bring pack back');
assert.equal(openingChaseGap(1,.5),.5,'opening must not push an already closer pack away');
let previous=0;
for(let t=0;t<5;t+=.01){const gap=openingChaseGap(t,11.5);assert.ok(gap>=previous);previous=gap;}
console.log('Opening pack retreats continuously by 4 s; later stumble gap remains authoritative');

import {nativeEnemyFollowTarget,stepNativeEnemyFollow} from '../target/temple-run/web/src/game/chasePresentation';
import {nativeStumbleIsFatal,NATIVE_STUMBLE_RESET_AGE,STUMBLE_KILL_WINDOW} from '../target/temple-run/web/src/game/nativeRunnerRules';
assert.equal(NATIVE_STUMBLE_RESET_AGE,7);
assert.equal(STUMBLE_KILL_WINDOW,10);
assert.equal(nativeStumbleIsFatal(9.999),true);
assert.equal(nativeStumbleIsFatal(10),false,'native b.pl makes exact 10 seconds safe');
assert.ok(Math.abs(nativeEnemyFollowTarget(0,false,false,false)-2.3)<1e-9);
assert.ok(Math.abs(nativeEnemyFollowTarget(10,false,false,false)-4.6)<1e-9);
assert.equal(nativeEnemyFollowTarget(10.5,false,false,false),15);
assert.equal(stepNativeEnemyFollow(15,2.3,.025,false,false),14.5);
assert.equal(stepNativeEnemyFollow(2.3,15,1,false,false),15,'retreat cannot overshoot');
console.log('Native pursuit: 10-second catch boundary, post-stumble approach, recovery retreat and bounded movement pass.');
