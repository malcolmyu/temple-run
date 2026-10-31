import assert from 'node:assert/strict';
import {readFileSync,writeFileSync} from 'node:fs';
import {sampleCurveComponent} from '../target/temple-run/web/src/nativeAnimationCurve.js';
// A cubic x(t)=t^3 on a non-unit interval verifies derivative units and signs.
const c={times:[1,3],values:[[1],[27]],outSlopes:[[3],[27]],inSlopes:[[3],[27]]};
for(const t of [1,1.25,1.5,2,2.75,3])assert.ok(Math.abs(sampleCurveComponent(c,0,1,(t-1)/2,0)-t**3)<1e-10);
assert.equal(sampleCurveComponent({times:[0,1],values:[[2],[8]]},0,1,.25,0),3.5);
assert.equal(sampleCurveComponent({times:[0,1],values:[[2],[8]],outSlopes:[[Infinity],[0]],inSlopes:[[0],[Infinity]]},0,1,.5,0),2);
const d=JSON.parse(readFileSync('target/temple-run/web/public/assets/characters/rig-orig_02___Default.json','utf8'));
const rows:any[]=[];
const used=new Set<number>();
for(let v=0;v<d.positions.length;v++)for(let k=0;k<4;k++)if(d.boneWeights[v][k]>0){let i=d.boneIndices[v][k];while(i>=0&&!used.has(i)){used.add(i);i=d.bones[i].parent;}}
const skinnedBones=new Set([...used].map(i=>d.bones[i].name));
for(const [name,clip] of Object.entries(d.clips) as any){
 let maxRawDifference=0,bone='',axis=0,time=0,segments=0;
 for(const [boneName,track] of Object.entries(clip.tracks) as any){
  const curve=track.position;if(!curve||!skinnedBones.has(boneName))continue;
  assert.equal(curve.inSlopes.length,curve.times.length);assert.equal(curve.outSlopes.length,curve.times.length);
  for(let i=1;i<curve.times.length;i++)for(let k=0;k<3;k++){
   assert.equal(sampleCurveComponent(curve,i-1,i,0,k),curve.values[i-1][k]);
   assert.equal(sampleCurveComponent(curve,i-1,i,1,k),curve.values[i][k]);segments++;
   for(const u of [.25,.5,.75]){
    const raw=sampleCurveComponent(curve,i-1,i,u,k),linear=curve.values[i-1][k]*(1-u)+curve.values[i][k]*u;
    if(Math.abs(raw-linear)>maxRawDifference){maxRawDifference=Math.abs(raw-linear);bone=boneName;axis=k;time=curve.times[i-1]+u*(curve.times[i]-curve.times[i-1]);}
   }
  }
 }
 rows.push({clip:name,segments,maxRawDifference,maxWorldDifference:maxRawDifference*.2,bone,axis,time});
}
writeFileSync('target/temple-run/analysis/native-position-curve-check.json',JSON.stringify({checks:'Analytic cubic, legacy linear fallback, stepped tangent, all source position key endpoints, interior linear-vs-Hermite differences',rows},null,2)+'\n');
console.log(JSON.stringify(rows));
