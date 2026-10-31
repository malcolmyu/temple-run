import assert from 'node:assert/strict';
import {HEAD_START_PRICE,HEAD_START_PROGRESS,MEGA_START_PRICE,MEGA_START_PROGRESS,headStartWindow} from '../target/temple-run/web/src/game/megaStart';
import {createNativeBoost,startNativeBoost,nativeBoostSpeedLimit} from '../target/temple-run/web/src/game/nativeBoost';
assert.equal(HEAD_START_PRICE,10000);assert.equal(MEGA_START_PRICE,2500);
assert.equal(HEAD_START_PROGRESS,950);assert.equal(MEGA_START_PROGRESS,2350);
for(const target of [HEAD_START_PROGRESS,MEGA_START_PROGRESS]){
 const state=createNativeBoost();startNativeBoost(state,20,target,false,42);
 assert.equal(state.left,target+50);assert.equal(state.speedBefore,20);assert.equal(nativeBoostSpeedLimit(state),84);
 const later=createNativeBoost();startNativeBoost(later,24,target-60,false,42);assert.equal(later.left,target-10);
}
console.log('Head starts: native defaults, metric target budget plus50, baseline preservation and normal84 cap pass');

assert.equal(headStartWindow(25),false);assert.equal(headStartWindow(25.001),true);assert.equal(headStartWindow(99.999),true);assert.equal(headStartWindow(100),false);
