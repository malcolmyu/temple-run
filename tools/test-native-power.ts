import{referenceJunctionDistance as J,referenceWorldDistance as W}from'../target/temple-run/web/src/game/referenceCoordinates';
import{REFERENCE_SHIELD_DURATION}from'../target/temple-run/web/src/game/referencePickups';
import{nativeInvincibilityDuration,nativeVacuumDuration}from'../target/temple-run/web/src/game/nativeCoinBonus';
import assert from 'node:assert/strict';
import * as THREE from 'three';
import { buildNativePower, updateNativePower } from '../target/temple-run/web/src/game/nativePower';
import frames from '../target/temple-run/web/src/game/nativePickupFrames.json';
import { referencePickupsForTurn } from '../target/temple-run/web/src/game/referencePickups';
for(const kind of ['magnet','shield','boost','bonus'] as const){
 const group=buildNativePower(kind,new THREE.Texture());
 const icon=group.getObjectByName('native-pickup-icon') as THREE.Sprite;
 assert.ok(icon.isSprite,'original FaceCamera sprites always face the camera');
 assert.deepEqual(icon.scale.toArray(),[...frames.iconSizes[kind],1]);
 assert.equal(icon.material.toneMapped,false);
 assert.equal(icon.material.premultipliedAlpha,true,'matches native premultiplied-alpha shader');
 assert.equal(icon.material.depthWrite,false);
 const [x,y,w,h]=frames.icons[kind];
 assert.deepEqual(icon.material.map!.repeat.toArray(),[w/1024,h/1024]);
 assert.deepEqual(icon.material.map!.offset.toArray(),[x/1024,1-(y+h)/1024]);
 const sparkle=group.getObjectByName('native-pickup-sparkle') as THREE.Sprite;
 updateNativePower(group,1/15+.0001);
 assert.equal(sparkle.material.map!.offset.x,frames.sparkles[1][0]/1024);
 updateNativePower(group,11/15+.0001);
 assert.equal(sparkle.material.map!.offset.x,frames.sparkles[0][0]/1024);
}
assert.deepEqual(referencePickupsForTurn(3,J(285)),[{kind:'bonus',lane:0,distance:W(329),height:3}]);
assert.deepEqual(referencePickupsForTurn(3,1000),[]);
assert.deepEqual(referencePickupsForTurn(0,J(81)),[]);
console.log('Four native pickup icons, original 15 FPS sparkle loop, camera-facing unlit alpha materials and observed fourth-turn bonus.');

assert.equal(frames.iconSizes.shield[0],3.08,'invincibility prefab has a 154px icon child, not160');

assert.deepEqual(referencePickupsForTurn(24,J(1585)),[{kind:'shield',lane:1,distance:W(1637),height:3}]);
assert.deepEqual(Array.from({length:7},(_,i)=>nativeInvincibilityDuration(i)),[15,15,17.5,20,22.5,25,25]);
assert.deepEqual(Array.from({length:7},(_,i)=>nativeVacuumDuration(i)),[15,15,20,20,25,25,25]);
assert.equal(REFERENCE_SHIELD_DURATION,25);
