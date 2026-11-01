// Normal-mode chase verification. No seek/spawn/forced powers. Needs >=2 banked gems for UI follow-up.
(()=>{
 const g=window.__templeGame,original=location.href,url=new URL(original),checks=[],records={};
 url.searchParams.set('seed','1');url.searchParams.delete('route');history.replaceState(null,'',url);
 const check=(name,ok)=>{checks.push({name,passed:!!ok});if(!ok)throw Error(name);};
 function prep(){g.restart();g.freeze();g.advance(1600);g.press('left');}
 function laneTo(target){const current=g.state().lane;for(let i=0;i<Math.abs(target-current);i++)g.press(target<current?'left':'right');}
 function driveUntil(predicate){
  for(let ticks=0;ticks<80000;ticks++){
   const s=g.state();if(s.phase!=='playing'||s.distanceExact>60000)return null;
   const target=predicate(s);if(target&&!s.airborne&&!s.sliding&&!s.powers.length)return {s,target};
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
 function contact(){for(let i=0;i<200&&g.state().phase==='playing'&&g.state().stumbleRemaining===0;i++)g.advance(25);return g.state();}
 try{
  prep();const opening=driveUntil(s=>s.obstacles.find(o=>o.defId==='treeTrip'&&o.ahead>20&&o.ahead<30));
  check('opening trip naturally reached',!!opening);const first=contact();check('first natural trip survives',first.phase==='playing'&&first.stumbleAge<.1&&first.stumbleRemaining>0);
  const recovered=driveUntil(s=>s.stumbleAge>=10.1);check('safe driving restores stumble window',!!recovered&&recovered.s.phase==='playing');
  check('pack retreats during recovery',recovered.s.enemyGap>=4.5);
  const later=driveUntil(s=>s.obstacles.find(o=>o.defId==='treeTrip'&&o.ahead>20&&o.ahead<30));check('later natural trip reached',!!later);
  const newTrip=contact();check('natural trip after recovery survives',newTrip.phase==='playing'&&newTrip.stumbleAge<.1&&newTrip.stumbleRemaining>0);
  records.recovery={opening,first,recovered,later,newTrip};
  prep();const paired=driveUntil(s=>s.course.features.find(f=>f.kind==='treeTrip'&&f.combo==='repeat'&&f.extraObstacleAt-48-s.distanceExact>20&&f.extraObstacleAt-48-s.distanceExact<30));
  check('paired natural roots reached without protection',!!paired);const far=paired.s.enemyGap,trip=contact();
  check('paired first trip survives',trip.phase==='playing'&&trip.stumbleRemaining>0);
  g.press('jump');g.advance(25);check('stumble timer rejects jump',!g.state().airborne);
  g.advance(550);const close=g.state();check('pack approaches after natural trip',close.enemyGap<far&&close.enemyGap<=3);
  g.advance(6000);const caught=g.state();check('second natural root catches within10s',caught.phase==='ended'&&g.death().kind==='caught'&&caught.stumbleAge<10);
  check('caught at second root',caught.distanceExact>=paired.target.extraObstacleAt-8&&caught.distanceExact<=paired.target.extraObstacleAt+30);
  records.pair={paired,far,trip,close,caught,death:g.death()};
 }finally{history.replaceState(null,'',original);}
 return {checks,records};
})()
