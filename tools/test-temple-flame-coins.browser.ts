// Normal generated course, real controls, no teleports/spawn fixtures/collision overrides.
(() => {
 const g=window.__templeGame,original=location.href,runs=[],checks=[],cliffDirections=[],treeRows=[];
 const check=(name,passed)=>checks.push({name,passed:!!passed});
 for(const seed of [1,2,3,4,5]){
  const url=new URL(location.href);url.searchParams.set('seed',String(seed));url.searchParams.delete('route');history.replaceState(null,'',url);
  g.restart();g.freeze();g.advance(1600);g.press('left');
  const samples=[],trace=[];let nextSample=2500;
  const seen=new Set(),branches=new Set(),longJumps=[];let merges=0,lastBranch=null,ticks=0;
  while(g.state().phase==='playing'&&g.state().distanceExact<9000&&ticks++<50000){
   if(g.state().distanceExact>=nextSample){samples.push({distance:g.state().distanceExact,gpu:g.gpu(),scene:g.scene()});nextSample+=2500;}
   const s=g.state(),remaining=s.nextTurn-s.distanceExact;
   if(s.obstacles.some(o=>o.defId==='pitLongB'&&o.ahead>-22&&o.ahead<14)){trace.push({distance:s.distanceExact,speed:s.speed,airborne:s.airborne,jumpY:s.jumpY,powers:s.powers,gap:s.obstacles.find(o=>o.defId==='pitLongB')});if(trace.length>80)trace.shift();}
   for(const o of s.obstacles)seen.add(o.defId);
   if(s.activeBranch)branches.add(s.activeBranch);
   if(lastBranch&&!s.activeBranch)merges++;lastBranch=s.activeBranch;
   if(remaining<5&&!s.turnQueued){if(s.nextJunction==='tee'&&s.course.surfaces.some(b=>b.level===3&&s.distanceExact>=b.from&&s.distanceExact<b.to))cliffDirections.push({direction:seed===1?-1:1,node:s.nextTurn,rendered:g.scene().nativeCliffTs>0});g.press(s.nextJunction==='tee'&&s.course.surfaces.some(b=>b.level===3&&s.distanceExact>=b.from&&s.distanceExact<b.to)?(seed===1?'left':'right'):(s.turnDirection===-1?'left':'right'));}
   else if(remaining>10){
    const branch=s.course.branches.find(b=>b.from>s.distanceExact&&b.from-s.distanceExact<40);
    const safe=g.groundSupport(24);
    let lane=s.activeBranch?s.lane:1;
    if(branch)lane=seed===1?0:2;
    else if(safe.some(Boolean)&&!safe.every(Boolean))lane=safe[s.lane]?s.lane:safe.findIndex(Boolean);
    const narrowNow=s.course.narrows.find(n=>s.distanceExact>=n.from-24&&s.distanceExact<=n.to+6);if(narrowNow)lane=narrowNow.side==='left'?0:2;
    if(lane!==s.lane)for(let i=0;i<Math.abs(lane-s.lane);i++)g.press(lane<s.lane?'left':'right');
   }
   const protectedNow=s.powers.some(p=>p.kind==='shield'||p.kind==='boost');
   const obstacle=s.obstacles.find(o=>o.ahead>0&&o.ahead<(o.kind==='gapLong'?8:10));
   if(obstacle&&!s.airborne&&!s.sliding&&!obstacle.defId.startsWith('narrow')){
    if(obstacle.kind==='block'){if(obstacle.lane===s.lane)g.press(s.lane===0?'right':'left');}
    else{const highFire=obstacle.kind==='fire'&&g.pickupDetails().some(p=>p.kind==='coin'&&p.baseY>3&&Math.abs(p.distance-(s.distanceExact+obstacle.ahead))<6);g.press(obstacle.kind==='arch'||obstacle.kind==='fire'&&!highFire?'slide':'jump');if(obstacle.defId==='pitLongB')longJumps.push(s.distanceExact);}
   }
   if(!s.airborne&&s.course.surfaces.some(surface=>surface.from>0&&s.distanceExact>surface.from-20&&s.distanceExact<surface.from-10))g.press('jump');
   const tree=s.obstacles.find(o=>['treeJump','treeTrip','treeSlide','flameTower'].includes(o.defId)&&o.ahead>15&&o.ahead<20);
   if(tree&&!treeRows.some(r=>r.seed===seed&&Math.abs(r.centre-(s.distanceExact+tree.ahead))<2)){
    const rows=g.pickupDetails().filter(p=>p.kind==='coin'&&Math.abs(p.distance-(s.distanceExact+tree.ahead))<5.6);
    if(rows.length===5)treeRows.push({seed,id:tree.defId,centre:(rows[0].distance+rows[4].distance)/2,rows,coinsBefore:s.coins,lane:s.lane,protected:s.powers,after:null});
   }
   for(const row of treeRows)if(row.seed===seed&&!row.after&&s.distanceExact>row.centre+10)row.after={phase:s.phase,coins:s.coins,airborne:s.airborne};
   g.advance(25);
  }
  const end=g.state();
  const fast=end.course.features.filter(f=>f.fastTurn);
  check('all3themes naturally crossed',new Set(end.course.surfaces.filter(s=>s.from<end.distanceExact).map(s=>s.level)).size===3);
  check('theme clock produced real progress requests',end.themePacing.changes.length>5&&end.themePacing.changes.every(c=>c.progress>500));
  check("seed"+seed+": naturally generated short fast turns crossed",fast.some(f=>f.to<end.distanceExact&&f.to-f.from<120));

  check('normal generated run reaches9000m',end.phase==='playing'&&end.distanceExact>=9000);
  check('live scene remains bounded during long run',samples.every(s=>s.scene.tiles<=24&&s.scene.obstacles<=20&&s.scene.pickups<=100));
  const finalGpu=g.gpu();g.advance(60000);check('long run can still fail to results',g.state().phase==='ended');g.restart();g.freeze();
  check('restart after long run resets course and powers',g.state().phase==='playing'&&g.state().distanceExact===-2&&!g.state().boost.active&&g.state().course.extent===489&&!g.state().fastTurn.active&&g.state().fastTurn.elapsed===0&&g.state().themePacing.level===2&&g.state().themePacing.elapsed===0&&g.state().themePacing.changes.length===0);
  runs.push({samples,trace,longJumps,end,finalGpu,restartedGpu:g.gpu(),restartedScene:g.scene(),death:g.death()});
 }
 for(const id of ['treeJump','treeTrip','treeSlide','flameTower'])check('unprotected '+id+' coin row reachable',treeRows.some(r=>r.id===id&&r.lane===1&&!r.protected.length&&r.rows.length===5&&r.after?.phase==='playing'&&r.after.coins>r.coinsBefore));
 for(const high of [false,true])check('flame '+(high?'high jump':'low slide')+' row naturally reachable',treeRows.some(r=>r.id==='flameTower'&&(r.rows[0].baseY>3)===high&&r.lane===1&&!r.protected.length&&r.after?.phase==='playing'&&r.after.coins>r.coinsBefore));
 check('both native cliff T exits naturally traversed',cliffDirections.some(c=>c.direction===-1)&&cliffDirections.some(c=>c.direction===1)&&cliffDirections.every(c=>c.rendered));history.replaceState(null,'',original);return {checks,runs,cliffDirections,treeRows};
})()
