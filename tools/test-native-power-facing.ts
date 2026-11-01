import assert from 'node:assert/strict';
import * as THREE from 'three';
import { buildNativePower, updateNativePower } from '../target/temple-run/web/src/game/nativePower';
const near=(a:THREE.Vector3,b:THREE.Vector3)=>assert.ok(a.distanceTo(b)<1e-6,`${a.toArray()} != ${b.toArray()}`);
const group=buildNativePower('shield',new THREE.Texture());
group.position.set(4,3,-20);
const camera=new THREE.PerspectiveCamera(50,1,1,100);
camera.position.set(0,7,0);camera.lookAt(0,4,-10);camera.updateMatrixWorld();
// Native FaceCamera.Update passes camera POSITION and camera UP to Transform.LookAt.
for(let i=0;i<3;i++)updateNativePower(group,1/15,camera);group.updateMatrixWorld(true);
const towardCamera=camera.position.clone().sub(group.position).normalize();
near(group.getWorldDirection(new THREE.Vector3()),towardCamera);
assert.ok(towardCamera.distanceTo(camera.getWorldDirection(new THREE.Vector3()).negate())>.1,'off-axis fixture distinguishes position-facing from screen alignment');
const icon=group.getObjectByName('native-pickup-icon') as THREE.Mesh;
assert.ok(icon.isMesh,'authored plane follows its parent transform');
// Reflection of native +Z world into web -Z reverses billboard local X.
assert.ok(icon.scale.x<0,'preserve native horizontal handedness');
const upWeb=new THREE.Vector3(0,1,0).applyQuaternion(camera.quaternion);
const upNative=upWeb.clone();upNative.z*=-1;
const forwardNative=towardCamera.clone();forwardNative.z*=-1;
const rightNative=upNative.clone().cross(forwardNative).normalize();rightNative.z*=-1;
const rightRendered=new THREE.Vector3(1,0,0).applyQuaternion(group.quaternion).negate();
near(rightRendered,rightNative);
const sparkle=group.getObjectByName('native-pickup-sparkle') as THREE.Mesh;
assert.ok(sparkle.position.x>0,'frame3 left-heavy crop appears at reflected native horizontal position');
assert.equal(sparkle.material instanceof THREE.MeshBasicMaterial,true);
console.log('Native power points to camera position with camera up, reflected horizontal crop and unlit plane.');
