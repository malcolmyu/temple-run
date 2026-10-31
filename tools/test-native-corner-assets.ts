import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import * as THREE from 'three';
import {OBJLoader} from 'three/examples/jsm/loaders/OBJLoader.js';
for(const [name,sign]of [['a',-1],['b',1]]as const){
 const path=`target/temple-run/analysis/native-corners/turn-${name}`;
 const obj=new OBJLoader().parse(readFileSync(path+'.obj','utf8'));obj.updateMatrixWorld(true);
 const uv=JSON.parse(readFileSync(path+'.uv1.json','utf8'));let count=0;
 obj.traverse(o=>{if((o as THREE.Mesh).isMesh)count+=(o as THREE.Mesh).geometry.getAttribute('position').count;});
 assert.equal(uv.length,count*2);
 const ground=(x:number,z:number)=>new THREE.Raycaster(new THREE.Vector3(x,.1,z),new THREE.Vector3(0,-1,0),0,.2).intersectObject(obj,true);
 for(const[x,z]of [[0,0],[0,5.5],[sign*5.5,0],[1.9,3],[-1.9,3],[sign*3,1.9],[sign*3,-1.9]])assert.ok(ground(x,z).length,`${name} must pave ${x},${z}`);
 assert.equal(ground(sign*5,5).length,0,'inside of bend remains open');
 assert.equal(ground(-sign*5,0).length,0,'opposite outgoing arm is absent');
}
console.log('Authored corner A/B: full4m arms reach5.5m, open inner turn, no opposite exit, UV1 matches face stream');
