(()=>{const g=window.__templeGame,seed=4,cliffDirections=[],treeRows=[];  const url=new URL(location.href);url.searchParams.set('seed',String(seed));url.searchParams.delete('route');history.replaceState(null,'',url);
  g.restart();g.freeze();g.advance(1600);g.press('left');
  const samples=[],trace=[];let nextSample=2500;
  const seen=new Set(),branches=new Set(),longJumps=[];let merges=0,lastBranch=null,ticks=0;
  while(g.state().phase==='playing'&&g.state().distanceExact<2764&&ticks++<50000){
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
g.snapFollowCamera();return {state:g.state(),rows:g.pickupDetails(),png:g.captureFrame().png};})()