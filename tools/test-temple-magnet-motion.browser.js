// Isolated physical pickups;upgrade level supplied by a copied native-schema save.
(()=>{const g=window.__templeGame;g.restart();g.freeze();g.advance(1600);g.press('left');g.advance(1500);
 g.spawnPickup('magnet',g.state().lane,3,1.35);g.advance(150);const before=g.state(),opposite=before.lane===0?2:0;
 for(const ahead of [12,14.5,17])g.spawnCoin(opposite,ahead,1.3);
 g.advance(25);const queued={state:g.state(),rows:g.pickupDetails().filter(p=>p.kind==='coin')};
 g.advance(100);g.snapFollowCamera();const moving={state:g.state(),rows:g.pickupDetails().filter(p=>p.kind==='coin')},png=g.captureFrame().png;
 g.advance(400);const after=g.state();g.spawnCoin(opposite,24,1.3);g.advance(25);const outside=g.pickupDetails().filter(p=>p.kind==='coin');
 return {before,queued,moving,after,outside,png};})()
