import assert from 'node:assert/strict';
import {nativeGroundContact,rebaseNativeGroundY} from '../target/temple-run/web/src/game/nativeDeath';
assert.equal(nativeGroundContact(-4,false,true,-3).dead,false,'absoluteY=-7 equality survives');
assert.equal(nativeGroundContact(-4.001,false,true,-3).deathType,1,'wood falls hit absolute water plane at relative-4');
assert.equal(nativeGroundContact(-4.001,false,true,0).dead,false,'stone has not reached water plane');
assert.equal(nativeGroundContact(-1.201,true,true,-3).deathType,4,'ledge depth stays relative to wood ground');
assert.equal(nativeGroundContact(-1.201,true,true,0).deathType,4,'same relative ledge depth on stone');
assert.equal(nativeGroundContact(0,true,false,-3).landed,true);
assert.equal(nativeGroundContact(.2,true,false,-3).landed,false);
assert.equal(nativeGroundContact(-5,true,true,-3).deathType,1,'absolute water death takes precedence over ledge');
console.log('Ground-relative ledge recovery and absolute water plane verified for stone and wood heights');

const walkingUp=rebaseNativeGroundY(0,-3,0);
assert.equal(walkingUp,-3);assert.equal(nativeGroundContact(walkingUp,true,false,0).deathType,4);
const jumpingUp=rebaseNativeGroundY(3.5,-3,0);
assert.equal(jumpingUp,.5);assert.equal(nativeGroundContact(jumpingUp,true,false,0).dead,false);
assert.equal(rebaseNativeGroundY(0,0,-3),3,'descending support preserves world position, allowing natural fall');
for(const [y,a,b]of [[0,-3,0],[3.5,-3,0],[0,0,3],[2,3,-3]])assert.equal(rebaseNativeGroundY(y,a,b)+b,y+a);
console.log('Ground plane changes preserve absolute Y; walking into a3m rise dies, sufficient jump clears it');
