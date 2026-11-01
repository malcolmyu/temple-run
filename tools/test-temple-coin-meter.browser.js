// Isolated pickup fixtures through real collision/update; save must be empty, upgrades0.
(()=>{
 const g=window.__templeGame,checks=[],check=(name,ok)=>{checks.push({name,passed:!!ok});if(!ok)throw Error(name);};
 const coins=n=>{for(let i=0;i<n;i++)g.spawnCoin(1,3);g.advance(300);};
 g.restart();g.freeze();g.advance(1700);const initial=g.state();coins(25);
 check('25 coins give25 charge and no free timed power',g.state().coins===25&&g.state().coinMeter.count===25&&g.state().powers.length===0);
 coins(75);let s=g.state();
 check('100 coins fill once and raise level2',s.coins===100&&s.coinMeter.count===0&&s.coinMeter.level===2);
 check('fill awards500 times run multiplier alongside coin/distance score',s.score-initial.score===(Math.floor(s.progressDistance)-Math.floor(initial.progressDistance))*s.scoreMultiplier+100*5*s.scoreMultiplier+500*s.scoreMultiplier);
 check('fill does not activate random power',s.powers.length===0);
 coins(50);const before=g.state();g.spawnPickup('bonus',1,3,1.35);g.advance(300);s=g.state();
 check('bonus pickup adds50 and fills accumulated meter',s.coins===200&&s.coinMeter.count===0&&s.coinMeter.level===3&&s.coinMeter.maxLevel===3);
 check('bonus fill score includes pickup25 and meter500',s.score-before.score===(Math.floor(s.progressDistance)-Math.floor(before.progressDistance))*s.scoreMultiplier+525*s.scoreMultiplier);
 coins(10);for(let n=0;g.state().distanceExact<110&&g.state().phase==='playing'&&n<600;n++)g.advance(25);s=g.state();
 check('natural root stumble clears charge and resets level',s.phase==='playing'&&s.stumbleRemaining>0&&s.coinMeter.count===0&&s.coinMeter.level===1&&s.coinMeter.maxLevel===3);
 g.advance(60000);check('failure still reaches results',g.state().phase==='ended');g.restart();g.freeze();
 check('restart clears meter and level history',g.state().coinMeter.count===0&&g.state().coinMeter.level===1&&g.state().coinMeter.maxLevel===0);
 return {checks,passed:checks.filter(c=>c.passed).length,total:checks.length};
})()
