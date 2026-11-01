import{REFERENCE_OPENING_OBSTACLES}from'../target/temple-run/web/src/game/referenceObstacles';
import{DEFS}from'../target/temple-run/web/src/game/obstacles/catalog';
/** Timing diagnosis only. Fitted phase/control availability are hypotheses, not gameplay constants. */
import{readFileSync,writeFileSync}from'node:fs';
import{nativeForwardAcceleration,nativeSlideDuration,NATIVE_STUMBLE_SPEED_FACTOR}from'../target/temple-run/web/src/game/nativeMotion';
import{nativeProgressDelta}from'../target/temple-run/web/src/game/nativeProgress';
const source=JSON.parse(readFileSync('target/temple-run/analysis/opening-score-timing.json','utf8'));
const observations=source.observations.filter((r:any)=>r.videoSecond>=2.7&&r.videoSecond<=9.3&&r.score!==null&&r.confidence>=.7&&r.score%20===0);
function simulate(onset:number,controlsDelay:number,slide:boolean,holdSeconds=0){
 let time=0,speed=20,distance=0,metric=0,remaining=0,stumbled=false,stumbleTime:number|null=null;
 const firstRoot=REFERENCE_OPENING_OBSTACLES[0],threshold=firstRoot.distance+DEFS.treeTrip.hitbox.z[0];
 const dt=.005,rows=[];
 for(const observation of observations){
  while(time+dt*.5<observation.videoSecond-onset){
   if(slide&&time>=4.7-onset&&remaining<=0)remaining=nativeSlideDuration(speed);
   if(time<holdSeconds){time+=dt;continue;}
   if(time>=controlsDelay)speed=Math.min(42,speed+nativeForwardAcceleration(speed,42,false,remaining>0)*dt);
   const delta=speed*dt;distance+=delta;metric+=nativeProgressDelta(0,delta,dt);
   if(!stumbled&&distance>=threshold){speed*=NATIVE_STUMBLE_SPEED_FACTOR;stumbled=true;stumbleTime=time+dt;}
   remaining=Math.max(0,remaining-dt);time+=dt;
  }
  rows.push({videoSecond:observation.videoSecond,score:observation.score,predictedScore:Math.trunc(metric)*20,metric,distance,speed});
 }
 const rmse=Math.sqrt(rows.reduce((sum,r)=>sum+(r.predictedScore-r.score)**2,0)/rows.length);
 return{onset,controlsDelay,holdSeconds,slide,rmse,stumbleVideoTime:stumbleTime===null?null:stumbleTime+onset,rows};
}
const baseline=simulate(2,0,false),repeatedSlide=simulate(2,0,true);let phaseOnly=repeatedSlide,best=repeatedSlide;
for(let o=190;o<=230;o++){
 const phase=o/100;const p=simulate(phase,0,true);if(p.rmse<phaseOnly.rmse)phaseOnly=p;
 for(let c=1;c<=100;c++){const result=simulate(phase,c/100,true);if(result.rmse<best.rmse)best=result;}
}
let nativeHold=simulate(1,0,true,1);
for(let o=50;o<=180;o++){const r=simulate(o/100,0,true,1);if(r.rmse<nativeHold.rmse)nativeHold=r;}
const result={nativeHold,source:'BV1ypuKzPErT',observations:observations.length,assumptions:['10FPS source glyph readings; original1FPS labels have different sampling phase','all motion constants from recovered native defaults','source first visual slide atvideo4.7, repeated slides inferred, not observed touch events','first stumble current authored position129 plus native region front-.2; scene placement remains estimated','comparison stops before first corner to avoid treating approximate route geometry as exact','fitted onset/control delay are nuisance hypotheses only; no production change is authorized by a numerical fit alone'],baseline,repeatedSlide,phaseOnly,best};
writeFileSync('target/temple-run/analysis/opening-timing-comparison.json',JSON.stringify(result,null,2)+'\n');
for(const[name,v]of Object.entries({baseline,repeatedSlide,phaseOnly,best,nativeHold}))console.log(name,JSON.stringify({onset:v.onset,controlsDelay:v.controlsDelay,scoreRMSE:v.rmse,stumbleVideoTime:v.stumbleVideoTime}));
