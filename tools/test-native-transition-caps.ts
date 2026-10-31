import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import * as THREE from 'three';
import {OBJLoader} from 'three/examples/jsm/loaders/OBJLoader.js';
import {attachNativeLightmapUV} from '../target/temple-run/web/src/game/nativeLightmap';
import {REFERENCE_SURFACES,nativeTransitionAt,nativeTransitionSupported,nativeGroundHeightAt} from '../target/temple-run/web/src/game/surface';
for(const [name,safeZ,openZ]of [['a',5,-5],['b',-5,5]]as const){
 const p='target/temple-run/web/public/assets/track/stone-plank-cap-'+name;
 const object=new OBJLoader().parse(readFileSync(p+'.obj','utf8'));attachNativeLightmapUV(object,JSON.parse(readFileSync(p+'.uv1.json','utf8')));object.updateMatrixWorld(true);
 const floor=(z:number)=>new THREE.Raycaster(new THREE.Vector3(0,.1,z),new THREE.Vector3(0,-1,0),0,.2).intersectObject(object,true);
 assert.ok(floor(safeZ).length);assert.equal(floor(openZ).length,0);
}
for(const section of REFERENCE_SURFACES.filter(s=>s.kind==='wood')){
 assert.equal(nativeTransitionAt(section.from-12),'a');assert.equal(nativeTransitionAt(section.to),'b');
 assert.equal(nativeTransitionSupported(section.from-9),false);assert.equal(nativeTransitionSupported(section.to-3),false);
 assert.equal(nativeGroundHeightAt(section.from-7),0);assert.equal(nativeGroundHeightAt(section.from-5),-3);
 assert.equal(nativeGroundHeightAt(section.to-1),-3);assert.equal(nativeGroundHeightAt(section.to),0);
}
console.log('Native transition caps: correct half-floor directions, source UV1, entry/exit gap support and retained ground levels');

const {CoursePlan,setActiveCourse}=await import('../target/temple-run/web/src/game/coursePlan');
const {nativeCliffTransitionAt}=await import('../target/temple-run/web/src/game/surface');
const plan=new CoursePlan(1,489);plan.surfaces.splice(0,plan.surfaces.length,{kind:'stone',level:2,from:0,to:600},{kind:'stone',level:3,from:600,to:900},{kind:'stone',level:2,from:900,to:Infinity});setActiveCourse(plan);
assert.equal(nativeCliffTransitionAt(600),'b');assert.equal(nativeCliffTransitionAt(888),'a');assert.equal(nativeCliffTransitionAt(612),null);
for(const d of [594,601,887,894])assert.equal(nativeTransitionSupported(d),true,`boundary${d}`);
for(const d of [594.001,600,600.999,887.001,890,893.999])assert.equal(nativeTransitionSupported(d),false,`gap${d}`);
for(const d of [590,605,880,897])assert.equal(nativeTransitionSupported(d),true);
assert.equal(nativeGroundHeightAt(600.999),0);assert.equal(nativeGroundHeightAt(601),3);assert.equal(nativeGroundHeightAt(893.999),3);assert.equal(nativeGroundHeightAt(894),0);
const family=JSON.parse(readFileSync('target/temple-run/analysis/native-cliff-road/family.json','utf8'));
for(const [label,sign]of [['A',1],['B',-1]]as const){
 const r=family.records.find((r:any)=>r.names.includes(`cliffToTempleCap${label}Vert_prefab`));assert.equal(r.regions[0].heightWorld,3);
 const zs=r.regions[0].pointsRaw.map((p:number[])=>-p[1]*.2);assert.ok(zs.every((z:number)=>z*sign>=1&&z*sign<=6));
 const p=`target/temple-run/web/public/assets/track/cliff-cap-${label.toLowerCase()}`;const object=new OBJLoader().parse(readFileSync(p+'.obj','utf8'));
 attachNativeLightmapUV(object,JSON.parse(readFileSync(p+'.uv1.json','utf8')));assert.ok(object.children.length);
}
plan.surfaces[0].level=1;plan.surfaces[0].kind='wood';assert.equal(nativeCliffTransitionAt(600),null,'mixed wood cliff link retains existing adapter');
setActiveCourse(null);console.log('Cliff caps:canonical half-floor orientation, first/last cell selection,7m grid gap edges and mixed-link exclusion pass');
