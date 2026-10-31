// Diagnostic seek isolates each transition; no protection is forced.
(()=>{
 const g=window.__templeGame,checks=[],runs=[];const check=(name,ok)=>checks.push({name,passed:!!ok});
 for(const exit of [false,true])for(const jump of [false,true]){
  g.restart();g.freeze();g.advance(1600);g.press('left');g.planTheme(3,600);g.planTheme(2,600);
  const cliff=g.state().course.surfaces.find(s=>s.level===3),at=exit?cliff.to-17:cliff.from-10;
  g.jumpTo(at);const before=g.state(),scene=g.scene();if(jump)g.press('jump');g.advance(1500);
  const after=g.state();check((exit?'exit':'entry')+(jump?' jump clears native cap gap':(exit?' walk descends safely':' walk fails rising cap gap')),jump||exit?after.phase==='playing'&&!after.falling:after.phase==='ended');
  check('cap model instantiated',scene.cliffCapsLoaded&&scene.nativeCliffCaps>0);
  runs.push({exit,jump,before,scene,after,death:g.death()});
 }
 g.advance(60000);check('successful crossing can later fail to results',g.state().phase==='ended');g.restart();g.freeze();
 check('restart clears falling state',g.state().phase==='playing'&&!g.state().falling&&g.state().distanceExact===-2);
 return {checks,runs};
})()
