// Natural normal-mode approaches only. Requires an isolated save with locked powers.
// No planAhead/jumpTo/spawn/power/collision overrides.
(()=>{
 const g=window.__templeGame,url=new URL(location.href),original=location.href,checks=[],cases=[];
 url.searchParams.set('seed','1');url.searchParams.delete('route');history.replaceState(null,'',url);
 const check=(name,ok)=>checks.push({name,passed:!!ok});
 function prep(){g.restart();g.freeze();g.advance(1600);g.press('left');}
 function laneTo(target){const current=g.state().lane;for(let i=0;i<Math.abs(target-current);i++)g.press(target<current?'left':'right');}
 function approach(predicate){
  for(let ticks=0;ticks<30000;ticks++){
   const s=g.state();if(s.phase!=='playing'||s.distanceExact>20000)return null;
   const target=predicate(s);if(target&&!s.airborne&&!s.sliding&&!s.powers.some(p=>p.kind==='shield'||p.kind==='boost'))return {s,target};
   const remaining=s.nextTurn-s.distanceExact;
   if(remaining<5&&!s.turnQueued)g.press(s.turnDirection===-1?'left':'right');
   else if(remaining>10){
    const branch=s.course.branches.find(b=>b.from>s.distanceExact&&b.from-s.distanceExact<40),safe=g.groundSupport(24);
    let lane=s.activeBranch?s.lane:1;
    if(branch)lane=0;else if(safe.some(Boolean)&&!safe.every(Boolean))lane=safe[s.lane]?s.lane:safe.findIndex(Boolean);
    const narrow=s.course.narrows.find(n=>s.distanceExact>=n.from-24&&s.distanceExact<=n.to+6);if(narrow)lane=narrow.side==='left'?0:2;
    const block=s.obstacles.find(o=>o.kind==='block'&&o.ahead>-5&&o.ahead<20);if(block&&lane===block.lane)lane=(block.lane+1)%3;
    laneTo(lane);
   }
   const o=s.obstacles.find(o=>(!o.branch||o.branch===s.activeBranch)&&o.ahead>0&&o.ahead<(o.kind==='gapLong'?8:10));
   if(o&&!s.airborne&&!s.sliding&&!o.defId.startsWith('narrow')){
    if(o.kind==='block'){if(o.lane===s.lane)laneTo(s.lane===0?1:0);}
    else g.press(o.kind==='arch'||o.kind==='fire'&&o.defId!=='fireWall'?'slide':'jump');
   }
   if(!s.airborne&&s.course.surfaces.some(t=>t.from>0&&s.distanceExact>t.from-20&&s.distanceExact<t.from-10))g.press('jump');
   g.advance(25);
  }
  return null;
 }
 try{
  for(const spec of [
   {kind:'branch',find:s=>s.course.branches.find(b=>b.from-s.distanceExact>28&&b.from-s.distanceExact<32),wrong:()=>1},
   {kind:'narrowSmall',find:s=>s.course.narrows.find(n=>n.to-n.from<=12&&n.from-s.distanceExact>32&&n.from-s.distanceExact<36),wrong:n=>n.side==='left'?2:0},
   {kind:'narrowLong',find:s=>s.course.narrows.find(n=>n.to-n.from>=30&&n.from-s.distanceExact>32&&n.from-s.distanceExact<36),wrong:n=>n.side==='left'?2:0},
   {kind:'shortGap',find:s=>s.obstacles.find(o=>o.defId==='pit'&&o.ahead>10&&o.ahead<14),wrong:()=>null},
   {kind:'longGap',find:s=>s.obstacles.find(o=>o.defId==='pitLongB'&&o.ahead>10&&o.ahead<14),wrong:()=>null}
  ]){
   prep();const reached=approach(spec.find);check(spec.kind+':natural unprotected approach',!!reached);
   if(!reached){cases.push({kind:spec.kind,failedApproach:g.state()});continue;}
   const target=spec.wrong(reached.target);if(target!==null)laneTo(target);
   const intent=g.state();g.advance(7000);const result=g.state(),death=g.death();
   check(spec.kind+':wrong action reaches results',result.phase==='ended');
   check(spec.kind+':road failure is falling/water',death.kind==='water'||death.kind==='fall');
   const expected=spec.kind.endsWith('Gap')?reached.s.distanceExact+reached.target.ahead:reached.target.from;
   check(spec.kind+':failure occurs at intended hazard',result.distanceExact>=expected-8&&result.distanceExact<=expected+28);
   check(spec.kind+':no power pickups aid failure',Object.values(result.powerPickups).every(v=>v===0));
   g.restart();g.freeze();const restart=g.state();check(spec.kind+':restart clears branch and input',restart.phase==='playing'&&restart.lane===1&&!restart.activeBranch&&!restart.powers.length);
   cases.push({kind:spec.kind,reached,intent,result,death,restart});
  }
 }finally{history.replaceState(null,'',original);}
 return {checks,cases};
})()
