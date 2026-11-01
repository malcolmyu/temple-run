// Isolated seed1 QA save; natural approach plus explicit collision fixture for audio.
(()=>{
 const g=window.__templeGame,checks=[],check=(name,ok)=>{checks.push({name,passed:!!ok});if(!ok)throw Error(name);};
 const prep=()=>{g.restart();g.freeze();g.advance(1600);g.press('left');g.advance(100);};
 prep();check('ground footsteps active',g.audioLoops().some(n=>n.startsWith('step')));
 g.press('jump');g.advance(100);check('airborne silent footsteps',g.state().airborne&&!g.audioLoops().some(n=>n.startsWith('step')));
 g.advance(900);check('landing restores footsteps',!g.state().airborne&&g.audioLoops().some(n=>n.startsWith('step')));
 g.pause();check('pause stops footsteps',!g.audioLoops().some(n=>n.startsWith('step')));g.pause();g.advance(25);
 check('resume restores footsteps',g.audioLoops().some(n=>n.startsWith('step')));
 prep();g.spawnObstacleDef('treeJump',1,12);for(let i=0;i<120&&g.state().phase==='playing';i++)g.advance(25);g.advance(1200);
 check('impact reaches results and no footsteps',g.state().phase==='ended'&&!g.audioLoops().some(n=>n.startsWith('step')));
 prep();for(let i=0;i<1200&&g.state().phase==='playing';i++){const s=g.state();if(s.obstacles.some(o=>o.ahead>0&&o.ahead<10)&&!s.airborne)g.press('jump');g.advance(25);}g.advance(1200);
 check('missed corner reaches results and no footsteps',g.state().phase==='ended'&&g.death().kind==='missed'&&!g.audioLoops().some(n=>n.startsWith('step')));
 prep();check('restart resets failure',g.state().phase==='playing'&&g.death().kind===''&&g.state().session.deaths===0);
 return {checks,passed:checks.filter(c=>c.passed).length,total:checks.length};
})()
