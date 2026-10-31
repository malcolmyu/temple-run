// Real pickup/update/collision fixture. Preserve progress; this mutates test runs.
(() => {
 const g=window.__templeGame,checks=[];
 const check=(name,ok)=>{checks.push({name,passed:!!ok});if(!ok)throw new Error(name);};
 const prep=()=>{g.restart();g.freeze();g.advance(1600);};
 prep();g.spawnPickup('boost',1,3,1.35);g.advance(250);
 const start=g.state();check('boost pickup starts progress budget and invincibility',start.boost.active&&start.boost.left>295&&start.boost.left<=300&&start.powers.some(e=>e.kind==='shield'));
 g.pause();const paused=g.state();g.advance(3000);
 check('pause consumes neither progress nor boost budget',g.state().distanceExact===paused.distanceExact&&g.state().boost.left===paused.boost.left);g.pause();
 let peak=0,braking=false,firstBrake=null,n=0,consumedProgress=0;
 while(g.state().phase==='playing'&&g.state().boost.active&&n++<800){
   const previous=g.state();g.advance(25);const s=g.state();
   if(s.boost.active)consumedProgress+=s.progressDistance-previous.progressDistance;
   peak=Math.max(peak,s.speed);
   if(s.boost.left<=50&&!firstBrake)firstBrake=s;
   if(firstBrake&&s.speed<peak-10)braking=true;
 }
 const end=g.state();
 check('accelerates beyond old1.35 multiplier to native84 cap',peak>80&&peak<=84.001);
 check('budget consumes measured progress rather than physical distance',Math.abs((start.boost.left-end.boost.left)-consumedProgress)<.01);
 check('braking starts below50 progress and slows towards previous speed',!!firstBrake&&braking&&end.speed<=start.boost.speedBefore+1);
 check('boost auto-follows actual corners without player turn commands',end.turnCount>=2&&end.phase==='playing');
 check('boost and attached invincibility end after braking',!end.boost.active&&!end.powers.some(e=>e.kind==='boost'||e.kind==='shield'));
 g.advance(7000);check('real collisions resume and reach results',g.state().phase==='ended');
 g.restart();g.freeze();check('results restart resets boost',!g.state().boost.active&&g.state().boost.left===0&&g.state().phase==='playing');
 prep();g.spawnPickup('boost',1,3,1.35);g.advance(1200);const savedSpeed=g.state().boost.speedBefore;
 g.spawnPickup('boost',1,3,1.35);g.advance(100);
 check('second real boost pickup refreshes budget without replacing saved speed',g.state().boost.left>290&&g.state().boost.speedBefore===savedSpeed);
 prep();g.press('left');let routeTicks=0;
 while(g.state().phase==='playing'&&g.state().distanceExact<350&&routeTicks++<1500){
  const s=g.state();if(s.nextTurn-s.distanceExact<5&&!s.turnQueued)g.press(s.turnDirection===-1?'left':'right');
  if(s.obstacles.some(o=>o.ahead>0&&o.ahead<10)&&!s.airborne)g.press('jump');g.advance(25);
 }
 check('normal route reaches third-turn approach',g.state().phase==='playing'&&g.state().turnCount===2);
 g.spawnPickup('boost',g.state().lane,3,1.35);g.advance(250);let override=false;
 for(let n=0;n<500&&g.state().phase==='playing'&&g.state().turnCount<3;n++){
  const s=g.state();if(s.autoTurnQueued&&s.nextTurn-s.distanceExact<=5&&!override){g.press('right');override=true;}g.advance(25);
 }
 check('manual T choice overrides boost default exit',override&&g.state().phase==='playing'&&g.graph().forks.find(f=>f.at===489)?.chosen==='right');
 return {checks,start,peak,firstBrake,end};
})()
