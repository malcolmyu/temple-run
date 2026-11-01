(async()=>{const g=window.__templeGame,original=location.href,checks=[],cases=[];const check=(name,ok)=>{checks.push({name,passed:!!ok});if(!ok)throw Error(name)};
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

try{for(const action of ['safe','miss','jump']){const u=new URL(location.href);u.searchParams.set('seed','1');u.searchParams.delete('pacing');history.replaceState(null,'',u);g.restart();g.freeze();g.advance(1600);g.press('left');
const r=approach(s=>s.course.branches.find(b=>b.riskyArm&&b.from-s.distanceExact>28&&b.from-s.distanceExact<32));check(action+':natural risk branch',!!r);const b=r.target;const risk=b.riskyArm==='left'?0:2;laneTo(action==='safe'?2-risk:risk);while(g.state().phase==='playing'&&g.state().distanceExact<b.from+2)g.advance(25);check(action+':entered intended arm',g.state().activeBranch===(action==='safe'?(b.riskyArm==='left'?'right':'left'):b.riskyArm));
const near=approach(s=>s.obstacles.find(o=>o.branch&&o.ahead>12&&o.ahead<16));check(action+':natural firewall approach',!!near);
const p=g.roadProbe(g.state().distanceExact,0),segment=[...p.segments].reverse().find(s=>s.start<=p.distance),travel=p.distance-segment.start;check(action+':common centreline has no lateral displacement',Math.hypot(p.point.x-(segment.x-Math.sin(segment.heading)*travel),p.point.z-(segment.z-Math.cos(segment.heading)*travel))<1e-8);
if(action==='jump'){for(let i=0;i<300&&g.state().distanceExact<near.s.distanceExact+near.target.ahead+12&&g.state().phase==='playing';i++){const s=g.state(),o=s.obstacles.find(o=>o.branch===s.activeBranch&&o.ahead>0&&o.ahead<10);if(o&&!s.airborne)g.press('jump');g.advance(25)}}else g.advance(2000);
const state=g.state(),death=g.death();check(action+':correct collision outcome',action==='miss'?state.phase==='ended'&&death.cause==='fireWall':state.phase==='playing');cases.push({action,branch:b,state,death});await new Promise(r=>setTimeout(r,0));}return{checks,cases};}finally{history.replaceState(null,'',original)}})()
