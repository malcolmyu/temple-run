// Deliberate main-thread stall. Run separately from normal-performance samples.
// Caller pauses the game for the FPS test or starts a fresh run for delta-clamp verification.
(async()=>{
 const intervals=[];let last;
 return await new Promise(resolve=>{
  let n=0;
  function step(t){
   if(last!==undefined)intervals.push(t-last);last=t;
   if(n++>=45){const sorted=[...intervals].sort((a,b)=>a-b),s=window.__templeGame.state();resolve({phase:s.phase,hudFps:s.fps,actualFps:intervals.length*1000/intervals.reduce((a,b)=>a+b,0),intervals,p95:sorted[Math.floor(sorted.length*.95)],simulation:s.simulation});return;}
   const until=performance.now()+90;while(performance.now()<until){}
   requestAnimationFrame(step);
  }requestAnimationFrame(step);
 });
})()
