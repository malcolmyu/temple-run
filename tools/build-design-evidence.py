"""Publish a source-linked design map. Video frames remain a separate appendix."""
import json, html, hashlib
from pathlib import Path
R=Path(__file__).resolve().parents[1]
D=json.loads((R/'docs/design-evidence/content.json').read_text())
O=R/'target/temple-run/web/public/design-evidence';O.mkdir(exist_ok=True)
F=json.loads((R/'target/temple-run/web/public/screenshots/BV1ypuKzPErT/frames.json').read_text())
e=html.escape
def stamp(n):return f'{n//60:02}:{n%60:02}'
def link(p):
 assert (R/p).is_file(),p
 return 'https://github.com/malcolmyu/temple-run/blob/'+D['sourceCommit']+'/'+p
nav=''.join(f'<a href="#{s["id"]}"><span>{i:02}</span>{e(s["title"])}</a>' for i,s in enumerate(D['sections'],1))
body='';rows='';index=[]
for s in D['sections']:
 seconds=sorted({f['second']for c in s['cards']for f in c['frames']})
 index.append(dict(dimension=s['title'],timestamps=[stamp(n)for n in seconds],seconds=seconds))
 body+=f'<section id="{s["id"]}"><header class="section-head"><h2>{e(s["title"])}</h2><p>{e(s["intro"])}</p><p class="time-index">关键帧：'+('、'.join(stamp(n)for n in seconds)or '无独立视频证据；汇总前述维度')+'</p></header>'
 for c in s['cards']:
  assert c['status'] in ['已实现','部分','未做','网页假设']
  refs='';frames=''
  for ref in c['sources']:
   assert ref['category']in ['原版 il2cpp','原版资源','视频观察','网页假设']
   ref['sha256']=hashlib.sha256((R/ref['path']).read_bytes()).hexdigest()
   refs+=f'<li><b>{e(ref["category"])}</b> <a href="{link(ref["path"])}" target="_blank" rel="noopener">{e(ref["path"])}</a></li>'
  for fr in c['frames']:
   n=fr['second'];assert 0<=n<len(F)
   fr['sourceSHA256']=F[n]['sourceSHA256'];fr['deliverySHA256']=F[n]['deliverySHA256']
   caption=f'{stamp(n)} · {fr["observation"]}'
   frames+=f'<figure><button class="frame" data-second="{n}" data-caption="{e(caption)}" aria-label="放大 {e(caption)}"><img src="../screenshots/BV1ypuKzPErT/{n:03}.webp" width="414" height="896" loading="lazy" decoding="async" alt="{e(caption)}"><span>{stamp(n)} ⤢</span></button><figcaption>{e(fr["observation"])}</figcaption></figure>'
  if c.get('icons'):
   atlas=json.loads((R/'target/temple-run/web/src/game/nativePickupFrames.json').read_text())
   labels={'magnet':'磁铁','shield':'护盾','boost':'加速','bonus':'金币奖励'}
   for kind in c['icons']:
    x,y,w,h=atlas['icons'][kind]
    frames+=f'<figure class="atlas-proof"><div role="img" aria-label="原版图集：{labels[kind]}" style="width:{w/2}px;height:{h/2}px;background:url(../assets/ui/EffectsTexture2x.png) {-x/2}px {-y/2}px / 512px 512px"></div><figcaption>原版资源：{labels[kind]}<br>图集裁片，非视频帧<br>网页复用同一精灵</figcaption></figure>'
  if not frames:frames='<p class="no-frame">本片未取得该项直接帧证据。<br>请核对下方资源或代码；不以相似截图代替。</p>'
  modules=[]
  for m in c['modules']:
   p=str(Path('target/temple-run/web/src/game',m));p=str(Path(p).resolve().relative_to(R))
   modules.append(f'<a href="{link(p)}" target="_blank" rel="noopener">{e(m)}</a>')
  body+=f'<article id="{c["id"]}" data-status="{c["status"]}"><div class="claim"><div class="card-title"><h3>{e(c["title"])}</h3><span class="status">{c["status"]}</span></div><h4>结论</h4><p>{e(c["conclusion"])}</p><div class="frame-rail">{frames}</div><h4>来源与规则</h4><p class="provenance">{e(' / '.join(dict.fromkeys(r['category'] for r in c['sources'])))}</p><p class="rules">{e(c["rules"])}</p><details><summary>查看来源类别、代码与资源</summary><ul class="sources">{refs}</ul><p>来源链接固定到审计快照 {D["sourceCommit"][:7]}；文件 SHA-256 收录在下载清单。视频观察的直接来源为关键帧及原视频，代码链接仅用于实现对照。</p></details><footer><b>实现状态：{c["status"]}</b><div>'+ ' · '.join(modules)+'</div></footer></div></article>'
  rows+=f'<tr><td><a href="#{c["id"]}">{e(s["title"])} / {e(c["title"])}</a></td><td>{c["status"]}</td><td>{"、".join(sorted(set(r["category"]for r in c["sources"])))}</td><td>'+ ' · '.join(modules)+'</td></tr>'
 body+='</section>'
body=body.replace('</section>', '</section>')
flow='''<div class="flow" aria-label="网页一局状态流程"><a href="#run-loop">菜单 / 商店 / 升级</a><i>↓ 开局快照</i><a href="#run-loop">入口镜头 → 跑动</a><div class="systems"><a href="#roads">道路与转向</a><a href="#obstacles">动作与碰撞</a><a href="#powers">拾取与效果</a><a href="#economy">金币与计分</a><a href="#chaser">追逐压力</a></div><i>↓ 失败</i><a href="#wings-start">死亡 → 可用复活 → 返回跑动</a><i>↓ 无复活 / 放弃</i><a href="#results-shop">结算入账 → 重新开始 / 商店升级</a></div>'''
page='''<!doctype html><html lang="zh-CN"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>神庙逃亡 · 玩法架构证据图</title><link rel="stylesheet" href="style.css"></head><body><a class="skip" href="#main">跳到内容</a><aside><a class="brand" href="#main">神庙逃亡<br><small>玩法架构证据图</small></a><nav aria-label="维度目录">'''+nav+'''</nav><div class="aside-links"><a href="../screenshots/BV1ypuKzPErT/frames.html">271 帧证据附录</a><a href="evidence.json" download>下载证据与哈希清单</a><a href="timestamps.json">各维度时间戳清单</a><a href="../">打开游戏</a></div></aside><main id="main"><header class="hero"><p>原版机制 · 视频证据 · 网页实现</p><h1>从一局跑动，<br>看清游戏如何组成。</h1><p class="lede">以结论组织证据，以来源约束结论。道路、动作、奖励与失败如何连接，以及哪些仍然只是我们的设计。</p><div class="legend"><span>原版 il2cpp：提取规则</span><span>原版资源：形态与几何</span><span>视频观察：可见行为</span><span>网页假设：本项目设计</span></div><p class="notice">时间基准：视频秒位（截图索引），不是画面左上角的局内计时器。单帧取样精度约1秒。00:00为悬崖插入片段；不能据此推断固定主题顺序。<a href="https://www.bilibili.com/video/BV1ypuKzPErT/" target="_blank" rel="noopener">回看原视频</a></p></header><section class="overview"><div><h2>一局的系统关系</h2><p>这是网页状态机与玩法模块的关系图；视频只直接证明其中若干节点。复活、商店等未被本片展示的机制，以代码与资源为依据。</p></div>'''+flow+'''</section><div class="toolbar"><label for="filter">实现状态</label><select id="filter"><option value="all">全部</option><option>已实现</option><option>部分</option><option>未做</option><option>网页假设</option></select><span id="count" aria-live="polite"></span></div>'''+body+'''<section id="matrix"><h2>逐项实现对照</h2><p>“已实现”不表示与原版全部一致。原版数值、网页适配、缺失视频证据分别见卡片。</p><div class="table-wrap"><table><thead><tr><th>维度 / 设计项</th><th>实现状态</th><th>证据类别</th><th>代码模块</th></tr></thead><tbody>'''+rows+'''</tbody></table></div></section><footer class="page-footer">审计实现快照 '''+D['sourceCommit']+'''。本页仅重组证据与实现对照，本轮未修改玩法。<a href="../screenshots/BV1ypuKzPErT/frames.html">271 帧原始顺序附录</a></footer></main><dialog id="viewer" aria-labelledby="viewer-caption"><button id="close" aria-label="关闭大图">关闭 ✕</button><img id="large" alt=""><p id="viewer-caption"></p><a id="video-link" target="_blank" rel="noopener">打开原视频此秒位</a></dialog><script type="module">CLIENT</script></body></html>'''
client=(R/'node_modules/.cache/design-evidence-client.txt').read_text()
(O/'index.html').write_text(page.replace('CLIENT',client))
(O/'style.css').write_text((R/'tools/design-evidence.css').read_text())
(O/'evidence.json').write_text(json.dumps(D,ensure_ascii=False,indent=2)+'\n')
(O/'timestamps.json').write_text(json.dumps(index,ensure_ascii=False,indent=2)+'\n')
(R/'docs/design-evidence/timestamps.md').write_text('# 关键帧索引\n\n视频秒位；非画面内计时器。\n\n'+'\n'.join('- '+i['dimension']+'：'+('、'.join(i['timestamps'])or '无独立帧；汇总前述维度')for i in index)+'\n')
print(f'Built {len(D["sections"])} dimensions / {sum(len(s["cards"])for s in D["sections"])} evidence cards')
