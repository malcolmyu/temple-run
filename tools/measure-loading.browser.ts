// Observe after navigation, before running gameplay or opening optional panels.
(()=>{
 const entries=performance.getEntriesByType('resource') as PerformanceResourceTiming[];
 const mark=performance.getEntriesByName('temple-ready')[0]?.startTime;
 const ready=(window.__readyObserved139 as number|null)??mark??null;
 const resources=entries.map(r=>r.toJSON());
 return {viewport:{width:innerWidth,height:innerHeight,dpr:devicePixelRatio},url:location.href,observedReady:ready,applicationReadyMark:mark,paint:performance.getEntriesByType('paint').map(p=>({name:p.name,time:p.startTime})),navigation:performance.getEntriesByType('navigation')[0]?.toJSON(),resources};
})()
