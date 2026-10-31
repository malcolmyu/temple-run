"""Build local, timestamped review sheets from captured reference frames.
Run: python3 tools/build-reference-gallery.py. Does not download or publish video.
"""
from pathlib import Path
from PIL import Image, ImageDraw, ImageChops
import hashlib, json

ROOT = Path(__file__).resolve().parents[1]
DEST = ROOT / 'docs/screenshots/BV1ypuKzPErT'
PHASES = [(0, 2, '开场 / 菜单'), (2, 67, '石桥'), (67, 111, '木桥'),
          (111, 213, '石桥'), (213, 240, '木桥'), (240, 263, '石桥'),
          (263, 264, '结算'), (264, 271, '结尾 / 重开')]
EVENTS = {
    2: '兽口神庙入口，石桥从门内伸出。', 3: '镜头从神庙侧后方转到跟随位置；三只恶魔猴。',
    8: '粗大树根横跨石桥。', 9: '直角石台转弯。', 10: '穿过浮雕石门，角色跳跃。',
    15: '横向树根，桥外是青绿色水面。', 17: '直角路口。', 18: '树根形成低矮门洞。',
    24: '路面缺口；角色与追逐猴跃起。', 33: '路口外侧巨树。', 37: '发光黄色道具。',
    44: '镜头随直角转弯旋转，远处水面。', 58: '断裂路面与跳跃。',
    67: '石桥转入木桥；边缘立柱带骷髅装饰。', 68: '连续木板桥面，两侧露出水面。',
    76: '木桥断口，底部交叉木支架清楚可见。', 80: '木桥直角转弯。',
    82: '带浮雕石片的低矮木桥横障。', 88: '白色骷髅端头与绳索。',
    97: '木桥整幅缺口与跳跃。', 108: '木桥断口。', 111: '木桥与石桥主题交接。',
    115: '大型树干拱洞覆盖石桥。', 118: '两侧雕像喷火，火焰横跨前方道路。',
    124: '角色在石台转弯时跃起。', 134: '连续直角路口。',
    145: '白色发光道具；之后角色出现青色透明效果。',
    146: '青色半透明角色；不能据此推断永久翅膀。',
    162: '喷火雕像与石门组合。', 170: '路面蓝色区域/断口，需进一步确认碰撞机制。',
    186: '金币开始混有红色，沿道路成串排列。', 190: '长条蓝色缺口与剩余石沿。',
    196: '一侧保留石沿，另一侧出现长条蓝色缺口。', 208: '喷火雕像横障。',
    213: '第二段木桥主题入口。', 216: '木桥上的黄色发光道具。',
    218: '木桥断口与交叉木支架。', 226: '木桥低矮浮雕横梁。',
    237: '木桥外侧巨树与直角转弯。', 240: '木桥结束，前方接石桥。',
    257: '石桥喷火横障。', 263: '结算面板：47240 分；计时 4:20.9。',
    265: '再次出现兽口神庙入口。', 266: '重开后的追逐镜头。',
}
frames = []
previous = None
for second in range(271):
    path = DEST / f'{second:03}.jpg'
    img = Image.open(path).convert('RGB')
    phase = next(name for a, b, name in PHASES if a <= second < b)
    duplicate = previous is not None and ImageChops.difference(previous, img).getbbox() is None
    frames.append(dict(second=second, image=path.name, phase=phase,
                       observation=EVENTS.get(second, ''), duplicatePrevious=duplicate,
                       sha256=hashlib.sha256(path.read_bytes()).hexdigest()))
    previous = img
for start in range(0, 271, 60):
    end = min(271, start + 60)
    sheet = Image.new('RGB', (1200, ((end-start+9)//10)*285), '#172225')
    draw = ImageDraw.Draw(sheet)
    for second in range(start, end):
        img = Image.open(DEST / f'{second:03}.jpg'); img.thumbnail((120, 256))
        x, y = ((second-start)%10)*120, ((second-start)//10)*285
        sheet.paste(img, (x,y+23)); draw.text((x+4,y+4),f'{second:03}s',fill='white')
    sheet.save(DEST / f'contact-{start:03}-{end-1:03}.jpg', quality=88)
(DEST / 'frames.json').write_text(json.dumps(frames, ensure_ascii=False, indent=2))
html = '''<!doctype html><html lang="zh-CN"><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>神庙逃亡 · 逐秒参考</title>
<style>*{box-sizing:border-box}body{margin:0;background:#172225;color:#e8dfbf;font:15px/1.6 system-ui}header{padding:24px;max-width:1100px;margin:auto}h1{font-size:24px}a{color:#e4c76a}.controls{position:sticky;top:0;background:#172225ed;padding:14px 24px;z-index:2;display:flex;gap:16px;align-items:center}input{width:min(55vw,700px)}main{display:grid;grid-template-columns:repeat(auto-fill,minmax(180px,1fr));gap:16px;padding:20px}figure{margin:0;background:#25363a;padding:8px;border:1px solid #49605c}figure img{width:100%;display:block}figcaption{min-height:72px;font-size:12px}button,select{padding:7px;background:#34464a;color:#f5d982;border:1px solid #60726b}dialog{background:#172225;color:#eee;border:1px solid #687671;max-width:95vw}dialog img{max-height:82vh;max-width:75vw}dialog button{float:right}</style>
<header><h1>神庙逃亡：271 张逐秒参考</h1><p>参考 <a href="https://www.bilibili.com/video/BV1ypuKzPErT/">BV1ypuKzPErT</a>。0–270 秒，414 × 896。文字区分明确事件与路段归类，空白处不编造逐秒动作。视频里的紫色计时器和水印属于录屏，不是游戏 HUD。</p><p><a href="../../reference/BV1ypuKzPErT-analysis.md">实现差异报告</a> · 左右方向键切换大图</p></header>
<div class="controls"><label>定位 <output id="value">0s</output></label><input id="seek" type="range" min="0" max="270" value="0"><select id="phase"><option value="">全部路段</option><option>石桥</option><option>木桥</option><option>开场 / 菜单</option><option>结算</option><option>结尾 / 重开</option></select></div><main></main><dialog><button id="close">关闭</button><img id="large"><p id="note"></p></dialog>
<script>const frames=__FRAMES__;const main=document.querySelector('main'),dialog=document.querySelector('dialog');let selected=0;function show(i){selected=Math.max(0,Math.min(270,i));let f=frames[selected];document.querySelector('#large').src=f.image;document.querySelector('#note').textContent=f.second+'s · '+f.phase+' · '+f.observation;if(!dialog.open)dialog.showModal()}frames.forEach(f=>{let el=document.createElement('figure');el.id='f'+f.second;el.dataset.phase=f.phase;let img=document.createElement('img');img.loading='lazy';img.src=f.image;img.alt=f.second+'秒参考画面';img.onclick=()=>show(f.second);let c=document.createElement('figcaption');c.textContent=f.second+'s · '+f.phase+' '+f.observation;el.append(img,c);main.append(el)});document.querySelector('#seek').oninput=e=>{document.querySelector('#value').value=e.target.value+'s';document.querySelector('#f'+e.target.value).scrollIntoView({block:'center'})};document.querySelector('#phase').onchange=e=>{main.querySelectorAll('figure').forEach(el=>el.hidden=e.target.value&&el.dataset.phase!==e.target.value)};document.querySelector('#close').onclick=()=>dialog.close();document.addEventListener('keydown',e=>{if(dialog.open&&e.key==='ArrowRight')show(selected+1);if(dialog.open&&e.key==='ArrowLeft')show(selected-1)})</script></html>'''
(DEST / 'index.html').write_text(html.replace('__FRAMES__',json.dumps(frames,ensure_ascii=False)))
print(f'{len(frames)} frames; consecutive duplicates: {[f["second"] for f in frames if f["duplicatePrevious"]]}')
