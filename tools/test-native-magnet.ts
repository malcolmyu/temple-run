import assert from 'node:assert/strict';
import {nativeMagnetMultiplier,stepNativeMagnetCoin,MAGNET_RADIUS,MAGNET_PICKUP_RADIUS} from '../target/temple-run/web/src/game/nativeMagnet';
import {nativePickupWithinReach} from '../target/temple-run/web/src/game/nativePickupCollision';
assert.deepEqual(Array.from({length:7},(_,i)=>nativeMagnetMultiplier(i)),[1,1,1,2,2,3,3]);
assert.equal(MAGNET_RADIUS,18);assert.equal(MAGNET_PICKUP_RADIUS,2.4);
assert.equal(stepNativeMagnetCoin(null,[18.01,0,0],[0,0,0],true,.025).state,null);
const start=stepNativeMagnetCoin(null,[18,0,0],[0,0,0],true,.025);assert.ok(start.state);assert.equal(start.state.position[0],18,'force queued,not instant collection');assert.ok(Math.abs(start.state.force[0]+80000/324)<1e-8);
const next=stepNativeMagnetCoin(start.state,[18,0,0],[0,0,0],false,.025);assert.ok(next.pulling,'previously pulled coin continues after expiration');assert.ok(next.state!.position[0]<18);assert.ok(Math.hypot(...next.state!.velocity)<=100);
assert.equal(stepNativeMagnetCoin(null,[5,0,0],[0,0,0],false,.025).state,null);
assert.equal(nativePickupWithinReach('coin',1,0,.6,2),false);assert.equal(nativePickupWithinReach('coin',1,0,.6,2,2.4),true);
let state=start.state;for(let i=0;i<200;i++){const result=stepNativeMagnetCoin(state,[18,0,0],[0,0,0],true,.025);state=result.state!;assert.ok(Math.hypot(...state.velocity)<=100.000001);if(nativePickupWithinReach('coin',1,state.position[0],state.position[1],state.position[2],2.4))break;if(i===199)assert.fail('coin never reaches the original pickup box');}
console.log('Native magnet:level multipliers,fixed18m sphere,queued inverse-square force,100m/s cap,persistent attraction and2.4m pickup radius pass');
