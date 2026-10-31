import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import * as THREE from 'three';
import {OBJLoader} from 'three/addons/loaders/OBJLoader.js';
import {extractNativeGate} from '../target/temple-run/web/src/game/nativeGate';
import {attachNativeLightmapUV} from '../target/temple-run/web/src/game/nativeLightmap';
const base='target/temple-run/web/public/assets/track/track-gate-a';
const source=new OBJLoader().parse(readFileSync(base+'.obj','utf8'));
attachNativeLightmapUV(source,JSON.parse(readFileSync(base+'.uv1.json','utf8')));
source.traverse((o:any)=>{if(o.isMesh)o.material.side=THREE.DoubleSide;});
const gate=extractNativeGate(source)!;gate.updateMatrixWorld(true);
const box=new THREE.Box3().setFromObject(gate),size=box.getSize(new THREE.Vector3());
console.log('Native portal bounds',box.min.toArray(),box.max.toArray());
assert.ok(size.x>6 && size.x<7.5 && size.z<3,'portal spans the road rather than duplicating a 12m tile');
assert.ok(box.max.y>5&&box.max.y<6.5);
for(const x of [-1.3,0,1.3]){const hits=new THREE.Raycaster(new THREE.Vector3(x,1,-4),new THREE.Vector3(0,0,1),0,8).intersectObject(gate,true);if(x===0)assert.equal(hits.length,0,'centre passage stays open');else assert.ok(hits.length>0,'authored side pillars are retained');}
gate.traverse((o:any)=>{if(o.isMesh)assert.equal(o.geometry.attributes.uv1.count,o.geometry.attributes.position.count);});
console.log('Native portal preserves UV1, excludes road slab and keeps the centre passage and original side pillars.');
const towerBase='target/temple-run/web/public/assets/obstacles/tower-arch';
const towerSource=new OBJLoader().parse(readFileSync(towerBase+'.obj','utf8'));
attachNativeLightmapUV(towerSource,JSON.parse(readFileSync(towerBase+'.uv1.json','utf8')));
towerSource.traverse((o:any)=>{if(o.isMesh)o.material.side=THREE.DoubleSide;});
const tower=extractNativeGate(towerSource,'tower')!;tower.updateMatrixWorld(true);
const towerBox=new THREE.Box3().setFromObject(tower);
assert.ok(towerBox.min.y<.2,'tower bases reach the original road plane');
assert.ok(towerBox.max.y>20,'first gate uses the high original tower, not a stretched low portal');
for(const x of [-2.3,2.3])for(const y of [.2,.8,1.5,2.2]) {
 assert.ok(new THREE.Raycaster(new THREE.Vector3(x,y,-8),new THREE.Vector3(0,0,1),0,16).intersectObject(tower,true).length>0,
  `native lower pillar support must survive at x${x},y${y}`);
}
assert.equal(new THREE.Raycaster(new THREE.Vector3(0,1,-8),new THREE.Vector3(0,0,1),0,16).intersectObject(tower,true).length,0);
tower.traverse((o:any)=>{if(o.isMesh)assert.equal(o.geometry.attributes.uv1.count,o.geometry.attributes.position.count);});
console.log('Original tower portal preserves carved panels, UV1 and centre passage.',towerBox.min.toArray(),towerBox.max.toArray());

assert.ok(Math.abs(towerBox.max.y-27.444518)<.002,'native.2 world scale, not legacy.18 shrink');
assert.ok(Math.abs(towerBox.min.x+6.713951)<.002&&Math.abs(towerBox.max.x-6.601492)<.002,'native authored TRS horizontal handedness');
