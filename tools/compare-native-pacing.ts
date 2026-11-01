/** Compare recovered default motion to footage; this is not a fitted replay. */
import { readFileSync,writeFileSync } from 'node:fs';
import { nativeForwardAcceleration } from '../target/temple-run/web/src/game/nativeMotion';
import { nativeProgressDelta } from '../target/temple-run/web/src/game/nativeProgress';
const input=JSON.parse(readFileSync('target/temple-run/analysis/reference-progress-calibration.json','utf8'));
let speed=20,distance=0,progress=0,time=0;
const dt=1/120;
const rows=[];
for(const observation of input.observations){
 const until=observation.gameSecond;
 while(time+dt/2<until){
  speed=Math.min(42,speed+nativeForwardAcceleration(speed)*dt);
  const travel=speed*dt;
  distance+=travel;
  progress+=nativeProgressDelta(0,travel,dt);
  time+=dt;
 }
 rows.push({videoSecond:observation.videoSecond,gameSecond:until,
  observedProgress:observation.progress,observedScore:observation.score,
  defaultNoInputSpeed:speed,defaultNoInputWorldDistance:distance,
  defaultNoInputProgress:progress,progressResidual:progress-observation.progress});
}
writeFileSync('target/temple-run/analysis/native-pacing-comparison.json',JSON.stringify({
 assumptions:['APK constructor defaults20/42 world units per second',
  '120Hz semi-implicit integration; smoothDeltaTime equals simulation step',
  'no jumps, slides, stumbles, powers or turn/camera effects',
  'video sample phase is approximate to0.1sec',
  'baseline is deliberately not fitted; residuals do not prove remote configuration differences'],
 observations:rows},null,2)+'\n');
for(const second of [1,2,3,4,5,6,7,8,9,10,30]){
 const row=rows.find(r=>r.gameSecond===second)!;
 console.log(`t=${second}: recorded=${row.observedProgress}, baseline=${row.defaultNoInputProgress.toFixed(2)}, speed=${row.defaultNoInputSpeed.toFixed(2)}, world=${row.defaultNoInputWorldDistance.toFixed(2)}`);
}
