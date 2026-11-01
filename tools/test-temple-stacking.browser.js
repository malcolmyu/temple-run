// Real game update/collision integration. Preserve and restore progress before/after.
(() => {
 const g=window.__templeGame,checks=[];
 const check=(name,ok)=>{checks.push({name,passed:!!ok});if(!ok)throw new Error(name);};
 const prep=()=>{g.restart();g.freeze();g.advance(1600);};
 const active=k=>g.state().powers.some(p=>p.kind===k);
 const drive=ms=>{for(let elapsed=0;elapsed<ms&&g.state().phase==='playing';elapsed+=25){const s=g.state();if(s.nextTurn-s.distanceExact<5&&!s.turnQueued)g.press(s.turnDirection===-1?'left':'right');g.advance(25);}};
 prep();g.spawnPickup('magnet',1,3,1.35);g.advance(250);
 g.spawnPickup('shield',1,3,1.35);g.advance(250);
 check('real magnet and shield pickups coexist',active('magnet')&&active('shield'));
 const coins=g.state().coins;g.spawnCoin(2,3,.6);g.advance(25);
 check('shield pickup preserves functional cross-lane magnet',g.state().coins>coins);
 g.spawnObstacle('hurdle',8);g.advance(600);
 check('magnet and shield retain real obstacle protection',g.state().phase==='playing'&&active('shield')&&active('magnet'));

 const all=g.state();drive(5200);
 check('timed powers continue while running',active('magnet')&&active('shield')&&g.state().phase==='playing');
 const shieldBefore=g.state().powers.find(p=>p.kind==='shield').remaining;
 g.spawnPickup('magnet',1,3,1.35);g.advance(250);
 const refreshed=g.state();
 check('repeat magnet refreshes only magnet',refreshed.powers.find(p=>p.kind==='magnet').remaining>14.7&&refreshed.powers.find(p=>p.kind==='shield').remaining<shieldBefore);
 // Normal steering, jumps and turns keep the run alive until shield's own clock expires.
 let ticks=0;
 while(active('shield')&&g.state().phase==='playing'&&ticks++<1000){
  const s=g.state();if(s.nextTurn-s.distanceExact<5&&!s.turnQueued)g.press(s.turnDirection===-1?'left':'right');
  if(s.obstacles.some(o=>o.ahead>0&&o.ahead<10)&&!s.airborne&&!s.sliding)g.press('jump');
  g.advance(25);
 }
 check('shield expires without cancelling refreshed magnet',g.state().phase==='playing'&&!active('shield')&&active('magnet'));
 const expired=g.state();prep();
 for(const kind of ['magnet','shield','boost']){g.spawnPickup(kind,1,3,1.35);g.advance(250);}
 check('boost can coexist with magnet and its own invincibility',active('magnet')&&active('shield')&&active('boost'));
 g.restart();g.freeze();
 check('new run clears every effect',g.state().powers.length===0);
 g.advance(14000);check('failure reaches results after stacking run',g.state().phase==='ended');
 g.restart();g.freeze();check('results restart returns clean playable run',g.state().phase==='playing'&&g.state().powers.length===0&&g.state().lane===1);
 return {checks,allEffects:all,afterRefresh:refreshed,afterShieldExpiry:expired};
})()
