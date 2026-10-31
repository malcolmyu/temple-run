// Four normal seeded runs. No spawned fixtures, teleports, forced powers or collision overrides.
// Uniform random selection permits repeats: coverage is across seeds, not a per-run quota.
(() => {
 const g=window.__templeGame,runs=[],originalUrl=location.href,checks=[],releases=[],collections=[];
 const check=(name,ok)=>checks.push({name,passed:!!ok});
 for(const seed of [1,2,3,4]){
  const url=new URL(location.href);url.searchParams.set('seed',String(seed));url.searchParams.delete('route');history.replaceState(null,'',url);
  g.restart();g.freeze();g.advance(1600);g.press('left');let ticks=0;
  while(g.state().phase==='playing'&&g.state().distanceExact<5500&&ticks++<9000){
   const s=g.state(),remaining=s.nextTurn-s.distanceExact;
   if(remaining<5&&!s.turnQueued)g.press(s.turnDirection===-1?'left':'right');
   else if(remaining>10){
    const safe=g.groundSupport(24);
    const target=s.pickups.find(p=>!['coin','gem'].includes(p.kind)&&p.ahead>0&&p.ahead<36);
    const branch=s.course.branches.find(b=>b.from>s.distanceExact&&b.from-s.distanceExact<40);
    let lane=s.activeBranch?s.lane:1;
    if(branch)lane=seed===1?0:2;
    else if(safe.some(Boolean)&&!safe.every(Boolean))lane=safe[s.lane]?s.lane:safe.findIndex(Boolean);
    else if(target&&!s.activeBranch)lane=target.lane;
    const narrow=s.course.narrows.find(n=>s.distanceExact>=n.from-24&&s.distanceExact<=n.to+6);if(narrow)lane=narrow.side==='left'?0:2;
    const block=s.obstacles.find(o=>o.kind==='block'&&o.ahead>-5&&o.ahead<20);if(block&&lane===block.lane)lane=(block.lane+1)%3;
    if(lane!==s.lane)for(let n=0;n<Math.abs(lane-s.lane);n++)g.press(lane<s.lane?'left':'right');
   }
   const obstacle=s.obstacles.find(o=>(!o.branch||o.branch===s.activeBranch)&&o.ahead>0&&o.ahead<(o.kind==='gapLong'?8:10));
   const protectedNow=s.powers.some(p=>p.kind==='shield'||p.kind==='boost');
   if(obstacle&&!protectedNow&&!s.airborne&&!s.sliding&&!obstacle.defId.startsWith('narrow')){
    if(obstacle.kind==='block'){if(obstacle.lane===s.lane)g.press(s.lane===0?'right':'left');}
    else g.press(obstacle.kind==='arch'||obstacle.kind==='fire'&&obstacle.defId!=='fireWall'?'slide':'jump');
   }
   if(!protectedNow&&!s.airborne&&(s.course?s.course.surfaces.map(surface=>surface.from).filter(at=>at>0):[1320,2244,4308,4908]).some(at=>s.distanceExact>at-20&&s.distanceExact<at-10))g.press('jump');
   g.advance(25);
   const after=g.state();
   for(const kind of ['bonus','boost','magnet','shield'])if(after.powerPickups[kind]>s.powerPickups[kind])collections.push({seed,kind,distance:after.distanceExact,coinsAdded:after.coins-s.coins,boostBudget:after.boost.left,remaining:after.powers.find(p=>p.kind===kind)?.remaining??null});
   if(s.boost.active&&!after.boost.active)releases.push({seed,distance:after.distanceExact,phase:after.phase,lane:after.lane,airborne:after.airborne,falling:after.falling,supported:g.groundSupport()[after.lane],powers:after.powers,handover:after.boostHandover});
  }
  const run=g.state();runs.push(run);const generated=run.generation.bonuses;
  check(`seed${seed}: normal run reaches5500m`,run.phase==='playing'&&run.distanceExact>=5500);
  check(`seed${seed}: first generated power before1000m`,generated.length>0&&generated[0].distance<1000&&generated[0].distance>600);
  check(`seed${seed}: generated gaps strictly exceed600m`,generated.every((p,i)=>i===0||p.distance-generated[i-1].distance>600));
  g.advance(60000);check(`seed${seed}: failure reaches results`,g.state().phase==='ended');
  g.restart();g.freeze();check(`seed${seed}: results restart clears generator`,g.state().phase==='playing'&&g.state().lane===1&&g.state().generation.bonuses.length===0);
 }
 for(const kind of ['bonus','shield','magnet','boost'])check(`normally generated and collected ${kind}`,runs.some(run=>run.generation.bonuses.some(p=>p.kind===kind&&p.collected)));
 check('natural boost expiry observed',releases.length>0);
 check('natural boost releases grounded and supported',releases.every(r=>r.phase==='playing'&&!r.airborne&&!r.falling&&r.supported));
 history.replaceState(null,'',originalUrl);
 return {checks,runs,releases,collections};
})()
