// Diagnosis, not recovered source touch events. Slide repeatedly between authored
// obstacle/turn actions, starting at physical55 (near the first visible slide).
// Adds diagnostic179m/335m jumps for observed first/second corner jumps;
// its world start is still fitted, not recovered touch timing.
// The first thin root is intentionally stumbled, as seen in the reference.
// Execute via the browser developer CDP surface; no native code is executed.
window.__templeRejectedSwipeReplayResult=(()=>{
 const g=window.__templeGame;g.restart();g.freeze();
 const rows=[];
 const slideWindows=[{center:1617,half:.5},{center:1761,half:.5},{center:2001,half:.5},{center:2337,half:.6},{center:2385,half:.5}];
 let reservedSeconds=0,slideInputs=0;
 let recoveringObservedStumble=false;
 const step=(target=Infinity,action=null)=>{
  const s=g.state();
  if(recoveringObservedStumble&&s.swipeStumbleDelay===null&&s.stumbleRemaining<=0)recoveringObservedStumble=false;
  if(s.distanceExact>=55&&!s.airborne&&!s.falling&&s.sliding<=0&&!recoveringObservedStumble&&!(action==='rejected-right'&&target-s.distanceExact<s.speed*.8)){
   // Native elapsed .01 float32 expires after ~.76; use a conservative
   // two-frame envelope for the no-slide gap, never alter runtime timing.
   const expiry=s.distanceExact+s.speed*.76;
   const reserve=slideWindows.some(w=>Math.abs(expiry-w.center)<w.half+s.speed*.03);
   if(reserve)reservedSeconds+=.01;
   else{g.press('slide');slideInputs++;}
  }
  g.advance(10);
 };
 const events=[[173,1],[179,"jump"],[301,"jump"],[329,1],[335,"jump"],[373,"jump"],[391,"rejected-right"],[467,"jump"],[497,-1],[641,-1],[671,"jump"],[881,-1],[899,"jump"],[959,"jump"],[1025,1],[1055,"jump"],[1115,"jump"],[1181,1],[1199,"jump"],[1283,"jump"],[1469,1],[1487,"jump"],[1577,1],[1614,"slide"],[1679,"jump"],[1758,"slide"],[1811,"jump"],[1907,"jump"],[1949,-1],[1998,"slide"],[2063,"jump"],[2171,"jump"],[2213,-1],[2332,"slide"],[2382,"slide"],[2441,-1],[2501,1],[2549,1],[2597,1],[2645,-1],[2693,1],[2741,1],[2789,1],[2849,1],[2897,-1]];
 for(const[target,action]of events){
  while(g.state().distanceExact<target&&g.state().phase==='playing')step(target,action);
  if(g.state().phase!=='playing')return{diagnostic:true,failedAt:target,state:g.state(),death:g.death(),rows};
  if(action==='jump')while(g.state().stumbleRemaining>0&&g.state().phase==='playing')step(target,action);
  if(typeof action==='number'){if(!g.attemptTurn(action))return{diagnostic:true,rejected:target,state:g.state(),rows};}else if(action==='rejected-right'){g.press('right');recoveringObservedStumble=true;}else g.press(action);
  g.advance(10);rows.push({target,action,state:g.state()});
 }
 const shieldCentre=2961.953545382353;
 while(g.state().phase==='playing'&&(g.state().stumbleRemaining>0||g.state().distanceExact<shieldCentre-g.state().speed*.6))step();
 g.press('jump');g.advance(10);rows.push({target:'speed-dependent shield jump',action:'jump',state:g.state()});
 while(g.state().distanceExact<2967&&g.state().phase==='playing')step();
 const ui=document.querySelector('.hud').__vueParentComponent.setupState.ui;
 return{reservedSeconds,slideInputs,power:ui.power,powerRemaining:ui.powerRemaining,diagnostic:true,policy:'inferred rejected right swipe after second-root landing at391; wait through its delay/stumble before resuming slides; video stumble confirmed but input cause/world coordinate not recovered',state:g.state(),death:g.death(),rows};
})();
