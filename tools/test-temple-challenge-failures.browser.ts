// Isolated2-gem save. Real keyboard input plus a controlled coin/tree-trip fixture.
(()=>{const g=window.__templeGame,checks=[];
 const check=(name,passed)=>{checks.push({name,passed:!!passed});if(!passed)throw Error(name);};
 const key=code=>{for(const type of ['keydown','keyup'])window.dispatchEvent(new KeyboardEvent(type,{code}));};
 g.restart();g.freeze();g.advance(1700);key('ArrowLeft');g.advance(180);let s=g.state();
 check('ordinary left is safe and does not mark stumble',s.phase==='playing'&&s.lane===0&&!s.runChallenges.stumbled);
 key('ArrowRight');g.advance(180);s=g.state();check('ordinary right is safe and does not mark stumble',s.phase==='playing'&&s.lane===1&&!s.runChallenges.stumbled);
 g.advance(2600);g.power('magnet');g.spawnCoin(1,3);g.advance(300);
 const opening=g.state().runChallenges.firstCoinDistance;
 check('first coin locks a short opening prefix',opening!==null&&opening<500);
 g.spawnObstacleDef('treeTrip',1,2);g.advance(300);const stumbled=g.state();
 check('actual obstacle marks stumble',stumbled.runChallenges.stumbled);
 g.advance(60000);check('failure reaches results',g.state().phase==='ended');g.revive();const revived=g.state();
 check('paid revive does not erase action conditions',revived.phase==='playing'&&revived.runChallenges.stumbled&&revived.runChallenges.firstCoinDistance===opening);
 g.advance(60000);check('revived run can fail to results',g.state().phase==='ended');g.restart();g.freeze();
 const saved=JSON.parse(localStorage.getItem('temple.v2.progress'));
 check('stumbled run cannot establish clean-run record',saved.bestCleanRunDistance===0);
 check('later coin-free period cannot replace opening prefix',saved.bestCoinFreeStart===Math.floor(opening));
 check('restart clears condition flags',!g.state().runChallenges.stumbled&&g.state().runChallenges.firstCoinDistance===null);
 return {checks,opening,stumbled:{phase:stumbled.phase,challenges:stumbled.runChallenges},revived:{phase:revived.phase,challenges:revived.runChallenges},saved};})()
