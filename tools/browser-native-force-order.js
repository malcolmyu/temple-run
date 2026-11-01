// Verify action changes cannot erase a force produced by the preceding controller update.
window.__nativeForceOrder=(()=>{
 const g=window.__templeGame;g.restart();g.freeze();g.advance(4200);g.jumpTo(20);g.setNextTurn(150);
 const before=g.state();g.press('slide');g.advance(25);const started=g.state();g.advance(25);const held=g.state();
 let frames=0;while(g.state().sliding>0&&frames++<40)g.advance(25);const expired=g.state();
 g.press('slide');g.advance(25);const renewed=g.state();g.advance(25);const renewedHeld=g.state();
 const checks={priorForceAppliedToSlideStart:started.speed>before.speed&&started.queuedForwardForce===0,
 noNewForceWhileSliding:held.speed===started.speed&&held.queuedForwardForce===0,
 expiryProducesNextForce:expired.sliding===0&&expired.queuedForwardForce>0,
 renewalCannotEraseOldForce:renewed.sliding>0&&renewed.speed>expired.speed&&renewed.queuedForwardForce===0,
 followingSlideFrameHasNoForce:renewedHeld.speed===renewed.speed};
 return{passed:Object.values(checks).every(Boolean),checks,before,started,held,expired,renewed,renewedHeld};
})();
