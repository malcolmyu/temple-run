// Fresh page after UI buying coinSpawn level5; normal route, no teleports/invincibility.
(()=>{
 const g=window.__templeGame,checks=[],check=(name,ok)=>{checks.push({name,passed:!!ok});if(!ok)throw Error(name);};
 const original=location.href,url=new URL(original);url.searchParams.set('seed','1');url.searchParams.delete('route');history.replaceState(null,'',url);const seed=1,expectedLevel=JSON.parse(localStorage.getItem('temple.v2.progress')).upgrades.coinSpawn??0;
 g.restart();g.freeze();g.advance(1700);g.press('left');
 check('fresh run snapshots purchased level',g.state().coinSpawnLevel===expectedLevel);
 const colors=new Set();let firstRed=null,firstBlue=null,ticks=0;
 while(g.state().phase==='playing'&&g.state().progressDistance<2350&&ticks++<6000){
  const sample=g.state();for(const p of sample.pickups.filter(p=>p.kind==='coin')){colors.add(p.value);if(p.value===2&&firstRed===null)firstRed=sample.progressDistance;if(p.value===3&&firstBlue===null)firstBlue=sample.progressDistance;}
   const s=g.state(),remaining=s.nextTurn-s.distanceExact;



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
    else{g.press(obstacle.kind==='arch'||obstacle.kind==='fire'?'slide':'jump');}
   }
   if(!protectedNow&&!s.airborne&&s.course.surfaces.some(surface=>surface.from>0&&s.distanceExact>surface.from-20&&s.distanceExact<surface.from-10))g.press('jump');
   g.advance(25);
 }
 const end=g.state();check('normal driving reaches2350 metric progress',end.phase==='playing'&&end.progressDistance>=2350);
 check('normal generation respects upgraded/base coin colors',expectedLevel===0?colors.size===1&&colors.has(1):colors.has(1)&&colors.has(2)&&colors.has(3));
 check('red/blue do not appear before native progress thresholds',expectedLevel===0?firstRed===null&&firstBlue===null:firstRed>=1000&&firstBlue>=2000);
 g.advance(60000);check('failure reaches results after high-value run',g.state().phase==='ended');g.restart();g.freeze();g.advance(1700);
 check('restart keeps upgrade but returns coin generation to yellow',g.state().coinSpawnLevel===expectedLevel&&g.state().pickups.filter(p=>p.kind==='coin').every(p=>p.value===1));
 history.replaceState(null,'',original);return {checks,passed:checks.filter(c=>c.passed).length,total:checks.length,expectedLevel,firstRed,firstBlue,end};
})()
