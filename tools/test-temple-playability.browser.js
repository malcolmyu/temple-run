// Run in the local game's DevTools via Runtime.evaluate; uses real input listeners.
// Preserve temple.v2.progress before running and restore it afterwards.
(() => {
  const originalUrl=location.href;const referenceUrl=new URL(location.href);referenceUrl.searchParams.set('route','reference');history.replaceState(null,'',referenceUrl);
  const g = window.__templeGame;
  const checks = [];
  const check = (name, condition) => { checks.push({name, passed: !!condition}); if (!condition) throw new Error(name); };
  const key = code => { for (const type of ['keydown', 'keyup']) window.dispatchEvent(new KeyboardEvent(type, {code})); };
  const prep = () => { g.restart(); g.freeze(); g.advance(1600); };
  const until = distance => { let n=0; while(g.state().phase==='playing' && g.state().distanceExact<distance && n++<2000) g.advance(25); };
  for (const [code, lane] of [['ArrowLeft',0],['ArrowRight',2]]) {
    prep(); key(code); g.advance(600);
    check(`${code}: lane and survival`,g.state().phase==='playing' && g.state().lane===lane && g.state().swipeStumbleDelay===null);
    for(let n=0;n<4;n++){key(code);g.advance(100);}
    check(`${code}: edge clamp`,g.state().phase==='playing' && g.state().lane===lane && Math.abs(g.state().side)<1.31);
    key('ArrowUp');g.advance(100);key(lane===0?'ArrowRight':'ArrowLeft');g.advance(200);
    check(`${code}: airborne lane change`,g.state().airborne && g.state().lane===1);
  }
  prep(); key('ArrowDown');g.advance(50);key('ArrowLeft');g.advance(150);
  check('slide lane change',g.state().sliding>0 && g.state().lane===0);
  prep(); const canvas=document.querySelector('canvas');
  for(const [from,to,lane] of [[200,100,0],[100,200,1]]){
    canvas.dispatchEvent(new PointerEvent('pointerdown',{clientX:from,clientY:200}));
    canvas.dispatchEvent(new PointerEvent('pointerup',{clientX:to,clientY:200}));g.advance(300);
    check(`swipe lane ${lane}`,g.state().lane===lane && g.state().phase==='playing');
  }
  for(const branch of ['left','right']){
    prep();key('ArrowLeft');let n=0;
    while(g.state().phase==='playing' && g.state().turnCount<3 && n++<1500){
      const s=g.state();
      if(s.nextTurn-s.distanceExact<5 && !s.turnQueued)key(s.turnCount===2?(branch==='left'?'ArrowLeft':'ArrowRight'):'ArrowRight');
      const obstacle=s.obstacles.find(o=>o.ahead>0 && o.ahead<10);
      if(obstacle && !s.airborne && !s.sliding)key(obstacle.kind==='arch'?'ArrowDown':'ArrowUp');
      g.advance(25);
    }
    check(`natural route: roots, gap, two corners, T ${branch}`,g.state().phase==='playing' && g.state().turnCount===3);
  }
  prep();key('ArrowLeft');let ticks=0;
  while(g.state().phase==='playing' && g.state().distanceExact<5500 && ticks++<8000){
    const s=g.state();
    if(s.nextTurn-s.distanceExact<5 && !s.turnQueued)key(s.turnDirection===-1?'ArrowLeft':'ArrowRight');
    const obstacle=s.obstacles.find(o=>o.ahead>0 && o.ahead<10);
    if(obstacle && !s.airborne && !s.sliding)key(obstacle.kind==='arch'||obstacle.kind==='fire'?'ArrowDown':'ArrowUp');
    if([1320,2244,4308,4908].some(b=>s.distanceExact>b-20 && s.distanceExact<b-10) && !s.airborne)key('ArrowUp');
    g.advance(25);
  }
  check('5500m: 42 junctions, both bridge sections and four theme boundaries',g.state().phase==='playing' && g.state().distanceExact>=5500 && g.state().turnCount>=42);
  const longRun=g.state();
  prep();until(112);
  check('actual root still collides',g.state().phase==='dying' || g.state().stumbleRemaining>0);
  prep();key('ArrowLeft');until(149);g.advance(700);
  check('missed corner still fails',g.state().phase==='dying' && g.death().kind==='missed');
  g.advance(6000);check('failure reaches results',g.state().phase==='ended');
  const result={checks, longRun, final:g.state()};history.replaceState(null,'',originalUrl);return result;
})()
