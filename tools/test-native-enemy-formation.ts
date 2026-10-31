import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import {nativeEnemyFormation} from '../target/temple-run/web/src/game/chasePresentation';
const source=JSON.parse(readFileSync('target/temple-run/analysis/native-enemy-formation-source.json','utf8'));
for(let i=0;i<8;i++){
 const expected=i===0?{side:0,behind:0}:{side:source.sideTable[i-1]*source.spreadLeftRight*.2,behind:source.backTable[i-1]*source.spreadFrontBack*.2};
 assert.deepEqual(nativeEnemyFormation(i),expected);
}
assert.ok(nativeEnemyFormation(1).side<0&&nativeEnemyFormation(2).side>0);
assert.ok(nativeEnemyFormation(1).behind>0&&nativeEnemyFormation(2).behind>nativeEnemyFormation(1).behind);
assert.equal(source.count,8);
console.log('Native eight-member formation agrees with binary tables and serialized scene spread.');
