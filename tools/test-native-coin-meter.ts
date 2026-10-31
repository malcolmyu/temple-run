import assert from 'node:assert/strict';
import {addNativeCoinMeter as add} from '../target/temple-run/web/src/game/nativeCoinMeter';
assert.deepEqual(add(24,1,1,1),{count:25,level:1,maxLevel:1,scoreValue:0});
assert.deepEqual(add(99,1,1,1),{count:0,level:2,maxLevel:2,scoreValue:500});
assert.deepEqual(add(98,2,3,3),{count:1,level:3,maxLevel:3,scoreValue:500});
assert.deepEqual(add(80,1,4,50),{count:30,level:2,maxLevel:4,scoreValue:500});
assert.deepEqual(add(0,1,1,250),{count:150,level:2,maxLevel:2,scoreValue:500},'native has one branch, not a repeated threshold loop');
assert.deepEqual(add(150,2,2,0),{count:150,level:2,maxLevel:2,scoreValue:0});
console.log('Native coin meter: threshold100, score500, carry, level/max, bonus batch and single native threshold branch pass.');
