import * as THREE from 'three';
import {OBJLoader} from 'three/examples/jsm/loaders/OBJLoader.js';
import {readFileSync,writeFileSync} from 'node:fs';
const rows=[];
const obj=new OBJLoader().parse(readFileSync('target/temple-run/web/public/assets/track/temple-entrance.obj','utf8'));obj.position.z=3;obj.updateMatrixWorld(true);obj.traverse(o=>{if((o as THREE.Mesh).isMesh)(o as THREE.Mesh).material=new THREE.MeshBasicMaterial({side:THREE.DoubleSide});});
for(const d of [-12,-6,-2,0,2,4,6,8,12]){let ray=new THREE.Raycaster(new THREE.Vector3(0,.1,3-d),new THREE.Vector3(0,-1,0),0,2);rows.push({distance:d,hits:ray.intersectObject(obj,true).slice(0,2).map(h=>h.point.toArray())});}

writeFileSync('target/temple-run/analysis/entrance-floor-ray-check.json',JSON.stringify({originZ:3,rayStartY:.1,rayDepth:2,rows,scope:'centreline geometry only; entrance mesh alone has no continuous floor, so removing all base road is unsupported'},null,2)+'\n');console.log(rows);
