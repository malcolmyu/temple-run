// Run on a fresh isolated save with >=2 gems and max pickup-boost upgrade.
(()=>{
 const g=window.__templeGame,checks=[],check=(name,ok)=>{checks.push({name,passed:!!ok});if(!ok)throw Error(name);};
 g.restart();g.freeze();g.advance(1700);g.power('magnet');for(let i=0;i<25;i++)g.spawnCoin(1,3);g.advance(300);
 for(let n=0;g.state().phase==='playing'&&n<800;n++){const s=g.state();if(s.distanceExact>99&&s.distanceExact<106&&!s.airborne)g.press('jump');g.advance(25);}g.advance(600);
 const before=g.state(),bank=JSON.parse(localStorage.getItem('temple.v2.progress'));
 check('natural missed turn reaches results with meter/magnet',before.phase==='ended'&&before.coinMeter.count>0&&before.powers.some(p=>p.kind==='magnet'));
 g.revive();let s=g.state();
 check('revive costs exactly2 gems and keeps run rewards',JSON.parse(localStorage.getItem('temple.v2.progress')).gems===bank.gems-2&&s.coins===before.coins&&s.score===before.score);
 check('fixed resurrection budget150+50 ignores pickup upgrade',s.boost.active&&s.boost.left===200);
 check('revive clears old powers and starts fresh native4s protection',!s.powers.some(p=>p.kind==='magnet')&&s.powers.find(p=>p.kind==='shield').remaining===4);
 check('revive clears meter and resets native catch age',s.coinMeter.count===0&&s.coinMeter.level===1&&s.stumbleAge===20);
 check('revive speed follows native floor and death slowdown',Math.abs(s.speed-Math.max(20,before.speed*.8500000238418579))<1e-6&&s.boost.speedBefore===s.speed);
 const distance=s.distanceExact;g.advance(300);check('revived player immediately moves safely',g.state().phase==='playing'&&g.state().distanceExact>distance&&!g.state().falling);
 let ticks=0;while(g.state().phase==='playing'&&g.state().boost.active&&ticks++<1000)g.advance(25);
 check('resurrection boost exits alive after automatic corners',g.state().phase==='playing'&&!g.state().boost.active);
 g.advance(60000);check('second death reaches results without free second revive',g.state().phase==='ended');g.revive();check('second revive request does not charge or resume',g.state().phase==='ended'&&JSON.parse(localStorage.getItem('temple.v2.progress')).gems===bank.gems-2);
 g.restart();g.freeze();check('restart clears resurrection boost',!g.state().boost.active&&g.state().coinMeter.count===0);
 return {checks,passed:checks.filter(c=>c.passed).length,total:checks.length};
})()
