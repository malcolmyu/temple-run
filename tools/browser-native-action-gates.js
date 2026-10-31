// Browser integration diagnostic; native/source input timing is not inferred.
window.__nativeActionGuards=(()=>{
 const g=window.__templeGame;
 const setup=()=>{g.restart();g.freeze();g.advance(3100);g.jumpTo(20);g.setNextTurn(150)};
 const flight=action=>{setup();g.press('jump');g.advance(200);const before=g.state();if(action)g.press(action);g.advance(100);return{before,after:g.state()}};
 const control=flight(null),down=flight('slide'),up=flight('jump');
 setup();g.press('slide');g.advance(100);const sliding=g.state();g.press('jump');g.advance(25);const jumped=g.state();
 const checks={airDownUnchanged:down.after.jumpY===control.after.jumpY&&down.after.jumpVelocity===control.after.jumpVelocity&&down.after.sliding===0,
  airUpUnchanged:up.after.jumpY===control.after.jumpY&&up.after.jumpVelocity===control.after.jumpVelocity,
  groundSlideAccepted:sliding.sliding>0&&!sliding.airborne,
  jumpCancelsSlide:jumped.sliding===0&&jumped.airborne&&jumped.jumpY>0};
 return{passed:Object.values(checks).every(Boolean),checks,control,down,up,sliding,jumped};
})();
