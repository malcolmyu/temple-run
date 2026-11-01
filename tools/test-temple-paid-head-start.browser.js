// Run immediately after a real HUD inventory activation, with the game frozen. No seek/spawn.
(() => {
 const g=window.__templeGame,start=g.state(),checks=[],samples=[];
 const check=(name,passed)=>checks.push({name,passed:!!passed});
 const target=start.headStart==='normal'?950:2350;
 check('paid head-start is active with native normal boost mode',!!start.headStart&&start.boost.active&&!start.boost.mega&&Math.abs(start.boost.left-(target-start.progressDistance+50))<.01);
 let maxSpeed=0,ticks=0;
 while(g.state().phase==='playing'&&g.state().boost.active&&ticks++<10000){
  const s=g.state();maxSpeed=Math.max(maxSpeed,s.speed);if(ticks%100===0)samples.push({distance:s.distanceExact,progress:s.progressDistance,boost:s.boost,pickups:s.powerPickups});g.advance(25);
 }
 const after=g.state();
 check('head-start auto-turns and exits alive',after.phase==='playing'&&!after.boost.active&&after.turnCount>=2);
 check('both paid starts obey84 speed cap',maxSpeed<=84.01);
 check('starting power excluded, naturally collected boost counted',start.powerPickups.boost===0&&after.powerPickups.boost===after.generation.bonuses.filter(b=>b.kind==='boost'&&b.collected).length);
 g.advance(60000);const ended=g.state();check('post-start failure reaches results',ended.phase==='ended');
 g.restart();g.freeze();const restart=g.state();check('restart clears paid start without rebuying',restart.headStart===null&&!restart.boost.active&&restart.phase==='playing');
 return {checks,start,after,ended,restart,samples,maxSpeed};
})()
