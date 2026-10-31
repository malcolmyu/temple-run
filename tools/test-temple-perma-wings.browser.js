// Run after actual HUD permanent-wing activation; no QA seek/spawn.
(()=>{const g=window.__templeGame,seed=1,checks=[];const before=g.state();const check=(name,ok)=>checks.push({name,passed:!!ok});
  const samples=[],trace=[];let nextSample=2500;
  const seen=new Set(),branches=new Set(),longJumps=[];let merges=0,lastBranch=null,ticks=0;
  while(g.state().phase==='playing'&&g.state().runElapsed<45&&ticks++<50000){
   if(g.state().distanceExact>=nextSample){samples.push({distance:g.state().distanceExact,gpu:g.gpu(),scene:g.scene()});nextSample+=2500;}
   const s=g.state(),remaining=s.nextTurn-s.distanceExact;
   if(s.obstacles.some(o=>o.defId==='pitLongB'&&o.ahead>-22&&o.ahead<14)){trace.push({distance:s.distanceExact,speed:s.speed,airborne:s.airborne,jumpY:s.jumpY,powers:s.powers,gap:s.obstacles.find(o=>o.defId==='pitLongB')});if(trace.length>80)trace.shift();}
   for(const o of s.obstacles)seen.add(o.defId);
   if(s.activeBranch)branches.add(s.activeBranch);
   if(lastBranch&&!s.activeBranch)merges++;lastBranch=s.activeBranch;
   if(remaining<5&&!s.turnQueued)g.press(s.turnDirection===-1?'left':'right');
   else if(remaining>10){
    const branch=s.course.branches.find(b=>b.from>s.distanceExact&&b.from-s.distanceExact<40);
    const safe=g.groundSupport(24);
    let lane=s.lane;
    if(branch)lane=seed===1?0:2;
    else if(safe.some(Boolean)&&!safe.every(Boolean))lane=safe[s.lane]?s.lane:safe.findIndex(Boolean);
    if(lane!==s.lane)for(let i=0;i<Math.abs(lane-s.lane);i++)g.press(lane<s.lane?'left':'right');
   }
   const protectedNow=s.powers.some(p=>p.kind==='shield'||p.kind==='boost');
   const obstacle=s.obstacles.find(o=>o.ahead>0&&o.ahead<(o.kind==='gapLong'?8:10));
   if(obstacle&&!s.airborne&&!s.sliding&&!obstacle.defId.startsWith('narrow')){
    if(obstacle.kind==='block'){if(obstacle.lane===s.lane)g.press(s.lane===0?'right':'left');}
    else{g.press(obstacle.kind==='arch'||obstacle.kind==='fire'?'slide':'jump');if(obstacle.defId==='pitLongB')longJumps.push(s.distanceExact);}
   }
   if(!s.airborne&&s.course.surfaces.some(surface=>surface.from>0&&s.distanceExact>surface.from-20&&s.distanceExact<surface.from-10))g.press('jump');
   g.advance(25);
  }

 const after=g.state();check('permanent wings survive more than30seconds',after.phase==='playing'&&after.runElapsed-before.runElapsed>30&&after.angelWings.permanent&&after.angelWings.remaining===30);
 check('activation consumed only permanent stock',after.angelWings.permanentStock===0&&after.angelWings.stock===1);
 let n=0;while(g.state().phase==='playing'&&n++<10000)g.advance(25);
 const dying=g.state();check('real failure consumes active wings and sets15 cooldown',dying.phase==='dying'&&!dying.angelWings.permanent&&dying.angelWings.remaining===0&&dying.angelWings.cooldown===15);
 g.advance(600);const revived=g.state();check('permanent wing failure automatically revives same run',revived.phase==='playing'&&revived.boost.active&&!revived.angelWings.pendingRevive);
 check('regular wing stock remains available after permanent revive',revived.angelWings.stock===1&&revived.angelWings.cooldown>14&&revived.angelWings.cooldown<=15);
 g.advance(60000);const ended=g.state();check('next unprotected failure reaches results',ended.phase==='ended');
 g.restart();g.freeze();const restart=g.state();check('restart clears protection and preserves separate normal stock',restart.phase==='playing'&&!restart.angelWings.permanent&&restart.angelWings.remaining===0&&restart.angelWings.stock===1&&restart.angelWings.permanentStock===0);
 return {checks,before,after,dying,revived,ended,restart};
})()
