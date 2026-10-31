import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import * as THREE from 'three';
import {OBJLoader} from 'three/examples/jsm/loaders/OBJLoader.js';
import {attachNativeLightmapUV} from '../target/temple-run/web/src/game/nativeLightmap';
import {REFERENCE_SURFACES,nativeTransitionAt,nativeTransitionSupported,nativeGroundHeightAt} from '../target/temple-run/web/src/game/surface';
for(const [name,safeZ,openZ]of [['a',5,-5],['b',-5,5]]as const){
 const p='target/temple-run/web/public/assets/track/stone-plank-cap-'+name;
 const object=new OBJLoader().parse(readFileSync(p+'.obj','utf8'));attachNativeLightmapUV(object,JSON.parse(readFileSync(p+'.uv1.json','utf8')));object.updateMatrixWorld(true);
 const floor=(z:number)=>new THREE.Raycaster(new THREE.Vector3(0,.1,z),new THREE.Vector3(0,-1,0),0,.2).intersectObject(object,true);
 assert.ok(floor(safeZ).length);assert.equal(floor(openZ).length,0);
}
for(const section of REFERENCE_SURFACES.filter(s=>s.kind==='wood')){
 assert.equal(nativeTransitionAt(section.from-12),'a');assert.equal(nativeTransitionAt(section.to),'b');
 assert.equal(nativeTransitionSupported(section.from-9),false);assert.equal(nativeTransitionSupported(section.to-3),false);
 assert.equal(nativeGroundHeightAt(section.from-7),0);assert.equal(nativeGroundHeightAt(section.from-5),-3);
 assert.equal(nativeGroundHeightAt(section.to-1),-3);assert.equal(nativeGroundHeightAt(section.to),0);
}
console.log('Native transition caps: correct half-floor directions, source UV1, entry/exit gap support and retained ground levels');
