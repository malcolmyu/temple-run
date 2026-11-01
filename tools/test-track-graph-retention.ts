import assert from 'node:assert/strict';
import {TrackGraph} from '../target/temple-run/web/src/game/trackGraph';
const graph=new TrackGraph(),baseline=new TrackGraph();let peak=0;
for(let i=1;i<=1000;i++){
 const d=i*180;
 const a=graph.fork(d),b=baseline.fork(d);graph.choose(a,i%2?'left':'right');baseline.choose(b,i%2?'left':'right');
 graph.pruneBefore(d-120);peak=Math.max(peak,graph.forks.length);
 for(const offset of [-100,-3,0,5,80])assert.deepEqual(graph.active.at(d+offset,0,true),baseline.active.at(d+offset,0,true));
 assert.equal(graph.nodes.length,graph.forks.length);
}
assert.equal(peak,1);assert.equal(baseline.forks.length,1000);
const active=graph.active,base=active.clone(),side=graph.forkLateral(180050,1.9,180182);graph.choose(side,'right');
graph.pruneBefore(180100);assert.ok(graph.forks.includes(side),'incomplete merge remains available');
assert.equal(graph.active,side.right);assert.deepEqual(graph.active.at(180130),side.right.at(180130));
graph.merge(base);graph.pruneBefore(180183);assert.equal(graph.forks.length,0);assert.equal(graph.nodes.length,0);assert.equal(graph.active,base);
const future=graph.fork(181000);graph.pruneBefore(NaN);assert.ok(graph.forks.includes(future));
console.log('Graph retention:1000 turns preserve world poses,old snapshots bounded,active/unfinished/future forks and merge retained');
