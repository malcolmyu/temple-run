import assert from 'node:assert/strict';
import {NativeFastTurnState} from '../target/temple-run/web/src/game/nativeFastTurn';
const state=new NativeFastTurnState();let draws=0;const roll=(n:number)=>()=>{draws++;return n;};
assert.equal(state.advance(1000,roll(0)),false);assert.equal(draws,0);
assert.equal(state.advance(.25,roll(3)),true);assert.equal(state.active,false);assert.equal(state.elapsed,0);
state.advance(1001,roll(0));assert.equal(state.active,true);assert.equal(state.elapsed,0);
assert.equal(state.advance(100,roll(0)),false);assert.equal(state.active,true);
state.advance(.25,roll(3));assert.equal(state.active,true);assert.equal(state.elapsed,0);
state.advance(101,roll(2));assert.equal(state.active,false);
for(const n of [0,1,2,3]){state.reset();state.advance(1001,()=>n);assert.equal(state.active,n<=2);}
state.active=true;
const normal={minTurnSpaces:12,minCoinRunSpaces:12,minObstacleSpaces:6};
assert.deepEqual(state.apply(normal),{minTurnSpaces:7,minCoinRunSpaces:0,minObstacleSpaces:6});
assert.equal(normal.minTurnSpaces,12);
for(const n of [2,3,4])assert.equal(state.apply({...normal,minTurnSpaces:n}).minTurnSpaces,2);
state.reset();assert.equal(state.elapsed,0);assert.deepEqual(state.apply(normal),normal);
assert.equal(state.advance(751,roll(1),{inactive:750,active:100}),true);
assert.throws(()=>state.advance(-1,roll(0)),RangeError);
console.log('Native fast turn: strict boundaries, all four rolls, failed-draw reset, active retry/exit, spacing clamp, coin override, configurable thresholds and reset pass.');
