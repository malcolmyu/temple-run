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
 try{for(const length of [36,48,60])for(const wrong of [false,true]){url.searchParams.set('seed',length===48?'7':'1');history.replaceState(null,'',url);prep();const reached=approach(s=>s.course.narrows.find(n=>n.to-n.from===length&&n.from-s.distanceExact>32&&n.from-s.distanceExact<36));check(length+':natural approach '+wrong,!!reached);if(!reached){cases.push({length,wrong,failed:g.state(),death:g.death()});continue;}const n=reached.target;laneTo(n.side==='left'?(wrong?2:0):(wrong?0:2));let ticks=0;while(g.state().phase==='playing'&&g.state().distanceExact<n.to+8&&ticks++<5000)g.advance(25);g.advance(600);const result=g.state(),death=g.death();check(length+(wrong?':wrong side fails':':supported side passes'),wrong?result.phase==='ended'&&(death.kind==='water'||death.kind==='fall'):result.phase==='playing'&&result.distanceExact>=n.to);if(!wrong)g.advance(60000);check(length+':failure reaches results '+wrong,g.state().phase==='ended');g.restart();g.freeze();check(length+':restart clears state '+wrong,g.state().phase==='playing'&&!g.state().falling&&g.state().lane===1);cases.push({length,wrong,reached,result,death});}return {checks,cases};}finally{history.replaceState(null,'',original);}})()