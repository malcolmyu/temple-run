import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { buildRunnerRig } from '../target/temple-run/web/src/runnerRig.js';
const data=JSON.parse(readFileSync('target/temple-run/web/public/assets/characters/rig-orig_02___Default.json','utf8'));
assert.equal(data.animationSource.clips.slideLoop,156);
const rig=buildRunnerRig(data);
rig.setClip('slide',true);rig.update(.3);
assert.equal(rig.getTime().clipTime,rig.clipDuration('slide'));
rig.setClip('slideLoop');rig.update(.1);
const a=Array.from(rig.mesh.geometry.attributes.position.array);
rig.update(.15);
assert.ok(rig.getTime().clipTime<rig.clipDuration('slideLoop'));
assert.ok(rig.mesh.geometry.attributes.position.array.some((v:number,i:number)=>Math.abs(v-a[i])>.0001),'slide loop must animate rather than hold the start pose');
rig.setClip('slide',true);rig.update(.05);
rig.setClip('slide',true);assert.equal(rig.getTime().clipTime,0,'repeated accepted slide must restart its start clip');
rig.update(.025);assert.ok(Math.abs(rig.getTime().clipTime-.025)<1e-9);
rig.setClip('run');assert.equal(rig.getTime().clipTime,0);
assert.deepEqual(rig.object.scale.toArray(),[.27,.27,.27]);
console.log('Slide start clamps, native slide loop animates and loops, run resumes, no squash');

const {nativeAnimationSpeed}=await import('../target/temple-run/web/src/game/nativeAnimation');
assert.equal(nativeAnimationSpeed(20),Math.fround(.65));
assert.ok(Math.abs(nativeAnimationSpeed(20,20)-Math.SQRT2*.65)<1e-7);
assert.ok(nativeAnimationSpeed(60)>1.55,'native speed has no web1.55 cap');
for(const clip of ['run','slide','slideLoop','jump']){
 rig.setClip(clip,true);rig.update(.1,.65,true);
 assert.ok(Math.abs(rig.getTime().clipTime-.065)<1e-9,`${clip} uses native state speed`);
}
rig.setClip('slide',true);rig.update(.1,.65);
assert.ok(Math.abs(rig.getTime().clipTime-.1)<1e-9,'legacy caller retains action clip speed');

assert.equal(data.animationSource.clips.stumble,143);
rig.setClip('stumble',true);rig.update(.1,.65,true);
assert.ok(Math.abs(rig.getTime().clipTime-.065)<1e-9);
rig.update(1,.65,true);assert.equal(rig.getTime().clipTime,rig.clipDuration('stumble'),'native Once stumble ends instead of looping');
