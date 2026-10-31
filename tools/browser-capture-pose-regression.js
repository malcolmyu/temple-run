// Native clip boundary regression. Capturing/freezing must not select another clip.
(()=>{
 const g=window.__templeGame;g.restart();g.freeze();
 for(let i=0;i<180;i++)g.advance(1000/60);
 g.press('slide');for(let i=0;i<10;i++)g.advance(1000/60);
 const before={runner:g.runner(),state:g.state(),pickups:g.pickupDetails()};
 const a=g.captureFrame();const afterCapture={runner:g.runner(),state:g.state(),pickups:g.pickupDetails()};
 g.freeze();const afterFreeze={runner:g.runner(),state:g.state(),pickups:g.pickupDetails()};
 const b=g.captureFrame();
 return window.__capturePoseRegression={passed:JSON.stringify(before)===JSON.stringify(afterCapture)&&JSON.stringify(before)===JSON.stringify(afterFreeze)&&a.png===b.png,
 before,afterCapture,afterFreeze,identicalPixels:a.png===b.png};
})()
