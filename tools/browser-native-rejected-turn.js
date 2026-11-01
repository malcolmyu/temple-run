// Local browser integration checks; injected flat road, not source touch recovery.
window.__nativeRejectedTurn=(()=>{
 const g=window.__templeGame;
 const setup=()=>{g.restart();g.freeze();g.advance(4200);g.jumpTo(20);g.setNextTurn(150)};
 setup();const initial=g.state();g.press('right');g.advance(200);const waiting=g.state();g.advance(100);const stumbled=g.state();const audio=g.audio();
 g.press('right');g.advance(300);const repeated=g.state();const death=g.death();
 setup();g.press('jump');g.advance(100);g.press('right');g.advance(25);const airborne=g.state();
 setup();g.press('slide');g.advance(100);g.press('left');g.advance(25);const sliding=g.state();
 setup();g.power('boost');g.press('right');g.advance(25);const boosted=g.state();
 g.restart();g.freeze();while(g.state().distanceExact<173&&g.state().phase==='playing')g.advance(10);g.press('right');g.advance(250);const turned=g.state();
 const checks={waitsBeforeStumble:waiting.swipeStumbleDelay>0&&waiting.stumbleRemaining===0,
  stumbleAfterDelay:stumbled.swipeStumbleDelay===null&&stumbled.stumbleRemaining>0&&stumbled.speed<initial.speed*.9,
  repeatsAreFatal:repeated.phase==='dying'&&death.kind==='caught',
  ignoredInAir:airborne.swipeStumbleDelay===null&&airborne.side===0&&airborne.airborne,
  ignoredWhileSliding:sliding.swipeStumbleDelay===null&&sliding.side===0&&sliding.sliding>0,
  ignoredWhileBoosted:boosted.swipeStumbleDelay===null&&boosted.side===0,
  validTurnAccepted:turned.turnCount===1&&turned.swipeStumbleDelay===null&&turned.phase==='playing'};
 return{passed:Object.values(checks).every(Boolean),checks,initial,waiting,stumbled,audio,repeated,death,airborne,sliding,boosted,turned};
})();
