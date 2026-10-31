// Diagnostic simulation rates; rendering/device FPS and touch latency are separate.
(()=>{
 const g=window.__templeGame,prior=location.href,checks=[],runs=[];
 const check=(name,ok)=>{checks.push({name,passed:!!ok});if(!ok)throw Error(name);};
 try{
  for(const stepMs of [50,25,1000/60])for(const seed of [1,2]){
   history.replaceState(null,'','/?seed='+seed);g.restart();g.freeze();
   g.advance(1600,stepMs);const before=g.state();g.advance(stepMs,stepMs);
   check('one actual step '+stepMs,g.state().simulation.steps===before.simulation.steps+1&&Math.abs(g.state().simulation.lastStepSeconds-stepMs/1000)<1e-10);
   const valid=g.state().simulation.steps;g.advance(NaN);g.advance(100,0);g.advance(-1);
   check('invalid schedule ignored '+stepMs,g.state().simulation.steps===valid);
   let ticks=0;const seen=new Set();
   while(g.state().phase==='playing'&&g.state().distanceExact<7500&&ticks++<50000){
    const s=g.state(),remaining=s.nextTurn-s.distanceExact;
    for(const o of s.obstacles)seen.add(o.defId);
    if(remaining<5&&!s.turnQueued)g.press(s.turnDirection===-1?'left':'right');
    else if(remaining>10){
     const fork=s.course.branches.find(b=>b.from>s.distanceExact&&b.from-s.distanceExact<40),safe=g.groundSupport(24);
     let lane=s.activeBranch?s.lane:1;
     if(fork)lane=seed===1?0:2;
     else if(safe.some(Boolean)&&!safe.every(Boolean))lane=safe[s.lane]?s.lane:safe.findIndex(Boolean);
     const block=s.obstacles.find(o=>o.kind==='block'&&o.ahead>-5&&o.ahead<20);if(block&&lane===block.lane)lane=(block.lane+1)%3;
     const narrow=s.course.narrows.find(n=>s.distanceExact>=n.from-24&&s.distanceExact<=n.to+6);if(narrow)lane=narrow.side==='left'?0:2;
     for(let i=0;i<Math.abs(lane-s.lane);i++)g.press(lane<s.lane?'left':'right');
    }
    const o=s.obstacles.find(o=>o.ahead>0&&o.ahead<(o.kind==='gapLong'?8:10));
    if(o&&!s.airborne&&!s.sliding&&!o.defId.startsWith('narrow')){
     if(o.kind==='block'){if(o.lane===s.lane)g.press(s.lane===0?'right':'left');}
     else g.press(o.kind==='arch'||o.kind==='fire'&&o.defId!=='fireWall'?'slide':'jump');
    }
    if(!s.airborne&&s.course.surfaces.some(x=>x.from>0&&s.distanceExact>x.from-20&&s.distanceExact<x.from-10))g.press('jump');
    g.advance(stepMs,stepMs);
   }
   const end=g.state();check('7500m survives '+stepMs+'/'+seed,end.phase==='playing'&&end.distanceExact>=7500);
   check('no diagnostic aid '+stepMs+'/'+seed,end.powers.length===0&&Object.values(end.powerPickups).every(n=>n===0));
   g.advance(60000,stepMs);const failed=g.state();check('results '+stepMs+'/'+seed,failed.phase==='ended');
   g.restart();g.freeze();const restarted=g.state();check('restart '+stepMs+'/'+seed,restarted.phase==='playing'&&!restarted.airborne&&!restarted.falling);
   runs.push({stepMs,seed,end,failed,restarted,seen:[...seen]});
  }
  return {checks,runs};
 }finally{history.replaceState(null,'',prior);}
})()
