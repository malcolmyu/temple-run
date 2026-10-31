import assert from 'node:assert/strict';
import{readFileSync}from'node:fs';
import{startNativeCameraShake,stepNativeCameraShake}from'../target/temple-run/web/src/game/nativeCameraShake';
import{NATIVE_CAMERA_NEAR,NATIVE_CAMERA_FAR,CAMERA_FOV}from'../target/temple-run/web/src/game/config';
const native=JSON.parse(readFileSync('target/temple-run/analysis/camera-source.json','utf8')).cameras.find((c:any)=>c.pathID===3873);
assert.equal(NATIVE_CAMERA_NEAR,native.nearClip*.2);assert.equal(NATIVE_CAMERA_FAR,native.farClip*.2);assert.equal(CAMERA_FOV,native.fieldOfView);
assert.deepEqual(stepNativeCameraShake(null,.1),{state:null,offset:[0,0,0]});
const first=stepNativeCameraShake(startNativeCameraShake(1,1.5),.1);
assert.ok(first.state&&first.state.phase<0,'native phase decreases from zero');
assert.ok(Math.abs(first.state!.magnitude-(1-.1/1.5))<1e-7);
assert.ok(Math.abs(first.offset[0]-(1-.1/1.5)*Math.sin(-.1*35)*.2)<1e-7,'local X uses raw35-frequency translation at .2 scale');
assert.ok(Math.abs(first.offset[1]-(1-.1/1.5)*Math.sin(-.1*50)*.2)<1e-7,'local Y uses raw50-frequency translation');
assert.equal(first.offset[2],0);
let s=startNativeCameraShake(1,1);for(let i=0;i<7;i++){const out=stepNativeCameraShake(s,.125);assert.ok(out.state);s=out.state!;}
assert.deepEqual(stepNativeCameraShake(s,.125),{state:null,offset:[0,0,0]},'linear damper clears at zero magnitude');
console.log('Native clip planes, negative-phase local XY translation, and linear shake expiry verified.');
