import assert from 'node:assert/strict';
import {nativeProgressDelta,nativeProgressScore} from '../target/temple-run/web/src/game/nativeProgress';
// Raw origin -> Z=-10 at world scale .2, counted on release without actor movement.
for(const [fps,score] of [[60,100],[30,40],[120,200]]) {
 const delta=nativeProgressDelta(0,2,1/fps);
 assert.equal(nativeProgressScore(0,delta,20).scoreDelta,score);
}
assert.equal(nativeProgressScore(0,nativeProgressDelta(0,0,1/60),20).scoreDelta,0);
console.log('Native 2m spawn displacement: frame-dependent score100 at60FPS,40 at30FPS,200 at120FPS; no fixed bonus');
