/** Inject after navigation, before readiness, on a fresh cold-cache document.
 * Measures an equivalent playable TTI: ready menu + a started simulation with2 ticks.
 * Not Lighthouse's5-second network/CPU quiet-window definition. */
export function installStartupProbe(){
 const tasks:Array<{start:number;duration:number}>=[];
 new PerformanceObserver(list=>tasks.push(...list.getEntries().map(e=>({start:e.startTime,duration:e.duration})))).observe({type:'longtask',buffered:true});
 const tick=setInterval(()=>{
  const mark=performance.getEntriesByName('temple-ready')[0];if(!mark)return;
  clearInterval(tick);const ready=mark.startTime;const game=window.__templeGame;game.start();
  const wait=setInterval(()=>{
   if(game.state().phase!=='playing'||game.state().simulation.steps<2)return;
   clearInterval(wait);const interactive=performance.now();game.freeze();
   (window as any).__startupSample={ready,interactive,paint:performance.getEntriesByType('paint').map(p=>({name:p.name,time:p.startTime})),resources:performance.getEntriesByType('resource').map(r=>r.toJSON()),tasks,viewport:[innerWidth,innerHeight],userAgent:navigator.userAgent};
  },25);
 },25);
}
