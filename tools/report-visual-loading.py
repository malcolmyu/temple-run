from pathlib import Path
import json,statistics,hashlib
R=Path(__file__).resolve().parents[1];D=R/'docs/performance/visual-loading';P=R/'target/temple-run/web/public'
summary={};lines=['# Slow4G + 6×CPU 完整视觉加载测量','每态三轮中位数；冷=清持久缓存+HTTP禁缓存，温=持久命中+HTTP禁缓存，热=两者命中。资源数是逻辑资源数，网络数仅统计transferSize>0。','|组别|按钮(ms)|可玩(ms)|首帧(ms)|首屏字节|资源数|网络数|','|---|---:|---:|---:|---:|---:|---:|']
for site,prefix in [('local','visual-final'),('public','visual-public')]:
 for mode in ['cold','warm','hot']:
  files=sorted(D.glob(f'{prefix}-{mode}-*.json'))
  if not files:continue
  assert len(files)==3
  rows=[]
  for f in files:
   x=json.loads(f.read_text());res=[r for r in x['resources']if r['startTime']<=x['ready']]
   rows.append(dict(button=x['ready'],tti=x['interactive'],frame=x['stages']['marks']['first-frame'],bytes=x['navigation']['transferSize']+sum(r['transferSize']for r in res),resources=1+len(res),network=1+sum(r['transferSize']>0 for r in res)))
  med={k:statistics.median(r[k]for r in rows)for k in rows[0]};summary[site+'-'+mode]={'median':med,'rounds':rows}
  lines.append('|'+site+'-'+mode+'|'+'|'.join(f'{med[k]:.1f}'for k in ['button','tti','frame','bytes','resources','network'])+'|')
ktx=json.loads((R/'target/temple-run/web/src/game/ktxAssets.generated.json').read_text());runtime=json.loads((R/'target/temple-run/web/src/game/runtimeAssets.generated.json').read_text())
lines+=['','## 格式体积','|贴图|KTX2字节|优化WebP字节|KTX尺寸|','|---|---:|---:|---|']
for source,row in ktx['textures'].items():
 webp=(P/runtime['textures'][source]).stat().st_size
 lines.append(f"|{source.split('/')[-1]}|{row['bytes']}|{webp}|{row['width']}×{row['height']}|")
summary['textures']=ktx['textures'];(D/'summary.json').write_text(json.dumps(summary,ensure_ascii=False,indent=2)+'\n');(D/'measurements.md').write_text('\n'.join(lines)+'\n')
print('\n'.join(lines))
