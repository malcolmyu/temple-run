// Local browser integration fixture. Requires one purchased tier of each upgrade.
// Preserve/restore temple.v2.progress around this test; spawn real pickups, keep real collisions.
(() => {
  const g=window.__templeGame, checks=[];
  const check=(name,ok)=>{checks.push({name,passed:!!ok});if(!ok)throw new Error(name);};
  const bank=()=>JSON.parse(localStorage.getItem('temple.v2.progress'));
  const prep=()=>{g.restart();g.freeze();g.advance(1600);};
  prep();g.spawnPickup('magnet',1,3,1.35);g.advance(250);
  check('purchased magnet picked up: 20 seconds',g.state().power==='magnet'&&g.state().powerRemaining>19.7&&g.state().powerRemaining<=20);
  g.spawnPickup('shield',2,8,1.35);g.spawnPickup('gem',2,8,1);g.advance(25);
  check('magnet does not vacuum shield or gem',g.state().power==='magnet'&&g.state().pickups.filter(p=>p.kind==='shield'||p.kind==='gem').length===2&&g.state().gems===0);
  g.spawnPickup('bonus',1,1,1.35);g.advance(25);
  check('purchased bonus gives 75 and preserves active power',g.state().coins===75&&g.state().power==='magnet');
  for(let i=0;i<4;i++)g.spawnCoin(2,3,.6);g.advance(25);
  check('magnet collects other-lane coins; purchased value gives five for four',g.state().coins===80);
  g.spawnPickup('shield',1,3,1.35);g.advance(250);
  check('purchased shield picked up: 17.5 seconds',g.state().power==='shield'&&g.state().powerRemaining>17.2&&g.state().powerRemaining<=17.5);
  prep();for(let i=0;i<4;i++)g.spawnCoin(1,1,.6);g.spawnPickup('gem',1,1,1);g.advance(100);
  check('coin and gem pickups work normally',g.state().coins===5&&g.state().gems===1);
  const initial=bank();g.advance(13000);
  check('normal failure enters results',g.state().phase==='ended');g.revive();
  check('revive resumes same run and spends two gems across run and bank',g.state().phase==='playing'&&g.state().coins===5&&g.state().gems===0&&bank().gems===initial.gems-1);
  g.advance(13000);check('revived run can fail again',g.state().phase==='ended');
  const beforeSecondRevive=bank();g.revive();
  check('second revive unavailable without spending',g.state().phase==='ended'&&bank().gems===beforeSecondRevive.gems);
  const final=g.state();g.restart();g.freeze();const committed=bank();
  check('final settlement banks one run and its coins once',committed.runs===initial.runs+1&&committed.coins===initial.coins+final.coins);
  g.restart();g.freeze();check('restarting again cannot double-bank',bank().runs===committed.runs&&bank().coins===committed.coins);
  return {checks,initialBank:initial,finalBank:committed,finalRun:final};
})()
