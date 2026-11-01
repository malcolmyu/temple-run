const dialog=document.querySelector<HTMLDialogElement>('#viewer')!;
const large=document.querySelector<HTMLImageElement>('#large')!;
const caption=document.querySelector<HTMLElement>('#viewer-caption')!;
const video=document.querySelector<HTMLAnchorElement>('#video-link')!;
let trigger:HTMLButtonElement|null=null;
document.querySelectorAll<HTMLButtonElement>('.frame').forEach(button=>button.addEventListener('click',()=>{
 trigger=button;large.src=button.querySelector('img')!.src;large.alt=button.dataset.caption!;caption.textContent=button.dataset.caption!;
 video.href=`https://www.bilibili.com/video/BV1ypuKzPErT/?t=${button.dataset.second}`;dialog.showModal();
}));
document.querySelector('#close')!.addEventListener('click',()=>dialog.close());
dialog.addEventListener('click',e=>{if(e.target===dialog)dialog.close();});
dialog.addEventListener('close',()=>trigger?.focus());
const filter=document.querySelector<HTMLSelectElement>('#filter')!;
const cards=[...document.querySelectorAll<HTMLElement>('article[data-status]')];
function update(){let count=0;for(const card of cards){card.hidden=filter.value!=='all'&&card.dataset.status!==filter.value;if(!card.hidden)count++;}document.querySelector('#count')!.textContent=`${count} / ${cards.length} 个设计项`;}
filter.addEventListener('change',update);update();
