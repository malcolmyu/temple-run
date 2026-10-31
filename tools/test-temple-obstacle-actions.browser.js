// Isolated obstacle fixtures, real input/collision/update. Preserve save externally.
(()=>{
 const g=window.__templeGame,checks=[],check=(name,ok)=>{checks.push({name,passed:!!ok});if(!ok)throw Error(name);};
 const prep=(id,lane=1)=>{g.restart();g.freeze();g.advance(4300);const at=g.state().distanceExact;g.spawnObstacleDef(id,lane,12);return at+12;};
 const run=(at,action)=>{let acted=false;for(let n=0;g.state().phase==='playing'&&g.state().distanceExact<at+4&&n<100;n++){const s=g.state();if(action&&!acted&&at-s.distanceExact<8){g.press(action);acted=true;}g.advance(25);}return g.state();};
 let at=prep('towerArch'),s=run(at);check('decorative arch standing passage does not stumble',s.phase==='playing'&&s.stumbleAge>10&&s.stumbleRemaining===0);
 for(const [id,action,safe] of [['flameTower',null,false],['flameTower','jump',true],['flameTower','slide',true],['treeSlide',null,false],['treeSlide','slide',true],['treeSlide','jump',false]]){
  at=prep(id);s=run(at,action);check(id+': '+(action??'standing')+' collision result',safe?s.phase==='playing':s.phase==='dying'&&g.death().kind==='impact');
  if(!safe){g.advance(600);check(id+': failure reaches results',g.state().phase==='ended');}
 }
 at=prep('stonePedestal',1);g.press('left');s=run(at);check('stone pedestal can be avoided by lane change',s.phase==='playing'&&s.lane===0&&s.stumbleAge>10);
 at=prep('stonePedestal',1);s=run(at);check('stone pedestal first impact stumbles instead of being ignored',s.phase==='playing'&&s.stumbleAge<1);
 g.spawnObstacleDef('stonePedestal',1,5);for(let n=0;g.state().phase==='playing'&&n<80;n++)g.advance(25);check('repeated pedestal impact triggers chase failure',g.state().phase==='dying'&&g.death().kind==='caught');g.advance(600);check('pedestal failure reaches results',g.state().phase==='ended');
 g.restart();g.freeze();check('restart clears all fixture obstacles and failure',g.state().phase==='playing'&&g.state().stumbleAge===7);
 return {checks,passed:checks.filter(c=>c.passed).length,total:checks.length};
})()
