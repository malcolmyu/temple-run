import {readFileSync} from 'node:fs';
import * as THREE from 'three';
import {buildRunnerRig,normalizeRigHeight} from '../target/temple-run/web/src/runnerRig.js';
const rig=buildRunnerRig(JSON.parse(readFileSync('target/temple-run/web/public/assets/characters/rig-orig_02___Default.json','utf8')),{scale:.27,yOffset:1.32});
normalizeRigHeight(rig,1.85);
for(const clip of ['run','slideLoop','jump']){
 rig.setClip(clip,true);
 for(const t of [0,.05,.1,.15]){
  rig.setTime(t);const box=new THREE.Box3().setFromObject(rig.object,true);
  console.log(JSON.stringify({clip,t,minY:box.min.y,maxY:box.max.y}));
 }
}
