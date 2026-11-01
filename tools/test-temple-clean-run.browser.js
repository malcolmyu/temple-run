// Natural generated run, avoid pickups for the opening1100 metric metres.
(()=>{const g=window.__templeGame,seed=1,longJumps=[],original=location.href;
const url=new URL(location.href);url.searchParams.set('seed','1');url.searchParams.delete('route');history.replaceState(null,'',url);
g.restart();g.freeze();g.advance(1600);g.press('left');let ticks=0;
while(g.state().phase==='playing'&&ticks++<20000){
 const s=g.state(),remaining=s.nextTurn-s.distanceExact;
 if(s.progressDistance>=5200&&remaining<12&&!s.turnQueued&&!s.boost.active)break;
   if(remaining<5&&!s.turnQueued)g.press(s.turnDirection===-1?'left':'right');
   else if(remaining>10){
    const branch=s.course.branches.find(b=>b.from>s.distanceExact&&b.from-s.distanceExact<40);
    const safe=g.groundSupport(24);
    let lane=s.lane;
    if(branch)lane=seed===1?0:2;
    else if(safe.some(Boolean)&&!safe.every(Boolean))lane=safe[s.lane]?s.lane:safe.findIndex(Boolean);
    if(s.progressDistance<1100){
     const blocked=new Set(s.pickups.filter(p=>p.kind!=='gem'&&p.ahead>-8&&p.ahead<32).map(p=>p.lane));
     const choices=safe.map((ok,i)=>ok&&!blocked.has(i)?i:-1).filter(i=>i>=0);
     if(choices.length&&!choices.includes(lane))lane=choices[0];
    }
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
const end=g.state();g.advance(60000);const failed={phase:g.state().phase,death:g.death(),challenges:g.state().runChallenges};g.restart();g.freeze();
const save=JSON.parse(localStorage.getItem('temple.v2.progress'));
history.replaceState(null,'',original);
return {checks:[{name:'normal run passes5200 metric metres',passed:end.phase==='playing'&&end.progressDistance>=5200},{name:'opening1000 metres avoided coins',passed:end.runChallenges.summary.coinFreeStart>=1000},{name:'no actual stumble through clean run',passed:!end.runChallenges.stumbled},{name:'missed-turn failure reaches results',passed:failed.phase==='ended'&&failed.death.kind==='missed'},{name:'both challenge records settled',passed:save.bestCoinFreeStart>=1000&&save.bestCleanRunDistance>=5000},{name:'new run clears conditional flags',passed:g.state().runChallenges.firstCoinDistance===null&&!g.state().runChallenges.stumbled}],end,failed,save};})()
