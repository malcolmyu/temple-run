import assert from 'node:assert/strict';
import * as THREE from 'three';
import {makeSafetyNet,setSafetyNetFrame,SAFETY_NET_FRAMES} from '../target/temple-run/web/src/game/safetyNet';
const atlas=new THREE.Texture(),net=makeSafetyNet(atlas),map=(net.material as THREE.MeshBasicMaterial).map!;
assert.notEqual(map,atlas);assert.deepEqual(atlas.repeat.toArray(),[1,1]);
assert.equal(net.visible,false);assert.deepEqual((net.geometry as THREE.PlaneGeometry).parameters,{width:4,height:12,widthSegments:1,heightSegments:1});
const seen=new Set();for(let i=0;i<5;i++){setSafetyNetFrame(net,(i+.1)/15);seen.add(map.offset.toArray().join(','));}
assert.equal(seen.size,5);setSafetyNetFrame(net,5/15);assert.equal(map.offset.x,SAFETY_NET_FRAMES[0][0]/1024);
assert.equal((net.material as THREE.MeshBasicMaterial).depthWrite,false);
console.log('Native safety net: 5 distinct frames, 15 FPS loop, 4x12 coverage, shared atlas unchanged');
