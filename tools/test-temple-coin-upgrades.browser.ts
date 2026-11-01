// Current normal driving plus first-observed native coin values. No seek/spawn/power overrides.
(()=>{const g=window.__templeGame,seed=1,cliffDirections=[],treeRows=[],sideRows=[],slantRows=[],sampledCells=new Set(),cornerRows=[];  const url=new URL(location.href);url.searchParams.set('seed',String(seed));url.searchParams.delete('route');history.replaceState(null,'',url);
  g.restart();g.freeze();g.advance(1600);g.press('left');
  const samples=[],trace=[],coinSeen=new Set(),coinObservations={counts:{1:0,2:0,3:0},firstRed:null,firstBlue:null,violations:[]};let nextSample=2500;
  const seen=new Set(),branches=new Set(),longJumps=[];let merges=0,lastBranch=null,ticks=0;
  while(g.state().phase==='playing'&&g.state().distanceExact<4000&&ticks++<50000){
   if(g.state().distanceExact>=nextSample){samples.push({distance:g.state().distanceExact,gpu:g.gpu(),scene:g.scene()});nextSample+=2500;}
   const s=g.state(),remaining=s.nextTurn-s.distanceExact;
   for(const p of g.pickupDetails())if(p.kind==='coin'){
    const key=[p.distance,p.lane,p.side,p.baseY,p.pattern].join(':');if(coinSeen.has(key))continue;coinSeen.add(key);
    coinObservations.counts[p.value]++;const record={progress:s.progressDistance,world:s.distanceExact,coinDistance:p.distance,value:p.value};
    if(p.value===2&&!coinObservations.firstRed)coinObservations.firstRed=record;
    if(p.value===3&&!coinObservations.firstBlue)coinObservations.firstBlue=record;
    const red=[Infinity,1500,1000,1000,1000,1000][s.coinSpawnLevel],blue=[Infinity,Infinity,Infinity,3000,2500,2000][s.coinSpawnLevel];
    if(p.value>=2&&s.progressDistance<red||p.value===3&&s.progressDistance<blue)coinObservations.violations.push(record);
   }
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
    if(!branch&&!s.activeBranch&&safe.every(Boolean)){const coin=s.pickups.find(p=>p.kind==='magnet'&&p.ahead>0&&p.ahead<45)??s.pickups.find(p=>p.kind==='coin'&&p.ahead>0&&p.ahead<28);if(coin)lane=coin.lane;}
    const block=s.obstacles.find(o=>o.kind==='block'&&o.ahead>-5&&o.ahead<20);if(block&&lane===block.lane)lane=(block.lane+1)%3;
    const narrowNow=s.course.narrows.find(n=>s.distanceExact>=n.from-24&&s.distanceExact<=n.to+6);if(narrowNow)lane=narrowNow.side==='left'?0:2;
    if(lane!==s.lane)for(let i=0;i<Math.abs(lane-s.lane);i++)g.press(lane<s.lane?'left':'right');
   }
   const protectedNow=s.powers.some(p=>p.kind==='shield'||p.kind==='boost');
   const obstacle=s.obstacles.find(o=>(!o.branch||o.branch===s.activeBranch)&&o.ahead>0&&o.ahead<(o.kind==='gapLong'?8:10));
   if(obstacle&&!s.airborne&&!s.sliding&&!obstacle.defId.startsWith('narrow')){
    if(obstacle.kind==='block'){if(obstacle.lane===s.lane)g.press(s.lane===0?'right':'left');}
    else{const highFire=obstacle.kind==='fire'&&g.pickupDetails().some(p=>p.kind==='coin'&&p.baseY>3&&Math.abs(p.distance-(s.distanceExact+obstacle.ahead))<6);g.press(obstacle.kind==='arch'||obstacle.kind==='fire'&&obstacle.defId!=='fireWall'&&!highFire?'slide':'jump');if(obstacle.defId==='pitLongB')longJumps.push(s.distanceExact);}
   }
   if(!s.airborne&&s.course.surfaces.some(surface=>surface.from>0&&s.distanceExact>surface.from-20&&s.distanceExact<surface.from-10))g.press('jump');
   const turnKey=seed+':turn:'+s.nextTurn;
   if(s.nextTurn-s.distanceExact<25&&s.nextTurn-s.distanceExact>15&&!cornerRows.some(r=>r.key===turnKey)){
    const rows=g.pickupDetails().filter(p=>p.pattern===7&&Math.abs(p.distance-s.nextTurn)<=5.01);
    if(rows.length===5)cornerRows.push({key:turnKey,seed,centre:s.nextTurn,direction:s.turnDirection,rows,powers:s.powers,after:null});
   }
   for(const row of cornerRows)if(row.seed===seed&&!row.after&&s.distanceExact>row.centre+6){const remaining=g.pickupDetails().filter(p=>p.kind==='coin'&&Math.abs(p.distance-row.centre)<5.01);row.after={phase:s.phase,distance:s.distanceExact,powers:s.powers,collected:5-remaining.length};}
   const cell=12*Math.ceil((s.distanceExact+14)/12),cellKey=seed+':'+cell;
   if(!sampledCells.has(cellKey)){
    sampledCells.add(cellKey);const rows=g.pickupDetails().filter(p=>p.kind==='coin'&&Math.abs(p.distance-cell)<5.01);
    if(rows.length===5&&rows.every(p=>p.pattern>=3))slantRows.push({seed,centre:cell,pattern:rows[0].pattern,rows,powers:s.powers,after:null});
   }
   for(const row of slantRows)if(row.seed===seed&&!row.after&&s.distanceExact>row.centre+6){const remaining=g.pickupDetails().filter(p=>p.kind==='coin'&&Math.abs(p.distance-row.centre)<5.01);row.after={phase:s.phase,distance:s.distanceExact,powers:s.powers,collected:5-remaining.length};}
   const upcoming=s.pickups.find(p=>p.kind==='coin'&&p.ahead>10&&p.ahead<15&&p.lane!==1);
   if(upcoming&&!sideRows.some(r=>r.seed===seed&&Math.abs(r.centre-(s.distanceExact+upcoming.ahead))<12)){
    const row=g.pickupDetails().find(p=>p.kind==='coin'&&p.lane===upcoming.lane&&Math.abs(p.distance-(s.distanceExact+upcoming.ahead))<1);
    if(row&&typeof row.side==='number')sideRows.push({seed,centre:row.distance,lane:row.lane,side:row.side,coinsBefore:s.coins,powers:s.powers,after:null});
   }
   for(const row of sideRows)if(row.seed===seed&&!row.after&&s.distanceExact>row.centre+5)row.after={phase:s.phase,coins:s.coins,lane:s.lane};
   const tree=s.obstacles.find(o=>['treeJump','treeTrip','treeSlide','flameTower'].includes(o.defId)&&o.ahead>15&&o.ahead<20);
   if(tree&&!treeRows.some(r=>r.seed===seed&&Math.abs(r.centre-(s.distanceExact+tree.ahead))<2)){
    const rows=g.pickupDetails().filter(p=>p.kind==='coin'&&Math.abs(p.distance-(s.distanceExact+tree.ahead))<5.6);
    if(rows.length===5)treeRows.push({seed,id:tree.defId,centre:(rows[0].distance+rows[4].distance)/2,rows,coinsBefore:s.coins,lane:s.lane,protected:s.powers,after:null});
   }
   for(const row of treeRows)if(row.seed===seed&&!row.after&&s.distanceExact>row.centre+10)row.after={phase:s.phase,coins:s.coins,airborne:s.airborne};
   g.advance(25);
  }
const end=g.state();g.advance(60000);const failed=g.state();g.restart();g.freeze();return {end,failed,restarted:g.state(),coinObservations};})()