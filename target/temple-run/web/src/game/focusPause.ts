export const PORTRAIT_BLOCK_QUERY='(orientation: landscape) and (max-height: 520px)';
/** Web lifecycle policy: losing focus pauses; returning never resumes implicitly.
 * The callback must pause idempotently, not toggle pause/resume. */
export function bindFocusPause(windowTarget:EventTarget,documentTarget:EventTarget&{visibilityState?:string},pause:()=>void,viewportBlocked:()=>boolean=()=>false):()=>void {
 const hidden=()=>{if(documentTarget.visibilityState==='hidden')pause();};
 const resized=()=>{if(viewportBlocked())pause();};
 windowTarget.addEventListener('resize',resized);
 windowTarget.addEventListener('blur',pause);
 documentTarget.addEventListener('visibilitychange',hidden);
 return ()=>{windowTarget.removeEventListener('resize',resized);windowTarget.removeEventListener('blur',pause);documentTarget.removeEventListener('visibilitychange',hidden);};
}
