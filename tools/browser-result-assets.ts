/** Run against a real production-build result screen (not a mocked component).
 * Fetch computed CSS URLs so stylesheet-relative custom-property regressions fail. */
export async function inspectResultAssets(){
 const paper=document.querySelector<HTMLElement>('.scroll-paper');
 const art=document.querySelector<HTMLImageElement>('.result-illustration');
 if(!paper||!art)throw Error('Enter the actual result screen before running this audit');
 const urls=[...getComputedStyle(paper).backgroundImage.matchAll(/url\(["']?(.*?)["']?\)/g)].map(m=>m[1]);
 if(urls.length!==1)throw Error('Result paper must have one computed background URL');
 const images=[...document.querySelectorAll<HTMLImageElement>('.result-scroll img')];
 const ribbon=document.querySelector<HTMLElement>('.result-restart');
 if(ribbon)urls.push(...[...getComputedStyle(ribbon).backgroundImage.matchAll(/url\(["']?(.*?)["']?\)/g)].map(m=>m[1]));
 urls.push(...images.map(i=>i.currentSrc||i.src));
 const requests=await Promise.all([...new Set(urls)].map(async url=>{
  const response=await fetch(url);return{url,status:response.status,type:response.headers.get('content-type')};
 }));
 const rect=paper.getBoundingClientRect();
 const failures=[...requests.filter(r=>r.status!==200||!r.type?.startsWith('image/')).map(r=>`${r.status} ${r.url}`),...images.filter(i=>!i.complete||!i.naturalWidth).map(i=>`undecoded ${i.src}`)];
 if(rect.width<=0||rect.height<=0)failures.push('paper has no painted area');
 const summary=document.querySelector('.result-summary')!.getBoundingClientRect();
 if(summary.left<rect.left||summary.right>rect.right+1)failures.push('metrics outside paper');
 return{passed:failures.length===0,failures,paper:{url:urls[0],width:rect.width,height:rect.height},illustration:{url:art.src,width:art.naturalWidth,height:art.naturalHeight},requests};
}
