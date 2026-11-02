/** Navigation-relative timings also available before Vue/Three execute. */
export function startupMark(name:string):void {
 const timing=(window as unknown as {__startupTiming?:{mark:(name:string)=>void}}).__startupTiming;
 timing?.mark(name);
}
