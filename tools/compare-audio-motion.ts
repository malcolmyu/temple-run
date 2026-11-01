/** Diagnostic inverse-motion comparison using observed sound events, never a gameplay script.
 * Unknown slide cadence/clock phase are hypotheses. No route/score constants are changed.
 */
import{readFileSync,writeFileSync}from'node:fs';
import{nativeForwardAcceleration,nativeJumpVelocity,nativeSlideDuration,stepNativeSlideTimer,stepNativeJump,NATIVE_STUMBLE_SPEED_FACTOR,stepNativeForwardVelocity}from'../target/temple-run/web/src/game/nativeMotion';
import{nativeStumbleDuration,nativeIntroHeld}from'../target/temple-run/web/src/game/nativeRunnerRules';
const audio=JSON.parse(readFileSync('target/temple-run/analysis/reference-audio-events.json','utf8'));
const observations=JSON.parse(readFileSync('target/temple-run/analysis/reference-score-observations.json','utf8')).observations.filter((r:any)=>r.score!==null&&r.score%20===0&&r.confidence>=.8);
type Options={onset:number;latency:number;slideGap:number|null;stumbles:boolean;observationPhase:number;integration?:'immediate'|'queued';timestep?:number};
function simulate(options:Options,keepRows=true){
 const {onset,latency,slideGap,stumbles,observationPhase}=options;
 const events=audio.events.filter((e:any)=>['jump','pickup',...(stumbles?['stumble']:[])].includes(e.kind)&&e.audioSecond>2&&e.audioSecond<263).map((e:any)=>({...e,at:e.audioSecond-latency}));
 const death=audio.events.find((e:any)=>e.kind==='splash').audioSecond-latency;
 let queuedForce=0;let index=0,time=0,speed=20,distance=0,progress=0,awards=0,jump={y:0,v:0,airborne:false},slide={elapsed:0,remaining:0,duration:0},nextSlide=0,stumble=0,acceptedJumps=0;
 const rejectedJumps:number[]=[],rows:any[]=[];const dt=options.timestep??.005;
 for(const observation of observations){
  const until=Math.min(death,observation.second+observationPhase);
  while(time+dt*.5<until){
   while(index<events.length&&events[index].at<=time+dt*.5){
    const e=events[index++];
    if(e.kind==='jump'){
     if(!jump.airborne&&stumble<=0){jump={y:0,v:nativeJumpVelocity(speed),airborne:true};slide.remaining=0;acceptedJumps++;}
     else rejectedJumps.push(e.audioSecond);
    }else if(e.kind==='stumble'){speed*=NATIVE_STUMBLE_SPEED_FACTOR;jump.v*=NATIVE_STUMBLE_SPEED_FACTOR;stumble=nativeStumbleDuration(speed);}
    else awards+=500;
   }
   if(time>=onset&&!nativeIntroHeld(time-onset)){
    if(slideGap!==null&&time>=4.7&&time>=nextSlide&&!jump.airborne&&slide.remaining<=0){slide={elapsed:0,duration:nativeSlideDuration(speed),remaining:nativeSlideDuration(speed)};}
    speed=options.integration==='queued'?stepNativeForwardVelocity(speed,queuedForce,dt):Math.min(42,speed+nativeForwardAcceleration(speed,42,jump.airborne,slide.remaining>0)*dt);
    distance+=speed*dt;progress+=speed*speed/48*dt;
    if(jump.airborne)jump=stepNativeJump(jump.y,jump.v,dt);
    if(slide.remaining>0){Object.assign(slide,stepNativeSlideTimer(slide.elapsed,slide.duration,dt));if(slide.remaining===0)nextSlide=time+dt+(slideGap??0);}
    stumble=Math.max(0,stumble-dt);
    if(options.integration==='queued')queuedForce=nativeForwardAcceleration(speed,42,jump.airborne,slide.remaining>0);
   }
   time+=dt;
  }
  const score=Math.trunc(progress)*20+awards;
  rows.push({videoSecond:observation.second,observedScore:observation.score,predictedScore:score,residual:score-observation.score,speed,distance,progress});
 }
 const rmse=Math.sqrt(rows.reduce((n,r)=>n+r.residual*r.residual,0)/rows.length);
 return{options,rmsePoints:rmse,acceptedJumps,rejectedJumps,final:rows.at(-1),...(keepRows?{rows}:{})};
}
const scenarios=[{label:'known jumps only',slideGap:null,stumbles:false},{label:'known jumps and stumbles',slideGap:null,stumbles:true},...[0,.01,.025,.05,.1,.2].map(slideGap=>({label:`unobserved slide gap ${slideGap}`,slideGap,stumbles:true}))].map(v=>({label:v.label,...simulate({onset:.9,latency:.22,observationPhase:-.1,slideGap:v.slideGap,stumbles:v.stumbles})}));
let best:any=null;
for(const onset of [.7,.8,.9,1,1.1,1.2,1.3,1.4])for(const latency of [.18,.22,.26])for(let gap=0;gap<=.201;gap+=.01){
 const r=simulate({onset,latency,observationPhase:-.1,slideGap:+gap.toFixed(2),stumbles:true},false);
 if(!best||r.rmsePoints<best.rmsePoints)best=r;
}
best=simulate(best.options);
const queuedScenarios=[1/120,1/60,1/30].map(timestep=>simulate({onset:.9,latency:.22,observationPhase:-.1,slideGap:0,stumbles:true,integration:'queued',timestep}));
const result={queuedScenarios,source:'BV1ypuKzPErT',status:'diagnostic only; no production tuning',assumptions:['native constructor motion defaults; straight flat road','audio event kinds are observed, touch timestamps are not','audio latency/onset and repeated-slide gap are nuisance hypotheses','no lateral motion/turn metric loss/unsupported ground/power motion','score pickups add verified500 each; no coins','simulation stops at observed splash minus assumed AV latency','one-second score labels phase−.1 is approximate'],scenarios,best};
writeFileSync('target/temple-run/analysis/audio-motion-comparison.json',JSON.stringify(result,null,2)+'\n');
for(const s of scenarios)console.log(s.label,JSON.stringify({rmse:s.rmsePoints,final:s.final?.predictedScore,jumps:s.acceptedJumps,rejected:s.rejectedJumps.length}));
console.log('BEST',JSON.stringify({options:best.options,rmse:best.rmsePoints,final:best.final,jumps:best.acceptedJumps,rejected:best.rejectedJumps}));

for(const q of queuedScenarios)console.log('QUEUED',JSON.stringify({dt:q.options.timestep,rmse:q.rmsePoints,final:q.final.predictedScore,rejected:q.rejectedJumps}));
