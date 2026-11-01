// Controlled pickup fixture: isolated2-gem save, no wings. Not natural-generation proof.
(()=>{
 const g=window.__templeGame,checks=[];
 const check=(name,passed)=>{checks.push({name,passed:!!passed});if(!passed)throw Error(name);};
 g.restart();g.freeze();g.advance(1700);g.power('magnet');
 for(let i=0;i<80;i++)g.spawnCoin(1,3);
 g.advance(300);check('first collection reaches80 coins',g.state().coins>=80);
 g.advance(60000);const before=g.state();check('first failure reaches results',before.phase==='ended');
 g.revive();check('revive preserves session coins',g.state().phase==='playing'&&g.state().coins===before.coins);
 g.power('magnet');for(let i=0;i<80;i++)g.spawnCoin(g.state().lane,3);
 g.advance(300);const after=g.state();check('post-revive coins accumulate in same session',after.coins>=before.coins+80);
 g.advance(60000);const final=g.state();check('later failure reaches results',final.phase==='ended');
 g.restart();g.freeze();const saved=JSON.parse(localStorage.getItem('temple.v2.progress'));
 check('settlement records full pre/post revive total as best',saved.bestRunCoins===final.coins&&saved.lifetimeCoins===final.coins&&saved.runs===1);
 g.restart();g.freeze();const repeated=JSON.parse(localStorage.getItem('temple.v2.progress'));
 check('restart cannot double-bank or double count session',repeated.runs===1&&repeated.bestRunCoins===saved.bestRunCoins&&repeated.coins===saved.coins);
 return {checks,beforeCoins:before.coins,afterCoins:after.coins,finalCoins:final.coins,saved,nextMultiplier:g.state().scoreMultiplier};
})()
