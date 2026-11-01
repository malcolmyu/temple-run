import assert from 'node:assert/strict';
import {writeFileSync} from 'node:fs';
import {CoursePlan} from '../target/temple-run/web/src/game/coursePlan';
const rows=[];
for(const pacing of ['baseline','raised']as const)for(let seed=1;seed<=200;seed++){
 const p=new CoursePlan(seed,0,'generated',pacing);
 for(let d=600;d<=12000;d+=60)p.ensureThrough(d,d*.7);
 assert.equal(p.rejectedEncounters.length,0);
 rows.push({pacing,seed,obstacles:p.obstacles.filter(o=>o.distance<=12000).length,narrows:p.narrows.filter(n=>n.from<=12000).length,branches:p.branches.filter(n=>n.from<=12000).length,recovery:p.features.filter(f=>f.kind==='recovery'&&f.from<=12000).length});
}
const mean=(mode,key)=>rows.filter(r=>r.pacing===mode).reduce((n,r)=>n+r[key],0)/200;
const summary=Object.fromEntries(['obstacles','narrows','branches','recovery'].map(key=>[key,{before:mean('baseline',key),after:mean('raised',key)}]));
assert.ok(summary.obstacles.after>summary.obstacles.before);
assert.ok(summary.obstacles.after<summary.obstacles.before*1.25,'avoid >25% first tuning step');
writeFileSync('target/temple-run/analysis/pacing141-generation.json',JSON.stringify({method:'200 paired seeds,normal streaming60m steps,progress=.7distance,12000worldm;no theme changes requested',summary,rows},null,2)+'\n');
console.log(summary);
