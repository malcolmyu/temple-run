// Native effect wiring checks on injected obstacles; not a source scene match.
window.__nativeCameraPresentation=(()=>{
 const g=window.__templeGame;
 const setup=()=>{g.restart();g.freeze();g.advance(4200);g.jumpTo(20);g.setNextTurn(150)};
 setup();const projection=g.cameraDetails();g.spawnObstacle('trip',2);g.advance(200);const trip={camera:g.cameraDetails(),state:g.state()};g.advance(1600);const expired=g.cameraDetails();
 setup();g.power('shield');g.spawnObstacle('trip',2);g.advance(200);const shield=g.cameraDetails();
 setup();g.press('right');g.advance(300);const rejected={camera:g.cameraDetails(),state:g.state()};
 setup();g.spawnObstacle('arch',2);g.advance(150);const impact={camera:g.cameraDetails(),state:g.state(),death:g.death()};g.advance(100);const dying={camera:g.cameraDetails(),state:g.state(),death:g.death()};
 const checks={nativeClipPlanes:projection.clip.near===1&&projection.clip.far===100,
  tripTranslatesCamera:trip.camera.shake?.duration===1.5&&Math.hypot(...trip.camera.shakeOffset)>0,
  shakeExpires:expired.shake===null&&Math.hypot(...expired.shakeOffset)===0,
  shieldPassHasNoShake:shield.shake===null,
  noUnverifiedDelayedShake:rejected.state.stumbleRemaining>0&&rejected.camera.shake===null,
  noClassicLaneErrorRoll:Math.abs(rejected.camera.rightY)<1e-7,
  fatalImpactShakes:impact.state.phase==='dying'&&impact.camera.shake?.duration===1,
  shakeContinuesDuringDeath:dying.state.phase==='dying'&&dying.camera.shake.phase<impact.camera.shake.phase&&dying.camera.shake.magnitude<impact.camera.shake.magnitude};
 return{passed:Object.values(checks).every(Boolean),checks,projection,trip,expired,shield,rejected,impact,dying};
})();
