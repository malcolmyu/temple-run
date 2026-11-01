// Typed source for the generated standalone audit appendix.
interface EvidenceRecord {
    path: string;
    url: string;
    kind: string;
    group: string;
    bytes: number;
    sha256: string;
}
const records: EvidenceRecord[] = JSON.parse(document.querySelector('#evidence-data')!.textContent!);
const $ = (s: string) => document.querySelector(s) as HTMLElement;
const searchInput = $('#search') as HTMLInputElement, groupSelect = $('#group') as HTMLSelectElement, kindSelect = $('#kind') as HTMLSelectElement;
const detailDialog = $('#detail') as HTMLDialogElement, prevButton = $('#prev') as HTMLButtonElement, nextButton = $('#next') as HTMLButtonElement;
const groups = [...new Set(records.map(r => r.group))];
for (const g of groups) {
    const o = document.createElement('option');
    o.textContent = g;
    groupSelect.append(o);
}
$('#counts').textContent = `共 ${records.length} 项；图片 ${records.filter(r => r.kind === '图片').length} 张。清单只覆盖仓库现存归档，不代表完整观看所有视频或整个 APK 内容已逆向。`;
let page = 0, filtered: EvidenceRecord[] = [];
function el<K extends keyof HTMLElementTagNameMap>(tag: K, text?: string): HTMLElementTagNameMap[K] { const e = document.createElement(tag); if (text !== undefined)
    e.textContent = text; return e; }
function render() { const q = searchInput.value.trim().toLowerCase(), group = groupSelect.value, kind = kindSelect.value; filtered = records.filter(r => (!q || (r.path + ' ' + r.group).toLowerCase().includes(q)) && (!group || r.group === group) && (!kind || r.kind === kind)); const pages = Math.max(1, Math.ceil(filtered.length / 24)); page = Math.min(page, pages - 1); $('#status').textContent = `匹配 ${filtered.length} 项`; $('#page').textContent = `第 ${page + 1} / ${pages} 页`; prevButton.disabled = page === 0; nextButton.disabled = page === pages - 1; $('#grid').replaceChildren(); for (const r of filtered.slice(page * 24, page * 24 + 24)) {
    const card = el('article');
    card.className = 'evidence';
    if (r.kind === '图片') {
        const a = el('a');
        a.href = r.url;
        const im = el('img');
        im.src = r.url;
        im.loading = 'lazy';
        im.alt = r.path;
        im.onerror = () => im.alt = '图片未能载入，请打开原文件：' + r.path;
        a.append(im);
        a.onclick = e => { e.preventDefault(); open(r); };
        card.append(a);
    }
    else {
        const label = el('div', r.path.split('.').pop().toUpperCase());
        label.className = 'file';
        card.append(label);
    }
    const body = el('div');
    body.className = 'body';
    const tag = el('span', r.group);
    tag.className = 'tag';
    body.append(tag, el('p', r.path), el('p', `${(r.bytes / 1024).toFixed(1)} KB`), el('code', 'SHA256 ' + r.sha256.slice(0, 16) + '…'));
    const links = el('p');
    const a = el('a', '打开原始文件');
    a.href = r.url;
    a.target = '_blank';
    a.rel = 'noopener';
    links.append(a);
    if (r.kind !== '图片') {
        const b = el('button', '页内阅读');
        b.onclick = () => open(r);
        links.append(' ', b);
    }
    body.append(links);
    card.append(body);
    $('#grid').append(card);
} }
async function open(r: EvidenceRecord) { $('#detailtitle').textContent = r.path; $('#detailbody').replaceChildren(); detailDialog.showModal(); if (r.kind === '图片') {
    const im = el('img');
    im.src = r.url;
    im.alt = r.path;
    $('#detailbody').append(im);
}
else {
    const pre = el('pre', '读取中…');
    $('#detailbody').append(pre);
    try {
        const response = await fetch(r.url + (r.url.includes('?') ? '&raw' : '?raw'));
        if (!response.ok)
            throw Error(String(response.status));
        let text=await response.text();
            // Vite's raw loader wraps source text in an export; static servers return it directly.
            if((response.headers.get('content-type')??'').includes('javascript')&&text.trimStart().startsWith('export default "')){
                const encoded=text.trim().replace(/^export default\s+/, '').replace(/\n\/\/# sourceMappingURL=[\s\S]*$/, '').trim().replace(/;$/, '');
                text=JSON.parse(encoded);
            }
            pre.textContent=text;
            if(globalThis.crypto?.subtle){
                const digest=await crypto.subtle.digest('SHA-256',new TextEncoder().encode(text));
                const actual=[...new Uint8Array(digest)].map(b=>b.toString(16).padStart(2,'0')).join('');
                const note=el('p',actual===r.sha256?'SHA-256 校验通过':'SHA-256 不匹配：当前文件可能已更新，请重建审计索引');
                $('#detailbody').prepend(note);
            }
    }
    catch (e) {
        pre.textContent = '无法页内读取。请使用“打开原始文件”，或通过本地开发服务器访问本页。' + e;
    }
} }
for (const id of ['search', 'group', 'kind'])
    $('#' + id).addEventListener(id === 'search' ? 'input' : 'change', () => { page = 0; render(); });
$('#clear').onclick = () => { searchInput.value = groupSelect.value = kindSelect.value = ''; page = 0; render(); };
prevButton.onclick = () => { page--; render(); };
nextButton.onclick = () => { page++; render(); };
$('#close').onclick = () => detailDialog.close();
for (const b of document.querySelectorAll<HTMLElement>('[data-query]'))
    b.onclick = () => { searchInput.value = b.dataset.query; groupSelect.value = kindSelect.value = ''; page = 0; render(); searchInput.scrollIntoView({ block: 'center' }); };
render();
