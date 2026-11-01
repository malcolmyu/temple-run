// Continue from the low-speed first-shield diagnostic, not from the fast safe bot.
window.__templeSlideSecondShield=(()=>{
 const g=window.__templeGame,rows=[];let shieldExpired=null;
 const step=(target=Infinity,action=null)=>{const s=g.state();const ui=document.querySelector('.hud').__vueParentComponent.setupState.ui;if(!shieldExpired&&ui.power!=='shield')shieldExpired={distance:s.distanceExact,runElapsed:s.runElapsed};const reserve=action==='slide'&&target-s.distanceExact<=s.speed*.75+1;if(!reserve&&s.jumpY<=0&&s.sliding<=0)g.press('slide');g.advance(10)};
 const events=[[3023,'jump'],[3077,-1],[3107,'jump'],[3161,1],[3166,'jump'],[3245,'slide'],[3305,'slide'],[3353,'slide'],[3413,'slide'],[3479,'jump'],[3509,1],[3539,'jump'],[3605,1],[3665,'slide']];
 for(const[target,action]of events){
  while(g.state().distanceExact<target&&g.state().phase==='playing')step(target,action);
  if(g.state().phase!=='playing')return{failedAt:target,state:g.state(),death:g.death(),rows,shieldExpired};
  if(typeof action==='number'){if(!g.attemptTurn(action))return{rejected:target,state:g.state(),rows,shieldExpired};}else g.press(action);
  g.advance(10);rows.push({target,action,state:g.state()});
 }
 // Fitted pickup centre; choose a descending flight phase which intersects the
 // native player bounds/sphere. This is replay input timing, not a runtime assist.
 const pickup=3706.125020757576;
 while(g.state().distanceExact<pickup-g.state().speed*.65&&g.state().phase==='playing')step();
 g.press('jump');rows.push({action:'jump for shield',state:g.state()});
 while(g.state().distanceExact<3710&&g.state().phase==='playing')step();
 const ui=document.querySelector('.hud').__vueParentComponent.setupState.ui;
 return{diagnostic:true,state:g.state(),power:ui.power,powerRemaining:ui.powerRemaining,rows,shieldExpired};
})();
