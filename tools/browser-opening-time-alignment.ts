// Temporal source-alignment diagnostic, not recovered original controls.
// Offset aligns60Hz first native release frame61 with source first score2.703.
(()=>{const g=window.__templeGame;g.restart();g.freeze();const offset=2.703-61/60;
const rows=[];let seenStumble=false;
for(let i=0;i<600&&g.state().runElapsed+offset<9.4;i++){
 const s=g.state();if(s.runElapsed>=3.033333&&!s.airborne&&s.sliding<=0)g.press('slide');
 g.advance(1000/60);const n=g.state();
 if(n.stumbleRemaining>0&&!seenStumble){seenStumble=true;rows.push({kind:'first-stumble',videoSecond:n.runElapsed+offset,state:n});}
}
const beforeTurn=g.state();const accepted=g.attemptTurn(1);
return window.__openingTimeAlignment={offset,policy:'60Hz; repeated slide from runElapsed3.033333; attempt first right turn at source video9.4; source timing estimates, not exact touch events',rows,beforeTurn,turnAccepted:accepted,afterTurn:g.state(),death:g.death()};})()
