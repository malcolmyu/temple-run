import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import * as THREE from 'three';
import {OBJLoader} from 'three/examples/jsm/loaders/OBJLoader.js';
const object=new OBJLoader().parse(readFileSync('target/temple-run/web/public/assets/track/temple-road-tile.obj','utf8'));
object.updateMatrixWorld(true);
let horizontal=0;
object.traverse(node=>{
 if(!(node as THREE.Mesh).isMesh)return;
 const mesh=node as THREE.Mesh;const p=mesh.geometry.getAttribute('position');const n=mesh.geometry.getAttribute('normal');
 for(let i=0;i<n.count;i++)assert.ok(Number.isFinite(n.getX(i))&&Number.isFinite(n.getY(i))&&Number.isFinite(n.getZ(i)));
 const a=new THREE.Vector3(),b=new THREE.Vector3(),c=new THREE.Vector3();
 for(let i=0;i<p.count;i+=3){a.fromBufferAttribute(p,i);b.fromBufferAttribute(p,i+1);c.fromBufferAttribute(p,i+2);
  if(Math.max(a.y,b.y,c.y)-Math.min(a.y,b.y,c.y)>.01)continue;
  const normal=b.clone().sub(a).cross(c.clone().sub(a));if(normal.length()<1e-8)continue;
  assert.ok(normal.y>0,'native horizontal faces must point upward');horizontal++;
 }
});
assert.equal(horizontal,87);
for(const x of [-1.95,0,1.95]){
 const down=new THREE.Raycaster(new THREE.Vector3(x,.1,0),new THREE.Vector3(0,-1,0),0,.2).intersectObject(object,true);
 assert.ok(down.length>0);assert.ok(Math.abs(down[0].point.y)<.01,'authored floor needs no1.36m lift');
}
assert.equal(new THREE.Raycaster(new THREE.Vector3(0,-.1,0),new THREE.Vector3(0,1,0),0,.2).intersectObject(object,true).length,0,'front-face floor is not visible from below');
console.log('Native straight:87 upward horizontal faces, finite computed normals,4m floor and zero extra height pass');
