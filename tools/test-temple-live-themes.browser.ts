//180s real RAF across naturally requested themes; no seek/advance/forced theme.
// Real RAF measurement, not diagnostic advance(). Desktop browser result only.
(async()=>{
 const g=window.__templeGame,url=new URL(location.href);url.searchParams.set('seed','1');url.searchParams.delete('route');history.replaceState(null,'',url);g.restart();
 const intervals=[],hitches=[],themes:Record<string,{frames:number;intervals:number[];firstDistance:number;lastDistance:number}>={},start=performance.now();let last=null,observer;
 try{observer=new PerformanceObserver(list=>hitches.push(...list.getEntries().map(e=>({start:e.startTime,duration:e.duration}))));observer.observe({type:'longtask',buffered:false});}catch{}
 const canvas=document.querySelector('canvas'),bufferStart={width:canvas.width,height:canvas.height};
 return await new Promise(resolve=>{
  function sample(now){
   const frameMs=last===null?null:now-last;if(frameMs!==null)intervals.push(frameMs);last=now;
   const s=g.state(),remaining=s.nextTurn-s.distanceExact;
   const level=s.course?.surfaces.find(x=>s.distanceExact>=x.from&&s.distanceExact<x.to)?.level??0;
   const bucket=themes[level]??={frames:0,intervals:[],firstDistance:s.distanceExact,lastDistance:s.distanceExact};bucket.frames++;bucket.lastDistance=s.distanceExact;if(frameMs!==null)bucket.intervals.push(frameMs);
   window.__templePerfStatus={running:true,elapsedMs:now-start,frames:intervals.length,distance:s.distanceExact,phase:s.phase,themes:Object.fromEntries(Object.entries(themes).map(([k,v])=>[k,v.frames])),heartbeat:performance.now()};
   if(now-start>=180000||s.phase!=='playing'){
    window.__templePerfStatus.running=false;observer?.disconnect();const end=g.state(),sorted=[...intervals].sort((a,b)=>a-b),p=n=>sorted[Math.min(sorted.length-1,Math.floor(n*sorted.length))];
    if(end.phase==='playing')g.pause();
    resolve({environment:{userAgent:navigator.userAgent,devicePixelRatio:devicePixelRatio,viewport:{width:innerWidth,height:innerHeight},physicalMobile:false},themes,durationMs:now-start,frames:intervals.length,averageFps:intervals.length*1000/intervals.reduce((a,b)=>a+b,0),frameMs:{p50:p(.5),p95:p(.95),p99:p(.99),max:Math.max(...intervals),over50:intervals.filter(v=>v>50).length},longTasks:hitches,bufferStart,bufferEnd:{width:canvas.width,height:canvas.height},end,intervals});return;
   }
   if(remaining<5&&!s.turnQueued)g.press(s.turnDirection===-1?'left':'right');
   else if(remaining>10){const branch=s.course.branches.find(b=>b.from>s.distanceExact&&b.from-s.distanceExact<40),safe=g.groundSupport(24);let lane=s.activeBranch?s.lane:1;if(branch)lane=0;else if(safe.some(Boolean)&&!safe.every(Boolean))lane=safe[s.lane]?s.lane:safe.findIndex(Boolean);const narrow=s.course.narrows.find(n=>s.distanceExact>=n.from-24&&s.distanceExact<=n.to+6);if(narrow)lane=narrow.side==='left'?0:2;const block=s.obstacles.find(o=>o.kind==='block'&&o.ahead>-5&&o.ahead<20);if(block&&lane===block.lane)lane=(block.lane+1)%3;for(let i=0;i<Math.abs(lane-s.lane);i++)g.press(lane<s.lane?'left':'right');}
   const o=s.obstacles.find(o=>(!o.branch||o.branch===s.activeBranch)&&o.ahead>0&&o.ahead<(o.kind==='gapLong'?8:10));if(o&&!s.airborne&&!s.sliding&&!o.defId.startsWith('narrow')){if(o.kind==='block'){if(o.lane===s.lane)g.press(s.lane===0?'right':'left');}else g.press(o.kind==='arch'||o.kind==='fire'&&o.defId!=='fireWall'?'slide':'jump');}
   if(!s.airborne&&s.course.surfaces.some(t=>t.from>0&&s.distanceExact>t.from-20&&s.distanceExact<t.from-10))g.press('jump');
   requestAnimationFrame(sample);
  }requestAnimationFrame(sample);
 });
})()
