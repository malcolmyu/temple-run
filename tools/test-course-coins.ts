import assert from 'node:assert/strict';
import {CourseCoinDirector} from '../target/temple-run/web/src/game/courseCoins';
import {CoursePlan} from '../target/temple-run/web/src/game/coursePlan';
for(let seed=1;seed<=100;seed++){
 const p=new CoursePlan(seed,489);p.ensureThrough(2000,1500,true);p.ensureThrough(5000,2000,false);
 const whole=new CourseCoinDirector().takeThrough(4500,p),stream=new CourseCoinDirector();let rows:typeof whole=[];
 for(let to=500;to<=4500;to+=25)rows.push(...stream.takeThrough(to,p));assert.deepEqual(rows,whole);assert.ok(rows.length);
 for(const c of rows){if(c.pattern===7){assert.ok(p.turns.some(t=>t.junction==='corner'&&Math.abs(t.distance-c.distance)<=5));continue;}const f=p.features.find(f=>c.distance>=f.from&&c.distance<f.to)!;assert.ok(c.distance>=f.from+6&&c.distance<=f.to-6);assert.notEqual(f.kind,'transition');assert.notEqual(f.kind,'branch');}
 assert.ok(rows.length<2000);assert.equal(new Set(rows.map(c=>c.distance)).size,rows.length);
}
console.log('Course coins:100 mixed courses,chunk invariance,unique native arrays,corner point validation and transition/branch exclusion pass');
