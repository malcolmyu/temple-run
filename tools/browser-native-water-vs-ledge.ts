// Isolated support diagnostics, not the source run's final trajectory.
window.__nativeWaterVsLedge=(()=>{
 const g=window.__templeGame;
 const setup=()=>{g.restart();g.freeze();g.advance(4200);g.jumpTo(20);g.setNextTurn(150)};
 setup();[8,16,24].forEach(a=>g.spawnObstacle('gap',a));const initialWaterAudio=g.audio();const samples=[];
 for(let i=0;i<80&&g.state().phase==='playing';i++){g.advance(25);samples.push(g.state());}
 const water=g.state(),waterDeath=g.death(),waterAudio=g.audio();g.advance(600);const ended=g.state();
 setup();g.spawnObstacle('gap',8);const initialLedgeAudio=g.audio();const ledgeSamples=[];
 for(let i=0;i<80&&g.state().phase==='playing';i++){g.advance(25);ledgeSamples.push(g.state());}
 const ledge=g.state(),ledgeDeath=g.death(),ledgeAudio=g.audio();
 setup();g.spawnObstacle('gap',17);g.press('jump');const recoverySamples=[];
 for(let i=0;i<44&&g.state().phase==='playing';i++){g.advance(25);recoverySamples.push(g.state());}
 const recovered=g.state();
 const count=(a,k)=>a.played?.[k]||0;
 const checks={unsupportedSurvivesBelowLedgeDepth:samples.some(s=>s.jumpY<-1.2&&s.phase==='playing'),
 waterDiesBelowSeven:water.jumpY<-7&&waterDeath.kind==='water'&&ended.phase==='ended',
 waterUsesSplash:count(waterAudio,'splash')-count(initialWaterAudio,'splash')===1&&count(waterAudio,'splat')===count(initialWaterAudio,'splat'),
 ledgeReentryDiesBeforeWater:ledge.jumpY>-7&&ledge.jumpY<-1.2&&ledgeDeath.kind==='fall',
 ledgeUsesSplat:count(ledgeAudio,'splat')-count(initialLedgeAudio,'splat')===1,
 shallowReentryRecovers:recovered.phase==='playing'&&recoverySamples.some(s=>s.falling)&&recovered.jumpY===0&&recovered.stumbleRemaining>0};
 return{passed:Object.values(checks).every(Boolean),checks,samples,water,waterDeath,waterAudio,ended,ledgeSamples,ledge,ledgeDeath,ledgeAudio,recoverySamples,recovered};
})();
