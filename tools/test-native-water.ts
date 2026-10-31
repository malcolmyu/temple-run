import assert from 'node:assert/strict';
import * as THREE from 'three';
import { nativeWaterGeometry,NATIVE_WATER_HEIGHT,nativeWaterAnchor } from '../target/temple-run/web/src/game/nativeWater';
import source from '../target/temple-run/analysis/native-water-plane-source.json';
import plane from '../target/temple-run/web/src/game/nativeWaterPlane.json';
const g=nativeWaterGeometry();
for(const [position,anchor] of [[0,0],[39.99,0],[40,40],[79.99,40],[80,80],[-.01,0],[-39.99,0],[-40,-40],[-79.99,-40],[-80,-80]]) {
 assert.equal(nativeWaterAnchor(position),anchor,`native water grid at ${position}`);
}
assert.equal(g.getAttribute('position').count,source.vertexCount);
assert.equal(g.index!.count,source.indexCount);
assert.equal(NATIVE_WATER_HEIGHT,-6.1);
assert.equal(g.boundingBox!.min.x,-200);
assert.equal(g.boundingBox!.max.z,200);
assert.deepEqual(Array.from(g.getAttribute('uv').array),plane.uv.flat().map(Math.fround),'source UV0 must survive without a world-space replacement');
const mesh=new THREE.Mesh(g,new THREE.MeshBasicMaterial());mesh.position.y=NATIVE_WATER_HEIGHT;mesh.updateMatrixWorld(true);
const hit=new THREE.Raycaster(new THREE.Vector3(0,0,0),new THREE.Vector3(0,-1,0)).intersectObject(mesh);
assert.ok(hit.length>0,'reflected winding retains the upward-facing water surface');
assert.ok(Math.abs(hit[0].point.y+6.1)<1e-5);
console.log('Original 121-vertex water plane, 600 indices, native UV0, upward winding and -6.1m scene height.');
