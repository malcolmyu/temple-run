import assert from 'node:assert/strict';
import {nativeUpgradeObjectiveCount,NATIVE_OBJECTIVE_UPGRADES} from '../target/temple-run/web/src/game/nativeUpgradeObjectives';
for(const threshold of [1,5]) {
 const levels:Record<string,number>={coin:99};
 assert.equal(nativeUpgradeObjectiveCount(levels,threshold),0);
 for(const [index,id] of NATIVE_OBJECTIVE_UPGRADES.entries()) {
  levels[id]=threshold-1;
  assert.equal(nativeUpgradeObjectiveCount(levels,threshold),index);
  levels[id]=threshold;
  assert.equal(nativeUpgradeObjectiveCount(levels,threshold),index+1);
 }
 levels.magnet=NaN;assert.equal(nativeUpgradeObjectiveCount(levels,threshold),4);
 levels.magnet=6;assert.equal(nativeUpgradeObjectiveCount(levels,threshold),5);
}
console.log('Native upgrade objectives:all five types,1/5 boundaries,partial progress,legacy exclusion and invalid values pass');
