import assert from 'node:assert/strict';
import { followCameraPose, followCameraBack, nextNativeDuckCamera, stepNativeFollowCamera } from '../target/temple-run/web/src/game/followCamera';
import { readFileSync } from 'node:fs';
const source=JSON.parse(readFileSync('target/temple-run/analysis/camera-follow-source.json','utf8'));
assert.equal(source.fieldLayoutVerification.serializedEnd,source.componentBytes);
const names=['FollowHeight','FollowDistance','FocusHeight'];
for(const [sliding,airborne,action] of [[false,false,'Run'],[false,true,'Jump'],[true,false,'Slide']] as const){
 const pose=followCameraPose(sliding,airborne);
 const values=[pose.height,pose.behind,pose.focusHeight];
 names.forEach((name,index)=>{
  const field=source.fieldLayoutVerification.fields.find((f:any)=>f.name===name+action);
  const raw=Buffer.from(field.rawHex,'hex').readFloatLE();
  assert.ok(Math.abs(values[index]-raw*.2)<1e-8,`${name+action} follows serialized original units`);
 });
}
console.log('Camera poses match native serialized action parameters, component layout ends at 304.');

for(const heading of [0,-Math.PI/2,Math.PI/2,Math.PI]){
 const anchor={x:73,z:-81,heading};const back=followCameraBack(anchor,10);
 assert.ok(Math.abs(Math.hypot(back.x-anchor.x,back.z-anchor.z)-10)<1e-8);
 const ahead={x:-Math.sin(heading),z:-Math.cos(heading)};
 assert.ok(Math.abs((back.x-anchor.x)*ahead.x+(back.z-anchor.z)*ahead.z+10)<1e-8,'camera follows actor heading on either corner arm');
}
console.log('Follow offset stays 10m behind the actor heading through left/right turns.');

assert.deepEqual(followCameraPose(false,true,2),{height:8,behind:11,focusHeight:4.5});
assert.deepEqual(followCameraPose(true,true,2),{height:1.2,behind:12,focusHeight:2.8},'native duck flag takes priority over jump');
assert.deepEqual(followCameraPose(false,false,2),{height:7,behind:10,focusHeight:4});

const native=JSON.parse(readFileSync('target/temple-run/analysis/native-methods/source.json','utf8'));
assert.equal(native.fields['CharacterPlayer.IsJumping'],'0xf8');

const overhead=[{mustSlideUnder:true,mustJumpOver:false}];
const beam=[{mustSlideUnder:true,mustJumpOver:true}];
assert.equal(nextNativeDuckCamera(false,true,false,[]),false,'sliding alone does not lower camera');
assert.equal(nextNativeDuckCamera(false,true,false,overhead),true);
assert.equal(nextNativeDuckCamera(true,true,false,[]),true,'duck flag latches during slide after leaving nearest element');
assert.equal(nextNativeDuckCamera(true,false,false,[]),false,'non-slide frame resets latch');
assert.equal(nextNativeDuckCamera(false,false,true,overhead),true);
assert.equal(nextNativeDuckCamera(false,false,true,beam),false,'dual jump/slide obstacle does not duck invincible runner automatically');
assert.equal(nextNativeDuckCamera(false,true,false,beam),true);

const {nativeEnemyFollowTarget,stepNativeEnemyFollow}=await import('../target/temple-run/web/src/game/chasePresentation');
assert.ok(Math.abs(nativeEnemyFollowTarget(7,false,false,false)-2.3)<1e-8);
assert.ok(Math.abs(nativeEnemyFollowTarget(7,true,false,false)-4.3)<1e-8);
assert.equal(nativeEnemyFollowTarget(11,false,false,false),15);
assert.equal(nativeEnemyFollowTarget(11,false,true,true),30);
assert.equal(stepNativeEnemyFollow(15,30,.05,true,true),25);
assert.equal(stepNativeEnemyFollow(30,15,.05,false,false),29);
assert.equal(stepNativeEnemyFollow(14.9,15,.05,false,false),15,'follow movement clamps without overshooting');

assert.deepEqual(stepNativeFollowCamera([0,0,0],[3,4,0],20,.1),[1.5,2,0]);
assert.deepEqual(stepNativeFollowCamera([0,0,0],[3,4,0],40,.1),[3,4,0]);
assert.deepEqual(stepNativeFollowCamera([0,0,0],[3,4,0],42,1),[3,4,0],'no overshoot');
assert.deepEqual(stepNativeFollowCamera([1,2,3],[9,8,7],0,.1),[1,2,3],'stationary actor does not move camera');
assert.deepEqual(stepNativeFollowCamera([1,2,3],[1,2,3],20,.1),[1,2,3],'coincident target is finite');
console.log('Native following uses 1.25 times 3D velocity, with a clamped Euclidean step.');

assert.deepEqual(followCameraPose(false,true,-1),{height:6.5,behind:9.5,focusHeight:3.75});
