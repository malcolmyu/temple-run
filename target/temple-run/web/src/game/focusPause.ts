/** Web lifecycle policy: losing focus pauses; returning never resumes implicitly.
 * The callback must pause idempotently, not toggle pause/resume. */
export function bindFocusPause(windowTarget:EventTarget,documentTarget:EventTarget&{visibilityState?:string},pause:()=>void):()=>void {
 const hidden=()=>{if(documentTarget.visibilityState==='hidden')pause();};
 windowTarget.addEventListener('blur',pause);
 documentTarget.addEventListener('visibilitychange',hidden);
 return ()=>{windowTarget.removeEventListener('blur',pause);documentTarget.removeEventListener('visibilitychange',hidden);};
}
