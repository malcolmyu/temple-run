import assert from 'node:assert/strict';
import {selectNativeBonus,BonusSpawnDirector} from '../target/temple-run/web/src/game/nativeBonusSpawn';
import {SeededRandom} from '../target/temple-run/web/src/game/obstacles/rng';
let calls=0;const stub={int:(max:number)=>{calls++;return max-1;}};
assert.equal(selectNativeBonus({bonus:0,shield:0,magnet:0,boost:0},stub),null);assert.equal(calls,0);
assert.equal(selectNativeBonus({bonus:1,shield:0,magnet:0,boost:0},stub),null,'Range(0,2)==1 skips opportunity');
const a=new SeededRandom(77),b=new SeededRandom(77);
for(let i=0;i<1000;i++)assert.equal(selectNativeBonus({bonus:1,shield:1,magnet:0,boost:0},a),selectNativeBonus({bonus:.01,shield:999,magnet:-1,boost:0},b),'positive magnitudes enable types, not weight them');
const rng=new SeededRandom(12),counts:Record<string,number>={none:0,bonus:0,shield:0,magnet:0,boost:0};
for(let i=0;i<100000;i++)counts[selectNativeBonus({bonus:1,shield:1,magnet:1,boost:1},rng)??'none']++;
assert.ok(Math.abs(counts.none/100000-.5)<.01);
for(const kind of ['bonus','shield','magnet','boost'])assert.ok(Math.abs(counts[kind]/100000-.125)<.01);
const director=new BonusSpawnDirector(new SeededRandom(4));
assert.equal(director.next,612,'strictly more than50 cells');
let previous=0,spawns=0;
for(let i=0;i<10000;i++){
 const at=director.next;const p=director.attempt(i%13!==0);
 if(p){assert.ok(p.distance-previous>600);assert.equal(p.distance%12,0);assert.notEqual(i%13,0);previous=p.distance;spawns++;}
}
assert.ok(spawns>100);
const c=new BonusSpawnDirector(new SeededRandom(5)),d=new BonusSpawnDirector(new SeededRandom(5));
for(let i=0;i<1000;i++)assert.deepEqual(c.attempt(i%7!==0),d.attempt(i%7!==0));
c.skipTo(1000);assert.ok(c.next>1600);assert.equal(c.next%12,0);
console.log('Native bonus selection: eligibility,50% gate, uniform enabled pool, strict spacing, reproducibility and debug skips pass.',counts);
