import assert from 'node:assert/strict';
import source from '../target/temple-run/analysis/native-methods/source.json';
import { nativeProgressDelta,nativeProgressScore,NATIVE_REFERENCE_STEP } from '../target/temple-run/web/src/game/nativeProgress';
assert.equal(NATIVE_REFERENCE_STEP,source.distanceFormula.referenceStep);
assert.equal(source.fields['CharacterPlayer.Score'],'0x138');
assert.equal(source.fields['CharacterPlayer.ScoreMultiplier'],'0x13c');
assert.ok(Math.abs(nativeProgressDelta(20,0,1)-25/3)<1e-6);
assert.ok(Math.abs(nativeProgressDelta(0,20,1)-nativeProgressDelta(20,0,1))<1e-9);
assert.ok(Math.abs(nativeProgressDelta(40,0,1)-4*nativeProgressDelta(20,0,1))<1e-9);
assert.equal(nativeProgressDelta(0,0,1),0);
assert.equal(nativeProgressDelta(20,0,0),0);
for(const fps of [30,60,120]){
 let metric=0,remainder=0,score=0;
 for(let i=0;i<fps*3;i++){
  const delta=nativeProgressDelta(20/fps,0,1/fps);metric+=delta;
  const next=nativeProgressScore(remainder,delta,20);remainder=next.remainder;score+=next.scoreDelta;
 }
 assert.ok(Math.abs(metric-25)<2e-6);
 assert.equal(score,500,'integer carry matches AddScore, independent of simulation step');
}
console.log('Native progress is horizontal speed squared /1200 in source units; integer carry feeds score multiplier.');
