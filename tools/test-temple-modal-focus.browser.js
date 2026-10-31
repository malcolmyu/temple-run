// Exercise mounted Vue panels and native DOM focus, not just the Input queue.
// The complementary native Shift-Tab/Enter reproduction is in modal-focus121.json.
(async()=>{
 const g=window.__templeGame,checks=[];
 const check=(name,ok)=>{checks.push({name,passed:!!ok});if(!ok)throw Error(name);};
 const flush=()=>new Promise(resolve=>requestAnimationFrame(resolve));
 const key=(target,key,shiftKey=false)=>target.dispatchEvent(new KeyboardEvent('keydown',{key,shiftKey,bubbles:true,cancelable:true}));
 g.toMenu();g.freeze();await flush();
 for(const name of ['STORE','目标','升级','STATS','OPTIONS','玩法说明']){
  const entry=Array.from(document.querySelectorAll('.menu-row button')).find(b=>b.textContent.trim()===name);
  entry.focus();entry.click();await flush();
  const root=document.querySelector('[role="dialog"]');
  check(`${name}: focus enters panel`,root&&root.contains(document.activeElement));
  const first=document.activeElement;
  key(first,'Tab',true);
  const last=document.activeElement;
  check(`${name}: reverse Tab stays in panel`,root.contains(last)&&/返回|完成/.test(last.textContent));
  key(last,'Tab');check(`${name}: forward Tab wraps`,document.activeElement===first);
  const background=document.querySelector('.overlay:not([role="dialog"]) .primary');
  background.focus();check(`${name}: background focus redirected`,root.contains(document.activeElement));
  key(document.activeElement,'Escape');await flush();
  check(`${name}: Escape closes without starting`,!document.querySelector('[role="dialog"]')&&g.state().phase==='menu');
  check(`${name}: focus returns to entry`,document.activeElement===entry);
 }
 return {checks};
})()
