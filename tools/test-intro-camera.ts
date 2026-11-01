import assert from 'node:assert/strict';
import * as THREE from 'three';
import { entranceCameraPose, nativeEntranceCameraPose } from '../target/temple-run/web/src/game/introCamera';
const one=entranceCameraPose(1)!;const two=entranceCameraPose(2)!;const end=entranceCameraPose(2.999)!;
assert.ok(one.behind<0 && Math.abs(one.side)<1e-8,'one-second frame faces the entrance');
assert.ok(two.side<-5 && two.behind<-12,'two-second frame still sees runner from front-left');
assert.ok(Math.abs(end.behind-10)<.001 && Math.abs(end.side)<.001,'orbit settles to recovered follow distance');
assert.ok(Math.abs(end.height-7)<.001 && Math.abs(end.lookHeight-4)<.001,'no discontinuity with native follow target height');
assert.ok(Math.abs(end.lookAhead)<.001);
assert.equal(entranceCameraPose(3),null);
for(let t=0;t<3;t+=.01){const p=entranceCameraPose(t)!;for(const n of Object.values(p))assert.ok(Number.isFinite(n));}
console.log('Legacy challenge intro poses preserve front-facing 2s view and meet the 7/10/4 follow camera continuously.');

// Reference 004.jpg: feet near y=650/896 in the 2-second front-left view.
const camera=new THREE.PerspectiveCamera(50,414/896,.1,190);
camera.position.set(two.side,two.height,two.behind);
camera.lookAt(0,two.lookHeight,-two.lookAhead);
camera.updateMatrixWorld(true);
const foot=new THREE.Vector3(0,0,0).project(camera);
const footFraction=(1-foot.y)/2;
assert.ok(footFraction>.68 && footFraction<.8,`reference lower-frame foot position, actual ${footFraction}`);
console.log('Two-second feet project into the reference lower-frame band:',footFraction);

// Absolute camera path is invariant to actor progress; using actor-relative
// offsets here would incorrectly translate the whole opening camera with him.
const nativeStart=nativeEntranceCameraPose(0)!;
assert.deepEqual(nativeStart,{distance:20,side:-0,height:2,lookHeight:4});
assert.deepEqual(nativeEntranceCameraPose(.25),nativeStart);
assert.deepEqual(nativeEntranceCameraPose(1.5),{distance:31,side:-2,height:5.5,lookHeight:4});
assert.deepEqual(nativeEntranceCameraPose(2.75),{distance:42,side:-4,height:9,lookHeight:4});
assert.deepEqual(nativeEntranceCameraPose(2.999),nativeEntranceCameraPose(2.75));
assert.equal(nativeEntranceCameraPose(3),null);
assert.equal(nativeEntranceCameraPose(Number.NaN),null);

console.log('Classic native path: initial hold, absolute midpoint/final nodes and controller end boundary pass.');
