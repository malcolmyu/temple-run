"""Build paginated WebP reference gallery; keep original captures under docs."""
import json,html,hashlib,math
from pathlib import Path
from PIL import Image
root=Path(__file__).resolve().parents[1];source=root/'docs/screenshots/BV1ypuKzPErT';out=root/'target/temple-run/web/public/screenshots/BV1ypuKzPErT';out.mkdir(parents=True,exist_ok=True)
frames=json.loads((source/'frames.json').read_text());records=[];pages=math.ceil(len(frames)/18)
for f in frames:
 p=source/f['image'];dest=out/(p.stem+'.webp')
 with Image.open(p) as im:im.save(dest,'WEBP',quality=84,method=6)
 records.append({**f,'sourceSHA256':hashlib.sha256(p.read_bytes()).hexdigest(),'image':dest.name,'bytes':dest.stat().st_size,'deliverySHA256':hashlib.sha256(dest.read_bytes()).hexdigest()})
style='body{margin:auto;max-width:1200px;padding:20px;background:#112025;color:#f0e8cc;font:16px system-ui}a{color:#f0c969}nav{display:flex;flex-wrap:wrap;gap:12px;margin:18px 0}main{display:grid;grid-template-columns:repeat(auto-fit,minmax(180px,1fr));gap:18px}figure{margin:0;background:#203337;padding:10px;border-radius:8px}img{display:block;width:100%;height:auto}figcaption{min-height:60px;padding:8px 0}a[aria-current]{font-weight:bold;color:white}'
for page in range(pages):
 name='index.html'if page==0 else f'page-{page+1}.html'
 nav='<nav aria-label="分页">'+''.join(f'<a href="{"index.html"if i==0 else "page-"+str(i+1)+".html"}"'+(' aria-current="page"'if i==page else '')+f'>{i+1}</a>'for i in range(pages))+'</nav>'
 cards=''.join(f'<figure id="f{f["second"]}"><a href="{f["image"]}" target="_blank"><img width="414" height="896" loading="lazy" decoding="async" src="{f["image"]}" alt="{f["second"]}秒 {html.escape(f["phase"])}"></a><figcaption>{f["second"]}s · {html.escape(f["phase"])}<br>{html.escape(f["observation"])}</figcaption></figure>'for f in records[page*18:(page+1)*18])
 (out/name).write_text('<!doctype html><html lang="zh-CN"><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>全场景视频截图参考</title><style>'+style+'</style><header><h1>全场景视频截图参考</h1><p>BV1ypuKzPErT · 0–270秒，每秒一帧，共271帧。每页18帧，图片懒加载；点击查看完整尺寸。WebP为有损发布副本，原始JPEG保留在仓库docs。</p><a href="https://www.bilibili.com/video/BV1ypuKzPErT/">原视频</a> · <a href="../../">返回游戏</a></header>'+nav+'<main>'+cards+'</main>'+nav+'</html>')
(out/'frames.json').write_text(json.dumps(records,ensure_ascii=False,indent=2)+'\n')
report={'frames':len(frames),'pages':pages,'quality':84,'dimensions':'414x896 preserved','sourceImageBytes':sum((source/f['image']).stat().st_size for f in frames),'sourceDirectoryBytes':sum(p.stat().st_size for p in source.rglob('*')if p.is_file()),'deliveryBytes':sum(p.stat().st_size for p in out.rglob('*')if p.is_file()),'imageBytes':sum(f['bytes']for f in records),'firstPageImageUpperBound':sum(f['bytes']for f in records[:18]),'indexBytes':(out/'index.html').stat().st_size}
(root/'target/temple-run/analysis/reference141-size.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report))
