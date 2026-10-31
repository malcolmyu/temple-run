import assert from 'node:assert/strict';
import {Input} from '../target/temple-run/web/src/game/input';
const win=new EventTarget(),canvas=new EventTarget(),input=new Input();
input.attach(win as Window,canvas as HTMLCanvasElement);
function pointer(type:string,x:number,y:number,id=1){const e=new Event(type);Object.assign(e,{clientX:x,clientY:y,pointerId:id,button:0});canvas.dispatchEvent(e);}
pointer('pointerdown',200,200);pointer('pointermove',100,200);
assert.deepEqual(input.drain(),['left'],'recognize left before finger release');
pointer('pointermove',50,200);pointer('pointermove',250,200);pointer('pointerup',250,200);
assert.deepEqual(input.drain(),[],'one gesture cannot issue repeated or reversed commands');
for(const [x,y,action] of [[300,200,'right'],[200,100,'jump'],[200,300,'slide']] as const){
 pointer('pointerdown',200,200);pointer('pointermove',x,y);assert.deepEqual(input.drain(),[action]);pointer('pointerup',x,y);assert.deepEqual(input.drain(),[]);
}
pointer('pointerdown',200,200);pointer('pointermove',207,200);assert.deepEqual(input.drain(),[]);pointer('pointercancel',207,200);pointer('pointerup',100,200);assert.deepEqual(input.drain(),[],'cancel before recognition discards tap');
pointer('pointerdown',200,200);pointer('pointermove',100,200);assert.deepEqual(input.drain(),['left']);pointer('pointercancel',100,200);pointer('pointerup',100,200);assert.deepEqual(input.drain(),[],'cancel after recognition adds nothing');
pointer('pointerdown',200,200);pointer('pointermove',100,200,2);pointer('pointerup',100,200,2);assert.deepEqual(input.drain(),[],'another pointer cannot consume the gesture');pointer('pointerup',200,200);assert.deepEqual(input.drain(),['jump'],'stationary tap compatibility');
pointer('pointerdown',200,200);input.setBlocked(true);pointer('pointermove',100,200);pointer('pointerup',100,200);input.setBlocked(false);assert.deepEqual(input.drain(),[],'modal discards in-flight pointer');
pointer('pointerdown',200,200);pointer('pointermove',100,200);input.resetTransient();pointer('pointerup',100,200);assert.deepEqual(input.drain(),[],'world reset clears queued gesture and release');
pointer('pointerdown',200,200);pointer('lostpointercapture',200,200);pointer('pointerup',100,200);assert.deepEqual(input.drain(),[]);
pointer('pointerdown',200,200);pointer('pointerup',300,200);assert.deepEqual(input.drain(),['right'],'release-only pointer still recognized');
console.log('Gesture input: recognition before release, four directions, one command, cancellation, second pointer, modal/reset and release fallback pass');
