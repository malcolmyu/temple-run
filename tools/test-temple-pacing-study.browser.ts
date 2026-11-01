// Controlled browser study, not human playtest: fixed response-error rates per encounter.
(async()=>{
 const g=window.__templeGame,original=location.href,runs=[];
 const roll=(seed,n)=>{let x=(seed^Math.imul(n+1,0x45d9f3b))>>>0;x=Math.imul(x^(x>>>16),0x7feb352d);x=Math.imul(x^(x>>>15),0x846ca68b);return((x^(x>>>16))>>>0)/4294967296};
 const laneTo=n=>{const s=g.state();for(let k=0;k<Math.abs(n-s.lane);k++)g.press(n<s.lane?'left':'right')};
 for(const mode of ['baseline','raised'])for(let seed=1;seed<=24;seed++){
  const u=new URL(location.href);u.searchParams.set('pacing',mode);u.searchParams.set('seed',String(seed));history.replaceState(null,'',u);
  g.restart();g.freeze();g.advance(1600);g.press('left');
  let count=0,measuring=false;const errors=new Map();
  const error=(id,p)=>{if(!measuring)return false;if(!errors.has(id))errors.set(id,roll(seed,++count)<p);return errors.get(id)};
  for(let ticks=0;ticks<18000;ticks++){
   const s=g.state();if(s.phase!=='playing'||s.distanceExact>=6000)break;
   measuring=s.progressDistance>=1000;const d=s.distanceExact,remaining=s.nextTurn-d;
   if(remaining<5&&!s.turnQueued&&!error('turn'+s.nextTurn,.05))g.press(s.turnDirection===-1?'left':'right');
   else if(remaining>10){
    const branch=s.course.branches.find(b=>b.from>d&&b.from-d<40),safe=g.groundSupport(24);
    let lane=s.activeBranch?s.lane:1;
    if(branch)lane=error('branch'+branch.from,.12)?1:0;
    else if(safe.some(Boolean)&&!safe.every(Boolean))lane=safe[s.lane]?s.lane:safe.findIndex(Boolean);
    const n=s.course.narrows.find(n=>d>=n.from-24&&d<=n.to+6);
    if(n)lane=error('narrow'+n.from,.12)?(n.side==='left'?2:0):(n.side==='left'?0:2);
    const block=s.obstacles.find(o=>o.kind==='block'&&o.ahead>-5&&o.ahead<20);
    if(block&&lane===block.lane&&!error('obstacle'+block.distance,.08))lane=(block.lane+1)%3;
    laneTo(lane);
   }
   const o=s.obstacles.find(o=>(!o.branch||o.branch===s.activeBranch)&&o.ahead>0&&o.ahead<(o.kind==='gapLong'?8:10));
   if(o&&!s.airborne&&!s.sliding&&!o.defId.startsWith('narrow')&&!error('obstacle'+o.distance,.08)){
    if(o.kind==='block'){if(o.lane===s.lane)laneTo(s.lane===0?1:0)}
    else g.press(o.kind==='arch'||o.kind==='fire'&&o.defId!=='fireWall'?'slide':'jump');
   }
   if(!s.airborne&&s.course.surfaces.some(t=>t.from>0&&d>t.from-20&&d<t.from-10))g.press('jump');
   g.advance(25);
  }
  const s=g.state();runs.push({mode,seed,distance:s.distanceExact,progress:s.progressDistance,phase:s.phase,death:g.death(),encounters:count,censored:s.phase==='playing',powers:s.powerPickups,rules:s.course.rulesVersion});
  window.__pacingProgress141={mode,seed};await new Promise(resolve=>setTimeout(resolve,0));
 }
 history.replaceState(null,'',original);return{method:'24 paired seeds;error model enabled only after1000progress;5% missed turns,8% skipped obstacle responses,12% wrong branch/narrow;zero power upgrades;cap6000worldm,25ms step;no forced spawn/seek/protection',runs};
})()
