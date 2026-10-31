/** One-off before/after migration audit. Capture before editing, compare after.
 * Not a permanent fixed-map acceptance gate; use when moving generator duties. */
import assert from 'node:assert/strict';
import {readFileSync,writeFileSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {CoursePlan} from '../target/temple-run/web/src/game/coursePlan';
import {CourseCoinDirector} from '../target/temple-run/web/src/game/courseCoins';
const snapshots=[];
for(let seed=1;seed<=100;seed++)for(const opening of ['generated','fixture']as const){
 const course=new CoursePlan(seed,0,opening),coins=new CourseCoinDirector(),stages=[];
 for(let step=1;step<=10;step++){
  if(step%2===0)course.requestTheme(([1,3,2]as const)[step/2%3],step*500);
  course.ensureThrough(step*3000,step*500,step%4===0);
  const row=coins.takeThrough(step*3000-90,course);
  stages.push({extent:course.extent,features:course.features,turns:course.turns,obstacles:course.obstacles,narrows:course.narrows,branches:course.branches,surfaces:course.surfaces,rejected:course.rejectedEncounters,coins:row});
  // Freeze each public publication before ensureThrough mutates future arrays.
  stages[stages.length-1]=JSON.parse(JSON.stringify(stages.at(-1)));
 }
 snapshots.push({seed,opening,sha256:createHash('sha256').update(JSON.stringify(stages)).digest('hex')});
}
const [mode,file]=process.argv.slice(2);assert.ok(file,'provide --capture/--compare path');
if(mode==='--capture')writeFileSync(file,JSON.stringify(snapshots,null,2)+'\n');
else if(mode==='--compare')assert.deepEqual(snapshots,JSON.parse(readFileSync(file,'utf8')),'published geometry/coins/RNG sequence changed');
else throw Error('Use --capture or --compare');
console.log(`Course publication:${mode},100 seeds×normal/fixture×10 stages,30km,mixed themes/fast turns,all public course fields and coin rows verified`);
