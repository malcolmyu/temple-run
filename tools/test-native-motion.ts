import{NATIVE_STUMBLE_RESET_AGE,STUMBLE_KILL_WINDOW,nativeStumbleIsFatal,nativeIntroHeld,NATIVE_INTRO_HOLD_SECONDS,nativeStumbleDuration}from'../target/temple-run/web/src/game/nativeRunnerRules';
import assert from 'node:assert/strict';
import { nativeSlideDuration,stepNativeSlideTimer,stepNativeJump,NATIVE_POSITION_STEP_MAX,nativeForwardAcceleration,nativeJumpVelocity,NATIVE_SLIDE_COEFFICIENT,NATIVE_STUMBLE_SPEED_FACTOR } from '../target/temple-run/web/src/game/nativeMotion';
import source from '../target/temple-run/analysis/native-methods/source.json';
assert.equal(NATIVE_SLIDE_COEFFICIENT,source.motion.slideSpeedCoefficient);
assert.equal(NATIVE_STUMBLE_SPEED_FACTOR,source.playerConfigDefaults.stumbleSlowDownPercent);
assert.ok(Math.abs(nativeSlideDuration(20)-.7)<1e-7);
assert.equal(nativeSlideDuration(30),.75);
assert.equal(nativeSlideDuration(0),0);
assert.ok(nativeSlideDuration(12)<nativeSlideDuration(20),'slower run has shorter slide');
assert.equal(nativeForwardAcceleration(20),6);
assert.equal(nativeForwardAcceleration(21),2,'50 percent enters second band');
assert.ok(Math.abs(nativeForwardAcceleration(27.3)-2)<1e-12,'65 percent remains in second band');
assert.ok(Math.abs(nativeForwardAcceleration(27.31)-.3)<1e-12);
assert.ok(Math.abs(nativeForwardAcceleration(36)-.1)<1e-12);
assert.equal(nativeForwardAcceleration(42),0);
assert.equal(nativeForwardAcceleration(20,42,true),0);
assert.equal(nativeForwardAcceleration(20,42,false,true),0);
assert.equal(nativeJumpVelocity(12),16);
assert.equal(nativeJumpVelocity(18),18);
assert.equal(nativeJumpVelocity(30),20);
console.log('Native slide speed scaling/cap, acceleration bands/action suppression and speed-dependent jump impulse.');

assert.equal(STUMBLE_KILL_WINDOW,source.stumbleRules.fatalWindowSeconds);
assert.equal(NATIVE_STUMBLE_RESET_AGE,source.stumbleRules.resetAge);
assert.equal(nativeStumbleIsFatal(9.999),true);
assert.equal(nativeStumbleIsFatal(10),false);
assert.equal(nativeStumbleIsFatal(NATIVE_STUMBLE_RESET_AGE+2.99),true,'reset age7 has3 seconds left in the10-second window; intro Hold gating is separate');
assert.equal(nativeStumbleIsFatal(NATIVE_STUMBLE_RESET_AGE+3),false);

assert.equal(NATIVE_INTRO_HOLD_SECONDS,source.introHold.holdSeconds);
assert.equal(nativeIntroHeld(0),true);
assert.equal(nativeIntroHeld(1),true,'native <=1 branch retains Hold');
assert.equal(nativeIntroHeld(1.00001),false);

let timer={elapsed:0,remaining:.75};
for(let i=0;i<3;i++)timer=stepNativeSlideTimer(timer.elapsed,.75,.25);
assert.equal(timer.elapsed,.75);assert.ok(timer.remaining>0,'native equality preserves IsSliding');
assert.equal(stepNativeSlideTimer(timer.elapsed,.75,.25).remaining,0);
timer={elapsed:0,remaining:.75};
for(let i=0;i<75;i++)timer=stepNativeSlideTimer(timer.elapsed,.75,.01);
assert.ok(timer.remaining>0,'native float32 cumulative .01 remains below .75 at75 steps');
assert.equal(stepNativeSlideTimer(timer.elapsed,.75,.01).remaining,0);
assert.equal(nativeSlideDuration(20),Math.fround(100*NATIVE_SLIDE_COEFFICIENT));

const {DEFS}=await import('../target/temple-run/web/src/game/obstacles/catalog');
const {collisionWouldHit}=await import('../target/temple-run/web/src/game/obstacles/collision');
const contact={prevDistance:99.9,distance:100,laneIndex:1,side:0,jumpY:0,jumpV:0,slideRemaining:0,lastJumpAt:-10,lastSlideAt:-10,now:10,jumpWindow:1,slideWindow:1};
const exactEnd=stepNativeSlideTimer(.5,.75,.25);
assert.equal(collisionWouldHit({def:DEFS.treeSlide,lane:1,distance:100},{...contact,slideRemaining:exactEnd.remaining}),false,'native equality frame still clears overhead collision');
assert.equal(collisionWouldHit({def:DEFS.treeSlide,lane:1,distance:100},{...contact,slideRemaining:stepNativeSlideTimer(exactEnd.elapsed,.75,.25).remaining}),true,'next frame expires without post-slide grace');

assert.equal(NATIVE_POSITION_STEP_MAX,source.jumpIntegration.positionStepMax);
assert.deepEqual(stepNativeJump(0,20,.025),{y:.46875,v:18.75,airborne:true});
let flight={y:0,v:20,airborne:true},peak=0,steps=0;
while(flight.airborne&&steps<100){flight=stepNativeJump(flight.y,flight.v,.025);peak=Math.max(peak,flight.y);steps++;}
assert.ok(steps>=31&&steps<=32,'native discrete flight lands near.8s');
assert.ok(Math.abs(peak-3.75)<.001,'semi-implicit .025s flight peak');
assert.deepEqual(flight,{y:0,v:0,airborne:false});
const hitch=stepNativeJump(0,20,.1);
assert.equal(hitch.v,15);assert.ok(Math.abs(hitch.y-1)<1e-6,'velocity full step, position capped at1/15');

assert.ok(Math.abs(nativeStumbleDuration(17)-.425)<1e-7);
assert.equal(nativeStumbleDuration(22),.5);
assert.equal(nativeStumbleDuration(0),0);

const {NATIVE_RESULT_DELAY,stepNativeDeathTimer}=await import('../target/temple-run/web/src/game/nativeDeath');
assert.equal(NATIVE_RESULT_DELAY,.5);
assert.deepEqual(stepNativeDeathTimer(0,.25),{elapsed:.25,finished:false});
assert.deepEqual(stepNativeDeathTimer(.25,.25),{elapsed:.5,finished:false});
assert.deepEqual(stepNativeDeathTimer(.5,.25),{elapsed:.75,finished:true});

import {nativeGroundContact} from '../target/temple-run/web/src/game/nativeDeath';
import {stepNativeVertical} from '../target/temple-run/web/src/game/nativeMotion';
assert.equal(nativeGroundContact(-1.2,false,true).dead,false);
assert.equal(nativeGroundContact(-1.2001,true,true).dead,true);
assert.deepEqual(nativeGroundContact(-.3,true,true),{dead:false,deathType:null,landed:true,stumble:false});
assert.deepEqual(nativeGroundContact(-.5,true,true),{dead:false,deathType:null,landed:true,stumble:true});
assert.equal(nativeGroundContact(-.5,true,false).stumble,false);
let falling={y:0,v:0};
for(let i=0;i<6;i++)falling=stepNativeVertical(falling.y,falling.v,.025);
assert.ok(falling.y<-.4&&falling.y>-1.2,'150ms unsupported can recover with a stumble');
assert.equal(nativeGroundContact(falling.y,true,true).stumble,true);
for(let i=0;i<4;i++)falling=stepNativeVertical(falling.y,falling.v,.025);
assert.equal(nativeGroundContact(falling.y,false,true).dead,false,'250ms unsupported fall must not be confused with ledge re-entry');
assert.equal(nativeGroundContact(falling.y,true,true).deathType,4);
assert.equal(nativeGroundContact(-7,false,true).dead,false);
assert.equal(nativeGroundContact(-7.001,false,true).deathType,1);
for(let i=0;i<12;i++)falling=stepNativeVertical(falling.y,falling.v,.025);
assert.equal(nativeGroundContact(falling.y,false,true).deathType,1,'continued fall reaches absolute water plane');
console.log('Unsupported vertical motion retains negative height, recovery and strict native death thresholds.');

import {NATIVE_REJECTED_TURN_DELAY,stepNativeStumbleDelay} from '../target/temple-run/web/src/game/nativeRunnerRules';
assert.equal(NATIVE_REJECTED_TURN_DELAY,.25);
assert.equal(stepNativeStumbleDelay(.25,.125),.125);
assert.equal(stepNativeStumbleDelay(.125,.125),0,'native delayed stumble fires at equality');
assert.ok(stepNativeStumbleDelay(.01,.025)<0,'overshoot triggers once rather than waiting another frame');

import {stepNativeForwardVelocity} from '../target/temple-run/web/src/game/nativeMotion';
assert.equal(stepNativeForwardVelocity(20,0,.025),20,'no current-frame acceleration when prior force is zero');
assert.ok(Math.abs(stepNativeForwardVelocity(20,6,.025)-20.15)<1e-6,'consume prior raw30 force in current movement');
assert.equal(stepNativeForwardVelocity(42,0,.025),42);
