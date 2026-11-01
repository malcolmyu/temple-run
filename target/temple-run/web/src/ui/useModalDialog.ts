import { onBeforeUnmount, onMounted, ref } from 'vue';

/** Native button activation bypasses the game's Input queue. Keep keyboard
 * focus inside the open panel as well as blocking gameplay commands. */
export function useModalDialog(close:()=>void) {
  const dialog=ref<HTMLElement|null>(null);
  let previousFocus:HTMLElement|null=null;
  const focusable=()=>Array.from(dialog.value?.querySelectorAll<HTMLElement>(
    'button:not(:disabled),input:not(:disabled),select:not(:disabled),textarea:not(:disabled),a[href],summary,[tabindex]:not([tabindex="-1"])',
  )??[]).filter(el=>el.tabIndex>=0&&el.getClientRects().length>0);
  const focusFirst=()=>{(focusable()[0]??dialog.value)?.focus();};
  const containFocus=(event:FocusEvent)=>{
    if(event.target instanceof Node&&!dialog.value?.contains(event.target))focusFirst();
  };
  const keydown=(event:KeyboardEvent)=>{
    if(event.key==='Escape'){
      event.preventDefault();event.stopPropagation();close();return;
    }
    if(event.key!=='Tab')return;
    const items=focusable(),first=items[0],last=items[items.length-1];
    if(!first){event.preventDefault();dialog.value?.focus();return;}
    if(event.shiftKey&&(document.activeElement===first||document.activeElement===dialog.value)){
      event.preventDefault();last.focus();
    }else if(!event.shiftKey&&document.activeElement===last){
      event.preventDefault();first.focus();
    }
  };
  onMounted(()=>{
    previousFocus=document.activeElement instanceof HTMLElement?document.activeElement:null;
    dialog.value?.addEventListener('keydown',keydown);
    document.addEventListener('focusin',containFocus);
    focusFirst();
  });
  onBeforeUnmount(()=>{
    dialog.value?.removeEventListener('keydown',keydown);
    document.removeEventListener('focusin',containFocus);
    if(previousFocus?.isConnected)previousFocus.focus();
  });
  return dialog;
}
