import assert from 'node:assert/strict';
import { TiltSteering } from '../target/temple-run/web/src/game/steering';
import { collisionWouldHit } from '../target/temple-run/web/src/game/obstacles/collision';
import { DEFS } from '../target/temple-run/web/src/game/obstacles/catalog';

const tilt = new TiltSteering();
assert.equal(tilt.axis, null);
assert.equal(tilt.sample(15), 0, 'calibrate to the actual grip rather than world zero');
assert.equal(tilt.sample(16), 0, 'small sensor jitter must not move the runner');
assert.equal(tilt.sample(27), .5, 'half tilt gives a position between lanes');
assert.equal(tilt.sample(60), 1, 'clamp at the bridge edge');
assert.equal(tilt.sample(-30), -1);
assert.equal(tilt.sample(null), -1, 'missing sensor readings retain the last valid position');
assert.equal(tilt.sample(NaN), -1);
tilt.reset();
assert.equal(tilt.axis, null);
assert.equal(tilt.sample(-20), 0, 'reenabling calibrates again');

const state = { prevDistance: 9, distance: 10, laneIndex: 1, jumpY: 0, jumpV: 0,
  slideRemaining: 0, lastJumpAt: -10, lastSlideAt: -10, now: 10, jumpWindow: .5, slideWindow: .5 };
const obstacle = { def: DEFS.stonePedestal, lane: 2, distance: 10 };
assert.equal(collisionWouldHit(obstacle, {...state, side: .5}), true, 'body overlaps a side blocker before its centre changes lanes');
assert.equal(collisionWouldHit(obstacle, {...state, side: .2}), false, 'centre of bridge clears the side blocker');
assert.equal(collisionWouldHit(obstacle, {...state, laneIndex: 2, side: .2}), false, 'actual position wins over the target lane while moving');
assert.equal(collisionWouldHit(obstacle, {...state, laneIndex: 2}), true, 'old lane-only callers remain supported');
assert.equal(collisionWouldHit({def: DEFS.flameTower, lane: 1, distance: 10}, {...state, side: 0}), true);
assert.equal(collisionWouldHit({def: DEFS.flameTower, lane: 1, distance: 10}, {...state, side: -.55}), true);
console.log('Steering OK: grip calibration, dead zone, continuous position, invalid samples, physical side collisions');

// Sensor events must never enter the swipe action queue, even after sustained tilt.
const listeners = new Map<string, (event: { gamma: number | null }) => void>();
Object.assign(globalThis, { DeviceOrientationEvent: class {}, window: {
  addEventListener: (name: string, handler: (event: {gamma: number | null}) => void) => listeners.set(name, handler),
}});
const { Input } = await import('../target/temple-run/web/src/game/input');
const input = new Input();
assert.equal(await input.enableTilt(), true);
listeners.get('deviceorientation')!({gamma: 10});
for (let i = 0; i < 20; i++) listeners.get('deviceorientation')!({gamma: 22});
assert.equal(input.steeringAxis, .5);
assert.deepEqual(input.drain(), [], 'holding the phone tilted must not queue turns');
input.disableTilt();
assert.equal(input.steeringAxis, null);
console.log('Input OK: sustained tilt produces no swipe or turn commands');

const {nativeTiltOffset,filterNativeAcceleration,stepNativeSteering,NATIVE_TILT_OFFSET_MAX}=await import('../target/temple-run/web/src/game/steering');
assert.equal(NATIVE_TILT_OFFSET_MAX,1.4);
assert.equal(nativeTiltOffset(.2),-1.4);
assert.equal(nativeTiltOffset(-.2),1.4);
assert.ok(Math.abs(nativeTiltOffset(.05)+.70875)<1e-10);
assert.ok(Math.abs(filterNativeAcceleration(0,.6)-.1)<1e-7);
assert.ok(Math.abs(stepNativeSteering(0,1.4,.02)-.1575)<1e-7);
assert.ok(Math.abs(stepNativeSteering(1.4,0,.02)-1.2425)<1e-7);
assert.equal(stepNativeSteering(0,0,.02),0);
assert.equal(stepNativeSteering(0,1.4,.5),stepNativeSteering(0,1.4,1/15),'native movement timestep cap');
console.log('Native tilt target gain/range/filter and default-sensitivity position response verified.');

const {nativeTiltAllowed}=await import('../target/temple-run/web/src/game/steering');
assert.equal(nativeTiltAllowed(1.5),false);assert.equal(nativeTiltAllowed(3),false);assert.equal(nativeTiltAllowed(3.00001),true);
