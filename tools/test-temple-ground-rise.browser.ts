// QA seek isolates the wood→stone support-plane change; not natural-generation evidence.
(() => {
 const g=window.__templeGame,checks=[],runs=[];
 const check=(name,ok)=>checks.push({name,passed:!!ok});
 for(const mode of ['walk','jump','shield']){
  g.restart();g.freeze();g.advance(1600);g.press('left');
  g.planTheme(1,500);g.planTheme(2,500);
  const wood=g.state().course.surfaces.find(s=>s.kind==='wood');
  g.jumpTo(wood.to-(mode==='jump'?10:.1));
  if(mode==='jump')g.press('jump');
  if(mode==='shield')g.power('shield');
  const before=g.state();let ticks=0;
  while(g.state().phase==='playing'&&g.state().distanceExact<wood.to+4&&ticks++<200)g.advance(25);
  const after=g.state();
  if(mode==='walk'){
   g.advance(1000);check('unprotected ground rise dies and reaches results',g.state().phase==='ended'&&g.death().kind==='fall');
  }else check(mode+' clears support-plane rise',after.phase==='playing'&&after.distanceExact>=wood.to+4&&after.groundY===0);
  runs.push({mode,boundary:wood.to,before,after,death:g.death()});
 }
 g.advance(60000);check('protected run can later fail normally',g.state().phase==='ended');g.restart();g.freeze();
 check('restart resets vertical state',g.state().phase==='playing'&&g.state().jumpY===0&&g.state().groundY===0&&!g.state().falling);
 return {checks,runs};
})()
