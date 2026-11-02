"""Summarise all rounds, keeping CDN and controlled-server measurements separate."""
import json,statistics
from pathlib import Path
R=Path(__file__).resolve().parents[1];D=R/'docs/performance/startup';raw=D/'raw'
def samples(prefix):
 paths=sorted(raw.glob(prefix+'-*.json'))
 if not paths:return None
 assert len(paths)==3,(prefix,len(paths))
 rows=[]
 for p in paths:
  x=json.loads(p.read_text());ready=x['ready'];tti=x['interactive'];assert tti>=ready>0
  rs=[r for r in x['resources']if r['name'].startswith(('http://','https://'))and r['startTime']<=ready]
  assert all(r['transferSize']>0 and r.get('responseStatus',200)==200 for r in rs),p
  rows.append({'file':p.name,'buttonReadyMs':ready,'playableTtiMs':tti,'fcpMs':next(r['time']for r in x['paint']if r['name']=='first-contentful-paint'),'transferBytes':sum(r['transferSize']for r in rs)+x['navigation']['transferSize'],'requests':len(rs)+1,'encodedBytes':sum(r['encodedBodySize']for r in rs)+x['navigation']['encodedBodySize'],'documentTtfbMs':x['navigation']['responseStart'],'longTasksBeforeTti':[t for t in x['tasks']if t['start']<tti]})
 return {'rounds':rows,'median':{k:statistics.median(r[k]for r in rows)for k in ['buttonReadyMs','playableTtiMs','fcpMs','transferBytes','requests','encodedBytes','documentTtfbMs']}}
groups={name:samples(prefix)for name,prefix in {'controlledBeforeFast':'startup-before-local-fast','controlledAfterFast':'startup-after-local-fast','controlledBeforeSlow':'startup-before-local-slow','controlledAfterSlow':'startup-after-local-slow','publicBeforeFast':'startup-before-fast','publicAfterFast':'startup-after-public-fast','publicAfterSlow':'startup-after-public-slow'}.items()}
summary={'method':{'viewport':[375,812],'cpuRate':4,'cacheDisabled':True,'fast':{'downloadBytesPerSecond':200000,'uploadBytesPerSecond':93750,'latencyMs':150},'slow':{'downloadBytesPerSecond':180000,'uploadBytesPerSecond':84375,'latencyMs':562.5},'tti':'temple-ready plus started simulation with >=2 ticks;not Lighthouse quiet-window TTI','bytes':'HTTP resource TransferSize started by button-ready + HTML navigation TransferSize;data-URI textures/rig are counted within opening JSON;no warm HTTP cache entries','controlledServer':'same machine,gzip level6,no-store,production builds;before source039a034;UA remains desktop Chrome with mobile viewport and CPU/network emulation,not a physical-device test'},'groups':groups}
(D/'summary.json').write_text(json.dumps(summary,ensure_ascii=False,indent=2)+'\n')
lines=['# 冷加载测量结果','', '每组三轮；时间单位毫秒，字节含HTML及浏览器估算响应头。原始记录在raw/。','', '|组别|开始按钮可用|可玩TTI|FCP|首屏字节|请求数|','|---|---:|---:|---:|---:|---:|']
for name,g in groups.items():
 if g:
  m=g['median'];lines.append('|'+name+'|'+'|'.join(f'{m[k]:,.1f}' for k in ['buttonReadyMs','playableTtiMs','fcpMs','transferBytes','requests'])+'|')
lines+=['','## 每轮可玩TTI','']
for name,g in groups.items():
 if g:lines.append('- '+name+'：'+', '.join(f'{r["playableTtiMs"]:.1f}'for r in g['rounds']))
(D/'measurements.md').write_text('\n'.join(lines)+'\n')
print('\n'.join(f'{n}:TTI={g["median"]["playableTtiMs"]:.1f}ms,bytes={g["median"]["transferBytes"]}'for n,g in groups.items()if g))
