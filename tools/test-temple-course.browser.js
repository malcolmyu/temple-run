// Normal generated course, real controls, no teleports/spawn fixtures/collision overrides.
(() => {
 const g=window.__templeGame,original=location.href,runs=[],checks=[];
 const check=(name,passed)=>checks.push({name,passed:!!passed});
 for(const seed of [1,2]){
  const url=new URL(location.href);url.searchParams.set('seed',String(seed));url.searchParams.delete('route');history.replaceState(null,'',url);
  g.restart();g.freeze();g.advance(1600);g.press('left');
  const seen=new Set(),branches=new Set(),longJumps=[];let merges=0,lastBranch=null,ticks=0;
  while(g.state().phase==='playing'&&g.state().distanceExact<7500&&ticks++<12000){
   const s=g.state(),remaining=s.nextTurn-s.distanceExact;
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
   if(obstacle&&!protectedNow&&!s.airborne&&!s.sliding&&!obstacle.defId.startsWith('narrow')){
    if(obstacle.kind==='block'){if(obstacle.lane===s.lane)g.press(s.lane===0?'right':'left');}
    else{g.press(obstacle.kind==='arch'||obstacle.kind==='fire'?'slide':'jump');if(obstacle.defId==='pitLongB')longJumps.push(s.distanceExact);}
   }
   if(!protectedNow&&!s.airborne&&s.course.surfaces.some(surface=>surface.from>0&&s.distanceExact>surface.from-20&&s.distanceExact<surface.from-10))g.press('jump');
   g.advance(25);
  }
  const end=g.state();runs.push({seed,end,seen:[...seen],branches:[...branches],merges,longJumps,death:g.death()});
  check(`seed${seed}: generated course reaches7500m`,end.phase==='playing'&&end.distanceExact>=7500);
  check(`seed${seed}: branch choice and merge work`,branches.has(seed===1?'left':'right')&&merges>0);
  check(`seed${seed}: both bridge types and native narrow groups appear`,seen.has('plankPit')&&seen.has('plankBeam')&&[...seen].some(id=>id.startsWith('narrowWall')));
  g.advance(60000);check(`seed${seed}: failure reaches results`,g.state().phase==='ended');
  g.restart();g.freeze();check(`seed${seed}: restart clears branch and course progress`,g.state().phase==='playing'&&!g.state().activeBranch&&g.state().lane===1&&g.state().distanceExact===-2);
 }
 check('real long-hole pairs generated and jumped without invincibility',runs.some(r=>r.longJumps.length>0&&r.seen.includes('pitLongA')&&r.end.phase==='playing'));
 history.replaceState(null,'',original);
 return {checks,runs};
})()
