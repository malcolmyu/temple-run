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
try{for(const length of [12,36,48,60]){url.searchParams.set('seed',length===48?'7':'1');history.replaceState(null,'',url);prep();const reached=approach(s=>{const n=s.course.narrows.find(n=>n.to-n.from===length&&n.from-s.distanceExact>32&&n.from-s.distanceExact<36);return n&&s.pickups.some(p=>p.kind==='coin'&&s.distanceExact+p.ahead>=n.from&&s.distanceExact+p.ahead<n.to)?n:null;});check(length+':natural narrow coin approach',!!reached);if(!reached){cases.push({length,failed:g.state(),death:g.death()});continue;}const span=reached.target,rows=g.pickupDetails().filter(p=>p.kind==='coin'&&p.distance>=span.from&&p.distance<span.to),before=g.state();check(length+':coins only on safe side',rows.length>=5&&rows.every(p=>p.lane===(span.side==='left'?0:2)&&p.side===(span.side==='left'?-1.3:1.3)));laneTo(span.side==='left'?0:2);let ticks=0;while(g.state().phase==='playing'&&g.state().distanceExact<span.to+8&&ticks++<5000)g.advance(25);const after=g.state();check(length+':grounded safe side collects row',after.phase==='playing'&&!after.airborne&&after.coins-before.coins>=rows.reduce((n,p)=>n+p.value,0));g.advance(60000);check(length+':failure reaches results',g.state().phase==='ended');g.restart();g.freeze();check(length+':restart clears run coins',g.state().phase==='playing'&&g.state().coins===0);cases.push({length,span,rows,before,after});}return {checks,cases};}finally{history.replaceState(null,'',original);}})()