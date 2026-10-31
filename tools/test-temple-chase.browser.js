// Local regression: preserve/restore save externally. Revive case needs >=2 banked gems.
(()=>{
 const g=window.__templeGame,checks=[];const check=(name,ok)=>{checks.push({name,passed:!!ok});if(!ok)throw new Error(name);};
 const key=code=>{for(const type of ['keydown','keyup'])window.dispatchEvent(new KeyboardEvent(type,{code}));};
 const prep=()=>{g.restart();g.freeze();};
 const until=(predicate,max=2000)=>{let n=0;while(!predicate(g.state())&&g.state().phase==='playing'&&n++<max)g.advance(25);};
 const firstTrip=()=>{prep();until(s=>s.distanceExact>=110);check('natural root: first stumble survives',g.state().phase==='playing'&&g.state().stumbleAge<.3&&g.state().stumbleRemaining>0);};
 firstTrip();const far=g.state().enemyGap;key('ArrowUp');g.advance(25);check('stumble action timer rejects jump',!g.state().airborne);
 g.advance(550);check('pack approaches after stumble',g.state().enemyGap<far&&g.state().enemyGap<=3);
 g.spawnObstacle('trip',5);until(s=>s.phase==='ended');g.advance(600);
 check('second root inside 10s catches player',g.state().phase==='ended'&&g.death().kind==='caught');
 g.revive();check('caught revive re-enters same run',g.state().phase==='playing'&&g.state().stumbleAge===7);
 g.spawnObstacle('trip',5);g.advance(400);check('revive protection prevents immediate repeat death',g.state().phase==='playing'&&g.state().stumbleAge>7);
 firstTrip();
 for(let n=0;g.state().phase==='playing'&&g.state().stumbleAge<10.1&&n<1500;n++){
  const s=g.state();if(s.nextTurn-s.distanceExact<5&&!s.turnQueued)key(s.turnDirection===-1?'ArrowLeft':'ArrowRight');
  const o=s.obstacles.find(o=>o.ahead>0&&o.ahead<10&&o.kind!=='trip');
  if(o&&!s.airborne&&!s.sliding)key(o.kind==='arch'||o.kind==='fire'?'ArrowDown':'ArrowUp');g.advance(25);
 }
 check('safe driving recovers 10s stumble window',g.state().phase==='playing'&&g.state().stumbleAge>=10);
 check('pack retreats after recovery',g.state().enemyGap>=4.5);
 // Wait until grounded and not sliding before the test contact.
 until(s=>!s.airborne&&!s.sliding);g.spawnObstacle('trip',6);until(s=>s.stumbleAge<1,120);
 check('new stumble after window survives',g.state().phase==='playing'&&g.state().stumbleAge<1);
 prep();g.power('shield');g.spawnObstacle('trip',30);until(s=>s.distanceExact>34);
 check('shielded early root does not start stumble/catch',g.state().phase==='playing'&&g.state().stumbleRemaining===0&&g.state().stumbleAge>7);
 return {checks,passed:checks.filter(c=>c.passed).length,total:checks.length};
})()
