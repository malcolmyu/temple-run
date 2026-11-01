import assert from 'node:assert/strict';
import {newEnemyJump,queueEnemyJump,stepEnemyJump} from '../target/temple-run/web/src/game/enemyJump';
const enemy=newEnemyJump();queueEnemyJump(enemy,5,25);
assert.equal(enemy.delay,Math.fround(.2));stepEnemyJump(enemy,.1,true);assert.equal(enemy.delay,Math.fround(.2));
stepEnemyJump(enemy,.1);assert.equal(enemy.y,0);stepEnemyJump(enemy,.1);assert.equal(enemy.jumping,true);assert.ok(enemy.y>0);
const velocity=enemy.v;queueEnemyJump(enemy,0,25);assert.equal(enemy.v,velocity,'cannot restart while jumping');
for(let i=0;i<100;i++)stepEnemyJump(enemy,.01);
assert.equal(enemy.y,0);assert.equal(enemy.jumping,false);
queueEnemyJump(enemy,0,25);assert.equal(enemy.v,20);assert.equal(enemy.jumping,true);
console.log('Enemy delayed jump: distance/speed, intro hold, launch, rejection while airborne and landing pass');

const changingSpeed=newEnemyJump();queueEnemyJump(changingSpeed,5,25);
stepEnemyJump(changingSpeed,.1,false,25);stepEnemyJump(changingSpeed,.1,false,18);
assert.equal(changingSpeed.v,13,'launch samples current18 speed, then gravity subtracts5');
const slow=newEnemyJump();queueEnemyJump(slow,0,10);assert.equal(slow.v,16);
const fast=newEnemyJump();queueEnemyJump(fast,0,40);assert.equal(fast.v,20);
console.log('Enemy launch samples current speed clamped16..20, including pending-delay speed changes');
