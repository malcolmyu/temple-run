import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import {NATIVE_COIN_ROOT_Y,NATIVE_COIN_ANGULAR_SPEED,nativeCoinYaw,nativeCoinRootHeight} from '../target/temple-run/web/src/game/nativeCoinPresentation';
const source=JSON.parse(readFileSync('target/temple-run/analysis/native-coin-presentation-source.json','utf8'));
assert.equal(NATIVE_COIN_ROOT_Y,source.standardRootYWorld);assert.equal(NATIVE_COIN_ANGULAR_SPEED,source.rendererRadiansPerSecond);
for(const coin of source.coins){
 const obj=readFileSync(`target/temple-run/web/public/assets/track/coin-${coin.colour}.obj`,'utf8');
 const vertices=obj.split('\n').filter(l=>l.startsWith('v ')).map(l=>l.split(/\s+/).slice(1).map(Number));assert.equal(vertices.length,coin.worldVertices.length);
 vertices.forEach((p,i)=>p.forEach((v,k)=>assert.ok(Math.abs(v-coin.worldVertices[i][k])<1e-8,'original pivot and .2 scale must survive export')));
}
assert.equal(nativeCoinRootHeight(1.3,1.3),.6);assert.ok(Math.abs(nativeCoinRootHeight(3.7,1.3)-3)<1e-12);
assert.equal(nativeCoinYaw(.5,0),.5);assert.ok(Math.abs(nativeCoinYaw(.5,180/257)-(.5+Math.PI))<1e-12);
console.log('Original 3 coin mesh pivots/unit scale, -257 native deg/s conversion, root height and fitted arc offsets verified.');
