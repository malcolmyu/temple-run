import assert from 'node:assert/strict';
import * as THREE from 'three';
import { makeSafetyNet, safetyNetIntensity, setSafetyNetIntensity } from '../target/temple-run/web/src/game/safetyNet';
assert.equal(safetyNetIntensity(.3,2.5001,.1),1);
assert.equal(safetyNetIntensity(1,2.5,.125),.75);
assert.equal(safetyNetIntensity(.25,1,.125),1); // native <=0 wraps, rather than clamping
assert.equal(safetyNetIntensity(.2,0,.1),1);
assert.equal(safetyNetIntensity(.75,1,0),.75);
const net=makeSafetyNet(new THREE.Texture());const clone=net.clone();
setSafetyNetIntensity(net,.5);
assert.equal((clone.material as THREE.MeshBasicMaterial).opacity,.5);
assert.equal((clone.material as THREE.MeshBasicMaterial).color.r,.5);
assert.equal(net.geometry.parameters.width,4);assert.equal(net.geometry.parameters.height,12);
console.log('Native Safety Net: 2.5s threshold, float32 decay, <=0 wrap, shared RGBA and dimensions pass');
