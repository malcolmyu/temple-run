import { readFileSync,writeFileSync } from 'node:fs';
import * as THREE from 'three';
import { OBJLoader } from 'three/addons/loaders/OBJLoader.js';
const output:any={note:'Authored cap heights after the same export frame as the native plank; not integrated into the flat gameplay path.',profiles:{}};
for(const name of ['a','b']){
 const mesh=new OBJLoader().parse(readFileSync(`target/temple-run/analysis/transition-caps/stone-plank-cap-${name}.obj`,'utf8'));
 mesh.traverse((o:any)=>{if(o.isMesh)o.material.side=THREE.DoubleSide});mesh.updateMatrixWorld(true);
 const profile=[];
 for(let z=-5.5;z<=5.5;z+=.5){
  const hits=new THREE.Raycaster(new THREE.Vector3(0,12,z),new THREE.Vector3(0,-1,0)).intersectObject(mesh,true);
  profile.push({z,topY:hits[0]?.point.y??null});
 }
 output.profiles[name]=profile;
}
writeFileSync('target/temple-run/analysis/cap-height-profiles.json',JSON.stringify(output,null,2)+'\n');console.log(JSON.stringify(output));
