// Normal generated approach; only boost activation is diagnostic.
(()=>{
 const g=window.__templeGame,prior=location.href,checks=[],runs=[];
 const check=(name,ok)=>{checks.push({name,passed:!!ok});if(!ok)throw Error(name);};
 history.replaceState(null,'','/?seed=1');
 function approach(until){
  g.restart();g.freeze();g.advance(1600);g.press('left');let ticks=0;
  while(g.state().phase==='playing'&&g.state().distanceExact<until&&ticks++<30000){
   const s=g.state(),remaining=s.nextTurn-s.distanceExact;
   if(remaining<5&&!s.turnQueued)g.press(s.turnDirection===-1?'left':'right');
   else if(remaining>10){
    const fork=s.course.branches.find(b=>b.from>s.distanceExact&&b.from-s.distanceExact<40),safe=g.groundSupport(24);
    let lane=s.activeBranch?s.lane:1;
    if(fork)lane=0;
    else if(safe.some(Boolean)&&!safe.every(Boolean))lane=safe[s.lane]?s.lane:safe.findIndex(Boolean);
    const block=s.obstacles.find(o=>o.kind==='block'&&o.ahead>-5&&o.ahead<20);if(block&&lane===block.lane)lane=(block.lane+1)%3;
    const narrow=s.course.narrows.find(n=>s.distanceExact>=n.from-24&&s.distanceExact<=n.to+6);if(narrow)lane=narrow.side==='left'?0:2;
    for(let i=0;i<Math.abs(lane-s.lane);i++)g.press(lane<s.lane?'left':'right');
   }
   const o=s.obstacles.find(o=>(!o.branch||o.branch===s.activeBranch)&&o.ahead>0&&o.ahead<(o.kind==='gapLong'?8:10));
   if(o&&!s.airborne&&!s.sliding&&!o.defId.startsWith('narrow')){
    if(o.kind==='block'){if(o.lane===s.lane)g.press(s.lane===0?'right':'left');}
    else g.press(o.kind==='arch'||o.kind==='fire'&&o.defId!=='fireWall'?'slide':'jump');
   }
   if(!s.airborne&&s.course.surfaces.some(x=>x.from>0&&s.distanceExact>x.from-20&&s.distanceExact<x.from-10))g.press('jump');
   g.advance(25);
  }
 }
 try{
  for(const spec of [{at:400,type:'branch'},{at:2900,type:'narrow'}]){
   approach(spec.at);check(spec.type+':normal approach survives',g.state().phase==='playing');
   g.power('boost');const start=g.state(),deferrals=[];let ticks=0,paused=false;
   while(g.state().phase==='playing'&&g.state().boost.active&&ticks++<2200){
    const b=g.state(),fork=b.course.branches.find(x=>x.from>b.distanceExact&&x.from-b.distanceExact<30);
    if(fork&&!b.activeBranch&&b.lane!==0)g.press('left');
    g.advance(25);const a=g.state();
    if(a.boostHandover.deferred>b.boostHandover.deferred){
     deferrals.push({distance:b.distanceExact,inside:b.course[spec.type==='branch'?'branches':'narrows'].some(x=>b.distanceExact>=x.from&&b.distanceExact<=x.to),reasons:a.boostHandover.reasons});
     if(!paused){g.pause();const p=g.state();g.advance(1000);const q=g.state();check(spec.type+':pause preserves handover',q.phase==='paused'&&q.distanceExact===p.distanceExact&&q.boost.left===p.boost.left&&q.runElapsed===p.runElapsed&&JSON.stringify(q.powers)===JSON.stringify(p.powers)&&q.boostHandover.deferred===p.boostHandover.deferred);g.pause();paused=true;}
    }
   }
   const end=g.state();check(spec.type+':expiry deferred inside support span',deferrals.some(d=>d.inside));
   check(spec.type+':release survives and ends protection',end.phase==='playing'&&!end.boost.active&&!end.powers.some(p=>p.kind==='shield'));
   check(spec.type+':not falling at release',!end.falling);
   g.advance(60000);check(spec.type+':collisions resume to results',g.state().phase==='ended');
   g.restart();g.freeze();check(spec.type+':restart clears handover',g.state().boostHandover.deferred===0&&!g.state().boost.active);
   runs.push({spec,start,end,deferrals});
  }
  return {checks,runs};
 }finally{history.replaceState(null,'',prior);}
})()
