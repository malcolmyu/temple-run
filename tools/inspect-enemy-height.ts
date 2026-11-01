import {readFileSync} from 'node:fs';
import * as THREE from 'three';
import {buildRunnerRig,normalizeRigHeight} from '../target/temple-run/web/src/runnerRig.js';
const data=JSON.parse(readFileSync('target/temple-run/web/public/assets/characters/rig-enemy.json','utf8'));
for(const native of [false,true]){
const rig=buildRunnerRig(data,{scale:.2,yOffset:0,authoredSkeleton:native});
if(!native)normalizeRigHeight(rig,1.65,{autoOrient:false});
console.log({native,scale:rig.object.scale.toArray(),position:rig.object.position.toArray()});
for(const clip of ['run']){
 rig.setClip(clip,true);
 for(const t of [0,.05,.1,.15]){
  rig.setTime(t);const box=new THREE.Box3().setFromObject(rig.object,true);
  console.log(JSON.stringify({clip,t,minY:box.min.y,maxY:box.max.y}));
 }
}

}
