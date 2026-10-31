// DevTools regression, with an isolated save owning every catalogue character.
// Preserve/restore the original localStorage outside this script.
(async()=>{
 const g=window.__templeGame,checks=[];
 const key=code=>{for(const type of ['keydown','keyup'])window.dispatchEvent(new KeyboardEvent(type,{code}));};
 const check=(name,passed)=>{checks.push({name,passed:!!passed});if(!passed)throw new Error(name);};
 for(const id of ['jhony','selene','scarlett','werewolf','barry','karma','conquistador','ghost','skeleton']){
  await g.setSkin(id);g.restart();g.freeze();g.advance(1700);
  check(id+': loaded in normal game',g.state().equipped===id&&g.state().rig==='ready'&&g.state().phase==='playing');
  key('ArrowLeft');g.advance(200);check(id+': left survives',g.state().phase==='playing'&&g.state().lane===0);
  key('ArrowRight');g.advance(200);check(id+': right survives',g.state().phase==='playing'&&g.state().lane===1);
  key('ArrowUp');g.advance(100);check(id+': jump',g.state().airborne);
  g.advance(1000);key('ArrowDown');g.advance(100);check(id+': slide',g.state().sliding>0);
  for(let n=0;g.state().phase!=='ended'&&n<500;n++)g.advance(50);
  check(id+': natural death reaches results',g.state().phase==='ended');
 }
 return {checks,passed:checks.filter(x=>x.passed).length,total:checks.length};
})()
