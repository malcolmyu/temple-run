import assert from 'node:assert/strict';
import * as THREE from 'three';
import {buildSidePathOverlay} from '../target/temple-run/web/src/game/render';
const stone=new THREE.MeshBasicMaterial({side:THREE.DoubleSide}),water=stone.clone();
const assets={material:{stone,water,wood:stone}} as any;
const preview=new THREE.Group();buildSidePathOverlay(assets,preview,true,true,0,'stone');preview.updateMatrixWorld(true);
const ray=new THREE.Raycaster();
for(const z of [-5,0,5]){
 ray.set(new THREE.Vector3(0,4,z),new THREE.Vector3(0,-1,0));
 assert.equal(ray.intersectObject(preview,true).filter(hit=>hit.point.y>-.1&&(hit.object as THREE.Mesh).material!==water).length,0,'branch centre must not show a walkable crossbar or merge slab over a physics gap');
}
for(const x of [-1.3,1.3]){
 ray.set(new THREE.Vector3(x,4,0),new THREE.Vector3(0,-1,0));
 assert.ok(ray.intersectObject(preview,true).some(hit=>Math.abs(hit.point.y-.064)<.01),'both preview arms have floor');
}
const selected=new THREE.Group();buildSidePathOverlay(assets,selected,true,true,-1.9,'stone');
assert.ok(selected.children.every(object=>!(object instanceof THREE.Mesh)||object.material!==water),'selected road must not retain a central water overlay');
console.log('Branch surfaces: true centre opening, both arm floors and no fake crossbar/merge floor pass.');
