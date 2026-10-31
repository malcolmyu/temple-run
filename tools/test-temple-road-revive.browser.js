// Requires an isolated bank with >=4 gems. Restore original progress after running.
(() => {
 const g=window.__templeGame,checks=[];
 const check=(name,ok)=>checks.push({name,passed:!!ok});
 const bank=()=>JSON.parse(localStorage.getItem('temple.v2.progress'));
 const prep=()=>{g.restart();g.freeze();g.advance(1600);};
 const initial=bank();prep();g.planAhead(6000,3000);const branch=g.state().course.branches[0];g.jumpTo(branch.from-8);g.advance(8000);
 check('branch centre failure reaches results',g.state().phase==='ended'&&g.death().kind==='water');
 g.revive();const revived=g.state();check('revive selects a supported road',revived.phase==='playing'&&revived.activeBranch==='left'&&g.groundSupport()[1]);
 g.advance(25);const first=g.state();
 check('revive immediately moves instead of replaying intro hold',first.distanceExact>revived.distanceExact);
 check('revive does not grant opening displacement progress',first.progressDistance-revived.progressDistance<1);
 g.advance(1500);check('revived branch merges and remains playable',g.state().phase==='playing'&&!g.state().activeBranch);
 check('revive charges exactly two gems',bank().gems===initial.gems-2);
 g.advance(13000);check('revived run can fail normally',g.state().phase==='ended');g.restart();g.freeze();
 const firstBank=bank();check('revived run settles once',firstBank.runs===initial.runs+1);g.restart();g.freeze();check('restarting cannot double-bank revived run',bank().runs===firstBank.runs&&bank().coins===firstBank.coins);
 prep();g.planAhead(6000,3000);g.planTheme(1,1000);const pit=g.state().course.features.find(f=>f.kind==='plankPit');const at=12*Math.round((pit.from+pit.to)/24);g.jumpTo(at-8);g.advance(8000);
 check('wooden gap failure reaches results',g.state().phase==='ended');g.revive();const wood=g.state();g.advance(25);const after=g.state();
 check('wooden revive preserves actual deck height',after.phase==='playing'&&after.groundY===-3&&after.jumpY===0&&after.worldY===-3);
 check('wooden revive does not rerun opening award',after.distanceExact>wood.distanceExact&&after.progressDistance-wood.progressDistance<1);
 return {checks,branchRevived:revived,branchFirstStep:first,woodRevived:wood,woodFirstStep:after};
})()
