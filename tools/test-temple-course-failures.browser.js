// Isolated wrong-entry tests plus a natural, unprotected long-gap failure.
(() => {
 const g=window.__templeGame,checks=[];
 const check=(name,ok)=>{checks.push({name,passed:!!ok});};
 const prep=()=>{g.restart();g.freeze();g.advance(1600);};
 prep();g.planAhead(6000,3000);const branch=g.state().course.branches[0];g.jumpTo(branch.from-8);g.advance(2000);
 check('centre entry into branch gap falls',g.state().phase==='dying'||g.state().phase==='ended');g.advance(6000);check('branch failure reaches results',g.state().phase==='ended');
 prep();g.planAhead(6000,3000);const narrow=g.state().course.narrows[0];g.jumpTo(narrow.from-16);g.press(narrow.side==='left'?'right':'left');g.advance(2400);
 check('wrong half of native narrow road falls',g.state().phase==='dying'||g.state().phase==='ended');g.advance(6000);check('narrow failure reaches results',g.state().phase==='ended');
 prep();g.press('left');let stopped=null,ticks=0;
 while(g.state().phase==='playing'&&g.state().distanceExact<8000&&ticks++<13000){
  const s=g.state(),remaining=s.nextTurn-s.distanceExact,protectedNow=s.powers.some(p=>p.kind==='shield'||p.kind==='boost');
  const long=s.obstacles.find(o=>o.defId==='pitLongB'&&o.ahead>8&&o.ahead<12);
  if(long&&!protectedNow&&!s.airborne){stopped=s;break;}
  if(remaining<5&&!s.turnQueued)g.press(s.turnDirection===-1?'left':'right');
  else if(remaining>10){
   const safe=g.groundSupport(24);let lane=s.lane;
   const branch=s.course.branches.find(b=>b.from>s.distanceExact&&b.from-s.distanceExact<40);
   if(branch)lane=0;else if(safe.some(Boolean)&&!safe.every(Boolean))lane=safe[s.lane]?s.lane:safe.findIndex(Boolean);
   if(lane!==s.lane)for(let i=0;i<Math.abs(lane-s.lane);i++)g.press(lane<s.lane?'left':'right');
  }
  const o=s.obstacles.find(o=>o.ahead>0&&o.ahead<(o.kind==='gapLong'?8:10));
  if(o&&!protectedNow&&!s.airborne&&!s.sliding&&!o.defId.startsWith('narrow')){
   if(o.kind==='block'){if(o.lane===s.lane)g.press(s.lane===0?'right':'left');}else g.press(o.kind==='arch'||o.kind==='fire'?'slide':'jump');
  }
  if(!protectedNow&&!s.airborne&&s.course.surfaces.some(surface=>surface.from>0&&s.distanceExact>surface.from-20&&s.distanceExact<surface.from-10))g.press('jump');
  g.advance(25);
 }
 check('natural course reaches unprotected long-gap pair',!!stopped&&stopped.obstacles.some(o=>o.defId==='pitLongA'));
 g.advance(7000);check('not jumping into natural long gap fails',!!stopped&&g.state().phase==='ended');
 const death=g.death();g.restart();g.freeze();check('restart after road failures is clean and playable',g.state().phase==='playing'&&g.state().lane===1&&!g.state().activeBranch);
 return {checks,stoppedAt:stopped?.distanceExact,death};
})()
