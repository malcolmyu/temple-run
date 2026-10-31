import assert from 'node:assert/strict';
import {nativeCoinThresholds as t,nativeCoinValue as v} from '../target/temple-run/web/src/game/nativeCoinValues';
assert.deepEqual(t(1),{double:1500,triple:999999999});assert.deepEqual(t(5),{double:1000,triple:2000});
for(const level of [0,1,2,3,4,5]){
 const threshold=t(level);assert.equal(v(0,level,1),1);
 if(level){assert.equal(v(threshold.double-.001,level,1),1);assert.equal(v(threshold.double,level,1),2);}
 if(level>=3){assert.equal(v(threshold.triple-.001,level,0),1);assert.equal(v(threshold.triple,level,0),2);assert.equal(v(threshold.triple,level,1),3);}
}
assert.equal(v(100000,0,1),1);assert.deepEqual(t(NaN),t(0));
console.log('Native coin defaults: every upgrade threshold, >=boundary, yellow/red and red/blue pairs, disabled base and invalid-level fallback pass.');
