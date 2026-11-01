/** Native GameCamera.Shake12ac828 and Update12affb0..12b0058.
 * Native phase deliberately DECREASES from zero; amplitude damps linearly.
 * Transform.Translate(float,float,float) applies local camera X/Y, not rotation.
 */
export interface NativeCameraShake {phase:number;magnitude:number;damper:number;duration:number;frequency:number}
export function startNativeCameraShake(magnitude:number,duration:number,frequency=1):NativeCameraShake {
 return {phase:0,magnitude:Math.fround(magnitude),damper:Math.fround(magnitude/duration),duration:Math.fround(duration),frequency:Math.fround(frequency)};
}
export function stepNativeCameraShake(shake:NativeCameraShake|null,dt:number):{state:NativeCameraShake|null;offset:[number,number,number]} {
 if(!shake)return{state:null,offset:[0,0,0]};
 const delta=Math.fround(dt),phase=Math.fround(shake.phase-delta);
 const magnitude=Math.fround(shake.magnitude-Math.fround(delta*shake.damper));
 if(magnitude<=0||phase>shake.duration)return{state:null,offset:[0,0,0]};
 const wave=(frequency:number)=>Math.fround(Math.fround(magnitude*Math.fround(Math.sin(Math.fround(Math.fround(phase*frequency)*shake.frequency))))*.2);
 return{state:{...shake,phase,magnitude},offset:[wave(35),wave(50),0]};
}
