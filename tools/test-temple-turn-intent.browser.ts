// Natural approaches for buffered turns. Requires isolated locked-power save.
// No planAhead/jumpTo/spawn/power/collision overrides.
(()=>{
 const g=window.__templeGame,url=new URL(location.href),original=location.href,checks=[],cases=[];
 url.searchParams.set('seed','1');url.searchParams.delete('route');history.replaceState(null,'',url);
 const check=(name,ok)=>checks.push({name,passed:!!ok});
 function prep(){g.restart();g.freeze();g.advance(1600);g.press('left');}
 function laneTo(target){const current=g.state().lane;for(let i=0;i<Math.abs(target-current);i++)g.press(target<current?'left':'right');}
 function approach(predicate){
  for(let ticks=0;ticks<30000;ticks++){
   const s=g.state();if(s.phase!=='playing'||s.distanceExact>20000)return null;
   const target=predicate(s);if(target&&!s.airborne&&!s.sliding&&!s.powers.some(p=>p.kind==='shield'||p.kind==='boost'))return {s,target};
   const remaining=s.nextTurn-s.distanceExact;
   if(remaining<5&&!s.turnQueued)g.press(s.turnDirection===-1?'left':'right');
   else if(remaining>10){
    const branch=s.course.branches.find(b=>b.from>s.distanceExact&&b.from-s.distanceExact<40),safe=g.groundSupport(24);
    let lane=s.activeBranch?s.lane:1;
    if(branch)lane=0;else if(safe.some(Boolean)&&!safe.every(Boolean))lane=safe[s.lane]?s.lane:safe.findIndex(Boolean);
    const narrow=s.course.narrows.find(n=>s.distanceExact>=n.from-24&&s.distanceExact<=n.to+6);if(narrow)lane=narrow.side==='left'?0:2;
    const block=s.obstacles.find(o=>o.kind==='block'&&o.ahead>-5&&o.ahead<20);if(block&&lane===block.lane)lane=(block.lane+1)%3;
    laneTo(lane);
   }
   const o=s.obstacles.find(o=>(!o.branch||o.branch===s.activeBranch)&&o.ahead>0&&o.ahead<(o.kind==='gapLong'?8:10));
   if(o&&!s.airborne&&!s.sliding&&!o.defId.startsWith('narrow')){
    if(o.kind==='block'){if(o.lane===s.lane)laneTo(s.lane===0?1:0);}
    else g.press(o.kind==='arch'||o.kind==='fire'&&o.defId!=='fireWall'?'slide':'jump');
   }
   if(!s.airborne&&s.course.surfaces.some(t=>t.from>0&&s.distanceExact>t.from-20&&s.distanceExact<t.from-10))g.press('jump');
   g.advance(25);
  }
  return null;
 }

 try{
  for(const spec of [
   {name:'left',direction:-1}, {name:'right',direction:1},
   {name:'T-left',direction:-1,tee:true}, {name:'T-right',direction:1,tee:true},
   {name:'jump-left',direction:-1,action:'jump'}, {name:'slide-right',direction:1,action:'slide'},
  ]){
   prep();const reached=approach(s=>{const r=s.nextTurn-s.distanceExact;return r>13&&r<14&&(spec.tee?s.nextJunction==='tee':s.nextJunction!=='tee'&&s.turnDirection===spec.direction)?{remaining:r}:null;});
   check(spec.name+':natural approach',!!reached);if(!reached)continue;
   const before=g.state();if(spec.action)g.press(spec.action);g.press(spec.direction<0?'left':'right');g.advance(25);
   const buffered=g.state();
   check(spec.name+':early input buffers without lane change or immediate confirmation',buffered.turnIntent?.direction===spec.direction&&buffered.lane===before.lane&&!buffered.turnQueued);
   if(spec.name==='left'){
    g.pause();const paused=g.state();g.advance(2000);const held=g.state();
    check('pause freezes buffered intent',held.phase==='paused'&&held.distanceExact===paused.distanceExact&&JSON.stringify(held.turnIntent)===JSON.stringify(paused.turnIntent));g.pause();
   }
   let ticks=0;while(g.state().phase==='playing'&&!g.state().turnQueued&&g.state().turnCount===before.turnCount&&ticks++<100)g.advance(25);
   const confirmed=g.state();check(spec.name+':geometry confirms requested exit',confirmed.turnQueued&&confirmed.turnDirection===spec.direction);
   while(g.state().phase==='playing'&&g.state().turnCount===before.turnCount&&ticks++<150)g.advance(25);
   const after=g.state();check(spec.name+':turn completes alive and consumes intent',after.phase==='playing'&&after.turnCount===before.turnCount+1&&!after.turnIntent);
   cases.push({name:spec.name,before,buffered,confirmed,after});
  }
  for(const mode of ['distant','wrong-direction','cancel','restart']){
   prep();const reached=approach(s=>{const r=s.nextTurn-s.distanceExact;return s.nextJunction!=='tee'&&(mode==='distant'?r>20&&r<21:r>13&&r<14)?{remaining:r}:null;});
   check(mode+':natural approach',!!reached);if(!reached)continue;
   const before=g.state(),direction=before.turnDirection;
   g.press((mode==='wrong-direction'?-direction:direction)<0?'left':'right');g.advance(25);
   if(mode==='cancel'){g.press(direction<0?'right':'left');g.advance(25);}
   if(mode==='restart'){g.restart();g.freeze();check('restart discards buffered intent',!g.state().turnIntent&&g.state().lane===1&&g.state().phase==='playing');continue;}
   const action=g.state();check(mode+':ordinary input does not leave a turn intent',!action.turnIntent&&!action.turnQueued&&action.phase==='playing');
   g.advance(4000);const after=g.state();check(mode+':missed turn still reaches results',after.phase==='ended'&&g.death().kind==='missed');
   cases.push({name:mode,before,action,after,death:g.death()});
  }
 }finally{history.replaceState(null,'',original);}
 return {checks,cases};
})()
