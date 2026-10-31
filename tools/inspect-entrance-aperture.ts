/** Probe the actual entrance triangles; no added black plane is needed. */
import * as THREE from 'three';
import {OBJLoader} from 'three/examples/jsm/loaders/OBJLoader.js';
import {readFileSync} from 'node:fs';
const obj=new OBJLoader().parse(readFileSync('target/temple-run/web/public/assets/track/temple-entrance.obj','utf8'));
obj.scale.setScalar(.2);obj.rotation.y=Math.PI;obj.position.z=7.3;obj.updateMatrixWorld(true);obj.traverse(o=>{if((o as THREE.Mesh).isMesh)(o as THREE.Mesh).material=new THREE.MeshBasicMaterial({side:THREE.DoubleSide});});
for(const y of [1,2,3,4,5]){
 const ray=new THREE.Raycaster(new THREE.Vector3(0,y,-20),new THREE.Vector3(0,0,1));
 console.log(JSON.stringify({y,hits:ray.intersectObject(obj,true).slice(0,4).map(h=>({point:h.point.toArray(),uv:h.uv?.toArray(),face:h.faceIndex}))}));
}
const camera=new THREE.PerspectiveCamera(50,414/896,.1,190);camera.position.set(0,7,-22.168323644230924);camera.lookAt(0,4,-3.168323644230924);camera.updateMatrixWorld(true);
for(const pixelY of [420,450,480,510]){
 const ray=new THREE.Raycaster();ray.setFromCamera(new THREE.Vector2(0,1-2*pixelY/896),camera);
 console.log(JSON.stringify({pixelY,hits:ray.intersectObject(obj,true).slice(0,2).map(h=>({point:h.point.toArray(),uv:h.uv?.toArray(),face:h.faceIndex}))}));
}
