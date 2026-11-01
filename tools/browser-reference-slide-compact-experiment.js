// Diagnosis, not recovered source touch events. Slide repeatedly between authored
// obstacle/turn actions, starting at physical55 (near the first visible slide).
// Adds a diagnostic335m jump for the directly observed17.2s corner jump;
// its world start is still fitted, not recovered touch timing.
// The first thin root is intentionally stumbled, as seen in the reference.
// Execute via the browser developer CDP surface; no native code is executed.
window.__templeSlideReplayResult=(()=>{
 const g=window.__templeGame;g.restart();g.freeze();
 const rows=[];
 const step=(target=Infinity,action=null)=>{const s=g.state();const reserveSlide=action==='slide'&&Math.abs((target+3-s.distanceExact)/s.speed-.75)<.08;if(!reserveSlide&&s.distanceExact>=55&&s.jumpY<=0&&s.sliding<=0)g.press('slide');g.advance(10)};
 const events=[[173,1],[301,"jump"],[329,1],[335,"jump"],[373,"jump"],[467,"jump"],[497,-1],[641,-1],[671,"jump"],[881,-1],[899,"jump"],[959,"jump"],[1025,1],[1055,"jump"],[1115,"jump"],[1181,1],[1199,"jump"],[1283,"jump"],[1469,1],[1487,"jump"],[1577,1],[1614,"slide"],[1679,"jump"],[1758,"slide"],[1811,"jump"],[1907,"jump"],[1949,-1],[1998,"slide"],[2063,"jump"],[2171,"jump"],[2213,-1],[2332,"slide"],[2382,"slide"],[2441,-1],[2501,1],[2549,1],[2597,1],[2645,-1],[2693,1],[2741,1],[2789,1],[2849,1],[2897,-1]];
 for(const[target,action]of events){
  while(g.state().distanceExact<target&&g.state().phase==='playing')step(target,action);
  if(g.state().phase!=='playing')return{diagnostic:true,failedAt:target,state:g.state(),death:g.death(),rows};
  if(typeof action==='number'){if(!g.attemptTurn(action))return{diagnostic:true,rejected:target,state:g.state(),rows};}else g.press(action);
  g.advance(10);rows.push({target,action,state:g.state()});
 }
 // Input flight phase adapts to the actual diagnostic speed.
 const shieldCentre=2961.953545382353;
 while(g.state().distanceExact<shieldCentre-g.state().speed*.6&&g.state().phase==='playing')step();
 g.press('jump');g.advance(10);rows.push({action:'jump for shield',state:g.state()});
 while(g.state().distanceExact<2967&&g.state().phase==='playing')step();
 const ui=document.querySelector('.hud').__vueParentComponent.setupState.ui;
 return{power:ui.power,powerRemaining:ui.powerRemaining,diagnostic:true,policy:'repeated slide after55; source input timing unverified',state:g.state(),death:g.death(),rows};
})();
