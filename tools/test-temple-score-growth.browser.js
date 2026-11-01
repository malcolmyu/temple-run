// Local test: start with an isolated empty save and fresh page; restore save externally.
(async()=>{
 const bank=()=>JSON.parse(localStorage.getItem('temple.v2.progress'));
 const g=window.__templeGame,checks=[],check=(name,ok)=>{checks.push({name,passed:!!ok});if(!ok)throw Error(name);};
 g.restart();g.freeze();g.advance(1700);check('new player starts at native base10',g.state().scoreMultiplier===10);
 const before=g.state();g.spawnCoin(1,3);g.advance(300);const after=g.state();
 check('coin uses run multiplier along with integer distance score',after.coins>before.coins&&after.score-before.score===(Math.floor(after.progressDistance)-Math.floor(before.progressDistance))*10+(after.coins-before.coins)*50);
 for(let ticks=0;g.state().phase==='playing'&&g.state().progressDistance<510&&ticks<3000;ticks++){
  const s=g.state(),remaining=s.nextTurn-s.distanceExact;
  if(remaining<5&&!s.turnQueued)g.press(s.turnDirection===-1?'left':'right');
  else if(remaining>10){const b=s.course.branches.find(b=>b.from>s.distanceExact&&b.from-s.distanceExact<40);if(b&&s.lane!==0)g.press('left');}
  const obstacle=s.obstacles.find(o=>o.ahead>0&&o.ahead<10);
  if(obstacle&&!s.airborne&&!s.sliding)g.press(obstacle.kind==='arch'||obstacle.kind==='fire'?'slide':'jump');
  g.advance(25);
 }
 check('normal driving earns500m objective',g.state().phase==='playing'&&g.state().progressDistance>=500);
 check('current run multiplier stays fixed',g.state().scoreMultiplier===10);
 g.advance(60000);check('failure reaches results retaining10x',g.state().phase==='ended'&&g.state().scoreMultiplier===10);
 g.restart();g.freeze();check('banking objective gives next run11x',g.state().scoreMultiplier===11&&bank().bestDistance>=500);
 g.advance(60000);check('next results retain11x',g.state().phase==='ended'&&g.state().scoreMultiplier===11);
 return {checks,passed:checks.filter(c=>c.passed).length,total:checks.length,bestDistance:bank().bestDistance};
})()
