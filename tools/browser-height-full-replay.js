// Continuous safe-input diagnostic, not source video controls. No teleport/shield injection.
(()=>{
const g=window.__templeGame;g.freeze();
const events=[[3023,"jump"],[3077,-1],[3107,"jump"],[3161,1],[3166,"jump"],[3245,"slide"],[3305,"slide"],[3353,"slide"],[3413,"slide"],[3479,"jump"],[3509,1],[3539,"jump"],[3605,1],[3665,"slide"],[3699,"jump"],[3743,"jump"],[3773,1],[3803,"jump"],[3845,1],[3875,"jump"],[3901,"jump"],[3941,1],[4021,"jump"],[4049,1],[4067,"slide"],[4105,"jump"],[4145,1],[4163,"jump"],[4217,1],[4241,"slide"],[4283,"jump"],[4319,"jump"],[4415,"jump"],[4457,1],[4493,"slide"],[4523,"jump"],[4601,"slide"],[4655,"jump"],[4685,-1],[4715,"jump"],[4757,1],[4811,"jump"],[4829,1],[4853,"slide"],[4911,"jump"],[4961,1],[4997,1],[5033,-1],[5069,1],[5105,1],[5123,"jump"],[5153,1],[5188,"slide"],[5237,"slide"],[5279,"jump"],[5309,1],[5340,"jump"]];
const job=window.__heightFullJob={status:'running',index:0,ticks:0,rows:[],events,policy:'repeated slides after55; authored action sequence plus native second exit-cap jump4911; continues prefix without reset; later jump3699 for elevated second shield instead of early3695; not source controls'};
const finish=(status,reason)=>{job.status=status;job.reason=reason;job.state=g.state();job.death=g.death();};
function pump(){
 for(let n=0;n<100&&job.status==='running';n++){
  let s=g.state();if(s.phase!=='playing'){finish('failed','phase');break;}
  if(s.distanceExact>=5350){finish('passed','visible route complete');break;}
  const next=events[job.index];
  if(next&&s.distanceExact>=next[0]&&!(next[1]==='jump'&&s.stumbleRemaining>0)){
   const [target,action]=next;
   if(typeof action==='number'){if(!g.attemptTurn(action)){finish('failed','turn rejected at'+target);break;}}
   else g.press(action);
   job.rows.push({target,action,state:g.state()});job.index++;
  }else{
   const reserve=next?.[1]==='slide'&&next[0]-s.distanceExact<=s.speed*.75+1;
   if(!reserve&&s.distanceExact>=55&&s.jumpY<=0&&s.sliding<=0)g.press('slide');
  }
  g.advance(10);job.ticks++;
  if(job.ticks>40000){finish('failed','tick budget');break;}
 }
 job.state=g.state();
 if(job.status==='running')job.timer=setTimeout(pump,0);
}
job.timer=setTimeout(pump,0);return{status:job.status,events:events.length};
})()
