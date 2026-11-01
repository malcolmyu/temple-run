import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import * as THREE from 'three';
import { OBJLoader } from 'three/addons/loaders/OBJLoader.js';
const deck=new OBJLoader().parse(readFileSync('target/temple-run/web/public/assets/track/plank-road-tile.obj','utf8'));
deck.traverse((o:any)=>{if(o.isMesh)o.material.side=THREE.DoubleSide;});
deck.updateMatrixWorld(true);
const box=new THREE.Box3().setFromObject(deck),size=box.getSize(new THREE.Vector3());
assert.ok(size.z>11.8 && size.z<12.5,'tile must join the 12m path grid');
for(const side of [-1.3,0,1.3]){
 let supported=0,total=0,gap=0,maxGap=0;
 for(let z=-5.8;z<5.8;z+=.025){
  const hits=new THREE.Raycaster(new THREE.Vector3(side,3,z),new THREE.Vector3(0,-1,0)).intersectObject(deck,true);
  const onBoard=hits.some(hit=>Math.abs(hit.point.y)<.15);
  total++;if(onBoard){supported++;gap=0;}else{gap+=.025;maxGap=Math.max(maxGap,gap);}
 }
 console.log('Lane',side,'board coverage',supported/total,'largest seam',maxGap);
 assert.ok(supported/total>.65,'plank faces must cover the lane');
}
console.log('Native plank: 12m tile and all three lane heights checked',size.toArray());
