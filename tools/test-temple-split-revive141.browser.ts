(()=>{const g=window.__templeGame,original=location.href,checks=[];const check=(name,ok)=>{checks.push({name,passed:!!ok});if(!ok)throw Error(name)};
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

try{const u=new URL(location.href);u.searchParams.set('seed','144966157');u.searchParams.delete('pacing');history.replaceState(null,'',u);g.restart();g.freeze();g.advance(1600);g.press('left');const bank=g.progress().gems;const branch=approach(s=>s.course.branches.find(b=>b.to-b.from===36&&b.from-s.distanceExact>28&&b.from-s.distanceExact<32));check('natural short split approach',!!branch);laneTo(1);g.advance(7000);check('centre gap reaches water results',g.state().phase==='ended'&&g.death().kind==='water');g.revive();const revived=g.state();check('revive stands on supported outer lane',revived.phase==='playing'&&revived.lane===0&&g.groundSupport()[0]);check('charges exactly two gems',g.progress().gems===bank-2);g.advance(1000);check('leaves split without another fall',g.state().phase==='playing'&&!g.state().activeBranch&&!g.state().falling);return{checks,branch:branch.target,revived,after:g.state()};}finally{history.replaceState(null,'',original)}})()
