import assert from 'node:assert/strict';
import {nativeIntroHeld,stepNativeRunClock} from '../target/temple-run/web/src/game/nativeRunnerRules';
let time=0;for(let i=0;i<60;i++)time=stepNativeRunClock(time,1/60);
assert.equal(time,0.9999997019767761);assert.equal(nativeIntroHeld(time),true);
time=stepNativeRunClock(time,1/60);assert.equal(time,1.0166664123535156);assert.equal(nativeIntroHeld(time),false);
const clocks=[0,100,1e8].map(previousWorldClock=>{
 let local=0;for(let i=0;i<61;i++)local=stepNativeRunClock(local,1/60);
 return {previousWorldClock,local};
});assert.ok(clocks.every(c=>c.local===time),'previous sessions do not alter release phase');
assert.equal(stepNativeRunClock(0,.025),Math.fround(.025));
console.log('Native float32 run clock: held through60 frames, releases on61; independent of prior world elapsed');
