import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { buildRunnerRig } from '../target/temple-run/web/src/runnerRig.js';
const read=(name:string)=>JSON.parse(readFileSync(`target/temple-run/web/public/assets/characters/rig-${name}.json`,'utf8'));
const enemy=read('enemy');
assert.equal(enemy.animationSource.clipPathID,129);
assert.equal(enemy.clips.run.duration,0.5666666626930237);
const rig=buildRunnerRig(enemy,{scale:.2,yOffset:0,authoredSkeleton:true});
assert.equal(rig.object.scale.y,.2);assert.equal(rig.object.position.y,0);
assert.equal(rig.object.rotation.x,0,'native Y-up animal must not be stood on its tail');
rig.object.updateMatrixWorld(true);
const joints=rig.joints();
assert.ok(joints['Bip01 Head'][1]>joints['Bip01 R Foot'][1]);
rig.setTime(.11,true);
rig.update(.2);
assert.ok(Math.abs(rig.getTime().clipTime-.31)<1e-6);
rig.update(.4);
assert.ok(rig.getTime().clipTime<.5667,'staggered run must keep looping');
let maxExtent=0;
for(let i=0;i<40;i++){
 rig.update(.01);
 const p=rig.mesh.geometry.attributes.position.array;
 assert.ok(p.every(Number.isFinite));
 rig.mesh.geometry.computeBoundingBox();
 const box=rig.mesh.geometry.boundingBox!;
 maxExtent=Math.max(maxExtent,box.max.x-box.min.x,box.max.y-box.min.y,box.max.z-box.min.z);
}
console.log('Enemy animation loops and remains finite; maximum raw extent:',maxExtent.toFixed(3));
