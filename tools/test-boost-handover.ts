import assert from 'node:assert/strict';
import {boostHandoverReasons} from '../target/temple-run/web/src/game/boostHandover';
import {createPowerEffects,activatePower,stepPowerEffects} from '../target/temple-run/web/src/game/powerEffects';
const clear={speed:42,supported:true,airborne:false,turnAhead:100,hazards:[]};
assert.deepEqual(boostHandoverReasons(clear),[]);
assert.deepEqual(boostHandoverReasons({...clear,supported:false}),['unsupported-exit']);
assert.deepEqual(boostHandoverReasons({...clear,airborne:true}),['airborne-exit']);
assert.deepEqual(boostHandoverReasons({...clear,turnAhead:30}),['junction-exit']);
assert.deepEqual(boostHandoverReasons({...clear,hazards:[{from:30,to:42}]}),['hazard-exit']);
assert.deepEqual(boostHandoverReasons({...clear,hazards:[{from:-20,to:-3}]}),[]);
assert.deepEqual(boostHandoverReasons({...clear,hazards:[{from:34,to:46}]}),[]);
assert.deepEqual(boostHandoverReasons({...clear,speed:84,hazards:[{from:34,to:46}]}),['hazard-exit']);
// A deferred expiry keeps both boost and shield, then ends on clear ground.
const p=createPowerEffects();activatePower(p,'boost',0,10,42,0);p.boost.left=0;
p.expires.shield=4.026;stepPowerEffects(p,4,.025);assert.equal(p.boost.active,true);
stepPowerEffects(p,4.05,.025);assert.equal(p.boost.active,false);
console.log('Boost handover: ground/air/junction/hazard/rear clearance, speed-scaled reaction and coupled expiry pass');
