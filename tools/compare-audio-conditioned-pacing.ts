/** Sensitivity analysis, NOT a source input replay: audio onset is not touch time. */
import {readFileSync,writeFileSync} from 'node:fs';
import {nativeForwardAcceleration,stepNativeForwardVelocity,nativeJumpVelocity,stepNativeJump,NATIVE_STUMBLE_SPEED_FACTOR,nativeSlideDuration,stepNativeSlideTimer} from '../target/temple-run/web/src/game/nativeMotion';
import {nativeProgressDelta} from '../target/temple-run/web/src/game/nativeProgress';
import {nativeStumbleDuration} from '../target/temple-run/web/src/game/nativeRunnerRules';
const dir='target/temple-run/analysis/';
const audio=JSON.parse(readFileSync(dir+'reference-audio-events.json','utf8'));
const observations=JSON.parse(readFileSync(dir+'reference-progress-calibration.json','utf8')).observations;
const release=2.7031,end=262,dt=1/60;
function run(latency:number,slideFrom:number|null){
 const events=audio.events.filter((e:any)=>e.kind==='jump'||e.kind==='stumble').map((e:any)=>({...e,time:e.audioSecond-latency})).sort((a:any,b:any)=>a.time-b.time);
 let t=release,speed=20,force=0,physical=-2,progress=nativeProgressDelta(0,2,dt),y=0,v=0,air=false;
 let stumble=0,slideElapsed=0,slideDuration=0,sliding=0,index=0,acceptedJumps=0,rejectedJumps=0,stumbles=0;
 const rows:any[]=[];
 let sample=observations.findIndex((r:any)=>r.videoSecond>=3);
 while(t<end-dt/2){
  while(index<events.length&&events[index].time<=t){
   const e=events[index++];
   if(e.kind==='stumble'){speed*=NATIVE_STUMBLE_SPEED_FACTOR;v*=NATIVE_STUMBLE_SPEED_FACTOR;stumble=nativeStumbleDuration(speed);stumbles++;}
   else if(!air&&stumble<=0){v=nativeJumpVelocity(speed);air=true;sliding=0;acceptedJumps++;}
   else rejectedJumps++;
  }
  if(slideFrom!==null&&t>=slideFrom&&!air&&sliding<=0){slideDuration=nativeSlideDuration(speed);slideElapsed=0;sliding=slideDuration;}
  speed=stepNativeForwardVelocity(speed,force,dt);
  const travel=speed*dt;physical+=travel;progress+=nativeProgressDelta(0,travel,dt);
  if(air){const next=stepNativeJump(y,v,dt);y=next.y;v=next.v;air=next.airborne;}
  if(sliding>0){const next=stepNativeSlideTimer(slideElapsed,slideDuration,dt);slideElapsed=next.elapsed;sliding=next.remaining;}
  stumble=Math.max(0,stumble-dt);
  force=nativeForwardAcceleration(speed,42,air,sliding>0);
  t+=dt;
  while(sample<observations.length&&t>=observations[sample].videoSecond){const o=observations[sample++];rows.push({videoSecond:o.videoSecond,observedProgress:o.progress,progress,residual:progress-o.progress,speed,physical});}
 }
 return {latency,groundPolicy:slideFrom===null?'no slide':`repeat slide when grounded after video${slideFrom}s`,acceptedJumps,rejectedJumps,stumbles,final:{time:t,speed,physical,progress,score:Math.floor(progress)*20+1000},rows};
}
const scenarios=[0,.15,.3].flatMap(delay=>[null,release,4,4.5,5].map(slideFrom=>run(delay,slideFrom)));
const result={sourceAudioSHA256:audio.sourceMediaSHA256,releaseVideoSecond:release,endVideoSecond:end,dt,sourceFinal:{score:47240,progress:2312},assumptions:['native20/42 constructor speeds and recovered forces','all13 detected stumble audio events imposed as speed reductions, not recreated input/collisions','jump onsets shifted by0/.15/.3s for sensitivity; variable real latency not recovered','flat supported floor; no native route/height/turn lateral trajectories','two observed500-point shield awards included at final only','no-slide/immediate-slide are diagnostic extremes; source004 visibly running and005 sliding bracket first slide in[4,5] seconds','repeated slide policy after that bracket is approximate, not recovered swipe timestamps','no fit or production parameter change'],scenarios};
writeFileSync(dir+'audio-conditioned-pacing.json',JSON.stringify(result,null,2)+'\n');
for(const s of scenarios)console.log(JSON.stringify({...s,rows:undefined}));
