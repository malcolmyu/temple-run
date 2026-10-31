// Run after UI purchasing boost level4; preserve/restore save outside test.
(()=>{
 const g=window.__templeGame,checks=[],check=(name,ok)=>{checks.push({name,passed:!!ok});if(!ok)throw Error(name);};
 g.restart();g.freeze();g.advance(1700);g.spawnPickup('boost',1,3,1.35);g.advance(300);
 let s=g.state();check('max upgrade pickup uses750 plus50 allowance',s.boost.active&&s.boost.left>790&&s.boost.left<=800);
 const beforeSpeed=s.boost.speedBefore;g.advance(1000);const beforeRefresh=g.state();
 g.spawnPickup('boost',1,3,1.35);g.advance(100);s=g.state();
 check('repeat pickup refreshes upgraded budget and preserves baseline speed',s.boost.left>beforeRefresh.boost.left&&s.boost.left>780&&s.boost.speedBefore===beforeSpeed);
 const shield=s.powers.find(p=>p.kind==='shield').remaining;
 g.advance(500);s=g.state();check('cruise freezes native4s protection clock',Math.abs(s.powers.find(p=>p.kind==='shield').remaining-shield)<.01);
 let n=0,braking=false,maxSpeed=0;
 while(g.state().phase==='playing'&&g.state().boost.active&&n++<1500){const t=g.state();braking ||= t.boost.left<=50;maxSpeed=Math.max(maxSpeed,t.speed);g.advance(25);}
 s=g.state();check('upgraded boost traverses corners and exits alive',s.phase==='playing'&&!s.boost.active&&s.turnCount>=2);
 check('upgraded boost brakes and keeps normal speed cap',braking&&maxSpeed<=84.01&&s.speed<maxSpeed);
 g.advance(60000);check('post-boost failure reaches results',g.state().phase==='ended');g.restart();g.freeze();
 check('restart clears boost and retains upgrade save',!g.state().boost.active&&JSON.parse(localStorage.getItem('temple.v2.progress')).upgrades.boost===4);
 return {checks,passed:checks.filter(c=>c.passed).length,total:checks.length,last:s};
})()
