// Two normal seeded runs. No spawned fixtures, teleports, forced powers or collision overrides.
// Uniform random selection permits repeats: coverage is across seeds, not a per-run quota.
(() => {
 const g=window.__templeGame,runs=[],originalUrl=location.href,checks=[];
 const check=(name,ok)=>checks.push({name,passed:!!ok});
 for(const seed of [1,2]){
  const url=new URL(location.href);url.searchParams.set('seed',String(seed));url.searchParams.delete('route');history.replaceState(null,'',url);
  g.restart();g.freeze();g.advance(1600);g.press('left');let ticks=0;
  while(g.state().phase==='playing'&&g.state().distanceExact<5500&&ticks++<9000){
   const s=g.state(),remaining=s.nextTurn-s.distanceExact;
   if(remaining<5&&!s.turnQueued)g.press(s.turnDirection===-1?'left':'right');
   else if(remaining>10){
    const safe=g.groundSupport(24);
    const target=s.pickups.find(p=>!['coin','gem'].includes(p.kind)&&p.ahead>0&&p.ahead<36);
    let lane=s.lane;
    if(safe.some(Boolean)&&!safe.every(Boolean))lane=safe[s.lane]?s.lane:safe.findIndex(Boolean);
    else if(target)lane=target.lane;
    if(lane!==s.lane)for(let n=0;n<Math.abs(lane-s.lane);n++)g.press(lane<s.lane?'left':'right');
   }
   const obstacle=s.obstacles.find(o=>o.ahead>0&&o.ahead<(o.kind==='gapLong'?8:10));
   const protectedNow=s.powers.some(p=>p.kind==='shield'||p.kind==='boost');
   if(obstacle&&!protectedNow&&!s.airborne&&!s.sliding&&!obstacle.defId.startsWith('narrow')){
    if(obstacle.kind==='block'){if(obstacle.lane===s.lane)g.press(s.lane===0?'right':'left');}
    else g.press(obstacle.kind==='arch'||obstacle.kind==='fire'?'slide':'jump');
   }
   if(!protectedNow&&!s.airborne&&(s.course?s.course.surfaces.map(surface=>surface.from).filter(at=>at>0):[1320,2244,4308,4908]).some(at=>s.distanceExact>at-20&&s.distanceExact<at-10))g.press('jump');
   g.advance(25);
  }
  const run=g.state();runs.push(run);const generated=run.generation.bonuses;
  check(`seed${seed}: normal run reaches5500m`,run.phase==='playing'&&run.distanceExact>=5500);
  check(`seed${seed}: first generated power before1000m`,generated.length>0&&generated[0].distance<1000&&generated[0].distance>600);
  check(`seed${seed}: generated gaps strictly exceed600m`,generated.every((p,i)=>i===0||p.distance-generated[i-1].distance>600));
  g.advance(60000);check(`seed${seed}: failure reaches results`,g.state().phase==='ended');
  g.restart();g.freeze();check(`seed${seed}: results restart clears generator`,g.state().phase==='playing'&&g.state().lane===1&&g.state().generation.bonuses.length===0);
 }
 for(const kind of ['bonus','shield','magnet','boost'])check(`normally generated and collected ${kind}`,runs.some(run=>run.generation.bonuses.some(p=>p.kind===kind&&p.collected)));
 history.replaceState(null,'',originalUrl);
 return {checks,runs};
})()
