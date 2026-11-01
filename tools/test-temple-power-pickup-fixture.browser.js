// Controlled20-per-kind physical pickup fixture. Isolated2-gem save, not a
// demonstration that natural generation delivers20 of each kind in this run.
(()=>{const g=window.__templeGame,checks=[];
 const check=(name,passed)=>{checks.push({name,passed:!!passed});if(!passed)throw Error(name);};
 const kinds=['magnet','shield','boost','bonus'];
 g.restart();g.freeze();g.advance(1700);
 for(const kind of ['magnet','shield','boost'])g.power(kind);
 check('direct activation does not count as pickup',Object.values(g.state().powerPickups).every(n=>n===0));
 for(const kind of kinds)for(let i=0;i<20;i++)g.spawnPickup(kind,1,3,1.35);
 g.advance(300);const collected=g.state().powerPickups;
 check('each of80 physical pickups counted exactly once',kinds.every(k=>collected[k]===20));
 g.advance(100);check('render/update frames do not recount collected objects',kinds.every(k=>g.state().powerPickups[k]===20));
 g.pause();g.advance(1000);check('pause does not add pickup counts',kinds.every(k=>g.state().powerPickups[k]===20));g.pause();
 g.advance(60000);check('collected powers can expire and run fails to results',g.state().phase==='ended');
 const before=g.state().powerPickups;g.revive();const after=g.state();
 check('resurrection boost does not count or erase pickups',after.phase==='playing'&&kinds.every(k=>after.powerPickups[k]===before[k]));
 g.advance(60000);check('later failure reaches results',g.state().phase==='ended');const final=g.state().powerPickups;
 g.restart();g.freeze();const saved=JSON.parse(localStorage.getItem('temple.v2.progress'));
 check('all20 thresholds settle with same-session counts',kinds.every(k=>saved.bestPowerPickups[k]===final[k]&&final[k]>=20));
 check('new run clears all pickup counts',Object.values(g.state().powerPickups).every(n=>n===0));
 g.restart();g.freeze();const repeated=JSON.parse(localStorage.getItem('temple.v2.progress'));
 check('repeat restart does not sum/bank pickup record twice',repeated.runs===saved.runs&&kinds.every(k=>repeated.bestPowerPickups[k]===saved.bestPowerPickups[k]));
 return {checks,collected,beforeRevive:before,afterRevive:after.powerPickups,final,saved};})()
