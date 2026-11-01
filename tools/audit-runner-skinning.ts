// Independent original-bone TRS skinning audit. Does not tune production sizing.
import {readFileSync,writeFileSync} from 'node:fs';
import * as T from 'three';
import {buildRunnerRig,normalizeRigHeight} from '../target/temple-run/web/src/runnerRig.js';
const enemy=process.argv.includes('--enemy'),modelY=enemy?0:.2;
const data=JSON.parse(readFileSync(`target/temple-run/web/public/assets/characters/rig-${enemy?'enemy':'orig_02___Default'}.json`,'utf8'));
const bind=data.bindposes.map((rows:number[][])=>new T.Matrix4().set(...rows.flat() as [number,number,number,number,number,number,number,number,number,number,number,number,number,number,number,number]));
function sample(curve:any,time:number,rotation=false){
 let i=curve.times.findIndex((t:number)=>t>=time);if(i<0)i=curve.times.length-1;
 const j=Math.max(0,i-1),a=i===j?0:Math.min(1,Math.max(0,(time-curve.times[j])/(curve.times[i]-curve.times[j])));
 if(!rotation&&curve.inSlopes&&curve.outSlopes&&i!==j){
  const dt=curve.times[i]-curve.times[j],a2=a*a,a3=a2*a;
  return new T.Vector3().fromArray([0,1,2].map(k=>(2*a3-3*a2+1)*curve.values[j][k]+(a3-2*a2+a)*dt*curve.outSlopes[j][k]+(-2*a3+3*a2)*curve.values[i][k]+(a3-a2)*dt*curve.inSlopes[i][k]));
 }
 return rotation?new T.Quaternion().fromArray(curve.values[j]).slerp(new T.Quaternion().fromArray(curve.values[i]),a):new T.Vector3().fromArray(curve.values[j]).lerp(new T.Vector3().fromArray(curve.values[i]),a);
}
function nativeVertices(clip:string,time:number){
 const world:T.Matrix4[]=[];
 function solve(i:number):T.Matrix4{
  if(world[i])return world[i];const b=data.bones[i],t=data.clips[clip].tracks[b.name];
  const p=t?.position?sample(t.position,time):new T.Vector3().fromArray(b.position);
  const q=t?.rotation?sample(t.rotation,time,true):new T.Quaternion().fromArray(b.rotation);
  const local=new T.Matrix4().compose(p as T.Vector3,q as T.Quaternion,new T.Vector3().fromArray(b.scale));
  return world[i]=b.parent>=0?solve(b.parent).clone().multiply(local):local;
 }
 const matrices=data.bones.map((_:unknown,i:number)=>solve(i).clone().multiply(bind[i]));
 return data.positions.map((p:number[],i:number)=>{
  const raw=new T.Vector3(-p[0],p[1],p[2]),out=new T.Vector3();
  const total=data.boneWeights[i].reduce((a:number,b:number)=>a+b,0)||1;
  for(let k=0;k<4;k++){const w=data.boneWeights[i][k]/total;if(w)out.addScaledVector(raw.clone().applyMatrix4(matrices[data.boneIndices[i][k]]),w);}
  // Same handedness and facing conversion as production; native raw-to-world scale .2.
  return out.set(out.x*.2,out.y*.2+modelY,-out.z*.2);
 });
}
const rig=buildRunnerRig(data,{scale:.2,yOffset:modelY,authoredSkeleton:true});
const rows:any[]=[];
for(const clip of ['run','slide','slideLoop','jump','stumble']){
 if(!data.clips[clip])continue;
 for(const time of [0,.05,.1,.15]){
  rig.setClip(clip,true);rig.setTime(time);rig.object.updateMatrixWorld(true);
  const attr=rig.mesh.geometry.attributes.position;
  const current=Array.from({length:attr.count},(_,i)=>new T.Vector3().fromBufferAttribute(attr,i).applyMatrix4(rig.mesh.matrixWorld));
  const native=nativeVertices(clip,time),nativeBox=new T.Box3().setFromPoints(native),currentBox=new T.Box3().setFromPoints(current);
  // Best uniform scale and translation; remaining residual exposes shape/pose differences.
  const nc=native.reduce((a,b)=>a.add(b),new T.Vector3()).multiplyScalar(1/native.length),cc=current.reduce((a,b)=>a.add(b),new T.Vector3()).multiplyScalar(1/current.length);
  let numer=0,denom=0;for(let i=0;i<native.length;i++){const n=native[i].clone().sub(nc),c=current[i].clone().sub(cc);numer+=n.dot(c);denom+=c.lengthSq();}
  const scale=numer/denom,offset=nc.clone().addScaledVector(cc,-scale);
  const absoluteRms=Math.sqrt(native.reduce((s,v,i)=>s+v.distanceToSquared(current[i]),0)/native.length);
  if(absoluteRms>1e-5)throw new Error(`Native actor transform mismatch ${clip} ${time}: ${absoluteRms}`);
  const rms=Math.sqrt(native.reduce((s,v,i)=>s+v.distanceToSquared(current[i].clone().multiplyScalar(scale).add(offset)),0)/native.length);
  rows.push({clip,time,nativeMin:nativeBox.min.toArray(),nativeMax:nativeBox.max.toArray(),currentMin:currentBox.min.toArray(),currentMax:currentBox.max.toArray(),bestScale:scale,bestOffset:offset.toArray(),shapeRms:rms,absoluteRms});
 }
}
const result={model:enemy?'enemy':'default',modelY,method:'Original serialized local bone TRS, absolute animation curves, boneWorld * bindPose * vertex; world scale .2 plus modelY as recorded. Position uses independently evaluated serialized Hermite derivatives; rotation slerp is shared, not an independent Unity interpolation oracle.',currentHolder:{scale:rig.object.scale.toArray(),position:rig.object.position.toArray()},rows};
writeFileSync(`target/temple-run/analysis/${enemy?'enemy':'runner'}-skinning-audit.json`,JSON.stringify(result,null,2)+'\n');console.log(JSON.stringify({samples:rows.length,maxAbsoluteRms:Math.max(...rows.map(r=>r.absoluteRms)),maxShapeRms:Math.max(...rows.map(r=>r.shapeRms)),scaleRange:[Math.min(...rows.map(r=>r.bestScale)),Math.max(...rows.map(r=>r.bestScale))],offsetYRange:[Math.min(...rows.map(r=>r.bestOffset[1])),Math.max(...rows.map(r=>r.bestOffset[1]))]}));
