// Natural runs on both reported seeds; schema1 topology is independently tested in test-merge-road.
(async()=>{
 const g=window.__templeGame,original=location.href,checks=[],cases=[];
 const check=(name,ok)=>{checks.push({name,passed:!!ok});if(!ok)throw Error(name)};
 let seed;
 function prep(){const u=new URL(location.href);u.searchParams.set('seed',String(seed));u.searchParams.delete('route');history.replaceState(null,'',u);g.restart();g.freeze();g.advance(1600);g.press('left');}
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

 try{for(seed of [144966157,145073850]){
  prep();const reached=approach(s=>s.course.branches.find(b=>b.from-s.distanceExact>28&&b.from-s.distanceExact<32));
  check(seed+':natural branch approach',!!reached);const span=reached.target;
  const probes=[span.from-1,span.from+2,span.from+8,(span.from+span.to)/2,span.to-2,span.to+1].map(d=>[-1.3,0,1.3].map(x=>g.roadProbe(d,x)));
  for(const row of probes)for(const p of row)check(seed+':branch visible floor matches support '+p.distance+'/'+p.side,p.supported===(p.visibleFloor.length>0));
  laneTo(seed===144966157?0:2);
  const at=g.state().nextTurn;const cue=approach(s=>s.nextTurn===at&&s.nextTurn-s.distanceExact<28&&s.nextTurn-s.distanceExact>24);
  check(seed+':survives merge',!!cue&&!cue.s.activeBranch);check(seed+':merge to turn >=96m',at-span.to>=96);
  const probe=g.roadProbe(at+12,0);check(seed+':visible path retains upcoming turn',probe.segments.some(s=>s.start===at));
  await Promise.resolve();await Promise.resolve();check(seed+':normal-mode turn cue visible',!!document.querySelector('.turn-cue')?.textContent?.includes('前方'));
  const before=g.state();for(let i=0;i<300&&g.state().distanceExact<at+12&&g.state().phase==='playing';i++){
   const s=g.state();if(s.nextTurn-s.distanceExact<5&&!s.turnQueued)g.press(s.turnDirection===-1?'left':'right');g.advance(25);
  }
  check(seed+':corner after merge playable',g.state().phase==='playing'&&g.state().turnCount>before.turnCount);
  cases.push({seed,branch:span,probes,corner:probe,after:g.state()});
  prep();const wrong=approach(s=>s.course.branches.find(b=>b.from-s.distanceExact>28&&b.from-s.distanceExact<32));laneTo(1);g.advance(7000);
  check(seed+':centre gap remains a real water failure',g.state().phase==='ended'&&g.death().kind==='water');
  cases.push({seed,wrongBranch:wrong.target,death:g.death(),state:g.state()});
  prep();const n=approach(s=>s.course.narrows.find(n=>n.to-n.from===12&&n.from-s.distanceExact>28&&n.from-s.distanceExact<32));
  check(seed+':natural short half-road approach',!!n);const mid=(n.target.from+n.target.to)/2;
  const narrow=[-1.3,0,1.3].map(x=>g.roadProbe(mid,x));
  for(const p of narrow)check(seed+':narrow visible floor matches support '+p.side,p.supported===(p.visibleFloor.length>0));
  cases.push({seed,narrow:n.target,probes:narrow});
 }
 return {checks,cases};}finally{history.replaceState(null,'',original);}
})()
