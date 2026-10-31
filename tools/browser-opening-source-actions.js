// Source-constrained opening controls. Timing estimates, NOT recovered touch input.
(()=>{const g=window.__templeGame;g.restart();g.freeze();const offset=2.703-61/60;
const events=[[9.4,1],[9.45,'jump'],[15.05,'jump'],[17.05,1],[17.2,'jump'],[18.77,'jump']];
const hypothesis=window.__openingRejectedSwipeHypothesis??null;
if(hypothesis)events.push([hypothesis.time,hypothesis.direction<0?'left':'right']);events.sort((a,b)=>a[0]-b[0]);
const rows=[],actions=[];let index=0,lastSecond=1,lastStumble=false;
for(let tick=0;tick<1800;tick++){
 const s=g.state(),video=s.runElapsed+offset;
 if(video>=21.4||s.phase!=='playing')break;
 if(events[index]&&video>=events[index][0]){
  const [target,action]=events[index++];const accepted=typeof action==='number'?g.attemptTurn(action):(g.press(action),null);
  actions.push({target,action,accepted,before:s});
 }else if(video>=4.72&&(!(video>=17.05&&video<20.8)||(video>=18.05&&video<18.77))&&!s.airborne&&s.sliding<=0)g.press('slide');
 g.advance(1000/60);const n=g.state(),second=Math.floor(n.runElapsed+offset);
 if(second>lastSecond){rows.push({videoSecond:second,state:n});lastSecond=second;}
 if(n.stumbleRemaining>0&&!lastStumble)actions.push({kind:'natural-stumble',videoSecond:n.runElapsed+offset,state:n});
 lastStumble=n.stumbleRemaining>0;
}
return window.__openingSourceActions={offset,policy:'native60Hz; fixed estimated source jump/turn times; repeat slide from4.72; preserve17.05..20.8 running except source-prone18.05..18.77; second root jump18.77 is a pose-bracket estimate18.753..18.786; current geometry may fail this diagnostic; no teleport, forced stumble or powers; not exact source input',hypothesis,events,actions,rows,state:g.state(),death:g.death()};})()
