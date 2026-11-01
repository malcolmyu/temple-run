import assert from 'node:assert/strict';
import {NativeSceneryGrid} from '../target/temple-run/web/src/game/nativeSceneryGrid';
let calls=0;const ranges:number[][]=[];
const grid=new NativeSceneryGrid((min,max)=>{calls++;ranges.push([min,max]);return max===21?10:999;});
assert.equal(grid.simulate(0,0,[[24,24]]),true);
assert.equal(grid.slots.filter(s=>s.assigned).length,345); // 361 - 15 entrance cells - road cell.
assert.equal(grid.slots.some(s=>s.visible),false);
assert.equal(calls,345*3);
assert.deepEqual(ranges.slice(0,3),[[0,21],[0,21],[0,1000]]);
assert.deepEqual(grid.slots[0],{assigned:true,visible:false,cellX:-9,cellZ:-9,x:-108,z:-108});
const retained=grid.slots.find(s=>s.cellX===2&&s.cellZ===0)!;
const initialCalls=calls;
assert.equal(grid.simulate(-11.99,0,[]),false,'negative near-zero camera remains in same native cell');
assert.equal(calls,initialCalls);
grid.simulate(12,0,[[24,24]]);
assert.equal(grid.slots.find(s=>s.cellX===2&&s.cellZ===0),retained,'invisible assigned slots persist');
assert.equal(calls-initialCalls,19*3,'one new X column only; no density reroll of retained cells');
grid.simulate(12,0,[[24,0]],true);
assert.equal(retained.assigned,true); // recycled into first available new cell if any, or cleared
assert.equal(grid.slots.some(s=>s.assigned&&s.cellX===2&&s.cellZ===0),false,'new road occupancy evicts assigned slot');
console.log('Native scenery lifecycle: X-major traversal, entrance mask, hidden assignment retention, cell-boundary RNG calls and road eviction pass. Source RNG state unresolved; rendering integration pending.');

import {initializeSceneryResources,sceneryResourcePath} from '../target/temple-run/web/src/game/nativeSceneryGrid';
for(let roll=0;roll<21;roll++){
 let count=0;
 const resources=initializeSceneryResources((_min,max)=>{count++;return max===21?roll:max-1;});
 assert.equal(resources.length,361);
 const expected=roll<=10?{type:1,group:'tree',variant:3}:roll<=14?{type:2,group:'group2',variant:2}:roll<=16?{type:3,group:'group3',variant:2}:roll<=18?{type:1,group:'fixedType1',variant:0}:roll===19?{type:5,group:'fixedType5',variant:0}:{type:4,group:'fixedType4',variant:0};
 assert.deepEqual(resources[0],expected);
 assert.equal(count,361*(roll<=16?2:1),'fixed branches do not consume a variant RNG draw');
}
console.log('All21 pool initialization branches and conditional variant RNG draws pass; resource identities are decoded independently from native literals.');

assert.equal(sceneryResourcePath({type:1,group:'fixedType1',variant:0}),'Trees/overgrowthTrees');
assert.equal(sceneryResourcePath({type:1,group:'tree',variant:3}),'Trees/treeAlone4');
assert.equal(sceneryResourcePath({type:2,group:'group2',variant:1}),'Trees/rock2');
assert.equal(sceneryResourcePath({type:3,group:'group3',variant:2}),'Trees/cliff3');
assert.equal(sceneryResourcePath({type:4,group:'fixedType4',variant:0}),'Trees/groundPatchTemple');
assert.equal(sceneryResourcePath({type:5,group:'fixedType5',variant:0}),'Trees/templeHead');

// Cross-check selected resource identities against independently decoded native string data.
import {readFileSync} from 'node:fs';
const native=JSON.parse(readFileSync('target/temple-run/analysis/native-scenery-manager-source.json','utf8'));
for(const group of native.initialPoolResources){
 for(let variant=0;variant<group.resources.length;variant++){
  const resource=initializeSceneryResources((_min,max)=>max===21?group.roll[0]:variant)[0];
  assert.equal(sceneryResourcePath(resource),group.resources[variant]);
 }
}
