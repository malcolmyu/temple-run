// Continuous safe-input diagnostic, not source video controls. No teleport/shield injection.
(()=>{
const g=window.__templeGame;g.restart();g.freeze();
const events=[[173,1],[301,"jump"],[329,1],[335,"jump"],[373,"jump"],[467,"jump"],[497,-1],[641,-1],[671,"jump"],[881,-1],[899,"jump"],[959,"jump"],[1025,1],[1055,"jump"],[1115,"jump"],[1181,1],[1199,"jump"],[1283,"jump"],[1469,1],[1487,"jump"],[1577,1],[1614,"slide"],[1679,"jump"],[1758,"slide"],[1811,"jump"],[1907,"jump"],[1949,-1],[1998,"slide"],[2063,"jump"],[2171,"jump"],[2213,-1],[2247,"jump"],[2332,"slide"],[2382,"slide"],[2441,-1],[2501,1],[2549,1],[2597,1],[2645,-1],[2693,1],[2741,1],[2789,1],[2849,1],[2897,-1],[2947,"jump"]];
const job=window.__heightPrefixJob={status:'running',index:0,ticks:0,rows:[],events,policy:'repeated slides after55; authored action sequence plus native exit-cap jump2247; not source controls'};
const finish=(status,reason)=>{job.status=status;job.reason=reason;job.state=g.state();job.death=g.death();};
function pump(){
 for(let n=0;n<100&&job.status==='running';n++){
  let s=g.state();if(s.phase!=='playing'){finish('failed','phase');break;}
  if(s.distanceExact>=2967){finish('passed','prefix complete');break;}
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
