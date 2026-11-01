"""Summarise captured browser measurements without hiding cache hits or failures."""
from pathlib import Path
from urllib.parse import urlparse
import json,statistics,re
root=Path(__file__).resolve().parents[1];base=root/'target/temple-run/analysis'
def sample(name):
 p=base/f'loading139-{name}.json'
 if not p.exists():return None
 d=json.loads(p.read_text());ready=d['observedReady'];origin=urlparse(d['url']);
 resources=[r for r in d['resources'] if urlparse(r['name']).netloc==origin.netloc and '/assets/' in urlparse(r['name']).path and r['startTime']<=ready]
 return {'file':p.name,'viewport':d.get('viewport'),'readyMs':ready,'fcpMs':next((v['time']for v in d['paint']if v['name']=='first-contentful-paint'),None),'requests':len(resources),'transferBytes':sum(r['transferSize']for r in resources),'encodedBytes':sum(r['encodedBodySize']for r in resources),'imageRequests':sum(urlparse(r['name']).path.endswith(('.png','.webp','.jpg','.avif'))for r in resources),'jsEncodedBytes':sum(r['encodedBodySize']for r in resources if urlparse(r['name']).path.endswith('.js')),'cssEncodedBytes':sum(r['encodedBodySize']for r in resources if urlparse(r['name']).path.endswith('.css')),'cacheHitEntries':sum(r['transferSize']==0 for r in resources),'failures':[r['name']for r in resources if r.get('responseStatus',200)>=400],'excludedEntries':len(d['resources'])-len(resources)}
data={'method':'Application assets started by the first enabled start button. Browser root favicon and post-ready requests excluded; raw records retained. TransferSize includes browser-estimated headers, not HTML.','onlineBefore':[sample(n)for n in ['before-online','before-online-2','before-online-3']],'localBefore':sample('before-local'),'localAfter':sample('after-local'),'onlineAfter':[sample(n)for n in ['after-online','after-online-2','after-online-3']if sample(n)]}
for row in [*data['onlineBefore'],data['localBefore'],data['localAfter'],*data['onlineAfter']]:
 if row:assert not row['cacheHitEntries'] and not row['failures'],f'Not a valid cold sample: {row}'
(base/'loading139-summary.json').write_text(json.dumps(data,ensure_ascii=False,indent=2)+'\n')
a=data['localBefore'];b=data['localAfter']
for row,phase in [(a,'before'),(b,'after')]:row['gpuTextures']=json.loads((base/f'loading139-gpu-{phase}.json').read_text())['result']['value']['textures']
(base/'loading139-summary.json').write_text(json.dumps(data,ensure_ascii=False,indent=2)+'\n')
p=root/'docs/architecture/loading-performance.md';text=p.read_text()
rows=[('应用子资源传输量（含估算头部）','transferBytes',' B'),('应用子资源请求数','requests',''),('首屏图像请求数','imageRequests',''),('实际首屏GPU纹理','gpuTextures',''),('FCP','fcpMs',' ms'),('开始按钮可用','readyMs',' ms'),('首屏全部JS压缩正文','jsEncodedBytes',' B'),('首屏CSS压缩正文','cssEncodedBytes',' B')]
def fmt(v):return f'{v:,.1f}'.rstrip('0').rstrip('.') if isinstance(v,float)else f'{v:,}'
table='| 指标 | 优化前 | 优化后 |\n| --- | ---: | ---: |\n'+'\n'.join(f'| {label} | {fmt(a[key])}{unit} | {fmt(b[key])}{unit} |'for label,key,unit in rows)
text=re.sub(r'\| 指标 \| 优化前 \| 优化后 \|.*?(?=\n\n上表)',lambda _:table,text,flags=re.S)
text=text.replace('同一机器、相同MIME压缩、独立端口、Cache-Control:no-store。','同一机器、375×812视口、相同MIME压缩、独立端口、Cache-Control:no-store。')
text=text.replace('上表不含约1KB HTML。','上表只统计按钮可用前启动的应用assets，排除浏览器自动favicon及之后的请求，不含约1KB HTML。FCP是否改善直接看同视口表格，不把早期桌面样本的较低FCP代替最终结果。')
p.write_text(text)
print(json.dumps({'before':a,'after':b,'onlineAfter':data['onlineAfter']},ensure_ascii=False))
