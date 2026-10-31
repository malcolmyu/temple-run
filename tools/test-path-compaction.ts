import assert from 'node:assert/strict';
import {TrackPath} from '../target/temple-run/web/src/game/path';
import {TrackGraph} from '../target/temple-run/web/src/game/trackGraph';
const full=new TrackPath(),compact=new TrackPath();let peak=0;
for(let i=1;i<=2000;i++){
 const d=i*120;full.turn(d,i%3?1:-1);compact.turn(d,i%3?1:-1);compact.compactBefore(d-240);peak=Math.max(peak,compact.segments.length);
 for(const delta of [-240,-120,-.01,0,.01,1,100])for(const side of [-1.9,0,1.9])for(const smooth of [false,true]){
  assert.deepEqual(compact.at(d+delta,side,smooth),full.at(d+delta,side,smooth));
  assert.equal(compact.nearTurn(d+delta,22),full.nearTurn(d+delta,22));
 }
 assert.equal(compact.segmentOffset+compact.segments.length,full.segments.length);
}
assert.ok(peak<=4);assert.equal(compact.clone().segmentOffset,compact.segmentOffset);
const graph=new TrackGraph(compact),base=compact.clone(),fork=graph.forkLateral(240010,1.9,240142);graph.choose(fork,'left');
const before=graph.active.at(240080,0,true);graph.compactBefore(239900);base.compactBefore(239900);
assert.deepEqual(graph.active.at(240080,0,true),before);graph.merge(base);assert.deepEqual(graph.active.at(240160),full.at(240160));
const saved=compact.segments.length;compact.compactBefore(NaN);assert.equal(compact.segments.length,saved);
console.log('Path compaction:2000 turns,retained-horizon/smooth/side/turn proximity/ordinal/clone/branch merge pass',{peak,offset:compact.segmentOffset});
