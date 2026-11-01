// Exercise mounted Vue panels and native DOM focus, not just the Input queue.
// The complementary native Shift-Tab/Enter reproduction is in modal-focus121.json.
(async()=>{
 const g=window.__templeGame,checks=[];
 const check=(name,ok)=>{checks.push({name,passed:!!ok});if(!ok)throw Error(name);};
 const flush=()=>new Promise(resolve=>requestAnimationFrame(resolve));
 const key=(target,key,shiftKey=false)=>target.dispatchEvent(new KeyboardEvent('keydown',{key,shiftKey,bubbles:true,cancelable:true}));
 g.toMenu();g.freeze();await flush();
 for(const name of ['STORE','目标','升级','STATS','OPTIONS','玩法说明']){
  const entry=Array.from(document.querySelectorAll<HTMLElement>('.menu-row button')).find(b=>b.textContent.trim()===name);
  entry.focus();entry.click();await flush();
  const root=document.querySelector<HTMLElement>('[role="dialog"]');
  check(`${name}: focus enters panel`,root&&root.contains(document.activeElement));
  const first=document.activeElement;
  key(first,'Tab',true);
  const last=document.activeElement;
  check(`${name}: reverse Tab stays in panel`,root.contains(last)&&/返回|完成/.test(last.textContent));
  key(last,'Tab');check(`${name}: forward Tab wraps`,document.activeElement===first);
  const background=document.querySelector<HTMLElement>('.overlay:not([role="dialog"]) .primary');
  background.focus();check(`${name}: background focus redirected`,root.contains(document.activeElement));
  key(document.activeElement,'Escape');await flush();
  check(`${name}: Escape closes without starting`,!document.querySelector<HTMLElement>('[role="dialog"]')&&g.state().phase==='menu');
  check(`${name}: focus returns to entry`,document.activeElement===entry);
 }
 const seen=localStorage.getItem('temple.v2.tutorial');
 try{
  localStorage.removeItem('temple.v2.tutorial');
  const entry=document.querySelector<HTMLElement>('.overlay:not([role="dialog"]) .primary');
  entry.focus();entry.click();await flush();
  const root=document.querySelector<HTMLElement>('.tutorial-overlay');
  check('tutorial: focus enters primer',root&&root.contains(document.activeElement));
  const first=document.activeElement;
  key(first,'Tab',true);
  check('tutorial: reverse Tab reaches return',root.contains(document.activeElement)&&document.activeElement.textContent==='返回主菜单');
  key(document.activeElement,'Tab');check('tutorial: forward Tab wraps',document.activeElement===first);
  const before=g.state();g.advance(2000);
  check('tutorial: does not advance world',g.state().phase==='menu'&&g.state().distanceExact===before.distanceExact);
  key(document.activeElement,'Escape');await flush();
  check('tutorial: cancel closes without opening store',!document.querySelector<HTMLElement>('.tutorial-overlay')&&!document.querySelector<HTMLElement>('.store-card')&&g.state().phase==='menu');
  check('tutorial: cancel does not mark seen',localStorage.getItem('temple.v2.tutorial')===null);
  check('tutorial: focus returns to start',document.activeElement===entry);
 }finally{
  if(seen===null)localStorage.removeItem('temple.v2.tutorial');else localStorage.setItem('temple.v2.tutorial',seen);
 }
 return {checks};
})()
