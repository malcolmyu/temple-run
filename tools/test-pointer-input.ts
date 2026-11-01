import assert from 'node:assert/strict';
import {Input} from '../target/temple-run/web/src/game/input';
const windowTarget=new EventTarget(),canvas=new EventTarget(),captures=new Set<number>();
Object.assign(canvas,{setPointerCapture:(id:number)=>captures.add(id),hasPointerCapture:(id:number)=>captures.has(id),releasePointerCapture:(id:number)=>captures.delete(id)});
const input=new Input();input.attach(windowTarget as unknown as Window,canvas as unknown as HTMLCanvasElement);
const point=(type:string,id:number,x:number,y:number,button=0)=>canvas.dispatchEvent(Object.assign(new Event(type),{pointerId:id,clientX:x,clientY:y,button}));
point('pointerdown',1,100,100);point('pointerdown',2,250,100);point('pointerup',1,200,100);
assert.deepEqual(input.drain(),['right'],'second finger must not overwrite the first gesture origin');
point('pointerup',2,150,100);assert.deepEqual(input.drain(),[]);
point('pointerdown',1,100,100);point('pointercancel',2,100,100);point('pointerup',1,0,100);assert.deepEqual(input.drain(),['left']);
point('pointerdown',3,100,100);assert.ok(captures.has(3));point('pointercancel',3,100,100);point('pointerup',3,100,200);assert.deepEqual(input.drain(),[]);
point('pointerdown',4,100,100);point('lostpointercapture',4,100,100);point('pointerup',4,100,200);assert.deepEqual(input.drain(),[]);
point('pointerdown',5,100,100,2);point('pointerup',5,100,100,2);assert.deepEqual(input.drain(),[],'right-click cannot jump');
for(const [dx,dy,action]of [[0,-80,'jump'],[0,80,'slide'],[80,0,'right'],[-80,0,'left'],[2,2,'jump']]as const){point('pointerdown',7,100,100);point('pointerup',7,100+dx,100+dy);assert.deepEqual(input.drain(),[action]);}
point('pointerdown',8,100,100);windowTarget.dispatchEvent(new Event('blur'));point('pointerup',8,200,100);assert.deepEqual(input.drain(),[]);
console.log('Pointer input: primary gesture identity, capture, foreign cancellation, loss/blur, right-click and swipe/tap mapping pass.');
