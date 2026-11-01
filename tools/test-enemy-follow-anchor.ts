import assert from 'node:assert/strict';
import {enemyFollowAnchor} from '../target/temple-run/web/src/game/chasePresentation';
const near=(a:number,b:number)=>assert.ok(Math.abs(a-b)<1e-9,`${a} != ${b}`);
// Straight road: full side2 becomes halfway to the centre while grounded.
let p=enemyFollowAnchor({x:2,z:-100,heading:0},2,3,false);near(p.x,1);near(p.z,-97);
p=enemyFollowAnchor({x:2,z:-100,heading:0},2,3,true);near(p.x,2);near(p.z,-97);
// Player has just turned right: native pack is behind current forward, even when
// this lies off the previous arm. It must not sample the previous road segment.
p=enemyFollowAnchor({x:101,z:-48,heading:-Math.PI/2},2,5,false);near(p.x,96);near(p.z,-49);
for(const heading of [0,.4,Math.PI/2,Math.PI,-Math.PI/2]){
 const actor={x:32+Math.cos(heading)*1.2,z:-24-Math.sin(heading)*1.2,heading};
 const out=enemyFollowAnchor(actor,1.2,4,false);
 const offset={x:out.x-actor.x,z:out.z-actor.z};
 near(offset.x*Math.cos(heading)-offset.z*Math.sin(heading),-.6);
 near(offset.x*Math.sin(heading)+offset.z*Math.cos(heading),4);
}
console.log('Enemy current-heading follow, half lateral anchor and airborne full lateral position verified. Native absolute grid origins remain unresolved.');
