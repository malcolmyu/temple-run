Original prompt: 使用 atb-game-porting 实现用户提供的 Temple Run XAPK，并修正角色、场景、转弯和追逐者与原游戏不符的问题。

2026-10-23: 确认当前 Web 游戏只是部分素材提取和自行实现的玩法。识别 APK 中 Mesh 96 `enemy` 与 Texture 53 `enemyTexture`，导出并接入追逐者。将跑道、障碍、金币、角色和相机的位置改为沿同一路径投影，增加物理转角和连续弯曲。加入绊倒后追逐者靠近、短时间再次碰撞则被抓的机制。待浏览器视觉与交互验证。

Validation: `npm run temple:build` passed. Playwright client exercised start, lane, jump, slide with no console errors; screenshots visually inspected. Browser checks at 207 m and 223 m showed an actual right-angle junction and continuation on the turned road. Forced stumble then catch confirmed pursuit state and ending reason, with no console errors. Remaining fidelity limits: Unity animations, native level generator, exact obstacle set, and environment mesh materials are not ported; character and enemy OBJ poses are approximate.

2026-10-23: Removed distance-based speed acceleration; running speed stays at 16 game units per second. Added a `dying` state with impact, caught, and falling animations before the result overlay. Browser checks confirmed mid-animation state, delayed results, restart reset, and a real gap collision producing the falling animation. Build and browser console remained clean. These endings are Web-authored, not Unity animation clip playback.

2026-10-23（续）: 排查“地图不会左右转”。根因是原实现的转向判定窗口只有路口前约 6 个单位（0.4 秒）且没有视觉提示，玩家几乎不可能在正确时刻按方向键；路口本身也看不出要转弯。已重写为：路口前 42 单位开始出现转向提示（箭头 + 倒计时 + 方向确认态），在该窗口内按提示方向即排队转向，到达路口自动完成 90° 转向并重新计算下一路口；错过路口会撞上断头墙并结算。真实键盘输入（←/→）与 debug 接口均验证：首路口 70 m，转向后 turnCount=1、下一路口 274 m、路径段数 2，相机与角色朝向沿新方向平滑过渡。

同一轮还完成：
1) 角色改为 APK 原始蒙皮网格（runner-rig.json：976 顶点、26 骨骼、run/jump/slide 三个 AnimationClip，CPU 蒙皮，bind pose 用 m_BindPose 修正），替换之前的 OBJ 顶点手工扭动；
2) 路面改用 APK 场景导出的原始石板路瓦片（temple-road-tile.obj，8×12，含护墙、青苔，烘焙 Y-up），按 12 单位周期沿路径铺贴；
3) 从 APK 导出 28 个原始音效（audio/*.wav）与 7 张 UI 图（ui/*，含 5 张死亡插画与按钮图集），音效已接入跑动脚步、换道、转向、跳跃、滑铲、金币、绊倒、死亡、结算等事件；结算卡加入对应死亡插画；
4) 路口重建：石砖台座、护墙、城垛与金色饰条；使用 APK 的高墙/城门 facade 方案因是假透视布景、在游戏相机下会穿帮而放弃；
5) 新增调试页 rig-preview.html、track-preview.html 与 window.__templeDebug（jumpTo / attemptTurn / setNextTurn / restart / freeze / end 等），便于回归验证。

Validation: `npm run temple:build` passed. Playwright 验证：菜单、直道原版路面、路口提示、真实按键转向、转向后新路段、死亡结算（含插画）均通过；console 无错误。仍待打磨：路口平台与两侧路面的衔接、装饰物在路口附近的取舍、音效音量平衡、以及更多原版障碍/场景资产。

路口平台二次调整：平台从 15.8 收窄到 9.8（与 8 单位路面 + 护墙对齐），断头墙与外侧墙统一 3.4 高并用原版石板材质，墙顶加城垛与金色饰条；只在封闭的两条边画压边条，开阔的两条边用矮护墙封角，避免白条横穿路面。视觉上比上一版干净，路口与前后路面的衔接仍可继续打磨。

2026-10-23（第三轮）：还原原版“神殿长廊”两侧高墙。把分析阶段导出的 track-wall-straight-a.obj（原版直段城墙立面，带金色饰带与城垛）按 0.2 缩放、贴合到每个路面瓦片两侧内沿（局部 x=±6.4，内侧面正好落在路面边缘 ±4.0），形成与 APK 参考图一致的寺庙长廊观感；由于立面是“假透视布景”（背面有大量汇聚三角形），在路口前后 10 个单位内隐藏立面，避免三角形穿到路口平台。路口的封闭侧墙改用从原版 wallTexture 图集裁出的砖墙区域（u .251–.5 / v .5–1.0）做贴图，并用原版瓦片本身的砖石 UV 区域（u .504–.748 / v .75–.994）重算路口平台铺装，修正了平台发白发绿的问题。新增 DEV 用 `__templeDebug.inspect()/uninspect()` 自由机位，方便俯视/侧视检查路口拼接。

开发服务器端口从 5175 收回 5173（此前 5173 被 13 小时前的旧进程占用，已结束旧进程并用 `npm run temple:dev -- --port 5173 --strictPort` 重新拉起），现在 `localhost:5173` 即可游玩。验证：真实按键在 70 m 完成左转（turnCount=1、下一路口 274 m），转向后长廊画面正常；`npm run temple:build` 通过（745 ms）；console 无新错误。仍待打磨：路口平台与长廊的衔接、假透视立面的完全消除（下一步考虑用真正的平直墙体 UV 重建路口）、障碍/城门等更多原版资产。

2026-10-23（第四轮）：① 路口墙面贴图修复——原先用 wallTexture 图集整块做 offset/repeat 会采到亮色/苔藓区，导致路口侧墙发白发绿；改为从原版图集裁出单块砖石格（canvas 256×256，x=256..512、y=0..256）生成 CanvasTexture 并 RepeatWrapping 平铺，路口侧墙/尽头墙现在都是正常砖石纹理；② 相机拉近压低（追尾距离 10.5→9.0、高度 5.15→4.55），人物占屏比更接近原版；③ 障碍物升级：石制障碍/拱门改用原版砖石贴图 + 金色顶饰，断桥加碎石，新增原版风格的「火坑」障碍（黑色焦坑 + 4 组自发光火焰锥，跳起可越过，已实测跳过不死）；④ 补齐转弯兜底验证：不按方向键跑到 72 m（=路口 70 + 2）会正确触发“错过路口，前方没有路了。”的死亡结算（此前只验证了成功转弯分支）。

验证：`npm run temple:build` 通过（835 ms）；真实键盘 ← 在 70 m 完成转弯（turnCount=1、下一路口 274 m、状态 playing）；9 秒自动驾驶到 72 m 未按键时正确判定错过路口；console 无新错误。截图：output/playwright/r2-corridor.png、r2-junction.png、r2-turn-done.png。仍待打磨：墙面立面上自带的假透视白块残留、路口平台与路面接缝、障碍物造型（原版没有独立障碍网格，只能按风格重做）。

2026-10-23（第五轮）：① 第一处路口从 70 m 提前到 58 m（路口间距 110–170 m 随机），第一次转弯更快到来；② 转弯提示从「屏幕中央大卡片」改成 HUD 下方的小胶囊（↱ 前方右转 · N m），不再遮挡前方路口视线，3D 金色箭头仍画在路口平台上；③ 大气/光照整体提亮（exposure 1.5、雾更淡、天空换成自上而下 深绿→暖黄 的渐变 CanvasTexture），长廊墙顶加上成片的丛林树冠，墙面内侧新增带杆火把（暖橙色小火焰 + 深色杆座），还原原版“神庙长廊在雨林里”的氛围；④ 路口平台铺装改用从原图集裁出的砖地单元（canvas 250×250）平铺，台座缩小到 8.8 并带砖纹；⑤ 转弯瞬间相机抬高 1.5 m 并平滑过渡，避免镜头切进路口墙体导致半帧穿墙。

验证：`npm run temple:build` 通过（785 ms）；匹配方向转弯（dir=1，40 m 路口）成功：distance 47、turnCount 1、nextTurn 193、state playing；无输入自动驾驶到 60 m（=58+2）正确触发“错过路口”死亡；19 个原版 WAV 正常预加载；console 无新错误。截图：output/playwright/r3-corridor-final.png、r3-junction-final.png、r3-turn-verify.png。仍待打磨：墙面立面上残留的浅色装饰块、路口平台与路面接缝、障碍物造型多样性。

2026-10-23（第六轮）：① 金币连击倍率（原版 HUD 的 ×N）：连续 1.3 s 内吃币累积 combo，每 4 枚提升一级（×2…×5，最高 ×5），2.4 s 无币自动回落 ×1；HUD 左上新增金色 ×N 徽章（有弹出动画），拾币音效随倍率微升调；起跑/重开重置倍率。② 场景天际线：在原版墙体外侧随机种上原版 decor-tree-a（缩放 0.06–0.095、外移 13–24）与 decor-rock-a，树冠从墙顶后探出，路口空地也能看到远处树干，纵深更接近原版丛林。两项均接入调试字段（render_game_to_text 增加 multiplier）。

验证：倍率逻辑（吃 6 币 → ×2，停吃 3 s 回 ×1，徽章隐藏；重开归 1）；自动连跑（脚本自动按方向键）成功完成 1 次转弯，随后在 98 m 因未跳过断桥触发 fall 死亡（障碍判定正常）；`npm run temple:build` 通过（见上）；console 无新错误。截图：output/playwright/r4-skyline.png、r4-multiplier.png。下一轮：路口墙体明暗/接缝、障碍物造型、菜单与原版 UI 元素对齐。

2026-10-23（第七轮）：① 找到并修复一处真实还原偏差——车道间距与路面宽度不匹配。从烘焙出的原版路面瓦片量得：可行走铺装只有 4 单位宽（x −2…2），而游戏 lanes 仍是旧程序化路面的 ±2.35，导致换道时角色站在路缘石上。改为 lanes=[−1.3,0,1.3]，并把所有障碍物按 0.62 缩放，使其正好占一条车道（宽 ~1.2）。② 路口铺装的砖石密度按原版瓦片 UV 重新标定（原瓦片铺装面 UV：u .5038–.7495、v .7226–.994，对应 4×12 单位），路口平台砖纹尺寸与路面一致；路缘石/基部压条改为深色石材。③ 排查路口处一块“砖块状凸起”：已排除台座、铺装面、压条与两侧立面，定位为原版瓦片本身（它是一整块“布景切片”，首尾带有端头几何）与路口重叠约 1 单位所致——由于路口距离不落在 12 米瓦片格点上，转角处瓦片必然重叠。下一轮方案：把路口距离吸附到瓦片边界（57/69/81…）或直接裁掉瓦片端头面。

验证：换道后角色站在铺装中线/边线上（截图 r5-lane-fixed.png）；转弯（dir=1，58 m 路口）成功 turnCount=1、nextTurn=193、state playing；跳跃越过跨栏（jumpY 1.56 无伤）；撞石障碍触发 stumble 而非瞬死；`npm run temple:build` 通过（761 ms）；console 无新错误。

2026-10-23（第八轮）：① 路口与瓦片格点对齐：原版路面瓦片以 12 米为周期、边界落在 distance ≡ 9 (mod 12)，而路口原来的 58/随机间隔会落在瓦片中间，导致转角处两块瓦片重叠约 1 单位（之前那块“砖块/木梁状凸起”的根因）。现在首个路口改为 57，之后 `nextTurn = 9 + 12*max(1, round((nextTurn+96+rand*40-9)/12))`，两块瓦片正好在转角点相接。② 路口平台改为 5×5 的“转角象限”小平台，中心在 (−dir*2, −2)，只填补两条路之间的缺口；压条/矮护墙按新尺寸重排，并删除会横穿入口的多余矮墙；③ 生成保护：障碍/金币不再生成在路口前后 22 米内，避免物体落在转角平台上；④ 界面/玩法无回归。

验证：脚本自动游玩（按提示自动转向 + 自动跳/滑/换道）连续通过 25 个路口不死（1500 步 × 120 ms）；不按方向键时在 59 m（=57+2）正确触发错过路口死亡；`npm run temple:build` 通过；console 无新错误。截图：output/playwright/r6-approach3.png（路口进近）、r6-turn-done.png（转向后长廊）。

2026-10-23（第九轮）：① 原版 UI 美术接入：从 egUI_Buttons2x 图集（2048²，Unity UI 合图）裁出原版「TEMPLE RUN 10th ANNIVERSARY」logo、(498,0,1132,220)、(850,1512,1145,1592) 的哥特体「Paused」字标，落到 web/public/assets/ui/{logo.png,paused.png}；开始菜单换成原版 logo + 中文副标，暂停面板换成原版 Paused 字标（原按钮/说明保留中文）。② 追逐者 bug 修复（用户反馈「根本看不到追逐者」）：根因是 `chaseGap=16` 而追尾相机在 distance-9，追逐者被放在相机后方 → 永远不可见。改为飞行恶魔贴身追逐：`chaseGap` 基线 4.8（绊倒时 3.4 逼近），悬停高度 1.12+呼吸浮动，模型缩放到 .085（原版 mesh-96-enemy.obj），材质提亮（color 0x9c7a66、emissive 0x8a5a3a ×.85），现在能在画面下方稳定看到展翅追逐的恶魔；被追上时的死亡插画正好是「恶魔扑倒跑者」的原版图，观感统一。③ 顺手把 enemy 暴露到 `__templeDebug.enemy()` 便于后续调试。

验证：菜单/暂停/结算三个界面截图（r7-menu-final.png、r7-pause.png、r7-caught.png）；追逐者在奔跑画面可见（r7-chaser-final.png），chaseGap=4.8；`npm run temple:build` 通过（790 ms）；console 无新错误。待办：障碍造型、路口接缝、远景神庙剪影。

2026-10-23（第十轮）：障碍物重做（更贴近原版）+ 追逐者不再挡视线。① 树根障碍：原来的“木架跨栏”换成横在路上的原版树皮树干（originalBark 贴图圆柱 + 斜枝 + 两侧根须锥），整体放大到 .82，跳起可越过；修掉了圆柱缩放轴写错导致“树干立起来”的问题（cyl 的 Y 轴是长度：scale 应为 (半径, 长度, 半径) 再旋转）。② 火坑障碍：改为 5 个火柱喷口（黑色喷口 + 石圈 + 橙色外焰 + 亮芯 + 加色发光 sprite），火焰随时间跳动；新增全局 fireOuter/fireGlow 材质，sprite 用 canvas 径向渐变生成，不依赖外部贴图。③ 追逐者移到玩家右后方（offset 1.9±0.45），不再挡住画面中央的近处障碍。④ 尝试把原版 track-gate-a 做远景神庙剪影，因手机竖屏横向 FOV 只有 ±17°、且每次转弯前 26 米处有 5.4 米高的路口墙挡住视野而不可见，已回滚该实验，结论记录在案。另起了一个后台子任务在 120 个未分类 APK 环境网格里找原版障碍模型（树根/倒木/石门/火盆），产出到 web/public/assets/obstacles/，完成后接入。

验证：树根障碍与火柱在实机可见（r8-hurdle-isolate.png、r8-fire3.png、r8-obstacles-final.png）；`npm run temple:build` 通过（959 ms）；4 秒自动跑在 59 m 正确触发错过路口死亡；console 无新错误。

2026-10-23（第十一轮）：补齐原版 power-up 系统 + 修复刷新概率。新增 4 种道具（对齐原版 Temple Run 1 的强化道具）：磁铁、金币加成、加速、护盾。
- 拾取物：八面体宝石 + 金色光环 + 加色发光 sprite（canvas 径向渐变），按颜色区分（磁铁红/加成金/加速绿/护盾蓝），在 spawnWave 里和障碍一起刷在安全车道前方 83 m，并保证每 170 m 至少出现一个。
- 效果：磁铁 9 s（10 m 内的金币向玩家车道吸附、按 1.7 m 半径自动拾取，跨车道有效）；金币加成 10 s（每枚金币 +3）；加速 4.5 s（速度 +55%、FOV +5、撞到障碍直接撞碎不减速）；护盾为一次性抵挡（撞到障碍抵挡一次并给 4 s 缓冲，HUD 显示「护盾·就绪」）；到期播放 recharged 音效。
- HUD：新增 #powerBadge（在倍率徽章下方、转向提示左侧），显示「名称 + 剩余秒数」或「就绪」，按道具类型换边框颜色；同时 `render_game_to_text` 增加 power/powerRemain/pickups 字段，调试 API 增加 spawnPickup/spawnCoin。
- 修 bug：自然刷新的道具概率判定几乎不触发（`rand(seed+137)>.78`），已改为「170 m 保底 + 22% 概率」，实测 98 m 内自然刷到 boost。

验证：磁铁跨车道吸取 2 枚金币 ✓；护盾吸收一次撞击后仍 playing ✓；加速 1 s 位移 25 m（基础 16）✓；加成下 2 枚金币计 6 枚 ✓；护盾/金币加成 HUD 文案与配色正常（r9-power-hud2.png、r9-power-final.png）；`npm run temple:build` 通过（780 ms）；console 无新错误。

2026-10-23（第十二轮预告）：后台子任务 `obstacle-asset-scout` 已在 120 个未分类 APK 环境网格里定位并导出 18 个原版障碍/场景 OBJ 到 `web/public/assets/obstacles/`：tree-jump-left/right（跳跃树根）、tree-slide（下滑树枝）、tree-trip-left/right（绊倒树根）、pit / pit-long-a / pit-long-b（坑洞）、flame-tower（火焰塔）、tower-arch（拱门）、narrow-beam-left/right、narrow-wall-left/right、stone-pedestal，每个都有正立 + 竖直两种朝向变体。配套 `obstacle-verify.json` 记录了每个模型的包围盒、逐列高度占用和「该车道是否可通过」的判读，`/tmp/export_temple_obstacles.py` 可重跑。新建 `web/obstacle-preview.html` + `src/obstacle-preview.js` 可一次预览全部障碍（归一化尺寸 + 名称+原始尺寸标签），截图 r9-obstacle-preview3.png。下一轮按「跳跃→tree-jump、下滑→tree-slide、绊倒→tree-trip、坑洞→pit、火焰→flame-tower、拱门→tower-arch」替换现有程序化障碍，并按 verify.json 的逐列高度调碰撞体。

2026-10-23（第十三轮，用户反馈「弯道奇怪、像一堆直角弯」排查）：
- 根因1：路径本来是一条平滑 S 曲线（横向振幅 3、波长 50 m），但用 12 m 直瓦片采样、瓦片端头是直角切面，每个接缝处都会出现一个角度突变 → 视觉上像一串小直角折线。处理：删掉 S 曲线，走廊改成完全笔直（这也是 Temple Run 1 原作的做法），只保留 90° 转弯。
- 根因2：转弯处车道偏移量（±1.3 m）会随着 heading 瞬间旋转 90°，导致玩家/相机过弯时横向瞬移约 1.8 m。处理：在转过弯后的 5.5 m 内对车道偏移方向做插值（横向基向量由旧朝向往新朝向平滑旋转），实测逐帧最大位移 = 0.8 m（= 16 m/s × 50 ms），无跳变。
- 根因3（部分缓解）：走廊假透视墙在路口前后 10 m 被隐藏 → 每个弯道会露出一个方形缺口看到外面丛林。处理：buildJunction 里新增「转角翼墙」（沿出弯方向两侧 + 入弯内侧各一段 9.5–10.6 m、7 m 高的程序化砖墙，junctionWallMat + 金色饰带），把缺口的观感补上；仍有少量漏缝，留待下一轮用原版转角件重建。
- 验证：过弯 turnCount=1、状态 playing；直道画面左右对称（r10-after.png / r10-wings-after.png）；`npm run temple:build` 通过（884 ms）；console 无新错误。

2026-10-23（第十四轮）：接入原版障碍预制体（obstacle-asset-scout 交付的 23 个 APK 障碍模型）。
- 新增 prefab 加载器：从 web/public/assets/obstacles/ 异步加载 OBJ，树干类用 treeTexture+alphaTest 0.4，石材类复用 wallTexture，全部 DoubleSide（原版是 2.5D 布景片），材质只读挂在模块级，createObstacle 时 clone。
- 跳跃障碍（hurdle）换成原版「倒下的树根横跨整条路」：tree-jump-left/right 随机左右朝向，缩放 0.094（原版 87.5 u 宽 → 8.2 游戏单位；障碍顶部 10 u → 0.94 高，正好是跳跃能过的档位）。
- 火焰障碍（fire）外框换成原版「双石灯座」flame-tower（缩放 0.19，约 8.1 宽、8.5 高，中央通道留空），中间仍是程序化火焰（原作火焰是 ParticleSystem，APK 里没有网格/贴图）。
- 引入「整路障碍」语义：hurdle/arch/gap/fire 标记 full=true，无论在哪条道都会判定/碰撞（对应原作必须跳/滑的障碍），石墙 block 仍是分道躲避。
- 暂缓：tree-slide（下滑树枝）朝向/枝干位置在竖屏下不易辨认、stone-pedestal 有悬空偏移，先回退为程序化版本；pit 因路面是整块薄面无法开洞，也保持程序化。下一步按 manifest 逐列高度重新校准这几件的朝向与落点。
- 验证：不跳两次碰撞 → 被追逐者抓住（caught）；起跳越过 → 无伤通过（stumbleCooldown=0）；树根/火焰塔在实机画面可见；`npm run temple:build` 通过（925 ms）；console 无新错误。

2026-10-23（第十五轮）：① 修崩溃——新增的高架门里重复声明 `gateTemplate`（原版 track-gate-a 已占用该变量）导致 main.js 启动即抛错（页面无样式、无调试钩子）；改名 `archGateTemplate` 后恢复。② 原版「倒树下滑障碍」tree-slide 重新接入：所有障碍预制体克隆时统一旋转 180°（APK 资产以 +Z 为跑动方向，我们的 group 朝 -Z），现在树干/横枝横在头顶、需要下滑才过得去；实测下滑通过 = 无伤（stumbleCooldown=0），不下滑连撞两次 = 被抓住。③ 尝试用 tower-arch 做「神庙高架门」：每 48/72 m 一个，但在追尾视角下门洞横梁基本在画面之上、两腿与侧墙重合，观感提升有限且增加杂乱，已回退（记录为负结果）。④ 稳定性回归：写了一个自动跑脚本（按 cue 转弯 + 全宽障碍跳跃 + 树slide下滑 + 分道石墙换道），连续跑 711 m、7 次转弯、10 次跳跃、2 次下滑、53 金币仍存活；console 无新错误；`npm run temple:build` 通过（见日志）。

待办：stone-pedestal/pit 落点校准、门洞间距与转角冲突的微调、继续用原版件替换路口转角墙。

2026-10-23（第十六轮）：① 原版音效全链路验证——给 sfx.js 增加 `playedCounts` 统计并在 DEV 下暴露 `__templeDebug.audio`，用真实点击（解锁 AudioContext）+ 自动跑 160 步实测：click 4、footstep 74、coin 11、whoosh(转弯) 3、swish(换道) 3、jump 5、land 4、coinCascade 1，证明 28 个原版音频已按事件正确触发（slide/gameOver 在该次跑动中未触发）。② 障碍预制体统一重心化：加载后按 Box3 把 XZ 居中、minY 归零，再包一层 Group——修掉 stone-pedestal 的悬空偏移；但该件带假透视倾斜，作为分道石墙仍不易读，决定保留程序化石墙（记录决策）。③ 路口转角墙重做：高度 5.4→7.0、与长廊立面同一平面（内侧面 x=±4.0 / z=-4.0，尽头墙 12.8 宽、侧墙 2.4 厚），城垛与金饰带随尺寸重排，转角不再是矮一截的断墙。④ 路口附近的天际线树木可见半径 13→22（2.5D 树片侧看像木板，靠路口露出来很出戏），转角缺口现在只露丛林地面与雾。⑤ 验证：过弯 turnCount=1、state=playing，直道画面左右对称，`npm run temple:build` 通过（879 ms），console 无新错误。

下一轮候选：原版城门 facade 放到路口尽头当“神殿终点墙”、商店/成就等原版 UI、以及把 stone-pedestal 按正确朝向重新校准。

2026-10-23（第十七轮）：主菜单补齐原版三件套 STORE / OPTIONS / STATS（从 egUI_Buttons2x 图集裁出的原版金字翼条），并做成可用面板。
- 裁图坐标（2048 图集）：STORE (6,1620,397,1692)、Options (39,1714,400,1788)、Stats (1250,1720,1520,1788)、Objectives (700,1670,1161,1782)，落盘 web/public/assets/ui/word-{store,options,stats,objectives}.png。
- 菜单：logo 下方新增一排原版字标按钮（已缩小到 17px 高、单行排布），样式与侧栏保持一致。
- 面板（共用 #panelOverlay，动态标题 + 内容）：
  · STORE：列出原作四个角色（Jhony 已拥有 / Selene·宇航员 / 万圣狼人 / 血鬼 均未解锁）+ 累计金币，注明“搬运中”；
  · OPTIONS：音效、震动反馈、高清渲染三个开关（原版音效开关与 HUD ♫ 同步），改动即时生效并写入 localStorage；
  · STATS：历史最佳距离、累计奔跑距离、完成局数、累计金币、最高金币倍率、累计成功转弯，数据在 finishDeath 时累计并持久化。
- 顺手修正：HUD 声音按钮改为读写 settings（不再只改内存 muted）；摔倒/死亡接震动反馈（settings.haptics 且设备支持时）；Escape 在面板打开时优先关闭面板。
- 验证：菜单/Store/Options/Stats 四张截图；关闭高清后 localStorage 记录 {"sfx":true,"haptics":true,"hq":false} 且刷新后保持；跑一局死亡后统计 runs=1/59m/6 币/×2，刷新仍在；成功转弯计入 stats.turns=1；`npm run temple:build` 通过（884 ms）；console 无新错误。

2026-10-23（第十八轮，用户反馈「拐弯视角被墙遮蔽」「坑躲不掉」）：
- 拐弯视角根因：buildJunction 里的 4 段「转角翼墙」中，沿入弯方向的两段中心 z=5.1、长 10.6 → 实际覆盖 z -0.2..10.4，其中 z 0..4.2 伸进了出弯走廊，正好卡在追尾相机与玩家之间。改为四段墙都从开口外侧起步（|x|,|z| ≥ 4.3，长度 10.6），形成规整的转角墙盒；并用相机与玩家的 raycast 验证无遮挡。同时转弯期相机轻度拉近/抬高（turnAmount：距离 9→6.8、高度 +2.6），不再穿墙。
- 坑（gap）根因 1：坑面画在 y=-1.5 的“坑底”，被实心路面盖住 → 玩家几乎看不见，只像一片阴影。改为在路面上方 y=0.042 画纯黑“洞口”（多层不规则平面），四周加碎石缺口头、金色警示沿、两侧各两盏点火柱，并新增 HUD 提示「前方坑洞 · 向上跳！」（距坑 3.5–11 m 触发）。
- 坑根因 2：判定是单帧 ±0.85 m，且只认 jumpY>.85 → 起跳稍早（人还在上升）会被判“没跳过”。改为区域判定 ±2.0 m，且「jumpY>.12 或 jumpV>0（正在上升）」即算越过。验证：提前 7 m 起跳 → 距离 52 m 存活；离坑沿 3 m 才起跳 → 存活；不跳 → 掉坑死亡。
- 追加 1:1 细节：速度改为随距离渐进（12 m/s → 22 m/s），前期反应时间更接近原作，也让坑/树根更好躲。
- 验证：过弯序列截图（56/61/69 m 无遮挡）、坑提示画面、jump/无 jump 两组数据；`npm run temple:build` 通过（1.13 s）；console 无新错误。

2026-10-23（第十九轮）：路口用原版墙体收口 + 石柱障碍 + 转弯相机再调。
- 路口死端墙/外侧墙改用原版 track-wall-straight-a facade（scale .2；死端 rotY=π/2、z=-8.3；侧墙 x=-dir*6.4、rotY=-dir>0?0:π），删掉原来的程序化砖盒+雉堞；走廊墙与路口墙现在同一套贴图/高度/金饰带，转角视觉连续。
- 补了路口的第二个铺装象限（corner 需要 8×8 广场的两个象限，之前只画了一个 → 另一侧露出丛林地面）：4.6×4.6 铺装面 + 下方石基座。
- 车道障碍 block 换成原版 stone-pedestal 预制体（6.2×14.9×10.1 u，scale .2 ≈ 1.2×3.0×2.0），程序化金饰石墩保留为兜底。
- 转弯相机：预转弯阶段不再把 look target 拉到路口外（原先会提前扭头+俯视），lookahead 改为 distance+6；转弯中（turnAmount）看向新朝向 distance+6+10、视线抬高 1.1；抬升量 2.6→2.0、拉近 2.2→1.6。转弯前后画面：52 m 正常追尾视角、61 m 沿新走廊、70 m 完全对称。
- 验证：右转/左转各一遍（turnCount=1、playing）；block 换道躲避 stumble=0、同道撞击 stumble=7.7；`npm run temple:build` 通过（858 ms）；console 无新错误。

2026-10-23（第二十轮，用户反馈「金币和树墩重叠」「树墩下滑铲躲不掉」）：
- 金币重叠：spawnWave 原来固定把 5 枚金币铺在障碍距离 ±5 m（safeLane 只避开车道障碍，对全幅障碍无效），金币会穿进倒树/树枝/火焰里。现在按障碍类型过滤：全幅障碍前后 6.5 m 不刷金币、车道障碍同车道前后 4 m 不刷，功率道具同样过滤；实测整局金币与全幅障碍最小间距 = 6.8 m。
- 滑铲躲不掉（3 个原因）：
  1. 碰撞判定在障碍中心 ±0.85 m 就触发，视觉上树干还在 0.85 m 外就判死 → 全幅障碍收窄到 ±0.5 m，并把 tree-slide 模型沿 z 平移 0.6 使树干横跨位置与碰撞面对齐；
  2. 树根（要跳）和斜树（要滑）外形相近，容易按错动作；新增底部动作提示 chip：接近全幅障碍 14 m 内显示「↑ 跳过」/「↓ 滑铲」（#actionCue）；
  3. 输入宽容：新增 lastJumpAt/lastSlideAt，刚按下动作 0.32 s 内也判有效；树根/火焰跳跃判定从 jumpY>.85 放宽为 jumpY>.55 或仍在上升。
- 验证：滑铲时机扫描（提前 0.30/0.35/0.40/0.43 s 均成功，到跟前才按失败，符合视觉）；起跳过树根成功；脚本跑 507 m/5 次转弯/22 金币无异常；`npm run temple:build` 通过（968 ms）；console 无新错误。

2026-10-23（第二十一轮）：原版「Save Me」复活 + 结算/暂停界面补齐。
- 金币复活：死亡界面新增「金币复活 50」按钮（每局一次，消耗本局金币）。复活时回退 12 m、清空周围障碍/金币、速度恢复、短暂无敌 2.6 s（角色闪烁，期间不判定碰撞）、金币/里程保留；复活后 nextTurn 重新对齐到 9 mod 12，路径段重置为 1 段，避免复活在路口边缘卡 state。
- 结算界面：死亡插画 + 本次距离/收集金币/历史最佳 + 复活按钮（可用/金币不足/本局已用三种态）+ 再跑一次 + 返回菜单；「返回菜单」为 ghost 样式按钮。
- 统计改为“离场提交”：finishDeath 只记录 deathRun 快照，commitRun() 在「再跑一次 / 返回菜单」时提交，复活不会重复计局/重复累计里程。
- 暂停界面新增「返回菜单」；goMenu() = commitRun + reset + 显示主菜单。
- 验证：复活可用态（90 币 → 复活后剩 40、距离回退、继续奔跑）、币不足态（灰化 + “50 · 币不足” + 说明）、已用态（灰化 + “已用”）、无敌期间撞树根 stumble=0、两次死亡后 stats 只 +1（死亡不提交、复活不提交、离场才提交）、暂停→返回菜单正常、stats 面板无回归；`npm run temple:build` 通过（815 ms）；console 无新错误。

2026-10-23（第二十二轮）：原版角色商店 + 金币银行（把 STORE 从占位变成可用功能）。
- 从 APK 再导出 9 张原版角色皮肤贴图（UnityPy 从 sharedassets0.assets 各 split 与 character prefab 资源包中取 Texture2D）：playerTexture_indi(默认 Jhony)、SeleneAstronaut、grl(Scarlett)、HalloweenWerewolf、bb(Barry Bones)、china(Karma Lee)、XiXueGui(血鬼)、Conq(征服者)、Skeleton(骷髅)，统一压到 1024 并放到 web/public/assets/characters/（共 3.4 MB）。
- 金币银行：新增 localStorage 'atb_temple_run_chars' 保存 {bank,owned,equipped}；每局离场提交时把本局金币入账（commitRun），金币因此跨局累积，才买得起角色。
- 商店：STORE 面板改成真实角色列表（价格 0/300/400/500/600/700/800/1000/1200），三种行态：已装备 / 可装备 / 购买（自动灰化买不起的）；购买即时扣银行、自动装备并通过 runnerRig.material.map 热切换皮肤（flipY=false + SRGB，与原版 UV 一致），无需重载页面。
- 验证：注入 1000 币 → 买 Selene 后 bank 700、equipped=selene、面板即时刷新；再买 Karma（700）→ bank 4300/equipped=karma（含前次存留），实机近景确认白色宇航服与红白 Karma 皮肤均正确显示；跑一局收 5 币离场 → bank 700→705；重载页面后 equipped 皮肤仍生效（loadRunnerRig 直接用已装备贴图）；转弯 turnCount=1、暂停→菜单、Stats 面板均无回归；`npm run temple:build` 通过（999 ms）；console 无错误。

2026-10-23（第二十三轮）：原版背景音乐 + 剩余音效补全。
- 从主资源包（sharedassets0.assets + sharedassets0.resource）补导出长音频：BackgroundMusic（61.07 s / 44.1 kHz / 立体声）、nightMusic（32.97 s）、boostLoop、shimmer、magnet、footstepsTemple/Plank/Cliff、coin；统一用 ffmpeg 转 128 kbps mp3（BackgroundMusic 978 KB，nightMusic 528 KB，其余几 KB~50 KB），放 web/public/assets/audio/。
- sfx.js 新增循环 BGM 播放器：startMusic(theme)/pauseMusic/resumeMusic/stopMusic（HTMLAudioElement loop + 2.5 s 淡入/1.2 s 淡出，soundInfo 可查）、musicInfo()；setMuted 同时静音/恢复音乐。
- 事件接线（main.js）：开局 reset() 播 theme；暂停暂停、继续恢复；finishDeath 淡出停止；复活重新起乐；返回菜单停止；加速道具生效时 startLoop('boostLoop')、结束后停止；磁铁/金币加成/护盾激活分别播 magnet/shimmer。
- 音效修正：金币改用原版 coin.mp3；新增 buy(收银机)、magnet、shimmer 条目。
- 验证（真点击解锁 AudioContext 后）：musicInfo 显示 theme playing、duration 61.1 s、音量 0.13→0.22 淡入；暂停 paused=true、继续恢复；死亡 current=null；复活重新播放；点 HUD 音效键音乐暂停；跑动音效计数 click/footstep/coin/whoosh/magnet 均命中；`npm run temple:build` 通过；console 无错误。

- 追加：Options 新增独立「音乐」开关（原版 Options 也是 Music / SFX 分开），settings.music 控制 startMusic/stopMusic，关闭后开局不再起乐、打开立即淡入；默认开启。验证：music=false 时 musicInfo.current=null，music=true 时 theme 正常播放（volume 0.22 / 61.1 s）。

2026-10-23（第二十三轮）：路口 3D 指引箭头（对齐原作「地面发光箭头」）。
- buildJunction 里新增发光箭头实体：箭杆 2.0×0.16×0.62 + 锥形箭头（rotZ=-90°），金色 emissive 材质（0xffc247 / emissive 0xff9a12@.75）；按转向镜像（rotation.y=dir<0?π:0），让箭头指向出弯方向；位置在转角平台前缘（padCX, .28, padCZ+1.1），rotation.x=-0.42 向前倾、便于第三人称视角看清。
- 动画：入弯后在 update 里做 `scale.set(1+.05sin,1,1+.05sin)` 脉冲 + 附加 additive 辉光 Sprite 透明度呼吸（.45±.25），跟随 junction 一起显隐。
- 验证：左转（57 m）画面里箭头指向左、右转（93 m）指向右，与顶部提示「前方左/右转」一致；转弯判定 turnCount=1 正常；`npm run temple:build` 通过；console 无新错误。

2026-10-23（第二十四轮）：商店角色头像（原版 UI 图集裁切）。
- 从 egUI_Buttons2x 图集裁出 4 个原版头像图标：Selene 宇航员头盔 (798,898,914,1010)、Karma 黑发女盗贼 (806,776,902,878)、Scarlett 红发女探险家 (806,1028,902,1130)、Barry 探险帽男 (735,1252,882,1362)，落盘 web/public/assets/ui/avatar-*.png。
- CHARS 增加 av 字段；STORE 每行改为「头像 + 名字/副标题 + 状态按钮」三列栅格；没有图标的角色（Jhony/狼人/征服者/骷髅/血鬼）显示金色 ◆ 符文占位，保持视觉整齐。
- 验证：商店 9 行、4 张原版头像正确加载（`.char-av` 数量=9，其中 4 个带 background-image），已装备/装备/购买三态正常；`npm run temple:build` 通过；console 无新错误。

2026-10-23（第二十五轮）：路口远景神庙立面（对齐原作「每个弯道尽头都是神庙」）。
- 载入原版 tower-arch.obj 作为 templeGateTemplate（facadeMat，DoubleSide），在 buildJunction 里以 scale .26、position (0,-.4,-11.6)、rotY=π 放在死端墙后：只有上半部（垛口 + 金色饰带 + 塔身）在 7 m 高的转角墙后方露出，形成远景神庙；随 junction 一起显隐，不参与碰撞。
- 观察：接近路口时画面正上方出现神庙塔楼剪影，转弯后自动消失；配合地面金色箭头，路口三件套（提示胶囊 / 3D 箭头 / 神庙剪影）齐了。
- 验证：转弯判定正常（turnCount=1, playing）；`npm run temple:build` 通过；console 无新错误。

2026-10-23（第二十六轮）：死亡镜头 + 暗角（对齐原作「死掉时镜头推近角色」的演出）。
- 关键结构问题：原 update() 在 state==='dying' 时 `updateDeath(dt);return`，所以相机电影镜头写在主 update 里根本不会执行；改为在 updateDeath() 内做镜机：`back=pathAt(distance-5.0)`，相机 lerp 到 (back.x, 3.15→2.4, back.z)，lookAt 玩家胸口，fov 收到 48，随死亡进度 smooth settle。
- 新增 #deathVignette（radial-gradient 暗角，z-index 4 在 HUD 上、结算弹窗下），end() 时淡入，reset() 时清除；配合镜头/角色翻滚形成死亡演出。
- 验证：dying 状态截图（r20-death-vignette3.png）能看到推近的角色 + 四周暗角；复活后镜头平滑回到追尾视角（r20-revive-after-death-cam.png，distance 17 正常续跑）；重开后暗角 class 清空；`npm run temple:build` 通过 824 ms；console 无新错误。

2026-10-23（第二十七轮）：结算页新增「最高倍率」、金币成串弧线、开局镜头入场。
- 新增 runBestMulti 记录单局最高倍率（multiplier 提升时更新，reset 归 1），deathRun 用它入账；结算 .result 由 3 列改 4 列：本次距离 / 收集金币 / 最高倍率 / 历史最佳。
- 金币弧线：spawnWave 的 5 连金币有 32% 概率生成跳跃弧线（y=1.35+sin(k/4·π)·1.25），配合原作「金币在空中排成弧」的观感；createCoin 增加 y 参数，更新循环用 c.y 而不是固定 1.3。
- 开局入场：reset() 时把相机放到 (pathAt(-9), 7.4) 并 lookAt 前方，随后由追尾相机 lerp 自然「落位」，每局开始有一次短暂的 drop-in 镜头。
- 验证：结算 4 列显示 ×2（单局 5 币触发）；弧线金币截图 r21-arc-check.png；`npm run temple:build` 通过；console 无新错误。

2026-10-23（第二十八轮）：拾取/受击反馈（原作的金币闪光与撞击顿感）。
- 新增火花粒子系统：spawnSparks(pos,color,count,spread,size,life) 用 additive 辉光 Sprite，重力 -2.2、生命 0.5-0.9 s，全部在 updateSparks 里回收；金币拾取 5 颗金色火花、道具拾取 12 颗对应颜色火花、绊倒 9 颗土色火花。
- 新增撞击反馈：stumbleOrCatch 里 impactFlash=1，触发 #impactFlash 全屏暖红径向光晕（z-index 4，0.3 s 衰减）+ 相机三轴抖动（x/y 正弦，幅度随 impactFlash 衰减），配合原有的 hint「绊倒了！追逐者靠近了」。
- 调试：debug 增加 burst()/slowDeath()/__freezeFx（截图用）。
- 验证：拾取火花 r22-sparks5.png；撞击闪红 r22-stumble-flash3.png（HUD 也被光晕覆盖）；撞击后 state 仍 playing、火花在生命周期后回收；`npm run temple:build` 通过；console 无新错误。

2026-10-23（第二十九轮）：复活倒计时 + 新纪录标记（对齐原作「Save Me!」限时感）。
- 复活改为 8 秒限时窗口：结算时 startReviveTimer() 起 setInterval(100ms)，进度条 #reviveBar 从 100%→0，note 同步显示「限时 Ns · 每局可复活一次」；倒计时结束置 reviveUsed=true、按钮置灰、提示「复活机会已过期」，revive() 也加了 reviveTimer>0 守卫；reset()/revive()/goMenu 都会 stopReviveTimer() 防泄漏。
- 结算页新增「★ 新纪录」徽章（#newBestTag）：finishDeath 时若 best > previousBest 且 >0 才显示，金色胶囊置于标题上方。
- 验证：有 120 币时按钮可点 + 进度条与「限时 5s」文案同步（r23-revive-countdown2.png）；无币时按钮灰化；把 best 改成 10 后跑到 17 m 出现「★ 新纪录」且 best 写回 17（r23-new-best.png）；`npm run temple:build` 834 ms 通过；console 无新错误。

2026-10-23（第三十轮）：道具拾取物换成原版图标（billboard）。
- 从 egUI_Buttons2x 图集裁出：加速「火焰箭」pw-boost.png (772,1158,892,1252)、护盾「天使翅膀」pw-wings.png (806,1388,912,1466)、金币加成「×2 金块」pw-bonus.png (1644,1420,1780,1540)，放 web/public/assets/ui/。
- createPickup：有原版图标的 kind 用 THREE.Sprite billboard（宽 2.35，按贴图比例给高，透明度贴图直接当图标，additive 辉光缩到 2.1、opacity 0.3）；磁铁没有对应原版图标，继续用红色八面体宝石；仍保留上下浮动与旋转。
- 验证：加速/加成/护盾在画面中显示为原版图标（r24-pw-boost.png、r24-pw-icons2.png），拾取正常触发 power（coin bonus 收集后 coins 正确增加）；`npm run temple:build` 通过；console 无新错误。

2026-10-23（第三十一轮）：密林树冠（走廊上方的丛林穹顶）。
- refreshRoadSurface 增加两层树冠：① 原有墙外树冠加大加密；② 新增「内侧树冠」——每块瓦片沿走廊两侧在 x=±2.4~4.3、y=10.2~12.8 处生成深/浅绿扁球（3.4~5.8 宽、1.1~1.8 高），形成从画面上沿压下来的绿色穹顶。
- 天际线树木从每侧 3 棵增至 4 棵、尺寸上限提高（scale .06~.11，高度最高 ~26），更接近原作密林包围感。
- 验证：奔跑画面顶部出现连续的树冠（r25-canopy2.png），道路/角色/障碍无遮挡；`npm run temple:build` 通过；console 无新错误；跑动 3 s 无异常。

2026-10-23（第三十二轮）：金币改为「神庙面金币」+ 跑步动画随速度缩放 + 起点神庙门框。
- 金币：替换原来的金环+球，改成 CylinderGeometry(r .27, h .055, 22 段) 圆盘，用 Canvas 画的正/背面贴图（金色径向渐变 + 内外两圈浮雕描边 + 双眼/鼻子/咧嘴 + 高光），侧边金色金属材质；另加微弱金辉 sprite。近景可见神像脸，跑步时旋转与原来一致。
- 动画：runnerRig.update(dt, timeScale)，run clip 的播放速率随实际速度缩放（speed/16，限制 0.65~1.55），加速道具时步频同步加快、减速时放慢；jump/slide 仍按常规速率。
- 起点：开局在玩家身后放一个原版 tower-arch 门框（scale .22，z=PLAYER_Z+6.2，面朝玩家），前 16 m 可见，形成「从神庙跑出去」的起始画面，之后自动隐藏。
- 验证：金币近景（r26-coin-face.png）与跑动收集（5 枚 + ×2 徽章，r26-coins-run.png）；起点门框（r26-startgate-look.png）；`npm run temple:build` 通过（833 ms）；console 无新错误。

2026-10-23（第三十三轮）：移动端可用性收尾（全屏 + 安全区）。
- HUD 右侧新增全屏按钮 ⛶（与音效/暂停同风格），点击调用 requestFullscreen / exitFullscreen，失败时提示「当前浏览器不支持全屏」；iOS 用 webkitRequestFullscreen 兜底。
- viewport meta 增加 viewport-fit=cover；移动端媒体查询下 .hud/.stats/.controls/.bottom-note/.turn-cue 全部叠加 env(safe-area-inset-top/bottom)，适配刘海屏/底部手势条，控件不再压到系统区域。
- 验证：390×844 视口下菜单（r27-mobile-menu.png / r27-mobile-fs.png）、游戏画面（r27-mobile-fs2.png）、加安全区后（r27-mobile-safearea.png）布局正常，三颗按钮排列正确；桌面 900×900 恢复常规手机壳布局（r27-desktop-back.png）；4 s 跑动无 window error / unhandledrejection；`npm run temple:build` 809 ms 通过。

2026-10-23（第三十四轮）：障碍波次改成原版式「组合波」，并做长跑公平性验证。
- spawnWave 重写为 4 种模式（种子确定性、可复现）：
  ① 45% 单个整幅障碍（hurdle/arch/gap/fire）+ 安全车道金币线/金币拱，间隔 22~32 m；
  ② 27% 双车道阻挡（两条车道 stone-pedestal，逼迫走进唯一空车道），间隔 24~33 m；
  ③ 18% 交错双阻挡（先挡 l1，8 m 后挡 l2，逼迫连续换道），间隔 32~40 m；
  ④ 10% 整幅障碍 + 金币拱（弧线穿障碍上方）。
- 转弯口前后 24 m 仍禁生成障碍/金币；金币仍遵守 coinFits（整幅障碍前后 6.5 m、车道障碍同车道前后 4 m 清空）。
- 视觉：stone-pedestal 车道障碍 scale .2→.27、材质压暗 0.5 倍，让它在土黄墙面背景里可读；debug 增加 spawnObstacleIn(kind,lane,ahead)。
- 公平性验证：用脚本机器人（看 render_game_to_text 决策：按时转弯、跳/滑整幅障碍、绕开双阻挡）跑 2600 tick×50 ms —— 稳定跑到 **2097 m / 18 次转弯 / 163 金币**，第 18 次转弯后因机器人自身操作失误被抓（caught），期间无不可解组合、无 impossible spawn；两次运行结果完全一致（确定性种子）。
- 截图：r28-pattern-play.png（313 m 处车道障碍 + 金币线）、r28-forced-lane7.png（双阻挡）、r28-block-inspect.png（障碍近景）；`npm run temple:build` 852 ms 通过；console 无新错误。

2026-10-23（第三十五轮）：还原原版的「矮墙 + 密林」走廊比例（此前是 7 m 高墙峡谷）。
- 依据：APK 导出报告（analysis/obstacle-assets-report.md）指出赛道瓦片自带 30 u 地面裙边，原版实际露出路面以上的只有约 6.78 u 的残墙；按 .2 缩放应下沉 30*.2=6.0。
- 改动：走廊 facade 下沉 LOWWALL_SINK=-6.0 → 露出约 1.36 m 带城垛的残墙 + 金色饰带；路口（死端/外侧/翼墙）仍保留 7 m 高神庙墙，形成「矮墙走廊 + 转角神庙」的原版构图。
- 新增墙后丛林：每块瓦片每侧 4 丛树冠球（x=±7.1~10.5、y=1.2~3.8，带 treeTexture 贴图），配合原有内外层树冠与天际线树，墙后不再是空白/草坪。
- 相机随之压低：4.55→4.05，视点 1.5→1.35（更接近原版追尾机位，能看到墙外丛林）。
- 验证：r29-jungle3.png（走廊：矮墙+金饰带+墙后密林+树冠）、r29-turn2.png（转弯后：左侧矮墙密林 / 右侧高神庙墙）、r29-turn1.png（转弯中）；机器人 1400 tick 跑到 1427 m / 12 转弯仍存活，无 window error；`npm run temple:build` 840 ms 通过。
- 备注：若想回到高墙版本，`LOWWALL_SINK` 改回 0 即可（墙/丛林/相机三处都在同一常量与相邻代码里）。

2026-10-23（第三十六轮）：矮墙改造后的配套修缮（火把/树冠/转弯镜头穿树叶）。
- 火把支架与火焰整体下移贴合 1.36 m 墙顶：支架 y 2.05→1.72（高度 .7）、横臂 1.64→1.38、火焰 2.75→2.06，现在是立在墙头的火把而不是悬空。
- 「墙顶溢出树冠」y 7.35~8.05 → 1.55~2.3（跟随矮墙），并补 userData.facade，转弯前 10 m 随墙一起隐藏，不再出现“悬空绿球”。
- 转弯镜头穿树：内侧树冠 y 6.4~8.8 → 7.3~9.5、拱形树冠 8.0~11 → 8.6~11.4，转弯抬升 2.2→1.85，修掉转弯瞬间半个屏幕被绿色球体挡住的问题。
- 墙后灌木外推 x 7.1~10.5 → 8.4~12，避免近距离大绿面糊住镜头。
- 验证：r30-approach2.png（路口前无悬空树冠）、r30-turnmid2.png（转弯中画面干净、石台/箭头/火把清晰）、r30-turnafter.png（转弯后左矮墙+右高神庙墙）、r30-corridor4.png（走廊火把/树冠贴合）；机器人 1600 tick 跑到 1701 m / 15 转弯仍存活；`npm run temple:build` 888 ms 通过；console 无新错误。

2026-10-23（第三十七轮）：道具视觉反馈 + 丛林氛围统一。
- 护盾：角色包裹半透明青色球体（scale 1.05/1.25，y 1.05，opacity .13~.17 呼吸），拾取/破盾时显隐。
- 磁铁：腰部红色圆环（Torus r .62）绕身旋转+上下浮动，配合原有金币吸附动画。
- 加速：身后持续冒出绿色火花（每 90ms，0x66ffb0），配合 FOV +5/加速音效。
- 道具槽改为单一：拾取非护盾道具会顶掉护盾（原版也是单槽），HUD 不再出现「护盾·就绪 + 磁铁」并存。
- 调试接口加 `d.givePower(kind)` 便于截图验证。
- 丛林氛围：背景渐变与雾色改为深丛林绿（#2b4033→#3a5038，FogExp2 0x5d7355/0.015），林下地面 0x314c3d→0x22352a；路口前墙后那条惨白绿被压成雾绿，画面更接近原版湿热丛林。
- 验证：r31-shield2.png / r31-magnet.png / r31-boost.png / r31-floor3.png；机器人 1500 tick 跑到 1540 m / 13 转弯仍存活；`npm run temple:build` 832 ms 通过；console 无新错误。

2026-10-23（第三十八轮）：角色动效（转弯侧倾/绊倒/加速前倾/落地与滑铲扬尘）+ 手势回归。
- 转弯侧倾：`turnLean=-turnDirection*turnFlash*0.22`，过弯瞬间整个身体向内侧倾斜（rail 130 m/h），换道侧倾幅度也从 -0.12 加到 -0.19。
- 绊倒：`stumbleKick=1` 后 0.42 s 内身体前扑（pitch -0.5*kick 衰减），配合镜头抖动。
- 加速：`power.type==='boost'` 时身体前倾 -0.11 rad。
- 落地扬尘：起跳→落地时脚下 4 颗 0xcdbb98 尘粒；滑铲时每 110ms 脚下 2 颗（0xc9bb9c）。
- 手势验证（触屏 PointerEvent 模拟）：左/右滑 → lane 1→0→1；上滑 → jumpY 0.86；下滑（落地状态）→ sliding 0.87，全部生效（下滑在跳跃中会变成快速落地，符合预期）。
- 顺带把 runnerRig 暴露为 `d.rig()`（含 getClip()），方便排查动作状态。
- 验证：r32-lean2.png（过弯侧倾）、r32-stumble.png（绊倒前扑+提示）、r32-slide-close.png（滑铲腿部前伸特写）；机器人 1500 tick 跑到 1540 m / 13 转弯仍存活；`npm run temple:build` 855 ms 通过。

2026-10-23（第三十九轮）：追逐者出现逻辑修正（对齐原版）。
- 之前追逐者一直跟在相机与角色之间，画面底部永远挂着一只黑色蝙蝠，既不像原版也不干净。改为：正常奔跑时 chaseGap=11.5（在相机后方 → `enemy.visible=false` 彻底不渲染），只有绊倒（stumbleCooldown>0）时 gap 快速收到 3.6、横向偏移 1.9→1.15、抬高 1.02→1.15、放大 1.12，凑到角色脚边；被抓住死亡时 gap 收到 .25 并由死亡演出接管。
- 效果：平时画面干净无黑蝙蝠（r33-normal2.png）；绊倒瞬间一只展翅恶魔从脚后扑上来（r33-stumble3.png），配合「绊倒了！追逐者靠近了」+ 尘土；二次绊倒 → 被抓住死亡，结算插画正好是“恶魔扑倒跑者”（r33-caught.png）。
- 验证：机器人 1400 tick 跑到 1427 m / 12 转弯仍存活；`npm run temple:build` 1.11 s 通过；console 无错误。

2026-10-23（第四十轮）：HUD 改回原版风格（去掉统计卡片）。
- 之前 HUD 是一整块带边框/毛玻璃的「距离|金币|最高」统计卡，现代感太强，和原版不符。改为原版式悬浮数字：无底板、无边框、无分割线，只有带描边的数字：
  - 左侧「金币」+ 金币符号 ◉（金色）
  - 中间「距离」大号白字 + m（最醒目）
  - 右侧「最高」小号
- 用 flex order（nth-of-type）把 DOM 顺序重排成 金币/距离/最高，兼容移动端（390px 下同样清晰，r34-hud-mobile.png）。
- 转弯提示文案从「转弯已确认，保持方向」缩成「转弯已确认」，避免两行换行。
- 验证：r34-hud4.png（桌面 HUD）、r34-hud-mobile.png（移动端）、r34-turn-hud.png（转弯时 HUD+提示）、r34-menu.png（菜单未受影响）；机器人 1400 tick 跑到 1427 m / 12 转弯仍存活；`npm run temple:build` 840 ms 通过；console 无错误。

2026-10-23（第四十一轮）：整体光照改成原版「白天丛林」。
- 之前是偏暗的黄昏/雾气调，和 1.39 原版的明亮白天差距大。改动：
  - 天空渐变：深绿 → 蓝天白云色（#4f7fa3 → #8fb4c6 → #cfdcc9 → #efe8c9）
  - 雾：FogExp2 0x5d7355/0.015 → 0x9cb08c/0.0115（减弱灰雾）
  - 半球光 2.5→2.1（天光偏冷白 0xe4f0e6），太阳光 0xffd9a0/3.5 → 0xfff0c8/3.1，补光偏冷
- 效果：走廊尽头出现明亮的“林间天光”，两侧树叶变成日光下的翠绿，石墙金色饰带更接近原版；路口、转弯、菜单全部同步变亮（r35-daylight2.png / r35-turn-day.png / r35-menu-day.png）。
- 备份：analysis/main.js.backup-r35（改之前版本，方便回滚）。
- 验证：机器人 1400 tick 跑到 1427 m / 12 转弯仍存活；`npm run temple:build` 839 ms 通过；页面 console 0 error / 0 warning。

2026-10-23（第四十二轮）：修角色贴图 V 方向（贴图错位）。
- 现象：跑者身上衣服/皮肤色块混乱（躯干是墨绿色破布、腿部粉白、靴子橙色），像贴图错位。放大观察后确认是 UV 采样方向问题。
- 原因：角色纹理 texture-63-playerTexture.png 是一张 UV 图集（左上皮肤、右上红发脸、右侧白衬衫、右下长裤靴子、左侧绿色破布），three.js 默认对贴图做 V 翻转，而 Unity 导出的是不翻转 V 的 UV；之前按轨道贴图的惯例设了 flipY=false，导致整体上下颠倒采样 → 躯干采到了绿色破布、腿采到皮肤。
- 修复：`runnerRig.js` 的 loadRunnerRig、`main.js` 的 loadFallbackRunner / setRunnerSkin 全部改为 flipY=true。现在 Jhony 是「米白衬衫 + 深色长裤 + 橙棕靴 + 红棕头巾」，Selene 是银白宇航服，色块连续自然（r36-runner-front.png / r36-selene.png，对照修复前 r36-runner-close.png）。
- 验证：机器人 1400 tick 跑到 1427 m / 12 转弯仍存活；`npm run temple:build` 851 ms 通过；console 无错误。

2026-10-23（第四十三轮）：加回原版「力量槽」（power meter）。
- 原版机制：吃金币把左上角能量条充满，满了自动随机触发一个力量（磁铁/加速/护盾/金币加成），而不是只靠路上随机刷新道具。之前只有 ×N 连击倍率，缺了这条核心循环。
- 实现：
  - HUD：金币下方新增 104×8 细条 `#powerMeter`（金→橙渐变填充，满时描边发光），桌面/移动端都在金币与 ×N 徽章之间。
  - 逻辑：每吃到 1 枚金币 `chargePowerMeter(1)`，满 40 枚 → 清零 + 随机 `POWER_KINDS` 触发 `activatePower()`，提示「力量充满 · 磁铁！」等 + recharged 音效 + 震动。
  - 重置/结算时同步清零与隐藏。
- 验证：r37-meter2.png（30% 填充）、r37-meter-full.png（满槽自动触发 boost，remain 3.2s、槽回落到 27.5%）、r37-meter-mobile.png（移动端布局）；机器人 1400 tick 跑到 1459 m / 13 转弯仍存活（沿途 149 金币，多次自动触发力量）；`npm run temple:build` 859 ms 通过；console 0 error / 0 warning。

2026-10-23（第四十四轮）：摄像机跟随跳跃/滑铲 + 金币 HUD 弹跳 + 调试时间冻结。
- 原版手感：起跳时镜头会略微跟起、滑铲时镜头下沉贴近地面；之前镜头高度固定 4.05，跳/滑只有人物动、镜头不动，少了「跟着跑」的感觉。
- 实现（web/src/main.js 相机段）：
  - `jumpFollow = min(1, jumpY/1.6)*0.55` 叠加到相机 y，`lookAt` 高度同时抬 `jumpFollow*0.5`；
  - `slideDip=0.42`（滑铲时相机 y 下压、lookAt 下压 0.35），用 `Math.min(1,dt*9)` 平滑；
  - 吃金币时 `#coins` 加 `.pop` 类做 0.16s 缩放弹跳（CSS keyframes coinPop）。
- 新增调试能力：`window.__templeDebug.hold(true/false)` 冻结 update（仍渲染），用于确定性抓起跳/滑铲/转弯中间帧（之前截图时物理继续跑，抓不到空中帧）。
- 验证：r38-jump-hold.png（人物腾空、镜头抬高）、r38-slide-hold.png（滑铲贴地、镜头下沉）；机器人 1600 tick 跑到 1701 m / 15 转弯存活，jump 266 tick、147 金币；`npm run temple:build` 898 ms；console 0 error / 0 warning。

2026-10-23（第四十五轮）：落地/滑铲/脚步烟尘粒子（原版跑动的尘土反馈）。
- 之前跳跃落地用的是 additive 金色光点，看起来像火花而不是尘土；跑步时脚边完全没有反馈。
- 实现（web/src/main.js）：
  - 新增 `dustPuff(pos,count,scale)`：用 `flameGlow` 径向贴图做 NormalBlending 软粒子（暖灰 0xdcd3c0、opacity .36），上浮 + 膨胀（scale 随寿命 ×1.6）、0.5~0.7s 淡出；粒子项带 `dust:true` 走单独的 `updateSparks` 分支。
  - 落地：`wasAirborne && grounded && jumpV===0` → 在脚后 1.0 m 生成 9 个烟尘；
  - 滑铲：每 0.11s 在身后 1.1 m 生成 2 个小烟尘（替换原 additive 火花）；
  - 跑步脚步：每 0.26s 在身后 1.15 m 生成 2 个烟尘；
  - 顺手把吃金币的 additive 光点从 5 个/尺寸 .34 降到 3 个/.26，避免糊成一团金光。
- 验证：r39-land-dust2.png（落地烟尘）、r39-dust4.png（跑步脚步烟尘）；机器人 1600 tick 跑到 1718 m / 15 转弯存活（滑铲 56 tick）；`npm run temple:build` 825 ms；console 0 error / 0 warning。

2026-10-23（第四十六轮）：原版「石门 gateway」装饰 + 路口/石门处的树冠让位。
- 原版每段走廊上会穿过石制门楼；我们之前走廊只有低墙 + 树冠，缺少这种地标性结构。
- 实现（web/src/main.js）：
  - 复用已导出的原版 `assets/obstacles/tower-arch.obj` 作为门楼模板 `templeGateTemplate`（原用于路口背景），每段路生成一座门：
    - `gateways[]` 存 `{group,seg,pathDistance}`，段起点 +62 m 处放一座（首段固定在 42 m，保证第一个路口 57 m 前能看到并穿过一座门）；
    - 门缩放 `(0.27, 0.13, 0.16)`：宽约 13.6 m——石柱落在两侧围墙外（±6.75），横梁从道路上方跨过；材质单独 `gateMat`（wallTexture + 提亮 + 微弱自发光）避免树荫下发黑；
    - 生命周期：segment 被转弯截断（`pathDistance > seg.end-2`）或跑过 26 m 后自动移除，转弯后新段再生成新门。
  - 树冠/侧墙让位：tiles 的 facade 子对象现在在「距转弯 10 m 内」或「距任意石门 11 m 内」隐藏，石门露出天空轮廓，不会埋在树冠里。
  - 调试：`window.__templeDebug.gateways()` 返回当前门的距离/位置/可见性。
- 验证：r40-gate25.png（29 m 处门楼全景、树冠让位露出天空）、r40-under-gate.png（44 m 穿门视角、两侧浮雕石柱 + 金饰横梁）、r40-gateway-run.png；机器人 1600 tick 跑到 1733 m / 15 转弯存活且门正常生成/回收；`npm run temple:build` 840 ms；console 0 error / 0 warning。

2026-10-23（第四十七轮）：树冠与丛林地面改用原版纹理，去掉「绿球」塑料感。
- 从原版 `treeTexture.png`（1024² 图集：苔藓、岩壁、树干、骷髅）裁出苔藓叶片区域 (0,300)-(300,620)，缩放到 512² 存为 `web/public/assets/apk/leafTexture.png`。
- 树冠/灌木材质（web/src/main.js）：
  - `leafAtlas` 用 RepeatWrapping、repeat(1.6,1.6)，挂到 `mats.leaf`（颜色 0xdcecc0）和 `mats.darkLeaf`（0xaccb9e），树冠从纯色球变成带苔藓纹理的叶团；
  - 视觉对比：左（旧，flat green sphere）→ 右（新，斑驳叶团），见 /tmp/leaf-compare2.png、r41-leaves2.png。
- 丛林地面：`undergrowth` 大平铺盒原来用纯色 0x22352a，现在换成同一 `leafTexture` 平铺贴图（repeat 46×42、颜色 0x93a778），转角/墙外不再是发亮的绿色平板，而是苔藓地面纹理（r41-turn-floor.png、r41-final.png）。
- 验证：桌面 1280×720 + 移动 390×844 均正常（r41-final.png / r41-final-mobile.png）；bot 1600 tick → 1749 m / 15 转弯存活；`npm run temple:build` 866 ms；console 0 error / 0 warning。

2026-10-23（第四十八轮）：对照原版截图做色彩/镜头校准，并加入藤蔓、调整丛林密度。
- 找到原版 TR1 官方 gameplay 截图（Wikipedia Temple_Run_gameplay.png）作参照：暗青绿丛林 + 暖色石道 + 头顶粗藤蔓 + 水面。
- 色彩分级（web/src/main.js，备份 analysis/main.js.backup-r48）：
  - 天空背景改暗青绿渐变（#16302b → #1f4038 → #2a4c40 → #35584a → #4a6b56），fog 0x2f5046 / 0.0135，exposure 1.46，sun 0xffe8b8 / 3.05，hemi 1.9，fill 0x86b3c4 / .85；
  - 树冠颜色压暗（leaf 0x86a877 / darkLeaf 0x4d6f52）；
  - 地面/水面：undergrowth 改用 leafTexture 平铺（repeat 22×20）+ 深青绿 0x27564b、roughness .42 / metalness .12，读作浑浊丛林水面；
  - 石道抬亮：roadTileMat 加 emissive 0x2b2316 × .55，在暗色环境里保持暖石色。
- 头顶藤蔓：每两段路加 2 组 CatmullRom 曲线（横向粗藤 + 3 条垂藤 + 叶团），TubeGeometry，颜色 0x4f7040 / 0x64854c；藤蔓挂在 decor 组，路口中止时自动隐藏；抬高到 y≈9.9、垂落最少 y≈8，不挡镜头。
- 丛林密度：decor 隐藏半径 22 → 12，转弯附近保留树木/石柱。
- 镜头对齐原版：后拉 10.0（原 9），高度 5.25（原 4.55），lookAt y .92（更俯视），转弯抬升 1.7；角色在画面中更小、前方道路更多（r42-desktop2.png / r42-mobile2.png）。
- 修复：`floorAtlas.clone()` 触发的 “Texture marked for update but no image data” 警告，改为单独 textureLoader 加载。
- 验证：bot 1600 tick → 1718 m / 15 转弯存活；`npm run temple:build` 866 ms；console 0 error / 0 warning；桌面 + 移动端截图正常。

2026-10-23（第四十九轮）：HUD 换成原版 UI 素材（金币/宝石图标 + 火焰能量条）。
- 从原版 UI 图集 `web/public/assets/ui/egUI_Buttons2x.png` 中定位并裁出：
  - `coin.png`（56×56，金色神像脸金币图标，图集坐标约 (1654,1058)-(1712,1115)）
  - `gem.png`（46×46，金色菱形宝石，坐标约 (1658,1125)-(1706,1172)）
  - `bar-gold.png`（361×31，金色火焰胶囊条，坐标约 (424,1524)-(796,1568)）
  - `bar-track.png`（388×50，深红底 + 金边胶囊，坐标约 (408,1572)-(800,1624)）
  裁剪时按 alpha 阈值取连通区域包围盒（纯 PIL + flood fill，因为环境无 numpy）。
- index.html HUD：金币前加 `<img class="coin-ico" src="/assets/ui/coin.png">`，最高前加 gem 图标；移除原来的 `#coins::before ◉` 文字图标。
- style.css：`.coin-ico` 19px、`.gem-ico` 14px；`.power-meter` 改为原版 `bar-track.png` 背景（128×16），`#powerFill` 用 `bar-gold.png` 固定 128px 宽裁切填充，替代原来的 CSS 渐变条。
- 验证：桌面 r43-desktop.png / 移动 r43-mobile.png；能量条在 30% 与满格时填充正确（r43-meter.png）；bot 1600 tick → 1723 m / 15 转弯 / 147 金币存活；`npm run temple:build` 880 ms；console 0 error / 0 warning。

2026-10-23（第五十轮）：HUD 改成原版 Temple Run 布局（右上 SCORE 石板 + 右下金币袋）。
- 新导出原版界面图集：`InterfaceTexture2x.png`（1024²，游戏内 HUD 图集，含金币袋、暂停、石质面板、提示字样），由 `/tmp/export_ui_textures.py` 从 APK 导出；同时导出 `egUI_Buttons2x_previous/New_UI/EffectsTexture2x/FontAtlas2x/Tutorial/GC_Atlas/Idol_Localized`。
- 裁出的原版 UI 素材（web/public/assets/ui/）：
  - `bag.png` 165×255（金色神像金币袋+藤蔓石座，取自 InterfaceTexture2x 约 (205,505)-(370,760)）
  - `score-word.png` 344×90（"SCORE ≡" 描金字，取自 egUI_Buttons2x 约 (1216,250)-(1560,340)）
  - 上一轮的 `coin.png`/`gem.png` 继续复用
- HUD 重构（index.html + style.css + main.js）：
  - 右上 `.hud-score` 石板：SCORE 描金字 + 大号金色分数（`score = 距离×10 + 金币×20`），下行显示金币图标+金币数、宝石图标+历史最佳；移除旧的「距离/金币/最高」浮动三栏（距离仍在 end/pause 面板）
  - 右下 `.bag-btn`：点击 → 暂停 + 打开 STORE 面板（面板 z-index 提到 6，关闭后自动回到暂停层）
  - 桌面 70×88、移动 62×78，仅 playing 状态显示
- 验证：桌面 r44-desktop.png / 移动 r44-mobile2.png；bag→STORE 正常（r44-bag-store2.png），关闭后回暂停、继续奔跑正常；bot 1600 tick → 1701 m / 15 转弯 / 159 金币，分数 20,190；`npm run temple:build` 916 ms；console 0 error / 0 warning。

2026-10-23（第五十一轮）：转弯提示与暂停按钮换成原版美术。
- 新导出原版箭头素材（来自 `InterfaceTexture2x.png`，游戏内 HUD 图集）：
  - `arrow-left.png` 286×70、`arrow-right.png` 294×66（橙色原版转弯箭头）
  - `arrow-up.png` 140×312（橙色向上箭头，备用）
- 转弯提示条：`#turnArrow` 从文字符号 ↰/↱ 换成原版箭头图片，左转用 arrow-left、右转用 arrow-right（`src/main.js` 中按 turnDirection 切换）；提示条保持现有紧凑胶囊布局（箭头 + 「前方左转 · N m」）。
- 暂停按钮：`#pauseBtn` 重绘为原版石质暂停板（深棕渐变底 + 金边 + 两条米白竖条，CSS 伪元素实现，无新增图片）。
- 验证：左转 r45-cue2.png、右转 r45-right2.png（箭头方向正确）；桌面 r45-desktop.png / 移动 r45-mobile.png；bot 1600 tick → 1749 m / 15 转弯 / 151 金币存活；`npm run temple:build` 878 ms；console 0 error / 0 warning。

2026-10-23（第五十二轮）：加入原版开局教学（来自原版 Tutorial 图集）。
- 从 APK 导出的 `Tutorial.png`（1024²，原版教学图集）裁出：
  - `tut-ready.png` 385×255（YOU'RE READY. GOOD LUCK!）
  - `tut-turn.png` 460×255（SWIPE TO TURN + 左右橙箭头）
  - `tut-jump.png` 300×405（SWIPE TO JUMP + 两台手机图标）
  - `tut-slide.png` 290×420（SWIPE TO SLIDE + 向下橙箭头）
  - `tut-meter.png` 390×207（FILL UP THE METER FOR BONUS POINTS!）
- 新增 `.tutorial` 覆盖层（index.html + style.css）：半透明深色底 + 原版教学图按竖向排布，pointer-events:none 不挡操作，内容按高度百分比自适应（桌面/移动端都在框内）。
- 逻辑（src/main.js）：`maybeShowTutorial()` 仅在首次进入游戏时显示 4.6 秒（localStorage key `atb_temple_run_tutorial_v1`），之后自动隐藏；`goMenu()` 时强制隐藏；debug 加 `__templeDebug.tutorial(true/false)` 便于复看。
- 验证：桌面 r46-tutorial2.png、移动 r46-tutorial-mobile.png；5 秒后 overlay 隐藏且 localStorage 标记写入；bot 1600 tick → 1733 m / 15 转弯存活；`npm run temple:build` 947 ms；console 0 error / 0 warning。

2026-10-23（第五十三轮）：右下角操作栏（金币袋 + 原版暂停板）+ 教学图清理。
- 布局：原本在顶栏的暂停按钮移到**右下角竖排操作栏**（`.right-rail`：金币袋在上、暂停板在下），与原版「右下金币袋 + 暂停」一致；顶栏只保留音乐/全屏。
- 暂停板：石质深棕渐变 + 金边 + 两条米白竖条（CSS 伪元素），桌面 46×40、移动 46×40（修正移动端两条白条粘连问题）。
- 教学图清理（`Tutorial.png` 裁切二次修正）：
  - `tut-jump.png` 去掉顶部箭头残片（清空顶部 14px）；
  - `tut-slide.png` 保留完整 "SWIPE TO"，右侧手机残边用 alpha 矩形遮掉；
  - `tut-ready.png` 去掉左缘杂点；
  - 教学叠层去掉 `tut-meter.png`（箭头与文字重叠、观感差），现在只保留 YOU'RE READY / SWIPE TO TURN / SWIPE TO JUMP / SWIPE TO SLIDE 四块。
- 验证：暂停板点击 → 暂停/继续正常；桌面 r47-desktop.png、教学 r47-tutorial.png、移动 r47-mobile2.png；bot 1600 tick → 1723 m / 15 转弯存活；`npm run temple:build` 928 ms；console 0 error / 0 warning。

2026-10-23（第五十四轮）：原版金币资产调研 + 金币换成原版神像脸金币。
- 从 APK 导出原版金币卡牌网格：Box01/Box06/Box07（各 20 顶点 / 12 三角面 / 3.64×3.67×1.26，材质 Box01Mat=wallTexture），脚本 /tmp/export_temple_coin2.py → `web/public/assets/coins/box01|06|07.obj`。
- 验证原版金币 UV：Box01 采样 wallTexture 的 u .755-.812 / v .928-.993（Unity V 需 flipY=true 才是金色钥匙孔图案，flipY=false 是苔藓石头）。
- 结论：卡牌网格在游戏里旋转时呈「菱形/卡片」，观感不如圆币；改为**圆币 + 原版神像脸贴图**：
  - 从原版 `Idol_Localized`/`bag.png` 的金色神像头裁出 256² `public/assets/ui/coin-face.png`；
  - `coinFaceMat` 用它 + metalness .32 / roughness .38 / emissive 0x8a5a12×.6，alphaTest .35；
  - 金币几何改为 CircleGeometry ×2（正反面）+ 圆环侧面，保证整张贴图不被圆柱端盖 UV 截掉；半径 .30、厚 .06。
- 验证：金币在场景中呈金色发光圆币、轨迹可正常拾取（bot 1733 m / 15 转弯 / 151 金币）；桌面 r48-coins.png、移动 r48-mobile.png；`npm run temple:build` 941 ms；console 0 error / 0 warning。

2026-10-23（第五十五轮）：主菜单开始按钮换成原版 PLAY! art。
- 从 `egUI_Buttons2x.png` 裁出 `public/assets/ui/play-btn.png`（199×92，原版橙红色描边 "PLAY!" 字；裁切框约 (548,988)-(790,1080)，清掉右下角相邻图标残片）。
- index.html：开始按钮改为 `<button class="primary play-btn" id="startBtn"><img class="play-art">…<small class="play-cn">开始奔跑</small>…</button>`。
- style.css：`.play-btn` 竖向 flex（PLAY art 高 31px + 9px 中文小字 + 右侧箭头），保留原金色按钮底。
- 验证：桌面 r49-menu.png / 移动 r49-menu-mobile.png；点击 PLAY 正常开始（state=playing）；bot 1600 tick → 1755 m / 15 转弯存活；`npm run temple:build` 908 ms；console 0 error / 0 warning。

2026-10-23（第五十六轮）：商店加入原版 UPGRADES 升级系统。
- 从 `New_UI.png` 裁出 `word-upgrades.png`（459×98，"UPGRADES" 羊皮纸描字样）与 `word-shop.png`（279×130，备用）。
- 升级系统（src/main.js）：
  - `charState.upgrades={magnet,coin,revive}`，随 `atb_temple_run_chars` 一起持久化；
  - `UPGRADES` 表：磁铁时长（每级 +1.2s，200/400/800）、金币价值（每级 +25%，300/600/1200）、复活折扣（每级 -10 金币，250/500/1000）；
  - 作用于玩法：`activatePower` 的磁铁时长 + `upLvl('magnet')*1.2`；金币拾取用累加器 `coinValueAcc`（每枚实际 1.25×/1.5×/1.75×，避免取整损失）；复活费用 `reviveCostNow()=max(20,50-lvl*10)`；
  - STORE 面板在角色列表下渲染 UPGRADES 区块：原版字样 + 名称/说明/等级圆点 Lv.N/3 + 价格按钮（`data-up`），`buyUpgrade()` 扣银行金币并重渲染。
- 验证：银行 1500 → 买磁铁 1300 → 买复活 1050 → 买金币 750；磁铁实际时长 10.1s（9+1.2）；复活费用显示 40（原 50）；8+6 枚金币收集后金币数 17（1.25× 累加生效）；桌面 r50-upgrades.png、移动 r50-upgrades-mobile.png；bot 1600 tick → 1723 m / 15 转弯 / 183 金币；`npm run temple:build` 915 ms；console 0 error / 0 warning。

2026-10-23（第五十七轮）：加入原版宝石（gems）系统，HUD 右上板改成「SCORE + 金币 + 宝石」。
- 宝石拾取（src/main.js）：`createGemPickup(lane,pathDistance)` 用八面体（0xff5a7a 自发光）+ 粉色辉光 sprite，悬停旋转；`gemItems` 数组随开局/清场统一清理。
- 生成：`spawnWave()` 里每波 10% 概率在 distance+99 处生成（避开路口 ±26m），约 150-300m 一颗。
- 拾取：同车道 ±1.05m、非跳跃状态；`gems++`，写回 `charState.gems` 并立即 `saveCharState()`（跨局持久化），HUD `#gems` 同步，播放 bonusPickup + 粉色火花 + 提示「宝石 +1」。
- HUD：原「历史最佳」位置改为真实宝石数（原版右上板就是 SCORE + 金币 + 宝石）；历史最佳仍在结算面板显示；store 底部信息加「宝石 N」。
- 调试：`__templeDebug.spawnGem(lane,ahead)`；`render_game_to_text` 输出 `gems`。
- 验证：投宝石 → gems 0→3、HUD 同步；桌面 r51-desktop.png、移动 r51-mobile.png（右上 SCORE 280 / 金币 3 / 宝石 6）；bot 1600 tick → 1755 m / 15 转弯 / 183 金币 / 6 宝石；`npm run temple:build` 1.02 s；console 0 error / 0 warning。

2026-10-23（第五十八轮）：加入原版 OBJECTIVES（成就目标）系统。
- 从 `egUI_Buttons2x.png` 裁出 `word-objectives.png`（390×68 描金 "OBJECTIVES" 字样），主菜单 wordmark 行新增第 4 个入口。
- 目标系统（src/main.js）：
  - `OBJECTIVES` 表 5 条：累计奔跑 3000m（200 金币）、累计金币 400（150 金币）、最高倍率 ×4（1 宝石）、累计转弯 40 次（150 金币）、累计复活 2 次（2 宝石）；
  - 进度读取 `stats`（新增 `stats.revives`，复活时 +1 并保存）；
  - `charState.objectives` 记录已领取，随角色存档持久化；`claimObjective()` 校验完成后发放奖励（金币进银行 / 宝石进 HUD）并重渲染；
  - 新增 `panelObjectivesHTML()`：原版 OBJECTIVES 标题 + 每行名称/说明/进度条/当前数值/奖励图标 + 「领取 / 已领取 / 百分比」；`renderPanel` 支持 objectives 面板与 claim 监听。
- 验证：`/tmp` 里把统计刷到接近目标 → 面板显示 2600/3000、360/400、×4 可领取；领取宝石目标 gems 6→7；全部完成后领完 5 条 → bank +500、gems +2、claimed=5 且持久化；桌面 r52-objectives.png / r52-objectives2.png，移动 r52-mobile-menu2.png / r52-mobile-objectives2.png；bot 1600 tick → 1733 m / 15 转弯 / 196 金币 / 12 宝石；`npm run temple:build` 911 ms；console 0 error / 0 warning。

2026-10-23（第五十九轮）：宝石成为硬通货（宝石复活 + 宝石限定角色）。
- 宝石复活（src/main.js）：
  - 新增 `revivePayment()`：金币足够 → 付金币；否则宝石 ≥1 → 付 1 宝石（金币不足时自动切换）；
  - `updateReviveButton()` 根据支付方式切换按钮文案「金币复活 / 宝石复活」、费用「50 / ◆ 1」与提示文案（剩余宝石数）；
  - `revive()` 按支付类型扣金币或宝石（宝石同步 `charState.gems` + 存档 + HUD）。
- 宝石限定角色：
  - `CHARS` 中 `ghost`（血鬼）改为 `gemPrice:2`、`skeleton`（骷髅）改为 `gemPrice:3`，说明加「宝石限定」；
  - 商店行渲染宝石价格按钮（宝石图标+数量，宝石不足灰显）；`buyChar()` 支持用宝石购买并扣减持久化。
- 验证：宝石 6 时买骷髅 → gems 6→3、owned/equipped 正确；0 金币死亡 → 按钮显示「宝石复活 ◆ 1」提示“金币不足 · 消耗 1 宝石复活（剩余 3 宝石）”，点击后 gems 3→2、state 变回 playing；桌面 r53-desktop.png，移动 r53-mobile-store.png；bot 1600 tick → 1718 m / 15 转弯 / 190 金币 / 5 宝石；`npm run temple:build` 1.10 s；console 0 error / 0 warning。

2026-10-23（第六十轮）：商店拆分为原版 SHOP / UPGRADES 分页。
- 使用上一轮裁出的 `word-shop.png`（279×130 描金 SHOP）+ `word-upgrades.png`，在 STORE 面板标题下方加两个图片 tab。
- src/main.js：`let storeTab='shop'`；`panelStoreHTML()` 顶部渲染 `.store-tabs`（`data-tab` 按钮，当前页高亮/下划线），正文按 tab 渲染角色列表或升级列表，底部提示随 tab 切换；`renderPanel('store')` 注册 tab 点击 → 切换并重渲染。
- 金币袋按钮打开商店时重置到 SHOP 页（`storeTab='shop'`），避免停留在上次的升级页。
- 验证：SHOP 页只有 `data-buy` 角色按钮，切到 UPGRADES 后只有 `data-up` 升级按钮、tab 高亮正确；桌面 r54-shop.png / r54-upgrades.png，移动 r54-mobile-upgrades.png；bot 1600 tick → 1723 m / 15 转弯 / 183 金币 / 8 宝石；`npm run temple:build` 915 ms；console 0 error / 0 warning。

2026-10-23（第六十一轮）：原版「NICE JOB!」里程碑横幅。
- 从 `InterfaceTexture2x.png` 裁出 `nicejob.png`（239×58，原版 "NICE JOB!" 描边字，清除底部杂物与旁边 "m"）。
- index.html 新增 `.milestone` 覆盖层：原版 NICE JOB! 图 + 金色里程数字（`#milestoneText`）。
- src/main.js：`showMilestone(m)` 在每 500m 触发（`Math.floor(distance/500)*500 > lastMilestone`），弹出动画 1.8s 后自动隐藏，播放原版 `best`（woohooFemale）音效；`reset()` 清零并隐藏。
- CSS：置于屏幕 43% 处（避开转弯曲 hint 与 HUD），`nj-pop`/`nj-fade` 弹性动画，pointer-events:none。
- 另外评估并回退了原版 `pit-long-a.obj` 坑洞网格：其坑道在实心路面以下、无法在不切割路面的情况下露出，坑洞仍用程序化绘制（已在代码注释说明原因）。
- 验证：500m 时横幅显示「NICE JOB! 500 m」（桌面 r55-milestone5.png、移动 r55-milestone-mobile.png），2.2s 后自动隐藏；bot 1600 tick → 1733 m / 15 转弯 / 196 金币 / 11 宝石；`npm run temple:build` 992 ms；console 0 error / 0 warning。

2026-10-23（第六十二轮）：原版 HIGH SCORE! 里程碑 + TRY AGAIN! 结算按钮。
- 从 `InterfaceTexture2x.png` 裁出：
  - `highscore.png` 291×53（原版 "High Score!" 描边字，用奶油色像素定位下边界清除了下方石条）
  - `tryagain.png` 294×57（原版 "Try Again!"，裁到 "!" 前避免带入右侧翅膀/绿框，并清除橙色翅膀像素与底部石条）
- 里程碑升级（src/main.js）：500m 用 `nicejob.png` + 1.8s；≥1000m 改用 `highscore.png` + 2.1s，数字显示当前千位里程（如 "1,000 m"）。
- 结算面板：`#restartBtn` 改为原版 TRY AGAIN! 图 + 小字「再跑一次」+ 箭头（沿用金色按钮底板），布局与主菜单 PLAY 按钮一致。
- 验证：1000m 触发 "High Score! 1,000 m"（r56-highscore.png）；结算面板按钮为 TRY AGAIN!（桌面 r56-tryagain2.png、移动 r56-mobile-end.png）；bot 1600 tick → 1718 m / 15 转弯 / 195 金币 / 14 宝石；`npm run temple:build` 947 ms；console 0 error / 0 warning。

2026-10-23（第六十三轮）：原版翅膀复活图标 + 复活反馈。
- 从 `InterfaceTexture2x.png` 裁出 `wings.png`（143×75，原版橙色翅膀，用亮黄底键控抠掉底板与内阴影）。
- 结算面板复活按钮改为：翅膀图标 + 「金币复活/宝石复活」标签 + 右侧费用胶囊；修复了 `.primary span{float:right}` 导致标签与费用顺序错乱的排版问题（`#reviveLabel` 取消浮动）。
- 复活标签改用 `#reviveLabel` 元素精确控制（原先依赖首个子文本节点，插入 img 后会失效）。
- 复活成功时新增金色/白色火花迸发（3 组 spark）并把提示文案改为「复活成功！短暂无敌」。
- 验证：宝石复活宝石 14→13、状态恢复 playing、按钮排版正确（r57-revive2.png、移动 r57-mobile-revive.png）；bot 1600 tick → 1701 m / 15 转弯 / 198 金币 / 16 宝石；`npm run temple:build` 958 ms；console 0 error / 0 warning。

2026-10-23（第六十四轮）：整体色调整体调暖，贴近原版白天阳光下的金褐色石头。
- 灯光/曝光（src/main.js）：
  - `toneMappingExposure` 1.46 → 1.50；太阳光 `0xffe6b0` 强度 3.05 → 3.6；半球光 `0xb4d6c4/0x4a3f2a` 强度 1.9 → 2.15；
  - `FogExp2` 密度 0.014 → 0.0115（远景更透亮）；
- 材质：
  - 路面 `roadTileMat` color 0xfff0d8 + emissive 0x3a2c15×0.5（金色石板更暖）；
  - 走廊立面 `facadeMat` color 0xffe9cc + emissive 0x1e170c×0.25（暖棕石墙）；
  - 路口铺地 `junctionPavingMat` color 0xd9c8a6（不再发白）；
  - 丛林树/岩石 `treeMat` color 0x6b5638（远景树更暗，白色树皮区域不再刺眼）。
- 验证：走廊/路口/移动端截图 r58-desktop.png、r58-turn5.png、r58-mobile2.png；bot 1600 tick → 1701 m / 15 转弯 / 183 金币 / 19 宝石；`npm run temple:build` 1.17 s；console 0 error / 0 warning。

2026-10-23（第六十五轮）：修掉转弯处左侧发白的“平板”伪影，并区分远景植被材质。
- 根因：路口/走廊上的原版 gateway 拱门（`gateMat`）在近处露出大面，浅色材质在强日照下过曝成奶白色平板。
  → `gateMat` color 0xe8dcc2 → 0x8f7a56，emissiveIntensity .4 → .18（转角处平板消失）。
- 此外：
  - 远景树 `treeMat` 改为无贴图深色剪影（0x141c10）——原版树皮 UV 会采样到白色图集区域，导致树身发白；
  - 岩石单独使用 `rockMat`（treeTexture + 0x443724）与树区分；
  - 灌木球改用带叶纹的 `mats.leaf/darkLeaf`（不再共用树的纯色材质）；
  - 路口铺地 `junctionPavingMat` 0xd9c8a6 → 0xb59c76。
- 验证：转弯帧 r59-turn5.png（左侧平板消失）、走廊 r59-gateway.png、移动端 r59-mobile.png；bot 1600 tick → 1701 m / 15 转弯 / 203 金币 / 22 宝石；`npm run temple:build` 1.00 s；console 0 error / 0 warning。

2026-10-23（第六十六轮）：角色落地阴影可见化 + 拱门石色回中。
- 排查发现：旧的角色阴影（CircleGeometry 半径 0.62 @ y=0.015）实际被路面/材质关系吞掉，玩家脚下一直没有影子。
- 重做 `shadow`：改为 3 层同心圆（半径 1.05/0.78/0.5，透明度 .16/.26/.44，深色 0x0b0f09，`depthWrite:false`、`renderOrder:2`），整体放在 y=0.09（高于铺地），新增 `setShadowAlpha(k)` 统一控制透明度；
  - 跳跃时影子随高度缩小变淡：`setShadowAlpha(1-min(jumpY,2)*.18)`、`scale=1+jumpY*.18`；
  - 复活/死亡流程沿用 `setShadowAlpha(...)`（死亡淡出、重置恢复）。
- 期间验证过 CanvasTexture 径向渐变方案在渲染中不可见（贴图 alpha 路径问题），已弃用并改为纯几何多层圆。
- `gateMat` 回调到中间石色 0x9c8760（上轮过暗）。
- 验证：桌面 r60-final3.png、移动 r60-mobile.png 可见脚下柔和阴影；bot 1600 tick → 1701 m / 15 转弯 / 196 金币 / 25 宝石；`npm run temple:build` 899 ms；console 0 error / 0 warning。

2026-10-23（第六十七轮）：追逐者行为/阴影打磨 + 软阴影分层。
- 开局异常：`reset()` 里 `chaseGap=4.8`，导致起跑瞬间追逐者（大蝙蝠）挤在镜头与玩家之间、贴在屏幕下方。改为 `chaseGap=11.5`（与常态阻尼目标一致）后开局画面干净，只有绊倒时才靠近。
- 追逐者动画：新增翅膀扑动——`enemy.rotation.z=sin(runTime*5.4)*.10`、`enemy.rotation.x=sin(runTime*4.1)*.06`。
- 追逐者地面阴影：`enemyShadow`（两层圆环 .62/.16、.42/.28）随敌人位置放置，仅在可见且 playing 时显示。
- 玩家影子改为 6 层同心圆（1.06→0.5，透明度 .05→.20 累加），消除之前 3 层方案可见的“环带”边缘，得到柔和椭圆阴影。
- 验证：开局 r61-start2.png（无蝙蝠）、绊倒 r61-stumble2.png（蝙蝠扑来+提示）、影子 r61-shadow2.png、移动端 r61-mobile.png；bot 1600 tick → 1701 m / 15 转弯 / 207 金币 / 28 宝石；`npm run temple:build` 1.27 s；console 0 error / 0 warning。

2026-10-23（第六十八轮）：火把动态点光源（暖光池）。
- src/main.js：新增 3 个 `PointLight(0xff9a3c, 0, 11, 2)` 组成的灯光池 `torchLights`，每隔 8 帧从全局 `flames` 里按与玩家的 z 距离挑选最近的火焰（每 2 个取 1，左右分布），把灯放到火焰位置 `(x, 2.35, z)`；
- 每帧按 `1.55 + sin(runTime*11 + i*2.3)*.3` 做火焰闪烁；菜单/结算等非 playing 状态强度为 0；
- 效果：路面与墙面出现随火把移动的暖橙色光斑，增强遗迹火把氛围（强度经过两轮调节，避免被误认为金币）。
- 验证：桌面 r62-torches3.png、移动 r62-mobile.png；点光源状态检查（示例 x=-3.9, y=2.4, z=-20.7 / -15.3 / -27.3）；bot 1600 tick → 1701 m / 15 转弯 / 195 金币 / 31 宝石；`npm run temple:build` 1.04 s；console 0 error / 0 warning。

2026-10-23（第六十九轮）：路口改成「神庙广场」铺装（不再悬在丛林上）。
- buildJunction 新增广场底盘：
  - `12×12` 铺装平面（`junctionPavingAtlas` 克隆，repeat 按 12m 缩放）放在 `(0,-0.06,-2)`，读作神庙广场地面；
  - 四角新增石质界桩（方形基座 + 圆柱），材质 `0x6f6147` + `obstacleStoneAtlas`（避免过曝发白）；覆盖转角时原本裸露的丛林地面/白色高光。
- 保留原有 5×5 转角 pad、双象限铺装、牌坊/墙体收口与金色 3D 箭头。
- 验证：转弯帧 r63-turn4.png、俯视 r63-junction-top.png、移动端 r63-mobile-turn.png；bot 1600 tick → 1733 m / 15 转弯 / 208 金币 / 36 宝石；`npm run temple:build` 1.18 s；console 0 error / 0 warning。
- 遗留：移动端画面最左侧偶见一块浅色方块（广场/界桩边缘），下次可定位并修掉。

2026-10-23（第七十轮）：广场角火把 + 关闭「左侧浅色方块」遗留问题。
- buildJunction 的广场四角界桩顶部新增火把（`createTorch`），并注册到全局 `flames`，让第 68 轮加入的点光源池也能照亮广场；
  - 新增 `junctionFlames` 数组：每次重建路口前把旧火把从 `flames` 移除，避免 15+ 次转弯后火焰数组/网格泄漏（实测整局结束 cone 数量稳定在 67）。
- 「移动端左侧浅色方块」定位结论：不是 bug，是广场铺装 (`junctionPavingMat` 12×12 apron) 在转弯时被阳光照亮后出现在画面左缘，取样颜色约 (175,165,128)；已在该轮说明里记录。
- 验证：桌面 r64-torch-desktop.png、移动端 r64-mobile-turn.png（广场火把可见）；bot 1600 tick → 1701 m / 15 转弯 / 196 金币 / 39 宝石；`npm run temple:build` 1.15 s；console 0 error / 0 warning。

2026-10-23（第七十一轮）：火把火星粒子 + 点光源柔化。
- 火星粒子（src/main.js）：
  - 新增 `spawnEmber(pos)`：复用 `sparks` 队列的 `ember` 分支（上升速度恒定、无重力、透明度按寿命衰减、大小 .16-.34、加色混合）；
  - 每 10 帧在点光源池选中的最近火把位置生成火星，火星缓慢上升并轻微水平漂移；
  - debug 新增 `__templeDebug.embers(n)` 便于截图验证（已用 r65-embers2.png 确认火星可见）。
- 点光源柔化：`PointLight` distance 11→15、强度 1.55→1.05（±0.22 闪烁）、灯位高度 2.35→2.95，避免近处石面被打爆成纯白。
- 色调微调：`mats.edge` 0xb7a98a→0x9d8f74、exposure 1.5→1.44、太阳 3.35→3.15、立面 emissive 提高到 0.6（减少 DoubleSide 背面死黑）。
- 验证：火星可见 r65-embers2.png；正常跑 r65-final3.png、移动端 r65-mobile.png；bot 1600 tick → 1701 m / 15 转弯 / 198 金币 / 42 宝石；`npm run temple:build` 904 ms；console 0 error / 0 warning。
- 遗留：约 30-32m 处左侧墙偶尔出现一条浅色竖条（疑似两段立面之间露出背景/未点亮面），下轮可继续定位。

2026-10-23（第七十二轮）：丛林萤火虫 + 远景树剪影提亮。
- 萤火虫（src/main.js）：`fireflies` 16 个绿色发光精灵（`0xa8ff6e`、非加色、opacity .8、大小 .5-.85），沿走廊两侧 |x| 3.2-5.4、高度 1.1-3.7 漂移；
  - `updateFireflies(dt)` 每帧做正弦上下浮动 + 左右摆动 + 明暗闪烁；超出玩家 z 范围（前 4m / 后 85m）时重置到前方 4-34m 处；
  - 验证截图 r66-fireflies4.png 可见左侧数颗绿色光点。
- 远景树剪影：`treeMat` 0x141c10 → 0x26331f + emissive 0x0d1409×0.6，丛林轮廓不再死黑。
- 顺带确认「30-32m 左侧浅色竖条」为放大后的正常镜头效果（阳光墙 + 树/灌木剪影），并非渲染缺口。
- 验证：bot 1600 tick → 1733 m / 15 转弯 / 196 金币 / 45 宝石；`npm run temple:build` 956 ms；console 0 error / 0 warning；桌面 r66-fireflies4.png、移动端 r66-mobile.png。

2026-10-23（第七十三轮）：移动端手势/滚动防护 + 滑动操作回归验证。
- 移动端防误滚（index.html + style.css）：
  - viewport 增加 `maximum-scale=1,user-scalable=no`（防双指缩放）；
  - `html,body{overscroll-behavior:none;touch-action:manipulation;user-select:none}`、`body{position:fixed;inset:0;overflow:hidden}`、`.app{height:100dvh}`，避免 iOS 橡皮筋/下拉刷新/滑动选中文字；
- 滑动操作验证（PointerEvent 模拟，桌面可跑）：
  - 左滑 → lane 0、右滑 → lane 1；
  - 上滑后 160ms `jumpY=1.07`、下滑后 `sliding=0.83`；
  - 方向键 / 屏幕按钮 / 滑动三套输入都正常。
- 验证：移动端 r67-mobile.png、桌面 r67-menu.png、r67-desktop.png 布局无回归；`body.position=fixed`、`overscrollBehavior=none`、`innerHeight=844`；bot 1600 tick → 1701 m / 15 转弯 / 190 金币 / 48 宝石；`npm run temple:build` 947 ms；console 0 error / 0 warning。

2026-10-23（第七十四轮）：横屏提示（竖屏专用）。
- index.html 新增 `.rotate-hint` 覆盖层（旋转图标 + 「请竖屏游玩 / ROTATE YOUR DEVICE」）；
- style.css：默认 `display:none`，在 `(orientation:landscape) and (max-height:560px) and (max-width:1000px)` 时 `display:grid`，全屏 z-index 99；
- main.js：`matchMedia` 监听屏幕方向，横屏且游戏中时自动 `pause()`，并同步 `aria-hidden`；竖屏恢复后覆盖层隐藏（保持暂停，玩家手动继续）。
- 验证：844×390 横屏 → 覆盖层 grid + state paused + 暂停面板可见；切回 390×844 → 覆盖层 none、state 仍 paused（可继续）；竖屏游戏画面截图 r68-mobile.png；bot 1600 tick → 1733 m / 15 转弯 / 196 金币 / 51 宝石；`npm run temple:build` 920 ms；console 0 error / 0 warning。

2026-10-23（第七十五轮）：原版道具图标接入 HUD + 激活提示。
- 新增 `POWER_ICON` 映射（magnet→coin.png、bonus→pw-bonus.png、boost→pw-boost.png、shield→pw-wings.png）与 `POWER_TITLE` 文案；
- HUD 力量徽章（#powerBadge）由纯文字改为「原版图标 + 剩余时间」，边框/辉光颜色仍按道具色；
- 新增 `.power-toast` 激活提示（原版图标 + 「磁铁激活！/金币加成！/加速冲刺！/护盾开启！」），1.5s 后自动隐藏，带弹入动画；
- 移除 activatePower 里重复的 setHint 文案（避免 toast 与 hint 同时出现）。
- 验证：四种道具图标/文案全部正确（magnet coin.png + 磁铁 10s / bonus pw-bonus + 金币加成 10s / boost pw-boost + 加速 5s / shield pw-wings + 护盾·就绪）；桌面 r69-power.png、r69-shield.png，移动端 r69-mobile.png（金币加成 toast + 徽章）；bot 1600 tick → 1701 m / 15 转弯 / 190 金币 / 54 宝石；`npm run temple:build` 985 ms；console 0 error / 0 warning。

2026-10-23（第七十六轮）：结算页加入原版羊皮卷按钮（商店 / 目标）。
- 从 `EndGameButtons_new.png` 裁出两个原版羊皮卷按钮：
  - `scroll-store.png`（购物车，243×294）
  - `scroll-objectives.png`（宝石堆，241×294）
- 结算卡片新增 `.end-rail`：两个 86px（移动 70px）的羊皮卷按钮，点击分别打开 STORE / OBJECTIVES 面板；
  - `openPanel` 允许 `state==='ended'`，关闭面板后回到结算页（state 仍 ended）。
- 结算卡片压缩以适配新按钮：插画 max-height 104px、标题 34px、stats/复活/TRY AGAIN 间距收紧，保证「返回菜单」在框内。
- 验证：桌面 r70-end2.png、移动端 r70-end-mobile.png；点击购物车 → STORE（word-store.png）、点击宝石堆 → OBJECTIVES（word-objectives.png），关闭后回到结算页；bot 1600 tick → 1723 m / 15 转弯 / 196 金币 / 57 宝石；`npm run temple:build` 898 ms；console 0 error / 0 warning。

2026-10-23（第七十七轮）：商店角色头像换成原版 CharacterPortraits 立绘。
- 从 `CharacterPortraits_spritesheet.png`（512²，17 个头像）用连通域定位后裁出 9 张 128² 头像：
  - jhony（棕发跑者）、selene（宇航员）、scarlett（红发女探险家）、werewolf（南瓜头万圣节）、barry（灰帽老跑者）、karma（海盗女）、ghost（蓝绿幽灵）、conquistador（王冠贵族）、skeleton（白须老人）；
  - 全部接入 CHARS 的 `av` 字段，商店列表 9 个角色都显示原版头像（不再有 ◆ 兜底）。
- 修复宝石价格按钮双钻石：`.store-btn.buy::before` 的 "◆" 会叠加在宝石图标前，新增 `.store-btn.buy.gem::before{content:none}`。
- 验证：桌面 r71-store.png / r71-store4.png、移动端 r71-mobile-store.png；9 行头像与原版风格一致；bot 1600 tick → 1723 m / 15 转弯 / 196 金币 / 60 宝石；`npm run temple:build` 987 ms；console 0 error / 0 warning。

2026-10-23（第七十九轮）：跑步镜头呼吸感（bob + 换道侧倾）。
- src/main.js 相机块：
  - 新增 `camLane` 状态，`camLane+=(laneX-camLane)*min(1,dt*7)`；
  - 落地时相机 y 叠加 `sin(runTime*10.4)*.05 + sin(runTime*20.8)*.018` 的跑步起伏（跳跃时自动取消）；
  - `camera.lookAt(...)` 之后追加 `camera.rotateZ((laneX-camLane)*.032)`，换道时轻微侧倾（注意必须在 lookAt 之后，否则被 lookAt 重置）。
- 验证：静止时相机 y 在 5.238–5.283 间波动；按左键换道后 rollZ 从 -0.011 平滑回 0；桌面 r73-desktop.png、移动端 r73-mobile.png；bot 1600 tick → 1701 m / 15 转弯 / 190 金币 / 66 宝石；`npm run temple:build` 922 ms；console 0 error / 0 warning。

2026-10-23（第八十轮）：转弯震动 + 广场接缝填补。
- 镜头震动（src/main.js）：新增 `shakeAmp`，`completeTurn()` 时 `shakeAmp=Math.max(shakeAmp,.16)`、跳跃落地时 `.07`；相机块里在 `lookAt` 之后叠加 `sin/cos(runTime*57/49)*shakeAmp` 并每帧衰减 `shakeAmp-=dt*1.7`。实测过弯时相机 x 由 0 → -0.10 → 0.06 → 0 平滑衰减。
- 广场 apron 从 12×12 @ z=-2 扩大为 **14×14 @ z=-1**（repeat 按 14m 重算），填掉入弯路面尽头到广场之间的黑色缝隙（此前俯视/转弯帧能看到丛林地面漏出）。
- 验证：桌面 r74-turn-fix.png、移动端 r74-mobile2.png（广场铺装连续、无黑洞）；bot 1600 tick → 1749 m / 15 转弯 / 183 金币 / 72 宝石；`npm run temple:build` 942 ms；console 0 error / 0 warning。

2026-10-23（第八十一轮）：过弯 FOV 冲击 + 落地扬尘验证。
- 过弯 FOV：新增 `turnKick`，`completeTurn()` 置 1，`targetFov` 加 `turnKick*6`，每帧衰减 `dt*2.2`；实测过弯瞬间 fov 65 → 72 再回落（有速度感）。
- 落地扬尘：确认跳跃落地时 `dustPuff(...,9,.85)` 用的是原版 EffectsTexture2x 的 `fx-dust.png`（第 72 轮接入），截图为脚边柔和的土黄色烟尘团，不再是之前的六边形径向光斑。
- 回退实验：曾尝试在广场两侧放原版 `stone-pedestal` 石雕（scale .42），俯视看会形成暗色方块且与墙体穿插，已回退并保留原本的铺装 + 界桩 + 火把方案。
- 验证：过弯 fov 序列 [65,65,65,65,65,65,65,65,69,71,71.9,72]、落地烟尘 r75-landing.png、广场干净 r75-final.png、移动端 r75-mobile.png；bot 1600 tick → 1723 m / 15 转弯 / 211 金币 / 75 宝石；`npm run temple:build` 913 ms；console 0 error / 0 warning。

2026-10-23（第八十二轮）：撞击碎片 + 道具拾取粒子爆发。
- 撞击（绊倒）反馈：`stumbleOrCatch()` 现在叠加
  - 三组原版粒子：石屑（fx-dust 灰黄 14 粒）、火星（fx-ember 橙 9 粒）、闪光（fx-spark 10 粒）；
  - 相机震动 `shakeAmp=max(.14)`；
  - 原有 impactFlash 全屏橙闪 + 追逐者拉近保持不变。
- 道具拾取：`pickups` 收集时在拾取位置爆发原版星爆（fx-spark 14 粒，道具色）+ 金色闪光（fx-sparkle 8 粒），之后再 `activatePower`。
- 验证：撞击帧 r76-impact.png（石屑/火星/灰尘可见）、拾取帧 r76-pickup2.png（boost 绿色星爆）、移动端 r76-mobile.png（撞击橙闪 + 碎石 + 追逐者扑近）；bot 1600 tick → 1739 m / 15 转弯 / 183 金币 / 78 宝石；`npm run temple:build` 921 ms；console 0 error / 0 warning。

2026-10-23（第八十三轮）：滑铲火星 + 速度感 FOV。
- 滑铲摩擦：`sliding>0` 时每 55ms 在身后 `pathAt(distance-.55)` 生成 1 粒 `fx-ember` 橙色火星（小尺寸 .22、短寿命 .45），配合原有每 110ms 的 `fx-dust` 扬尘，滑铲时地面有火星拖尾。
- 速度感：`targetFov` 追加 `Math.max(0,speed-RUN_SPEED_MIN)*.22`（12→22 速度对应 +0~2.2° FOV），随距离提速视野略微张开。
- 验证：37m 时 speed 12.74 → fov 65.2（公式生效）；滑铲帧 r77-slide2.png、移动端 r77-mobile.png（火星拖尾 + 扬尘）；bot 1600 tick → 1718 m / 15 转弯 / 188 金币 / 81 宝石；`npm run temple:build` 940 ms；console 0 error / 0 warning。

2026-10-23（第八十四轮）：跳跃输入缓冲（手感）。
- src/main.js：新增 `jumpBuffer`。jump() 在空中按下时写入 `.16s` 缓冲；update 中若缓冲未过期且已落地（jumpY<=.02 && jumpV<=0）则立即起跳（播放 jump 音效），实现「落地紧跟下一跳」的输入缓冲，避免连跳丢失。
- 验证：连按两次跳跃（第二次在空中）后两段跳跃顶点均为 1.60（第二跳在落地帧立即触发）；空中帧 r78-jump.png、移动端 r78-mobile.png；bot 1600 tick → 1704 m / 15 转弯 / 202 金币 / 84 宝石；`npm run temple:build` 991 ms；console 0 error / 0 warning。

2026-10-23（第八十五轮）：滑铲落地缓冲 + 失焦自动暂停。
- 滑铲输入缓冲（src/main.js）：空中按下滑铲时 `jumpV=-8` 快速下落，同时写入 `slideBuffer=.24s`；落地帧若缓冲未过期则自动进入滑铲（`sliding=.95` + slide 音效），贴合「空中下压→落地滑铲」的原版操作。
- 失焦暂停：新增 `window.addEventListener('blur', ()=>{if(state==='playing')pause()})`，切窗口/拖拽时不再白送一条命。
- 验证：空中下压后落地 `sliding=0.95`（自动滑铲）；blur 事件后 state playing→paused、暂停面板可见；滑铲落地帧 r79-slide-land.png、移动端 r79-mobile.png；bot 1600 tick → 1739 m / 15 转弯 / 198 金币 / 87 宝石；`npm run temple:build` 1.00 s；console 0 error / 0 warning。

2026-10-23（第八十六轮）：强化路口 3D 金色箭头指引。
- 实验（已回退）：尝试在转弯前路面上绘制「贴地金色箭头」（先 junction 局部坐标、后 scene 级 turnGuide 组，混用 cone 压扁与 canvas 箭头贴图），运行中均几乎不可见（贴地被路面/朝向/材质面剔除），已全部回退，代码恢复干净。
- 保留并强化原有 3D 箭头（`junction.userData.arrow`）：
  - 脉冲改为基础 1.28 倍 + ±9%（原 1±5%），位置 y .28→.38，光晕 2.6→3.6；
  - 现在 11m 外即可清楚看到大号金色箭头指向转弯方向（配合 HUD 转弯胶囊 + 地砖 chevrons）。
- 验证：桌面 r80-arrow.png、移动端 r80-mobile.png（大箭头清晰可见）；bot 1600 tick → 1701 m / 15 转弯 / 202 金币 / 90 宝石；`npm run temple:build` 1.01 s；console 0 error / 0 warning。

2026-10-23（第八十七轮）：整局视觉巡检 + 树冠底面提亮。
- 巡检：用脚本 bot 依次冻结在 120m / 300m / 620m 截图（r81-audit120/300/620.png），检查远处转弯、坑洞、树冠、追逐者、HUD。未发现穿模/浮空等硬 bug。
- 发现问题：树冠球体底面在背光时几乎纯黑，在 300m 附近形成一块「黑色矩形」观感。
- 修复：给 `mats.leaf` / `mats.darkLeaf` 增加低强度自发光（0x1c2e1a×.55 / 0x14241a×.6），树冠底面从死黑变为暗绿，远处树冠层次更自然。
- 验证：620m 巡检帧 r81-audit620.png（树冠明暗正常、追逐者/金币/转弯都正常）、移动端 r81-mobile.png；bot 1600 tick → 1755 m / 15 转弯 / 183 金币 / 94 宝石；`npm run temple:build` 970 ms；console 0 error / 0 warning。

2026-10-23（第八十八轮）：BGM 修复（用户反馈「我 bgm 呢？」）。
- 根因排查：
  1. 背景音乐只在 `state==='playing'` 时启动，**主菜单一直静音**（原版主菜单是有主题曲的）；
  2. 顶部 ♫ 按钮只应静音音效，但 `sfx.setMuted()` 会连带 `music.el.pause()`，而 `startMusic()` 又以 `muted` 为前置条件 → 一旦按过 ♫，BGM 就再也不响；
  3. 音量偏低（0.22）。
- 修复：
  - 菜单 BGM：首次任意 pointerdown/keydown 即 `unlockAudio()+startMusic('theme')`；`goMenu()` 改为回菜单继续播放主题曲（原为 stopMusic）；`applySettings()` 在 menu/playing/paused 状态下缺音乐就补启动；
  - 解耦：`startMusic`/`resumeMusic` 不再受 SFX mute 影响，`setMuted` 不再暂停音乐（音乐只由 Options → 音乐开关控制）；
  - 音量 `musicVolume 0.22 → 0.32`，环境音 loop gain `.7 → .42` 避免盖过 BGM。
- 验证：菜单首击后 musicInfo = {current:'theme', paused:false, volume:.32, duration:61.1}；游戏中持续播放；关音乐开关 → current null；开 → 重新淡入；按 ♫ 静音音效后 BGM 仍在播放；死亡静音、重开后恢复；bot 1600 tick → 1771 m / 15 转弯；`npm run temple:build` 994 ms；console 0 error / 0 warning。
  （注：浏览器 autoplay 策略要求先有一次点击/触摸，页面加载后点一下任意处即开始播放。）

2026-10-23（第八十九轮）：BGM 回归验证 + 音频覆盖审计 + 首次点击提示。
- 音频覆盖审计：脚本触发 开始/跳跃/滑铲/换道/转弯/金币/道具/绊倒/死亡，统计 `sfx.playedCounts` 差值，确认 click、footstep、jump、coin、whoosh、slide、land、swish、magnet、stumble、splat 均在对应事件触发（gameOver/best 在 finishDeath 的 1.25s 后触发，时序原因未落在统计窗口内）。
- 菜单新增 `.audio-hint`（♪ 点击任意处开启原版音乐）：首次 pointerdown/keydown 时隐藏；Options 关闭音乐或音乐已在播放时不显示（applySettings 统一同步）。
- 验证：菜单/游戏中 musicInfo.current = theme 且持续播放；bot 1600 tick → 1704 m / 15 转弯 / 190 金币 / 100 宝石；`npm run temple:build` 1.08 s；console 0 error / 0 warning。

2026-10-23（第九十轮）：金币统计（累计/持有/已花费）可见化。
- 菜单底部新增 `.menu-coins`：「持有 X 金币 · 累计收集 Y」，在启动、回菜单、结算提交后刷新（`updateMenuCoins()`）。
- STATS 面板（菜单 → Stats）新增三行：累计收集金币（`stats.totalCoins`，只统计路上吃到的）、当前持有金币（`charState.bank`，含任务奖励）、已花费金币（新增 `stats.coinsSpent`，角色/升级/金币复活时累加）。
- 结算面板在结果四宫格下新增一行「累计收集金币 N」（含本局）。
- 验证：菜单显示「持有 1575 金币 · 累计收集 1068」；Stats 行 = 1068/1575/0；买一次磁铁升级（400）后 spent=400、bank=1175、面板同步；结算面板显示累计收集金币行；`npm run temple:build` 通过；console 0 error。

2026-10-23（第九十一轮）：暂停面板本局数据 + 静音按钮视觉。
- 暂停卡新增 `.pause-stats` 三列：本局距离 / 本局金币 / 当前倍率（`pause()` 时写入 #pauseDistance/#pauseCoins/#pauseMulti）。
- 顶部 ♫ 按钮改进：统一显示 "♪"，静音时加 `.muted` 类（变暗 + 斜杠划掉），不再用 "♪̸" 这种易乱码字符；`aria-label` 同步「开启声音/关闭声音」。
- 验证：暂停卡显示 18 m / 2 金币 / ×1（桌面 r85-pause.png、移动 r85-mobile-pause.png）；静音后按钮显示斜杠（r85-muted3.png）；音乐仍由 Options → 音乐独立控制（♫ 只影响音效）；bot 1600 tick → 1701 m / 15 转弯；`npm run temple:build` 947 ms；console 0 error / 0 warning。

2026-10-23（第九十二轮）：逆向原版转弯/地图生成 + 转弯手感与地图变化落地。
- 逆向（APK 是 IL2CPP）：从 `/tmp/temple-xapk-inner/com.imangi.templerun.apk` 抽出 `assets/bin/Data/Managed/Metadata/global-metadata.dat`（7.96MB）与 `config.arm64_v8a.apk` 里的 `lib/arm64-v8a/libil2cpp.so`（44MB）到 /tmp/temple-il2cpp/；无 dotnet 环境，改用 Python 从 metadata 提取 ASCII 字符串，得到原版路径 API：AddSegment / AddRandomPath / AddFollowingPathNode / AddTutorialPath / CanPathExtendOnSide / CanPathExtendOnSide2 / CanTurnLeft / CanTurnRight / DistanceToTurnSection(End) / DistanceTraveledSinceLastTurnSection / DoesSidePathHaveObstacles/Coins / BuildMapCreator / AllowTiltToTurn / CoinSpawn(Config) / DoubleTrack / Curve / Corner 等 —— 说明原版是「节点图 + 线段 + 转弯段 + 随机延伸 + 地图构建器」的结构。
- 转弯实现（src/main.js）：新增 `TURN_ARC=3.6` 与 `normAngle`；`pathAt(distance,side,smooth)` 在 smooth 模式下把直角转成缓动圆弧；`placeOnPath(group,distance,side,smooth)`；玩家/追逐者/阴影/相机走 smooth，地面瓦片保持直线拼接。转弯相机改为「沿圆弧路面前进 + 始终看向跑者（带少量前瞻）」，并修正：转弯期间 move() 不再提前 return，允许换道（此前 42m 转弯窗口内无法换道导致撞障碍）。
- 地图生成：`pickNextTurnLength()` —— 30% 短段 24-36m（S/U 连续弯）、44% 60-96m、26% 长直 132-204m；`completeTurn` 按 12m 瓦片对齐并记录 `nextTurnLen`；短距离后接弯 60% 反向（S 弯）/ 40% 同向（U 弯），用 `turnDirectionForced` 覆盖随机方向。转角刷怪保护：`|base-nextTurn|<26`、`|base+8-nextTurn|<26`、`base-lastTurnDistance<22` 跳过；金币在转角前 20m 内不刷。
- 验证：bot 3000 tick → 1656m / 18 转弯，转弯点 [249,345,429,465,561,765,789,861,897,933,969,1065,1197,1233,1293,1473,1629,1689]（含 24/36m 连续弯与 204m 长直）；转弯帧 r86-final-desktop.png / r86-final-mobile.png（相机跟弯、跑者居中、低矮废墟墙与火把无遮挡）；`npm run temple:build` 981ms；console 0 error / 0 warning。

2026-10-23（第九十三轮）：角色性别配音 + 去掉乌鸦叫（丛林环境音层）。
- 配音：原版 AudioClip 本身有男女两套（gruntJump/gruntJumpFemale、gruntJumpLand…、gruntTrip…、splat…、scream…、woohoo…）。sfx.js 补齐 male/female 两套 clip（jump/jumpF、land/landF、stumble/stumbleF、splat/splatF、scream/screamF、best/bestF），main.js 新增 `voiceGender` + `vkey(k)`，所有跳跃/落地/绊倒/死亡/欢呼按当前角色性别选 clip：
  - 男：Jhony、Barry Bones、万圣狼人、征服者、骷髅
  - 女：Selene、Scarlett、Karma Lee、血鬼
- 角色性别写入 CHARS 的 `g` 字段；`reset()` 与 `equipChar()` 时同步 `voiceGender=charGender()`。
- 乌鸦叫：定位为一直叠加播放的丛林环境层 `monkeys.wav`（gain .42、loop，连主菜单都在放），已从 CLIPS 与 main.js 移除，改为只有 BGM。对 BackgroundMusic.mp3（61s）做频谱分析：无高频周期性鸟叫突发，说明「乌鸦叫」来自环境层而非音乐本身。
- 验证：Jhony 跑动 jumpM=21 / landM=20，Selene 跳跃 jumpF=5、死亡 splatF=1，男女不混用；全程 ambience 播放次数 0；主题曲正常；bot 1600 tick → 1656m / 18 转弯；`npm run temple:build` 988ms；console 0 error / 0 warning。

2026-10-23（第九十四轮）：首页局域网二维码 + 石墩障碍实体化。
- 局域网访问：
  - `target/temple-run/vite.config.js` 加 `server: { host: '0.0.0.0' }`，dev server 现在同时监听 `http://172.23.204.81:5173/`；
  - 桌面端右侧面板新增 `.qr-card`：`assets/ui/qr-lan.png` 二维码 + 「手机扫码 · 局域网直接玩」+ URL 文本；手机端（≤850px）及已通过局域网打开时自动隐藏；
  - 新增 `target/temple-run/tools/gen-lan-qr.py`：自动探测本机 LAN IP、重新生成 PNG 并同步 `index.html` 里的 URL 文本（用法 `python3 target/temple-run/tools/gen-lan-qr.py 5173`，依赖 `pip3 install qrcode pillow`）；
  - 二维码已用 jsQR 解码验证：`http://172.23.204.81:5173/`。
- 建模：lane blocker（block 障碍）不再用 APK 的 `stone-pedestal` 2.5D 舞台立面（近距离会出现深色锯齿碎片），改为实体几何：圆角石墩 + 顶盖 + 金边 + 苔藓条 + 四角底脚；并修正 block 也被 `.62` 缩放导致过矮的问题（现在胸高）。
- 验证：QR 解码正确、桌面/手机布局正常、LAN 页面 200 且无 console 错误；block 碰撞正常（stumble=7.5 + 提示「绊倒了」）；bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 1.01 s；console 0 error / 0 warning。

2026-10-23（第九十五轮）：滑铲/跳跃判定与树桩、树枝路障重做。
- 定位：原来的「树墩子」= hurdle 用的 APK `tree-jump-left/right` 预制件，它其实是整棵 2.5D 树，近看会有一大团深色枝叶盖住走廊 → 看着像「奇怪的树枝路障」，也让人误以为能滑过去（实际该跳）。
- 重做障碍（src/main.js，全部程序化 bark 几何）：
  - hurdle（倒木/树桩）：横跨路面的粗树干 + 两根断裂树桩 + 根部锥体 + 苔藓条，语义「跳过」；
  - arch（低树枝）：两根木桩 + 横梁 + 下垂细枝 + 苔藓，语义「滑铲」；
  - 两者都保留 actionCue：hurdle/fire → «↑ 跳过»，arch → «↓ 滑铲»。
- 判定窗口放宽/对齐：
  - justJump .32 → .42s，hurdle 允许 `jumpY>.45 || jumpV>.2`（原 .55/.4）；
  - justSlide .32 → .42s，arch 允许 `sliding>.03`（原 .05）；
  - 滑铲时长 .95 → 1.05s（约多滑 1.5m）。
- 判定矩阵实测（spawnObstacleIn + 按键，读 stumbleCooldown）：hurdle+↑ 通过(0)、arch+↓ 通过(0)、arch+不操作 撞(5.9)、hurdle+↓ 撞(5.9)。
- 验证：桌面 r90-hurdle3.png / r90-arch2.png、移动端 r90-mobile-arch.png；bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 1.20 s；console 0 error / 0 warning。

2026-10-23（第九十六轮）：两个用户反馈——「3D 模型糊在人物身上」与「角色应有不同声音」。
- 角色渲染排查（src/runnerRig.js、src/main.js）：
  - 角色材质原为 `DoubleSide`，奔跑时内侧面会透出轮廓 → 看起来像「糊在身上」；改为 `FrontSide`（导出时已修正绕序）。
  - 角色贴图增加 `anisotropy=8`；默认角色贴图 512→1024 Lanczos 放大，减轻近距离放大模糊。
  - 金币/宝石拾取判定提前（金币 0.85→1.2m、宝石 1.05→1.35m），拾取火花改为在头顶上方生成、金币光晕缩小（0.9→0.62 / 不透明度 .18→.14）——此前光晕正好糊在腰腹/腿上的问题消失。
- 角色声音差异化（src/main.js）：CHARS 增加 `p` 音高，`vplay()` 统一走 `voiceGender` 选男/女声后用 WebAudio `detune` 微调音色：
  - jhony 1.00、selene 1.04、scarlett 1.09、karma 1.02、werewolf 0.80（低沉）、ghost 0.93（幽怨）、barry 0.90、conquistador 0.95、skeleton 0.87（空洞）；所有跳跃/落地/绊倒/死亡/欢呼/新纪录语音都走该通道。
  - debug 钩子：`__templeDebug.voicePitch()/equipped()/giveChar()/equipChar()`；实测 5 个角色 pitch 依次 1 / 1.04 / .8 / .93 / .87。
- 新手教学改进（上轮遗留）：教学遮罩期间冻结跑动（`tutorialActive` 时跳过 update），点击/按任意键才开始；Options 新增「玩法教学 · 播放」按钮可重看。
- 验证：移动端/桌面截图（r92-mobile.png、r92-gameplay.png、r92-coins.png）角色轮廓干净、无光斑糊身；bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 1.22 s；console 0 error / 0 warning。

2026-10-23（第九十七轮）：移动手感与性能自适应。
- 点击跳跃：canvas 的 pointerup 手势在位移 <28px 时判定为「点按」→ 触发跳跃（原来直接 return，点一下没反应）；实测点击后 jumpY 0→1.16，与上滑跳跃等价。
- 自适应分辨率（src/main.js frame 循环）：以 90 帧为窗口统计平均帧时长——
  - 平均 <40fps 时把 `renderer.setPixelRatio(1)` 降级一次；
  - 连续 3 个窗口 >55fps 时恢复为 `min(devicePixelRatio,2)`，高刷设备不长期损失清晰度。
- 相机挂载的太阳眩光 Sprite 尝试后移除（受 fog/遮挡与叠加顺序影响基本不可见，收益低于复杂度）。
- 验证：点击跳跃 jumpY 1.16 / state playing；bot 1600 tick → 1656 m / 18 转弯 / 73 金币；`npm run temple:build` 957 ms；console 0 error / 0 warning；桌面 r93-final.png、移动端 r92-mobile.png。

2026-10-23（第九十八轮）：商店角色可试听声音。
- store 每行头像旁新增 ♪ 按钮（`.char-voice`，data-voice），点击用**该角色专属音高**播放一次跳跃语音，方便在买之前就听出差异（原版没有该按钮，属于本作辅助功能）。
- 重构 `vplay(k,opts,id)` / `vkey(k,id)`：支持按指定角色取男/女声底与 detune；`charPitchFor(id)`。
- 样式修复：插入按钮后行内换行错乱，`.store-row` 统一改 flex（头像 34px / 声音 22px / 名称弹性 / 右侧按钮固定），9 行恢复单行。
- 验证：9 个 ♪ 按钮存在；点击第 5、9 个后 playedCounts.jump +2（声音可播放）；商店截图 r94-store-voice2.png；bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 1.76 s；console 0 error / 0 warning。

2026-10-23（第九十九轮）：HUD 数字换成原版金色数字字体。
- 发现 `FontAtlas2x.png` 里的样张 「506983 / 2714'」正好覆盖 0-9 十个字形，用连通域裁出十张金色数字（`score-0.png`…`score-9.png`，统一 48px 高、按字符定宽）；
- src/main.js 新增 `renderNum(el,value,extra)`：把文本数字替换成原版数字图片序列（非数字字符保留为文本 span 以便带单位）；
  - HUD：积分（30px）、金币（15px）；手机宽度下积分降到 26px 以适配记分牌；
  - 结算面板：本次距离 / 收集金币 / 历史最佳（21px + 单位）；
- style.css：`.num` 行内 flex、`num-lg/num-md/num-sm` 三档尺寸、数字带细微投影。
- 验证：桌面积分 440 / 结算 32 m · 6 · ×2 · 1656 m 均为原版字形（r95-digits2.png、r95-end-digits.png）；移动端积分适配记分牌（r95-mobile2.png）；bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 1.05 s；console 0 error / 0 warning。

2026-10-23（第一百轮）：原版金色数字铺开到商店/统计/菜单；修复统计丢失。
- `numHTML(value,cls)`：给 innerHTML 模板用的金色数字片段（非数字字符保留为文本），接入：
  - 菜单底部「持有 X 金币 · 累计收集 Y」；
  - Stats 面板 8 行数值（距离/局数/金币/倍率/转弯）；
  - 商店价格按钮（角色价格 + 升级价格，宝石价格）；
  - 暂停面板保持文本（格子小，金色数字太挤，可读性优先）。
- 修 bug：直接点「再跑一次 / 重新开始」时不会提交本局数据 → 统计（局数/累计距离/金币/转弯）会丢；`reset()` 开头补 `commitRun()`（幂等）。实测结束→返回菜单后 stats 落盘（runs 2 / 71m / 6 金币），localStorage `atb_temple_run_stats` 正常写入。
- 验证：菜单 r96-menu.png、Stats r96-stats.png、商店 r96-store.png、暂停 r96-pause2.png（文本清晰）、移动端 r96-mobile.png；bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 1.34 s；console 0 error / 0 warning。

2026-10-23（第一百零一轮）：加速道具体验 —— 屏幕边缘速度线。
- index.html 新增 `#speedlines` 覆盖层；CSS 用 `repeating-linear-gradient` 画竖向速度线，`radial-gradient` 做中区透明遮罩让线条只出现在画面边缘，boost 期间 `.on` 叠加 `streakMove` 0.32s 位移动画，`prefers-reduced-motion` 时降级为静态低透明度。
- main.js：`updateSpeedLines()` 在每帧 `frame()` 内调用（不依赖 playing 分支），条件 `state==='playing' && power.type==='boost' && runTime<power.until`；死亡时清空 power 并关闭速度线（原版死亡后道具失效）。
- 验证：加速中边缘出现速度线（r97-boost.png / r97-mobile-boost.png）；结束状态 class 自动移除；bot 1600 tick → 1656 m / 18 转弯 / 死亡时 power=null；`npm run temple:build` 1.78 s；console 0 error / 0 warning。

2026-10-23（第一百零二轮）：道具视觉反馈 —— 护盾破碎 + 磁铁吸币痕迹。
- 护盾抵挡撞击时（src/main.js 碰撞分支）：在玩家胸口位置生成 10 枚翅膀火花（0x9fe0ff）+ 8 枚白色火花，加 `shakeAmp .12` 与 `impactFlash .35` 屏幕闪光；音效换成 shimmer + sizzle 组合；提示「护盾抵挡了一次撞击」。
- 磁铁吸币（金币更新循环）：被吸取的金币每 0.09s 剥离 1 枚金色拖尾火花（fx-spark，位置跟随金币），让「吸过来」的轨迹可见；保持原有吸引曲线与 ring 效果。
- 验证：护盾被石墩撞破帧（r98-shieldbreak3.png，白蓝火花 + 提示）、磁铁吸币帧（r98-magnet.png，粉红 ring + 金币拖尾）；bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百零三轮）：地面接触阴影 + 坑洞水体反光 + 坠落水花声。
- 障碍接触阴影（`addContactShadow`）：hurdle / arch / block / fire 各自在底部加两层深色圆盘（y .035，透明加法），让障碍读作「压在地面上」而不是漂浮（update 不参与，零帧开销）。
- 坑洞（gap）：洞底新增青绿色水体平面（0x123f3d，opacity .55）叠在黑色洞面上，坑洞从纯黑板变成「有深度的水/深渊」；黑色洞面仍保留描边碎片与金色边条。
- 坠落死亡音效：`fall` 类死亡在进度 >.55 时播放原版 `splash.wav`（水花），并给一次轻震；此前坠落只有惨叫没有落水声。
- 验证：坠落死亡 splash 计数 0→1；坑洞帧 r99-gap.png（可看到水面反光）、移动端 r99-gap-mobile.png；bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百零四轮）：跳落挤压 + 落地尘环。
- 落地反馈（src/main.js）：新增 `landPulse`（落地置 1，按 dt*7 衰减），每帧 `body.scale.set(1+squash*.55, 1-squash, 1+squash*.55)` 做 squash & stretch；与滑铲压扁（无骨骼模式）叠加。
- 落地尘环：原有 8 个尘团基础上，在左右 ±0.55 车道再各补 3 个尘团，并附带 `.05` 震动，落地更有「砸下来」的重量感；仍复用 fx-dust 原版粒子贴图。
- 调试钩子：`__templeDebug.landPulse()/body()` 方便后续检查姿态。
- 验证：跳跃落地帧 landPulse .82 / body.scale.y .891（r100-landing.png）；bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百零五轮）：起跳蹬地尘 + 落地低频「咚」+ 起跳风声。
- sfx.js 新增合成音 `thud(gain)`：110→46Hz 正弦下滑 0.22s 包络，落地时叠在原版落地语音下（不额外打包音频资源）。
- main.js：
  - `jumpKick()` 起跳时在脚下左右 ±0.42 各喷 3 团尘（fx-dust），跳跃两条路径（直接跳 / 输入缓冲跳）都调用；
  - 跳跃按下同时播 `whoosh`（rate 1.12，增益 .32）作风声；
  - 落地 `sfx.thud(.5)` + 原有落地语音 + 尘环 + 震动。
- 验证：跳跃时 whoosh 计数 0→1、落地 thud 计数 0→1；起跳 80ms 帧 jumpY .61 带尘（r101-jumpkick.png）；bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百零六轮）：滑铲摩擦声 + UI 点击音。
- sfx.js 新增 `startFriction(gain)` / `stopFriction()`：用 1.2s 白噪声 buffer + bandpass(950Hz) 循环，gain 目标值渐变进出；静音/未解锁时直接返回。
- main.js：滑铲开始/结束（含缓冲滑铲）自动开关摩擦声，死亡/暂停/重开时强制停止；实测滑铲中 `__frictionOn=true`、结束后 false。
- 全局 UI 点击音：pointerdown 捕获阶段监听所有非禁用 `button`，播放 `click`（0.4 增益），菜单/商店/面板/暂停按钮都有反馈；实测商店开/返回各 +1 次 click。
- 验证：滑铲帧尘/火花 r102-slide.png；bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百零七轮）：远景山脊 + 转弯蹭地尘。
- 远景：场景新增 9 座低多边形山脊（ConeGeometry 4 段、颜色 0x2b3a33、z=-95），在树冠上方形成深色剪影，增加纵深；追逐视角大多被树冠遮住，主要在过弯/俯视/高机位时露出（避免刷屏）。
- 转弯蹭地：`completeTurn()` 时在左右脚各喷 4 团 dust（fx-dust）+ 5 个浅色 spark，模拟急转时鞋底蹭地，与既有 FOV 冲拳/震动叠加。
- 验证：过弯帧与高机位帧（r103-peaks4.png、r104-turn-drift.png）；bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百零八轮）：磁铁吸金币的视觉强化（+ 出口牌坊实验回退）。
- 磁铁：被吸的金币现在会随吸附进度（k=1-gap/10）放大到 1.35 倍、自转加速到 3.5+k*10、光晕不透明度 .12→.67，并继续每 .09s 拖出一颗金色 spark；离开磁吸范围自动恢复原始大小/光晕。
- 实验记录：曾尝试在转弯出口放一座原版牌坊（templeGateTemplate .135 @ x=±7.4）让玩家「穿过神庙门」，但相机过弯弧线会从牌坊柱旁擦过、柱子遮挡画面约 0.4s，判定弊大于利已回退（俯视/角色外侧视角下效果不错，但追尾相机不合适）。
- 验证：磁铁吸附帧 r106-magnet.png（金币围绕玩家、光圈、火花拖尾）；bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百零九轮）：金币/宝石「飞入 HUD」收集动画。
- `spawnFlyCoin(worldPos,kind)`：拾取瞬间把金币/宝石的世界坐标投影到屏幕，生成一个固定定位的 `<img class="fly-coin">`，下一帧 transition 到 HUD 计数器位置并缩小、淡出（0.38s cubic-bezier），结束后移除；并发上限 7 个，防止刷屏。
- CSS `.fly-coin`：24px、金色 drop-shadow、pointer-events:none、z-index 9；金币用 coin.png、宝石用 gem.png。
- 调用点：金币拾取（含磁铁吸附）与宝石拾取，各自在 spark 爆发之外叠加飞入动画。
- 验证：一次拾取 2 枚金币时 `.fly-coin` 节点存在且在飞行途中可见（r107-fly3.png 中右侧可见飞行金币）；bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百一十轮）：树冠质感 + 能量条充满的「金色爆发」。
- 树冠：`mats.leaf` / `mats.darkLeaf` 开启 `flatShading`，原本光滑的绿色「气球」变成有棱面的叶簇，配合 leafTexture 更像丛林。
- 能量条充满：`chargePowerMeter` 满格时先播放原版 `bonusMeterFull.wav`（新接入 sfx `meterFull`），在玩家胸口喷 18 个金色 sparkle + 10 个 spark、屏幕暖色闪一下，再激活随机强化并弹提示。
- 验证：满条触发帧 r109-meterfull.png（加速强化 + 金色粒子）；移动端 r109-mobile.png；bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百一十一轮）：路口石火盆（brazier）。
- `createBrazier(parent,x,z)`：石质基座（mats.stone 0.62×2.0）+ 石檐 + 火盆（cyl）+ 火焰锥（mats.fire，0.34×0.95）+ 加色 glow sprite；火焰登记到 `flame.userData.torch` 由近处点光池点亮，并加入 `junctionFlames` 随路口重建清理。
- 放置：每个路口两座，位于出口路两侧（x=dir*3.75，z=padCZ+1.7 / padCZ-3.9），既当路标又不挡视线；第一版偏白/无火，已改为深石色 + 更大火焰 + 光晕。
- 验证：过弯前后帧 r110-brazier-turn.png / r110-brazier2.png（两座石火盆 + 暖光池）；移动端 r110-mobile.png；bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百一十二轮）：触控/鼠标按钮换成原版箭头贴图。
- 从 `InterfaceTexture2x.png` 重新裁切了上/下箭头（(715,195,812,462) → arrow-up.png 89×267；(375,530,488,840) → arrow-down.png 113×310，已剔除旁边的黄色柱子像素）；左右箭头沿用原裁切。
- index.html 四个控制按钮内改用 `<img src="/assets/ui/arrow-*.png">`；CSS 按方向分别定尺寸（左右 30px 宽、上下 30px 高，移动端 26px），金色箭头带投影，全部收在 56px 圆形按钮内。
- 验证：桌面/移动端截图（r111-controls4.png、r111-mobile.png）四个按钮均为完整金色箭头、无溢出/残片；点击按钮仍对应 left/right/slide/jump；bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百一十三轮）：空气尘埃（god-ray 氛围粒子）。
- 新增 26 个 `dustMotes` 加色 Sprite（暖白 0xffeccd，scale .18-.44，opacity .14-.34 呼吸），在玩家前方 2-36m、高度 0.4-5.2m 的走廊空间缓慢上升/横向漂移，越界从前方重新生成；在 frame() 每帧 `updateDustMotes(dt)`（菜单/暂停也保留氛围）。
- 与火把光、光束、火虫一起构成暖色空气感，贴近原版走廊的浮尘。
- 验证：桌面帧 r112-dust2.png（路面上方可见柔和浮尘）、移动端 r112-mobile.png；bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百一十三轮补充 / Round 100 里程碑）：
已落地模块——圆弧转弯 + 3D 金箭头 + 倒计时提示；长短段与 S/U 弯地图生成；骨骼动画角色与 9 款皮肤（男女分声线 + 音高）；原版路面/墙/牌坊/树/岩石资产；树根障碍、枝拱、石墩、火柱、坑洞；金币/宝石/磁铁/护盾/加速/倍率/能量条；原版 UI 字体、图标、菜单、商店、升级、目标、结算；61s 原版 BGM + 28 个原版音效；暂停/失焦/教学/移动端适配/局域网二维码。
剩余差距：转角原版构件（假透视资产不适合追尾相机）、障碍造型细分、角色近景细节、部分 UI 按钮可再统一。

2026-10-23（第一百一十四轮）：火障碍重做（原因：APK flame-tower 预制体整块 42.8×44.9×60 单位，含神庙墙体，缩放到 .19 后仍是一大坨黑色屋顶罩住走廊）。
- 移除 `obstaclePrefab('flame-tower',.19)`，改为程序化火焰墙：8.0×1.4 的黑色焦土底 + 7.8 宽石台基座，两端 x=±3.2 各有石质火盆；6 道火焰（锥体火心 fireOuter/fireCore + 原版 `fx-flame` 加色 Sprite + 光晕）横跨路面。
- 火焰 Sprite 每帧脉动（尺寸 1.45×/2.05× 随正弦变化、不透明度 .6-.82），与原版火墙观感一致；碰撞逻辑不变（仍需跳跃）。
- 验证：火墙全景 r113-fire4.png、移动端 r113-mobile-fire.png；跳跃测试 state=playing / stumble 0；bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 849 ms；console 0 error / 0 warning。

2026-10-23（第一百一十五轮）：转弯金币引导 + 火盆火焰修复。
- 转弯金币轨迹：`beginTurn()` 时沿弯道弧线铺 9 枚金币（distance = nextTurn-8 + i*2.2，居中车道），用 `placeOnPath(..., true)` 走圆弧定位；玩家转过去正好一串吃到，视觉上引导「往这边转」。与现有转弯护栏/箭头/倒计时叠加。
- 火盆火焰：原来用锥体 + 强自发光，镜头靠近时点光把锥体照成「白色冰淇淋甜筒」；改为原版 `fx-flame` 加色 Sprite（0.95×1.25，opacity .9，脉动），近看是真实火焰而不是白锥。
- 验证：转弯金币帧 r114-turncoins.png（转角金色菱形金币弧）、火盆帧 r114-brazier2.png（橙色火焰 + 暖光）；bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百一十六轮）：转弯完成的暖金边缘闪光。
- 新增 `.turn-glow` 全屏叠加层（radial-gradient 只在边缘出现暖金色，mix-blend-mode:screen），由 `turnFlash` 驱动透明度（最大 .55，随 1.8/s 衰减）；`completeTurn()` 时 turnFlash=1.1 → 转弯瞬间屏幕四周暖金色一闪，强化「转成功了」的反馈，0.6s 内完全回落。
- 尝试并回退：在路口尽头墙面上加「金环 + 原版金币图腾浮雕」，但该 facade 是 2.5D 斜面假透视，实测墙面在 y=1.5/3.0 处深度不同（-6.56/-6.23），浮雕无论放哪个 z 都会穿模或被遮住，已移除并记录。
- 验证：转弯完成帧 r115-glow2.png（暖金边缘 + 漂亮的转弯提示，turnGlow opacity .55）；移动端 r115-mobile.png；bot 1600 tick → 1656 m / 18 转弯 / 171 金币；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百一十七轮）：控制按钮按下反馈。
- `.controls button` 增加 transform/box-shadow/background 过渡；按下（`:active` 或 JS 加 `.hit` 类 120ms）时缩到 0.92、金色径向高光、内阴影 + 外发光，触控有「按下去」的手感；按钮 pointerdown 同时触发 `haptic(8)` 轻微震动。
- 验证：按住跳跃键帧 r116-press2.png（右侧按钮出现金色高光/缩小）；四个按钮点击仍分别触发换道/滑铲/跳跃；bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百一十八轮）：全 UI 按钮按压反馈。
- 全局 pointerdown 捕获器在播放 click 音效的同时给按钮加 `.hit` 类 130ms；`button{transition:transform/filter/box-shadow}` + `button.hit{scale .96/brightness 1.1}`，主按钮额外金色外发光，菜单文字按钮 STORE/Options/Stats 高亮，商店行按钮提亮。
- 验证：菜单 STORE 按下帧 r117-menuhit.png（STORE 字标明显高亮，其余不受影响）；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百一十九轮）：神庙猴子（偷金币）。
- `spawnMonkey(ahead)`：低模猴子（棕色身体/头/脸/眼睛/四肢/卷尾）蹲在路肩墙顶（x=side*3.55，y≈1.52，scale 1.35），轻微上下浮动 + 摇晃。
- 玩家跑过（±1.3m）时触发：偷走最多 3 枚金币（`coins-=steal` + HUD 同步）、播放原版 monkeyRoar、提示「猴子偷走了 N 金币！」、haptic；没金币时嘲讽「这穷鬼一枚金币都没有」。偷完跳跃旋转离场 2.4s 后回收。
- 生成：每 150-230m 一只（与转弯距离 <26m 时顺延），菜单/重开时清理；debug `spawnMonkey(ahead)` / `monkeys()`。
- 验证：偷窃测试 before 5 → after 3、hint 正确、monkeyRoar 触发；猴子蹲墙帧 r118-monkey3.png；bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百二十轮）：角色补光与材质微调。
- `charRim`：一盏暖色点光（0xffe2b0，强度 .85，距离 7）每帧跟在跑者后方 1.7m、高 2.6m 处，给角色轮廓镶暖边，在暗墙/树荫前更立体。
- runnerRig 材质 `roughness .9 → .82`、`metalness .04`，皮肤/衣服高光更细腻一点。
- 排查记录：截图里角色腰腹处出现的亮斑经排查是「拾取火花被 hold 冻结」的测试假象（spawnSparks 在 freeze 时停在原地），不是模型/光照问题，已在正常帧确认无亮斑。
- 验证：正常帧 r119-live.png（角色清晰、无亮斑）、移动端 r119-mobile.png；bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百二十一轮）：2.4km 长跑审计 + 高分溢出修复。
- 用持续护盾的脚本 bot 跑到 2390m / 27+ 段（截图 600m/1400m/2390m），检查转弯、火墙、金币、猴子、护盾、粒子均正常，无悬空/破面/黑洞。
- 发现并修复：分数超过 5 位时（如 15600、27490）金色数字会溢出 HUD 记分牌。`renderNum` 为 `num-lg` 增加 `.long`（>4 位）/`.longer`（>5 位）类，CSS 把字号从 30px 降到 23px/19px，右对齐容器内收；24000 分实测完整显示在木牌内。
- 验证：r120-a1400.png（修复前溢出）、r120-score2400.png（修复后 24000 完整）、移动端正常；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百二十二轮）：里程碑横幅改版。
- `.milestone` 从裸文字改为金色描边木牌：深色渐变底 + 描边 + 内发光 + 阴影，`msPop` 弹入动画（.62→1.06→1）；里程数字改用原版金色数字图片（numHTML），单位 m 小字。
- 500m 用原版 NICE JOB! 字样，≥1000m 用 HIGH SCORE! 字样（两张原版图）；触发时仍播放 best 语音。
- 验证：1000m 节点帧 r121-milestone2.png（NICE JOB! + 500 m 木牌）、移动端 r121-mobile.png；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百二十三轮）：金币里程碑。
- 每收集满 100 金币触发一次金色木牌提示（与里程里程碑同一套 UI）：原版 NICE JOB! 字样 + 金色数字「100 金币」，`lastCoinMilestone` 防止重复触发，重开时归零；debug `milestone(n,unit)` 可直接预览。
- 验证：真实收集到 118 金币时里程碑按 100 节点弹出（seenMilestone=true，class=milestone pop）；截图 r122-coinms3.png（采集瞬间）与 r122-coinms2.png（特写：NICE JOB! + 100 金币）；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百二十四轮）：宝石里程碑 + 金币里程碑粒子。
- 宝石每满 10 个弹金色木牌（NICE JOB! + 「N 宝石」），`lastGemMilestone` 去重、重开归零；debug `milestones()` 可查两个里程碑状态。
- 金币每满 100 个触发时，在角色胸口追加金色 sparkle/spark 喷发（像金币喷泉），与木牌一起出现。
- 验证：真实收集 60 宝石时 lastGemMilestone=60、milestone pop（r123-gemms2.png：NICE JOB! + 60 宝石）；金币里程碑喷发已接入同一分支；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百二十五轮）：里程碑音效细分 + 丛林猴叫环境音。
- 里程碑按类型播放不同原版音效：金币里程碑 → cashRegister（coinCascade），宝石里程碑 → shimmer，里程里程碑 → best 欢呼（原来全都用 best）。
- 环境音：每 26-60s 随机在远处播放一声 monkeyRoar（gain .14、随机 rate .85-1.15），营造丛林氛围；重开时计时归零。与猴子偷钱的近身音效（gain .7）区分明显。
- 验证：播放计数测试 coinCascade=1、shimmer=1；bot 跑 823m 期间 monkey 计数 5（含近身猴子与远处环境音）；回归 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百二十六轮）：丛林树冠摇曳。
- 路旁/头顶的树冠叶簇（leaf/bush，约 380 个 mesh）在建造时登记 `swayLeaves`，每帧按 `sin(runTime*1.1+phase)*.045` 与 `cos(runTime*.8+phase*1.7)*.03` 做轻微旋转摆动，丛林不再是静止的绿色球体；flatShading 叶面 + 摆动后更有生命力。
- 性能：仅改 rotation，无几何/实例增删；bot 回归与 build 时间无变化。
- 验证：同一叶簇两个时间点的 rotation.z 不同（数值验证）；画面正常 r125-sway.png；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百二十七轮）：飘落叶粒子。
- `spawnLeaf()`：在玩家前方 8-26m 的路侧（±2.6-4.8）空中生成一片原版树纹理 Sprite（深绿 0x7fae5f，scale .24-.38，缓慢下落 .55-.9 m/s + 横向摆动 + 自转 + 接近地面淡出），同时最多 6 片，`clearObjects()` 时清理。
- 与浮尘、萤火虫、火星一起构成空气层次；色调压暗后不再像「白色光点」。
- 验证：r126-leaves2.png（空中可见飘落叶片）；bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百二十八轮）：路口「围观猴子」。
- 抽出 `makeMonkey(scale=1.35)`（身体/头/脸/眼/四肢/卷尾），偷钱猴子复用；`buildJunction()` 里在路口两侧矮墙顶各放一只 watch monkey（scale 1.15，y 1.55，朝向路口），加入 `watchMonkeys` 列表，每帧轻微上下浮动 + 左右摇摆（`sin(runTime*2.2+phase)*.06`、`sin(runTime*1.3+phase)*.08`）。
- 路口重建时 `watchMonkeys` 清空并重新生成，不会泄漏对象。
- 验证：转弯帧 r127-jmonkeys4.png（路口两侧墙顶各有一只棕猴，会轻微晃动）；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百二十九轮）：围观猴子会转头看你。
- watchMonkeys 记录初始朝向 `base`；每帧计算与玩家的水平距离，<13m 时目标朝向 = atan2(dx,dz)，用 `diff*min(1,dt*6)` 平滑转向跑者，跑远后转回原朝向；仍保留轻微上下浮动与摇摆。
- 验证：转弯帧 r128-look.png（路口三只猴子均朝跑者方向）；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百三十轮）：倾斜转向（原版 AllowTiltToTurn 选项）。
- Options 新增「倾斜转向」开关（settings.tilt，持久化）。开启时在 iOS 上会调用 `DeviceOrientationEvent.requestPermission()` 申请方向权限。
- 监听 `deviceorientation`：gamma < -20° 记左倾、> 20° 记右倾；仅在 `settings.tilt && state==='playing' && turnDirection!==0 && !turnQueued` 且处于转弯窗口（nextTurn-42 … nextTurn+2）时，倾斜方向与路口方向一致则直接 `turnQueued=true` 并提示「倾斜转弯！」（轻微震动）。只用于路口转向，换道仍靠滑动/按键，避免误触。
- 验证：注入 `DeviceOrientationEvent{gamma:-32}` 后 turnQueued=true（方向 -1、路口 57m）；Options 面板显示开关且勾选状态持久化（r129-options2.png）；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百三十一轮）：屏幕边缘转弯箭头。
- index.html 新增 `.turn-edge`（原版左右箭头图 + 「左转/右转」文字），距路口 ≤18m 时从画面左/右侧滑入，转弯确认后变绿显示「已确认」（`.ready`），离开路口/重开自动隐藏。
- 与顶部倒计时胶囊、路面金色箭头、弯道金币串形成四重提示；移动端竖屏也清晰可见。
- 验证：接近帧 r130-edge2.png（左侧「← 左转」滑入）、确认帧 r130-edge3.png（绿色「← 已确认」）；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百三十二轮）：过弯镜头预告 + 弯道间距审计 + 场景小修。
- 镜头预告：距路口 ≤24m 时，`lookAt` 目标向转弯一侧偏移（`anticip=.85`、转弯中另加 `turnAmount*1.1`，使用当前朝向的横向向量），让镜头提前「看向弯道」，减少突然甩头感（r131-anticip.png）。
- 弯道间距审计（bot 1656m/18 弯）：转弯位置 57, 249, 345, 429, 465, 562, 765, 789, 861, 897 → 间距 192/96/84/**36**/97/203/**24**/72/**36**，确认 S/U 连续弯与长直交替生效。
- 场景小修：路边装饰石柱原来 2.8 高、柱头 1.55 宽浅色，低墙改造后像悬空石板 → 降为 1.9 高 + 1.1 柱头且统一 ancientStone；地面灌木推远到 ±10.6-13.6 并缩小，避免在路口贴脸（r131-bush2.png 复查）。
- 验证：回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百三十三轮）：树林光柱（sun shafts）。
- 新增 `shaftTex`（64×256 的垂直渐变 + 两侧羽化遮罩）与 `addLightShaft(parent,x,z,seed)`：一块 4.2×13 的加色平面挂在每块偶数瓦片的 tile group 上（每块 2 道），世界坐标跟随瓦片，靠近时由 frame() 里沿 Y 轴 billboard 朝向相机，透明度 .09-.2 缓慢脉动。
- 修复过程：最初把光柱挂在 `surface` 组上，被 `refreshRoadSurface()` 清空（`while(surface.children.length)`）清掉了；改挂 `group`（持久）后正常显示，数量 12。
- 验证：桌面帧 r132-shafts5.png（左侧墙面与路面暖色光带）、移动端；bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百三十四轮）：丛林桥段（跨河木桥）。
- 新判据：`isBridgeTile(d)` —— 以 12m 瓦片为周期，每 36 块（约 432m）连续 3 块（36m）为「桥段」，若离转弯 <24m 则跳过，避免桥面横跨路口。
- `makeBridge(tile)`：每块瓦片挂一个 bridge 组（默认隐藏）——26×12.4 的水面平面（程序化 ripple 纹理 + `bridgeWaterMat`，y=-1.32）+ 两侧木护栏（立柱、上下两道横杆、斜撑，`bridgeWood` 0x6b4a2c）。
- 帧循环里按 `isBridgeTile(tile.pathDistance)` 切换：桥段隐藏两侧神庙矮墙（facade 条件追加 `&& !bridge`）和装饰树，只留水面+木栏；水面纹理随时间缓慢平移（offset.x/y）。
- 验证：414m/444m 桥面帧 r133-bridge3.png（左右青色河水 + 木栏 + 石板桥面）、移动端 r133-mobile.png；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 1.00 s；console 0 error / 0 warning。

2026-10-23（第一百三十五轮）：桥面木栈道 + 桥头石灯。
- 程序化木板纹理 `plankTex`（128²，深棕木纹 + 横向板缝，repeat 1.1×7.0，约 0.36m 一块板）+ `plankMat`（0xb98453）；在桥段每块瓦片铺 7.7×11.9 木栈道面（y .022，盖住石板路），两侧加木边梁遮住石板断面。
- `makeBridgeLantern(parent,x,z)`：简易石灯笼（石柱 + 石檐 + 暖黄发光玻璃 + 石顶），每块桥瓦片四角各一只；火光不参与点光源池（避免过量灯光）。
- 修复：`makeBridge` 原来传入的是字面量 `{group}`，导致 `tile.bridge` 没挂到真正的 tile 上、visibility 永不切换（水面/护栏全不可见）；改为在 tile 循环末尾 `makeBridge(group)`，并用 `const root=tile.group||tile` 兼容。
- 验证：440m 桥面帧 r134-bridge3.png（清晰木板桥面 + 木栏 + 两侧青水 + 灯笼）、移动端 r134-mobile.png；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百三十六轮）：原版「按地面材质切换跑步脚步声」。
- 发现之前提取但未使用的三个原版脚步循环：`footstepsTemple.mp3`（神庙石板）、`footstepsPlank.mp3`（木桥）、`footstepsCliff.mp3`（崖边）。
- sfx.js 新增 CLIPS `stepTemple` / `stepPlank`（gain 1.35）与 `setLoopRate(name,rate)`、`activeLoops()`。
- main.js 新增 `stepSurface` / `setStepSurface(name)`：跑动时循环播放当前地面脚步（`isBridgeTile(distance)` 决定石板 or 木桥），随速度调整循环播放速率（.82+超出基础速度*0.028）；跳跃/滑铲/踉跄/暂停/死亡/菜单时停止，恢复继续。
- 修复：停止逻辑最初写在 `update()` 里（暂停时不执行），改到 `frame()` 中，真实暂停实测 loops=[] ✓。
- 验证：石板段 loops=[stepTemple]、桥段 loops=[stepPlank]、暂停后 []；回归 bot 1600 tick → 1656 m / 18 转弯；console 0 error / 0 warning。

2026-10-23（第一百三十七轮）：崖边段（第三套地表 + 岩石崖壁）。
- sfx.js 新增 `stepCliff`（`footstepsCliff.mp3`），与石板/木桥并列；桥段优先，其次崖边段，否则神庙石板。
- `isCliffTile(d)`：每 48 块瓦片（约 576m）连续 4 块（48m）为崖边段，避开桥段和转弯 24m 范围。
- `makeCliff(tile)`：每侧 6 块原版 `decor-rock-a` 岩石克隆（scale .075-.11，x=±6.6-7.8，y=-0.1），形成崖壁轮廓；崖边段隐藏装饰树、保留神庙矮墙（避免背景漏空），岩石从墙顶上方露出。
- 修复：makeCliff 最初也传了字面量导致 `tile.cliff` 没挂上（同桥段的坑），改为传真实 tile；岩石初版 scale .11-.17 直接把整条路盖黑，缩小到 .075-.11 后正常。
- 验证：崖边段帧 r136-cliff6.png（两侧岩石崖壁 + 走廊完整）、loops=[stepCliff]；回归 bot 1600 tick → 1762 m / 19 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百三十八轮）：按地貌的环境音（桥下水声 / 崖边风声）+ 崖边薄雾。
- sfx.js 新增 `setAmbience(kind, level)` / `stopAmbience()` / `ambienceInfo()`：用 WebAudio 生成 2.4s 棕噪声缓冲并循环——`water` 走 bandpass 760Hz（Q .55），`wind` 走 lowpass 430Hz；慢速 LFO（.23/.11Hz）调制音量使其像自然起伏；切换时 0.5-0.8s 淡入淡出。
- main.js：跑动且在地面时按 `isBridgeTile` / `isCliffTile` 设置 `water`（gain .42）/ `wind`（gain .30）/ 无；暂停、死亡、菜单统一 `stopAmbience(.5)`。调试接口 `audio.ambienceInfo()`。
- 崖边薄雾：`makeCliff` 每块瓦片每侧 3 个雾 Sprite（径向渐变 canvas 纹理，scale 3.4-5.6×1.2-2.0，透明度 .08-.15 缓慢脉动）。
- 修复：雾透明度初始化时引用了不在作用域的 `z`（ReferenceError），改用 `i`。
- 验证：corridor=bull、bridge=water、cliff=wind（`ambienceInfo()`）；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百三十九轮）：神庙柱廊段（hall）。
- `isHallTile(d)`：每 60 块瓦片（约 720m）连续 3 块（36m）为「柱廊段」，避开桥段/崖边段/转弯 26m。
- `makeHall(tile)`：每侧两根古石巨柱（3.62m 处，半径 .58，高 6.4 + 柱础/柱头），每对柱间架 7.7m 宽石横梁（y 6.62）+ 横梁下金色饰条；两侧柱脚各一座石火盆（火焰加入全局 flame 池，随路口/大厅重建清理）。
- 帧循环切换 hall 可见性并隐藏树木装饰；柱廊段保持矮墙外观，只多出头顶横梁与立柱，形成「神庙大厅」的纵深感。
- 修复迭代：柱子初版放在 x=±4.85（埋进墙里看不见）→ 移到 ±3.62；后加横梁让柱廊有「顶部」。
- 验证：246m 柱廊帧 r138-hall3.png（左右巨柱 + 头顶横梁 + 金饰 + 火盆）；回归 bot 1600 tick → 1762 m / 19 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百四十轮）：柱廊段顶部漏光光斑。
- `poolTex`（径向暖光 128²）+ `poolMat`（加色、不透明度 .5、DoubleSide）；`makeHall` 在每对横梁下方向下投 3 块 5.2×4.4 的地面光斑（y .045，z=-3.4/0/3.4），形成「屋顶缝隙漏下的阳光」。
- 光斑随 hall 组可见性一起开关；不参与实时点光，零光照开销。
- 验证：246m 柱廊帧 r139-hall.png（石板路上三片暖光斑）；回归 bot 1600 tick → 1885 m / 20 转弯存活；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百四十一轮）：柱廊段混响 + 性能复核。
- sfx.js 新增 `setHallReverb(on)` / `reverbInfo()`：程序化生成 1.7s 双声道指数衰减脉冲响应，`ConvolverNode` + 湿声 gain；柱廊段把当前脚步循环一路并联进混响（每循环只连一次），进入时 .5 湿声淡入、离开 .45s 淡出。
- main.js：`hallReverbOn` 状态随 `isHallTile(distance)` 切换；暂停/死亡/菜单时关闭。
- 性能复核：菜单/游戏稳定 60.4fps（2s rAF 采样）。
- 验证：244m（柱廊内）reverbInfo on=true、wet 实时升到 0.5；520m（走廊）on=false；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百四十二轮）：柱廊尽头的大门。
- `hallGateMat`（facade 贴图、0xa08a62、emissive 0x241c10×.26）复用原版 `tower-arch` 牌坊模板；`makeHall` 在柱廊中段瓦片（idx%60===21）放置一座 9.5 宽 × 7.8 高 × 6 深的拱门（rotation.y=π，脚在路缘外），形成「穿过神庙大门进入柱廊」的入口。
- 排查记录：后退 `jumpTo` 会让 12 块瓦片只向前回收、身后短暂出现「没有路面」的青色底部（undergrowth 透出）——这是调试瞬移的假象，正常前进不会出现，已记录避免误判为 bug。
- 验证：226m 接近帧 r140-hall-gate3.png（完整拱门 + 柱廊），通过门洞帧 r140-hall-gate4.png；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百四十三轮）：柱廊两侧的旗帜。
- 程序化旗帜纹理 `bannerTex`（96×256：深红/亮红渐变 + 金色边框 + 金色圆徽 + 下摆斜角）；`bannerMat` 双面；每块柱廊瓦片在两侧 x=±2.75、y=4.35 挂两面 1.35×3.1 的旗帜，轻微摆动（sin 频率 1.6，幅度 .035 rad）。
- 修复：旗帜代码最初误插到 `makeBridgeLantern`（第一个 `return g;` 匹配），实际挂到了桥头灯笼上；移到 `makeHall` 后才正确出现在柱廊里。
- 验证：246m 柱廊帧 r141-banner4.png（两侧红金旗帜 + 巨柱 + 火盆 + 光斑）；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百四十四轮）：柱廊红毯 + 天花板光柱 + 守门神像面。
- 程序化地毯纹理 `rugTex`（96×512：深红底 + 金色包边 + 菱形纹样，repeat 1×1.3）+ `rugMat`；每块柱廊瓦片铺 2.7×11.9 红毯（y .05），跑者正好跑在中央红毯上。
- 天花板光柱：柱廊横梁间加两片 2.2×6.4 加色光柱平面（y 3.3，倾斜 .12，opacity .3），模拟从顶缝漏下的光。
- 守门神像面：每根内侧巨柱在 y 4.35 处嵌一尊石雕守卫头像（球体头 + 六棱冠 + 金眉 + 金眼 + 侧耳），面向跑者。
- 修复：插入神像时 python 切片匹配到了循环内层的 `}`，留下重复残留行导致 main.js 500；清理后恢复。
- 验证：236m 柱廊帧 r142-rug.png（红毯 + 旗帜 + 光柱 + 巨柱）；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百四十五轮）：木桥加悬索（rope bridge）。
- `ropeMat`（0x35261a）+ 每段桥面两侧各一条下垂绳索：CatmullRomCurve3 从 z=-5.9 到 5.9，y 从 2.05 起按 sin 弧度下垂 0.38，TubeGeometry(radius .045) 渲染，挂在桥组里随桥段显隐。
- 与木栈道、木栏、石灯笼、水面一起构成完整的吊桥/索桥外观。
- 验证：432m 桥面帧 r143-bridge-rope.png（两侧下垂绳索清晰可见）；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百四十六轮）：HUD 叠层去重 + 长跑审计。
- 2.6km 脚本长跑审计（多段截图 300/600/900m）：发现转弯/加速时同时出现「转弯已确认」提示条 + 屏幕边缘「已确认」箭头 + 「力量充满·加速！」提示 + 强化 toast，四个浮层叠在一起。
- 修复：① 边缘大箭头在 `turnQueued` 后不再显示（由提示条承担确认反馈）；② `setHint` 在转弯进行中直接忽略（转弯提示优先）；③ `chargePowerMeter` 满条时不再额外 setHint（已有「加速冲刺！」toast）。
- 验证：r145-overlap.png（只剩转弯已确认一条）、r145-toast.png（加速 toast + 加速 4s 徽章 + 转弯条，互不遮挡）；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百四十七轮）：商店 3D 角色预览。
- 商店 SHOP 页顶部新增 3D 预览窗（`#charPreview` canvas + 角色名标签）：独立 WebGLRenderer/Scene/Camera，暖色主光 + 冷色轮廓光 + 地面圆形软阴影；复用 `loadRunnerRig` 加载原版骨骼跑者，慢速原地跑（时间缩放 1/3200）并左右轻微摆动。
- 切换角色时 `setPreviewChar()` 只换材质贴图（不重建 rig）；`renderCharPreview()` 在 frame() 里按商店面板可见性渲染，独立 220×168 画布，对主渲染无负担。
- 修复：每次重开面板会重建 canvas，而 renderer 仍绑定旧 canvas → 预览黑屏。`ensureCharPreview()` 现在检测 `previewRenderer.domElement!==当前canvas` 就重建 renderer（复用 scene/rig），并重新挂载 rig。
- 验证：桌面 store3d（Jhony）、store3d-selene3（Selene 宇航服正确切换）、移动端 r146-mobile.png；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百四十八轮）：预览转台 + 拖动旋转。
- 转台：深色石质圆柱底座（.62/.66 半径，高 .07）+ 金色细圆环（TorusGeometry .02，金属度高、带微自发光）+ 原有软阴影盘，让角色有「站在展台上」的展示感。
- 拖动旋转：canvas pointerdown/move/up 拖动改变 `previewYaw`（1px≈0.011rad），松手 2.2s 后恢复自动缓慢旋转；右下角提示「拖动旋转」。
- 验证：r147-turntable.png（转台 + 角色）、r147-drag.png（拖动后侧身）、移动端 r147-mobile.png；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百四十九轮）：预览属性标签 + 点击头像预览。
- 预览窗左上角新增属性胶囊：「速度 +8%/-20%/标准速度」+「男声/女声」，随预览角色实时更新（名字左下、提示右下）。
- 点商店任意角色的头像即可在 3D 预览窗查看该角色（不需要已拥有），高亮当前预览行 `.previewing`；点 ♪ 仍试听该角色语音。装备角色时预览自动回到已装备角色。
- 验证：r148-preview.png（万圣狼人预览 + 「速度 -20%」「男声」标签）、移动端 r148-mobile.png；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百五十轮）：柱廊加盖（室内化）+ 修复守护神像材质 bug。
- 柱廊新增石质天花板（7.6×11.9 平面，y 7.35，使用 wallStoneAtlas 贴图）+ 每 2.2m 一根头顶横梁，柱廊从「露天柱阵」变成真正有顶的神庙大厅。
- 发现并修复：`mats.ancientStone` 这个键并不存在（ancientStone 是独立常量），导致第 131 轮加的「巨柱守护神像」一直用默认白色材质渲染；把引用改为 `ancientStone` 后神像恢复石色。
- 验证：r150-ceiling3.png（柱廊内部，顶棚横梁）、r150-ceiling5.png（从门洞外看柱廊，顶部有石顶 + 红毯）、移动端 r150-mobile.png；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百五十一轮）：柱廊壁画饰带 + 墙灯 + 顶棚金边。
- `friezeTex`（256×64：暗石底 + 金圆浮雕 + 内框，repeat 1.6）→ 四块 6.2×1.15 饰带贴在两侧内墙（x ±3.58，y 5.5，z ±3.3），柱间形成壁雕饰带。
- 墙灯：每块柱廊瓦片 4 盏壁灯（z ±1.65，x ±3.46，y 4.45 的石托 + FX.flame 火苗 + 光晕），火焰注册进全局 `flames`，会参与最近 3 盏点光源池，夜里/室内有真实火光。
- 顶棚金边：两侧 y 7.24 各一条 11.8m 金色饰条，呼应大门/红毯的金色元素。
- 验证：r151-sconce.png（柱廊：金饰带 + 4 盏墙灯 + 顶棚 + 红毯 + 旗帜）；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百五十二轮）：峡谷段的深渊与石峰。
- `makeCliff` 两侧各加一块 26×12.2 的深色深渊平面（0x0a1614，y=-1.55）盖住原来的绿色林地面，形成「悬崖步道下方是深谷」的错觉。
- 深渊中每侧 3 座尖石峰（ConeGeometry 半径 1.1-2.7、高 4-11，rockMat），从谷底升起，在墙顶上方露出剪影。
- 崖壁岩石从 x ±6.6 推到 ±8.2 并降低 y=-0.6，避免大块黑石悬在墙顶像漂浮物。
- 验证：r152-chasm3.png（两侧深谷 + 石峰剪影 + 步道）；移动端 r152-mobile.png；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百五十三轮）：深渊雾气上涌 + 调试里程碑开关。
- 峡谷段每侧新增 2 团大型深渊雾气（scale 7.5-11 × 2.6-4，opacity .1-.18），与原有 3 团近墙雾气一起做上升动画：`cyc=(runTime*rise+phase)%1.6`，y 从 baseY 上浮 1.6 并随时间淡出后循环，形成「谷底雾气往上冒」的层次。
- debug 新增 `setMilestone(v)`：批量截图时可把里程碑计数推到很大，避免 500m 木牌挡住画面（之前调试截图老被遮住）。
- 验证：r153-mist2.png（峡谷段墙体上方浮雾 + 谷底）；移动端 r153-mobile.png；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百五十四轮）：峡谷瀑布。
- 程序化瀑布纹理 `waterfallTex`（64×256 青色底 + 白色/浅青竖条，repeat 1×2.2，`offset.y` 随 runTime*0.55 向下滚动）。
- 每块峡谷瓦片两侧各一道 2.6×17 的加色瀑布平面（x ±7.2，y 4.2，z -2，面向步道），从崖顶倾泻进深渊，底部有 4.6m 的雾状水花光晕；`waterfalls` 数组统一驱动滚动。
- 修复：瀑布最初只在 `idx%2===0` 的瓦片上创建，但瓦片是按初始里程一次性建内容的，回收后 index 变了 → 大部分峡谷瓦片没有瀑布。改为所有峡谷瓦片都建瀑布。
- 验证：r154-falls6.png（远处两侧白蓝色瀑布柱）；移动端 r154-mobile.png；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百五十五轮）：瀑布环境音（WebAudio 合成）。
- APK 里没有瀑布音效，所以在 sfx.js 里合成：2 秒白噪声 buffer（一阶低通预加重）→ highpass 140Hz + lowpass 950Hz → 独立增益 → master；再叠加 0.2Hz LFO 微幅起伏，循环播放。
- 新增 `startWaterfall(level)` / `stopWaterfall()` / `waterfallInfo()`；main.js 在 update 里当玩家位于峡谷段（distance/-/+14/+26 任一命中 isCliffTile）时 `startWaterfall(.4)`，否则 `stopWaterfall()`；死亡/菜单统一 stop。
- 用 setTargetAtTime 做 0.5s 淡入淡出，避免进出峡谷时的爆音/突变。
- 验证：`waterfallInfo()` 在峡谷内增益上升、离开后回落（0.046 → 0.001）；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百五十六轮）：峡谷悬空步道（木桩 + 绳索护栏）。
- `makeCliff` 两侧各加两根木桩（mats.bark，x ±3.98，y 1.35-2.68，柱头带石帽）和上下两道下垂绳索（CatmullRom，z -5.6..5.6，y 2.62/1.72，下垂 .26/.2，TubeGeometry r .04），把峡谷步道变成「悬崖上的绳索栈道」。
- 与已有的深渊、石峰、瀑布、雾气叠加，峡谷段的整体观感完整了。
- 验证：r156-walkway2.png（两侧下垂绳索 + 木桩 + 远处瀑布柱）；移动端 r156-mobile.png；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百五十七轮）：瀑布水雾粒子 + 1100/1750m 长距离审计。
- 每道瀑布底部生成 4 颗水雾 Sprite（mistTex，初始 y 1.7-2.5，位于墙顶上方可见区域），以 1.3 倍速循环上升 0.9m、同时淡出并放大，模拟瀑布溅起的水雾。
- 审计：跳转到 1100m / 1750m 各截一帧检查，走廊、墙体、瀑布、猴子、HUD 均正常，无破面/悬空异常。
- 验证：r157-spray2.png（瀑布旁上浮水雾）、r157-a1100.png / r157-a1750.png（长距离画面）；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百五十八轮）：峡谷入口石门 + 瀑布音量分层。
- 峡谷段入口（每 48 块瓦片中的第 6 块）架一座原版 `tower-arch` 门（缩放 .18、深色石质、金饰带），跨在步道上方作为「进入峡谷」的地标；门只在入口瓦片显示（按 tile 的 idx%48 动态显隐），其余峡谷瓦片只有绳索栈道。
- 修复：tile.cliff 在瓦片首次进入峡谷的那一帧还没建好，直接 add 会抛 `Cannot read properties of undefined`；加 `tile.cliff &&` 守卫，下一帧再挂门。
- 瀑布环境音改为按距离分层：峡谷内 .42、前方 8m .3、前方 20m .2，更接近「走近水声变大」。
- 验证：r158-gate2.png（跨路石门 + 瀑布 + 绳索栈道）、移动端 r158-mobile.png；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百五十九轮）：面板内容裁切修复（UI 走查）。
- 走查商店/统计/目标/设置四个面板，发现 `.panel-body` 的 max-height 42vh 会把最后一行截断（统计页「累计成功转弯」、目标页「转角达人」、设置页「玩法教学」都被 返回 按钮压住一半）。
- 修复：`.panel-body{max-height:49vh;overflow-y:auto;padding-bottom:12px}` + 底部 18px 渐变遮罩（mask-image）+ 细金色滚动条（-webkit-scrollbar 5px）；现在所有面板最后一整行都能看到，超出部分可滚动且边缘有淡出提示。
- 验证：r159-stats2.png（统计 8 行完整）、r159-obj3.png（4 个目标完整）、r159-opt2.png（设置 6 行完整）；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百六十轮）：面板开启动画 + 商店滚动体验。
- 面板打开动画：`#panelOverlay .panel-card` 260ms 弹入（translateY 14px + scale .96 → 1，回弹曲线），遮罩 200ms 淡入；打开设置/统计/商店/目标都有统一的「卡片弹出」手感。
- 商店 9 个角色的列表确认可滚动到底（scrollHeight 844 / 可视 353，滚动到底能看到最后两行 + 银行说明），每个角色行 min-height 52px，最后一行留白。
- 验证：r160-store-scroll.png（滚动到底：血鬼宝石 2、骷髅宝石 3、征服者 1000 等完整显示）、r160-mobile-store.png（移动端滚动到底）、面板动画 computed animationName=panelIn；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百六十一轮）：面板关闭动画 + 商店按钮分级。
- 关闭面板：`closePanel()` 先给遮罩加 `.closing`（卡片 170ms 下移 10px + 缩 .97 + 淡出，遮罩 160ms 淡出），170ms 后再真正隐藏；面板关闭也有了退场手感。
- 商店按钮分级：已装备/已拥有「装备」为绿色，可购买价格按钮为金框（带内发光），余额不足时转为暗红 + 降饱和（filter:saturate(.5) brightness(.85)），一眼能分辨「能买/买不起/已拥有」。
- 验证：r161-store-badges2.png（可购买金色按钮 + 绿色装备）、r161-store-locked2.png（银行余额 120 时价格按钮暗红降饱和）、关闭动画 class 时序 closing → hidden；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。测试后已把本地存档银行/宝石恢复原值（5095 / 103）。

2026-10-23（第一百六十二轮）：UPGRADES 页升级预览与满级态。
- 每行新增效果预览：磁铁「9.0s → 10.2s」、金币「100% → 125%」、复活「50 金币 → 40 金币」（满级时显示「已达上限 · 12.6s / 175% / 20 金币」）。
- 等级条从三个小圆点改为 20×7 分段金条（点亮段带金色渐变 + 微光晕）；满级行加左侧绿色描边和「已满级」绿色徽章。
- 修复：曾把面板标题随 tab 切换成 UPGRADES 字标，和 tab 栏的 UPGRADES 重复，已回退为固定 STORE 标题（当前 tab 仍由金色下划线指示）。
- 验证：r162-upgrades3.png（Lv.0/3 + 效果预览）、r162-upgrades-max.png（满级绿框 + 已满级）、移动端 r162-mobile.png；测试后已恢复存档（upgrades 全 0）；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百五十轮盘点）：3000 tick 长跑 QA + 还原度清单。
- 长跑：持续补护盾的脚本跑到 3155m / 36 转弯仍存活；之后护盾空档被追逐者抓住，结算面板正常（3194m、213 金币、×5、最佳 4990）。
- 新增商店「NEW」徽章：万圣狼人、血鬼名字旁的橙色 NEW 角标。
- 修复结算页复活按钮文案：未复活但计时已过时显示「已过期」而不是「已用」。
- README 新增「当前还原度」模块清单（地图/角色/场景/障碍/音效/结算/UI/玩法/适配）。
- 回归 bot 1600 tick → 1656m / 18 转弯；`npm run temple:build` 1.27s；console 0 error / 0 warning。

2026-10-23（第一百六十四轮）：石墩路障视觉升级。
- 单车道 blocker 从「光秃圆角石墩」升级为「雕花石台」：obstacleStoneAtlas 贴图（pedestalMat，0xd8c8a4）+ 顶部金饰条 + 侧面苔藓 + 底座台 + 四角石墩，1.9×2.15×1.15，看起来像神庙里的石台/祭坛，挡路意图更明确。
- 试过用原版 decor-rock-a 当大石（boulderMat），但它的网格是尖刺状根岩，放到路中间像一堆黑色残枝，判定不出「要换道」，已回退为雕花石台方案。
- 验证：r164-block-final2.png（左侧车道雕花石墩 + 转弯提示）、移动端 r164-mobile.png；回归 bot 1600 tick → 1656 m / 18 转弯（一路上多块石墩都靠换道通过）；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百六十五轮）：石台火盆 + 火焰灯光池泄漏修复。
- 雕花石台顶部加火盆：石碗 + 金环 + FX.flame 火苗 + 光晕，石台从「石墩」变成「燃烧的祭坛路障」，远距离也能一眼看到；
- 修复一个真实的性能/灯光 bug：`flames` 数组只增不减 —— 路口生成的两个角落火把（flames.push(createTorch(...)) 但没进 junctionFlames）在每次重建路口后被从场景移除，但数组仍持有引用。跑 1200 tick 后 165 个火焰里有 78 个是「孤儿」，灯池会继续把它们当光源候选。
- 修复：在 `update()` 里按里程做火焰 GC（每 24m 清理一次，向上遍历 parent 判断是否还在 scene 里）。修复后 1317m 长跑里 flames 稳定在 87 个、孤儿 0。
- 验证：r165-blockfire.png（石台顶部火盆）、移动端 r165-mobile.png；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百六十六轮）：对象池长跑审计 + 能量条满格展示。
- 审计 13 个运行时对象池（flames/sparks/waterfalls/gateways/monkeys/coins/gems/pickups/dust/fireflies/leaves/sway/watch/obstacles）：1762m 长跑前后全部稳定，无泄漏（新增 debug `pools()`）；顺带确认金币/宝石/道具/猴子/门架在离开屏幕后都被正确回收。
- 能量条满格展示：原来充能满的瞬间立刻清零并触发道具，玩家几乎看不到「条满了」。现在满格会保持 0.55s（`.full` 金色光晕 + 火花 + 屏幕闪光 + meterFull 音效），然后才清零并随机获得道具；新增 debug `chargeMeter(n)` 便于验证。
- 验证：r166-meter3.png（满格保持阶段 100% + full 光晕）、r166-meter4.png（保持结束 → 金币加成 7s 徽章、条归零）、移动端 r166-mobile.png；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百六十七轮）：WebGL 几何体泄漏修复。
- 发现长跑 GPU 资源持续增长：1656m 跑完 renderer.info.memory.geometries 从 186 涨到 580（+394），原因是「每次生成/重建都 new 几何体」：石台 3 个 RoundedBox、深坑 4 个 Plane、接触阴影 2 个 Circle、道具/宝石的 Octahedron/Torus、以及**每次过弯重建的路口**里的 RoundedBox/Box/Plane/apron。
- 修复：新增 `sharedGeo` 缓存（路口 pad/base/paving/quad/apron、深坑水面/洞面、石台三段、道具与宝石），深坑洞面改用 1×1 平面 + scale；`addContactShadow` 改用按半径/透明度缓存的 Circle 几何与材质。
- 效果：1656m 首跑 geometries +156（且第二次 1600 tick 长跑 geometries/textures/programs **完全不变**：260→260 / 39→39 / 22→22），确认泄漏已封；新增 debug `gpu()` 查看 renderer.info。
- 验证：回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百六十八轮）：WebAudio 节点审计 + README 系统清单。
- 给 sfx.js 加节点统计 `stats()`：created / ended / loopsOpen / ambOn / frictionOn / fallOn；每次 playBuffer 创建 source 时计数，source ended 时计数并 disconnect；stopLoop 在淡出后 disconnect source 与 gainNode。
- 真实时间实测（非模拟）：开局 9 秒 + 一次跳跃 → created 15 / ended 15 / active 0、loopsOpen 0、ambOn false，确认没有 WebAudio 节点累积。
- README 追加「系统清单与调试接口」：运行时子系统表、调试接口（pools/gpu/audioStats/chargeMeter/setMilestone/givePower 等）、第 150-155 轮验证结论。
- 验证：回归 bot 1600 tick → 1656 m / 18 转弯；移动端 r168-mobile.png；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百六十九轮）：路口柱廊（神庙庭院感）。
- 在路口断头墙两侧加两根 9.2m 高古石柱（柱础 + 柱身 + 金环 + 柱头 + 金顶饰），形成「神庙庭院/山门」的框景；
- 入口两侧加两根低火柱（2.3m 石柱 + 金环 + 火盆），替代原计划的第二对高柱 —— 实测高柱会正好落在转弯时相机的扫过路径上，把画面挡住约 0.5s；
- 柱子在 `buildJunction` 重建，火柱火焰进 junctionFlames 池随路口重建回收。
- 验证：r169-junction3.png（弯前柱廊框景）、r169-junction5.png（转弯中无遮挡，只看到低火柱与火盆）、r169-junction6.png（转弯后走廊干净）、移动端 r169-mobile.png；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百七十轮）：路口地面日纹印章 + 断头墙挂幅。
- 地面印章：256² canvas 画的日纹圆盘（双环 + 16 道放射刻线 + 金色圆芯），3.6×3.6 半透明平面贴在路口压花地面（y .052、renderOrder 1），与 3D 金箭头叠成「罗盘 + 箭头」的转弯标识；
- 断头墙挂幅：复用柱廊红金旗帜纹理，2.3×4.4 挂在路口尽头的石框里（y 4.5，顶上金杆），和后面的神庙剪影、守卫猴一起把断头侧做成「庙门」；
- 验证：r170-medallion2.png（俯视：金色日纹印章在路口中）、r170-banner.png + 局部放大 /tmp/banner-zoom.png（石框里的红金挂幅 + 火盆 + 猴），移动端 r170-mobile.png；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百七十一轮）：路口守护兽 + 挂幅飘动。
- 守护兽：在路口断头侧左右各放一尊石兽（身体/兽首/口鼻/尖耳/前爪/金饰眼带，1.2m 级），面朝跑者蹲守，和守卫猴、火盆、挂幅组成完整的「庙门」；初版放在柱基处被矮墙挡住，已移到断头墙前 ±3.75m 的压实路面上。
- 挂幅飘动：路口挂幅每帧 `rotation.z=sin(runTime*1.7)*.035`、`rotation.x=sin(runTime*1.13+1)*.022`，配合 3D 箭头脉冲，让神庙门口有生气。
- 验证：r171-beast2.png（断头墙左右石兽 + 红金挂幅 + 猴 + 火盆），移动端 r171-mobile.png；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百七十二轮）：全局火焰摇曳 + 守护兽眼光。
- 火焰摇曳：frame() 中对全部 65 个火焰 Sprite 做双频正弦呼吸（`k=1+sin(runTime*7.3+i*1.9)*.07+sin(runTime*13.1+i)*.04`，基于各自初始 scale），所有火把/火盆/桥头灯都开始有真实的跳动感。
- 守护兽眼光：石兽双眼各加一颗金色 sparkle additive Sprite，每帧 `opacity=.55+sin(runTime*2.6+i*1.7)*.3` 呼吸发光。
- 修复：这两段动画最初被插进了「路口可见时才执行」的代码块里，离开路口就停止动画；已移到 frame() 主循环（经 `userData.baseScale` 实测 65 个火焰都在动）。
- 验证：r172-flicker2.png（路口火焰/光晕）；移动端 r172-mobile.png；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百七十三轮）：地形化火光 + 守护兽转头。
- `createBrazier(parent,x,z,tint)` 增加可选的火焰色；峡谷段火盆改为冷蓝白 `0xcfe8ff`，大厅/神庙保持暖金，让峡谷的湿冷感更明确（实测场景内冷色火焰 Sprite = 12、暖色 = 若干）。
- 守护兽头部拆成独立 headG 分组（头/口鼻/耳/金眼带都挂在 headG 下），每帧根据跑者世界坐标 `rotation.y=atan2(dx,dz)*.6` 缓慢转头追踪；配合之前的眼光呼吸，石兽会「盯着」跑者。
- 验证：`__templeDebug.junction().traverse` 找到 2 只石头守卫（世界坐标 ±2.9 / -59.8）；回归 bot 1600 tick → 1656 m / 18 转弯；移动端 r173-mobile.png（峡谷冷色火光）；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百七十四轮）：猴子偷金币动画。
- 偷窃触发后不再直接原地起飞：新增 leap 阶段（0.42s）——从墙上一跃而起，抛物线扑向跑者前侧（player + side*1.25 / y+1.15 / 前 1.55m），扑击时绕自身旋转；随后进入原来的横向逃跑上升阶段（1.5s）后回收。
- 猴子体型从 1.35 缩到 1.15，扑击落点放在跑者前侧而不是后肩，避免挡住镜头。
- 验证：r174-monkeyleap4.png（偷窃后猴子在跑者前侧飞扑，不挡人）；回归 bot 1600 tick → 1656 m / 18 转弯；移动端 r174-mobile.png；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百七十五轮）：猴子把偷到的金币抛向丛林。
- 偷窃成功时按偷到的数量生成对应的金币实体（buildCoinBody，scale .85），从猴子位置以抛物线向侧面丛林抛出（vx=side*(1.6+k*.35)、vy=3.6+k*.5、vz=-1.2-k*.4），受重力、旋转、1.1s 生命周期后回收；同时播 coinCascade 小音量。
- `stolenCoins` 池在 reset/clearObjects 时一并清理，避免残留。
- 验证：r175-toss2.png（猴子扑击后抛出的金币在跑者左侧飞过）；回归 bot 1600 tick → 1656 m / 18 转弯；移动端 r175-mobile.png；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百七十六轮）：峡谷风声（阵风版）。
- 原来峡谷用的是通用的低通噪声环境音（setAmbience('wind')），这次在 sfx.js 新增专用的 `startWind/stopWind/windInfo`：带通 620Hz + Q1.6 的噪声，叠加两路 LFO——0.14Hz 阵风扫频（±260Hz）与 0.09Hz 音量起伏，形成「风一阵阵刮」的感觉；增益按「在峡谷→前方 8m→前方/后方 24m」分四档（.2/.15/.1/.08），出峡谷即淡出。
- 主循环里保留 bridge 的水声 setAmbience('water')，峡谷不再使用通用环境音，避免两套风叠加；死亡/暂停时 stopWind。
- 验证：直接调用 `audio.startWind(.2)` 测得增益 2 秒内爬升到 .196、置 0 后衰减到 .014；场景内 windOn=true 且增益随峡谷距离变化；回归 bot 1600 tick → 1656 m / 18 转弯；移动端 r176-mobile.png（峡谷）；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百七十七轮）：峡谷风痕粒子。
- 新增 `windStreaks`：7 条加色 `FX.sparkle` 拉伸精灵（4.2×.26），在峡谷段以相机为参考系横向掠过：`camera.getWorldDirection` + 右向量定位，沿左右方向 7.5m/s 往返，z 4-26m 前，y 0.2-2.6，透明度随正弦呼吸。
- 修复两次：① 最初用世界坐标 z 偏移，跑过转弯后方向不对 → 改为相机相对坐标；② 透明度/亮度太低看不见 → 提高到 .4±.16 并加长。
- 非峡谷段全部隐藏（`visible=false`）。
- 验证：r177-streaks5.png（裁剪可见走廊里的淡色风痕）；移动端 r177-mobile.png；回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百七十八轮）：峡谷雾气随风飘动 + 修复一次代码删除事故。
- 峡谷雾气加入 Wind sway：每团雾在上升同时 `x = baseX + sin(runTime*.7 + baseY*2.7)*1.5`，实测同一团雾 x 从 -8.30 → -7.85 缓慢摆动，配合风声更自然。
- 事故与修复：试做「风痕粒子」时用脚本删除实验代码，误删了相邻的一段声明与函数（`swayLeaves`、`watchMonkeys`、`_tmp`、`spawnLeaf` 及 `coinItems/gemItems/pickups` 之外的部分相邻内容），导致 `ReferenceError: swayLeaves is not defined` → 游戏第一帧就报错结束。已逐一恢复：
  * 重新声明 `swayLeaves / watchMonkeys / _tmp`（并确认 `coinItems/gemItems/pickups/obstacles` 原在别处声明，未重复）；
  * 重写 `spawnLeaf()`（叶子 Sprite：leafAtlas 贴图、0.22-0.44 缩放、从 7.2-10.4m 高处下落、带 baseX/phase 摆动字段），恢复「空中飘落树叶」系统（池计数回到 6）。
- 教训：批量删代码前先 `grep` 待删区间内的所有 `const/let` 声明和函数名，逐条确认引用面；删除后用完整 bot 回归（1600 tick，18 转弯）+ console 检查，而不是只截一张图。
- 验证：全量回归 bot 1600 tick → 1656 m / 18 转弯 / 178 金币，console 0 error；移动端 r178-mobile.png；`npm run temple:build` 通过。

2026-10-23（第一百七十九轮）：菜单按钮单行化 + 随机输入压测 + 备份。
- 先 `cp target/temple-run/web/src/main.js target/temple-run/analysis/main.js.backup-r166` 建立安全点（吸取上轮误删教训）。
- 随机输入压测：8 局随机方向键连打（每 7 帧一次），8 次死亡→重开全部正常，console 0 error，无卡死/状态泄漏。
- 菜单四个字标按钮原本在 440px 面板里挤成两行（OBJECTIVES 单独第二行），改为 `flex-wrap:nowrap` + 字标高度 15px + gap 6px：桌面与 390px 移动端都能单行放下，菜单更整齐。
- 验证：r179-menu2.png（桌面：STORE/OPTIONS/STATS/OBJECTIVES 一行）、r179-menu-mobile.png（移动端一行）；全量回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百八十轮）：屏幕边缘转弯箭头带倒计时。
- 边缘大箭头（手机/桌面都用）原来只显示「左转/右转」，现在显示「左转 · 15m」：`turnEdgeTxt = dir + ' · ' + remain + 'm'`，与顶部提示条同步刷新；确认后仍显示「已确认」。
- 小步改动（先有 backup），DOM 校验：40m 处 `#turnEdge` class=`turn-edge left show`、文本 `左转 · 15m`。
- 验证：r180-edge.png（桌面左侧边缘箭头 + 顶部提示条都显示 15m）、r180-mobile.png；全量回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百八十一轮）：转弯最后 6 米的紧迫脉动。
- 边缘箭头在 `remain<=6m && !turnQueued` 时加 `.urgent`：0.42s 交替的 box-shadow 扩散 + brightness 1→1.3，提示「现在就要按键」。
- 先做备份：`analysis/main.js.backup-r168`、`analysis/style.css.backup-r168`。
- DOM 校验：`#turnEdge` 在 5m 时 class=`turn-edge left show urgent`，10m 时无 urgent；顶部提示条与边缘箭头同步显示 5m。
- 验证：r181-urgent2.png（桌面左侧 urgent 箭头）、r181-mobile.png（移动端）；全量回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百八十二轮）：已确认转弯的绿色反馈修复。
- 发现真实 bug：边缘箭头原本 `near = remain<=18 && !turnQueued`，一旦按键确认就立刻隐藏，导致上一轮加的 `.ready` 绿色确认态**永远看不到**；改为 `near = remain<=18`，确认后箭头保持显示「已确认」直到过弯完成。
- 绿色确认 flare：`.turn-edge.ready` 新增一次性 `edgeReady` 动画（box-shadow 6→24px 绿光、brightness 1.4→1），配合顶部「转弯已确认」条形成双重确认。
- 验证：r182-ready2.png（顶部「转弯已确认」+ 左侧「已确认」双绿）、r182-mobile.png；DOM 校验 class=`turn-edge left show ready`、文本「已确认」；全量回归 bot 1600 tick → 1656 m / 18 转弯；build 通过；console 0 error / 0 warning。

2026-10-23（第一百八十三轮）：路口前的镜头轻微前推（dolly-in）。
- 追尾镜头新增 `approach=(24-(nextTurn-distance))/24` 与 `dolly=approach*1.15`：离路口 24m 内相机逐渐向跑者方向推近最多 1.15m、同时压低 0.26m，过弯后随 nextTurn 跳远自然复位。
- 效果：接近路口时画面更聚焦、速度感更强；实测相机↔跑者水平距离 11.06m → 10.17m（推近 0.9m），相机高度 4.37。
- 兼容性：与转弯镜头、落地/受击抖动、跳跃跟随叠加正常；转弯中帧无穿模（r183-midturn.png）。
- 先备份 `analysis/main.js.backup-r170`。
- 验证：r183-dolly.png（路口前 0m 近景）、r183-midturn.png（转弯中「漂亮的转弯」）、移动端 r183-mobile.png；全量回归 bot 1600 tick → 1656 m / 18 转弯；build 1.08 s；console 0 error / 0 warning。

2026-10-23（第一百八十四轮）：转弯确认的绿色粒子与触感反馈。
- 按下正确方向确认转弯时：在跑者胸前爆一圈 8 颗绿色 `fx-spark`（0xa8e88d，spread 1.0，size .32，life .5），同时触发 `haptic(12)` 轻震动（移动端）。
- 与已有的 click 音效、顶部「转弯已确认」条、边缘「已确认」绿箭头组成完整的确认反馈链。
- 实测：确认瞬间 sparks 池 17 → 25（+8），turnQueued=true。
- 先备份 `analysis/main.js.backup-r171`。
- 验证：r184-confirm-sparks.png（跑者周围绿色粒子 + 双绿确认 UI）、移动端 r184-mobile.png；全量回归 bot 1600 tick → 1656 m / 18 转弯；build 通过；console 0 error / 0 warning。

2026-10-23（第一百八十五轮）：过弯 FOV 冲击调强。
- `turnKick` 的 FOV 加成从 6 → 9，衰减从 dt*2.2 → dt*1.6：过弯瞬间视野「punch」更明显、回落更从容。
- 实测（65.2 基准）：过弯后 5 个采样内冲到峰值 **74.7**，随后约 0.7s 平滑回落到 71.5→65。
- 与 turnFlash 的 +4 FOV、boost 的 +5、速度项叠加正常；非过弯状态 FOV 稳定 65.2。
- 先备份 `analysis/main.js.backup-r172`。
- 验证：r185-fov.png（过弯中广角 + 漂亮的转弯）、移动端 r185-mobile.png；全量回归 bot 1600 tick → 1656 m / 18 转弯；build 通过；console 0 error / 0 warning。

2026-10-23（第一百八十五轮）：过弯 FOV 冲击与 dolly 协调。
- `turnKick` FOV 加成 6 → 7，衰减 dt*2.2 → dt*1.9（先试过 9/1.6，过弯瞬间视野过夸张，回退折中）。
- 接近路口的 dolly-in 现在随 `turnAmount` 淡出：`dolly=approach*1.15*(1-min(1,turnAmount*1.4))`，避免「前推 + 转弯镜头 + 广角」叠加把画面推得太近。
- 实测 FOV：基准 65.2 → 峰值 73.1 → 约 0.7s 回落到 69.8；非过弯稳定 65.2。
- 移动端逐帧检查 160/320/520ms：160ms 构图稳定（跑者居中 + 双绿确认），520ms 处于相机随弯道摆动的过渡相位（跑者在画面右缘，属已知瞬时状态）。
- 备份：`analysis/main.js.backup-r172`。
- 验证：r185-fov.png、r185-mobile2.png；全量回归 bot 1600 tick → 1656 m / 18 转弯；build 1.05 s；console 0 error / 0 warning。

2026-10-23（第一百八十六轮）：过弯相机距离修正（含两次失败尝试）。
- 用新 debug 指标 `cameraGap()`（相机↔跑者水平距离 / 高度 / FOV）采样过弯过程：发现旧参数下过弯中相机距离被压到 **6.47m**（空间上贴着跑者），这是过弯中段画面构图崩坏/跑者被裁到画面边缘的根因。
- 修复：过弯时相机沿弧线锚点距离由「10.2 − turnAmount*0.6」改为「10.2 + turnAmount*2.2」，补偿弧线几何压缩。采样：最差距离从 6.47m 提升到 **7.61m**，中段 8.6–9.5m；640ms 帧画面已恢复「走廊 + 跑者居中偏左」的正常构图。
- 中途两次失败尝试（已回滚）：① 相机 55% 向「跑者正后方」混合切角 → 相机进墙、画面全白；② 25% 切角 + 抬升 → 跑者出画。结论：转弯相机只能用弧线锚点 + 距离补偿，不能做位置切角混合。
- 备份：`analysis/main.js.backup-r173`；新增 debug `cameraGap()` 供后续调参。
- 验证：r186-back640.png（过弯中段构图正常）、r186-back-post.png（出弯后标准追尾）、r186-desktop.png；全量回归 bot 1600 tick → 1656 m / 18 转弯；build 通过；console 0 error / 0 warning。

2026-10-23（第一百八十七轮）：路面前几米画出转弯指示箭头。
- `buildJunction` 在弯前 8m / 15m 各铺一块 4.4×2.2 的路面箭头贴花（canvas 256×128 双箭头、白金色 + 深金描边、透明底），左转时旋转 180° 指向左，右转指向右；与顶部提示条/边缘箭头/3D 金色箭头形成「HUD + 地面」双通道指引。
- 生命周期：每次 beginTurn 重建时清掉旧的 `turnGuides`；`clearObjects()`（重开/切场景）也会清理，避免残留。
- 先备份 `analysis/main.js.backup-r174`。
- 验证：r187-guide.png（10m 处地面双箭头 + HUD「前方左转 · 10m」）、r187-mobile.png、r187-guide-right.png（右侧测试姿态）；全量回归 bot 1600 tick → 1656 m / 18 转弯；`npm run temple:build` 通过；console 0 error / 0 warning。

2026-10-23（第一百八十七轮补记）：
- 第一次插入贴花时匹配锚点错位，代码被插进了 `makeHall()`（那里没有 `dir` 变量），运行期报 `ReferenceError: dir is not defined`，整个游戏在第一处柱廊段报错停摆。已把整段代码移到 `buildJunction()` 中的饰带/挂幅区域，并重新验证 0 error。
- 复查：本次事故与第 165 轮同类（插入位置未校验作用域）——今后插入代码后先 `grep -n` 检查所在函数，再跑完整 bot + console。

2026-10-23（第一百八十八轮）：路面箭头与确认状态联动。
- `turnGuideMats` 保存弯前路面箭头的材质；frame() 每帧按 `turnQueued` 统一着色：未确认 → 白金色，确认后 → 绿色（0xa8e88d），与顶部提示条 / 边缘箭头 / 跑者绿色粒子同步。
- 弯前地面箭头现在有完整状态机：白=待操作、绿=已确认；过弯重建时随 `turnGuides` 一起清理。
- 先备份 `analysis/main.js.backup-r175`。
- 验证：r188-guide-white.png（21m 处白色箭头）、r188-guide-green.png（确认后箭头变绿 + 顶部绿条 + 绿色粒子）、移动端 r188-mobile.png；全量回归 bot 1600 tick → 1656 m / 18 转弯；build 1.05 s；console 0 error / 0 warning。

2026-10-23（第一百八十九轮）：路面箭头流水脉动 + 真正实现确认变绿。
- 修正上一轮的疏漏：`turnGuideMats` 当时只被填充、**没有任何着色代码**（frame 里的替换锚点没匹配上），所以「确认变绿」实际未生效。本轮把着色 + 脉动真正插入 `frame()` 主循环：
  * 每帧按 `turnQueued` 着白/绿；
  * 两张箭头贴花按 `sin(runTime*5.2 - i*1.5)` 交替呼吸（透明度 0.6±0.28，确认后 0.95±0.28），形成朝路口方向的流动感。
- 验证：r189-flow1.png（21m 白色脉动箭头）、r189-flow-green.png（确认后绿色箭头 + 绿色粒子 + 顶部绿条）、移动端 r189-mobile.png；全量回归 bot 1600 tick → 1656 m / 18 转弯；build 1.04 s；console 0 error / 0 warning。

2026-10-23（第一百九十轮）：路口翼墙加压顶石与雉堞。
- 翼墙（翼墙 = 路口两侧引导相机与视觉的矮墙）顶部加 1.3 宽的压顶石条（ancientStone），并在出弯方向两段墙顶按每 2.0m 加一垛 0.7×0.42×1.24 的雉堞（共 9 垛/段），与断头墙的城垛造型统一。
- 效果：转弯时两侧不再是光板石墙，而是带城垛口的庭院围墙，与柱廊、火柱、挂幅形成完整神庙庭院。
- 先备份 `analysis/main.js.backup-r177`。
- 验证：r190-wing3.png（出弯后翼墙压顶 + 雉堞清晰）、r190-desktop.png；全量回归 bot 1600 tick → 1656 m / 18 转弯；build 1.04 s；console 0 error / 0 warning。

2026-10-23（第一百九十一轮）：路口翼墙壁灯。
- 翼墙内侧共 10 盏壁灯（石托 + 石碗 + FX.flame 火苗 + 光晕）：入弯侧每墙 2 盏、出弯侧每墙 3 盏；火焰注册进 junctionFlames/flames 光池，转弯时庭院被照亮。
- 修复两个 bug：① 插入代码时 `wx/wingCenter` 是相邻块作用域变量 → 运行期 `ReferenceError: wx is not defined`，改为直接写常量（5.0 / 9.5）；② 壁灯火苗既 push 进 flames 又经 `junctionFlames.forEach` 二次 push → 每次路口重建泄漏重复引用，已改为只进 junctionFlames 再由统一 forEach 加入。
- 顺带把「断头墙两侧火把」也纳入 junctionFlames（之前只 push 进 flames，路口重建时同样泄漏 2 个）。
- 验证：r191-lamps3.png（出弯时翼墙壁灯成排亮起）、r191-mobile.png；全量回归 bot 1600 tick → 1656 m / 18 转弯，flames 池在 75 稳定（长跑审计历史结论：一次性地貌内容后不再增长）；build 1.02 s；console 0 error / 0 warning。

2026-10-23（第一百九十二轮）：翼墙壁灯随接近逐盏点亮。
- `junctionLamps` 记录每盏壁灯（sprite + 基础透明度 + 序号）；frame() 用 `ap = clamp((24-remain)/24)` 计算接近度，按 `lit = clamp(ap*3.2 - i*0.12)` 让壁灯从入口向转角逐盏亮起（远处只保留 12% 微光，全部亮起时 90%）。
- 实测 22m 处：壁灯透明度序列 0.90/0.90/0.61/0.52/0.42/0.33/0.23/0.14/0.11…（越靠近入口越亮）；36m 处全部 0.11 微光。
- 与原有全局火焰闪烁兼容（闪烁作用在 base 上，点亮系数再乘）。
- 先备份 `analysis/main.js.backup-r179`。
- 验证：r192-lamps-near.png（22m 壁灯渐次点亮）、r192-mobile.png；全量回归 bot 1600 tick → 1656 m / 18 转弯；build 1.02 s；console 0 error / 0 warning。

2026-10-23（第一百九十三轮）：确认转弯后壁灯整体爆亮。
- 壁灯点亮规则扩展：`turnQueued` 时速度 3.2→5.5、序号衰减 .12→.04，并且每盏灯至少 `max(lit, .55+ap*.45)`——确认瞬间整排壁灯从微光跳到 55%+ 亮度，随接近继续到 100%。
- 实测（22m 处）：确认前 0.11 微光 → 确认后 0.55 全排；同时顶部变绿、路面箭头变绿、跑者绿色粒子。
- 修复插入疏漏：`junctionLamps` 重建时未清空（第一次 replace 未命中），导致旧路口灯 sprite 残留、序号错位、点亮阈值永远达不到；已在 `buildJunction` 清理区补 `junctionLamps.length=0`。
- 先备份 `analysis/main.js.backup-r180`。
- 验证：r193-lamps-flare.png（确认后整排壁灯亮起）、r193-mobile.png；全量回归 bot 1600 tick → 1656 m / 18 转弯；build 1.09 s；console 0 error / 0 warning。

2026-10-23（第一百九十四轮）：确认转弯时路口火盆爆燃 + 火星四溅。
- 新增 `flareJunction()`：在正确确认转弯的瞬间被调用，做两件事——
  1. 给路口 10 个火焰（火盆/火把/壁灯）各喷 3 颗橙色火星（0xffb066，spread .7，life .62）；
  2. 置 `junctionFlare=1.1`，frame() 中让路口火焰缩放瞬时放大 1.55 倍后按 dt*2.6 衰减回原尺寸（记录 `_sx/_sy` 基准，不会漂移）。
- 实测确认瞬间 sparks 池 16 → 53（绿色确认粒子 8 + 火焰火星 30），与壁灯爆亮、路面箭头变绿、火盆爆燃同步，形成「场景被点亮」的强反馈。
- 先备份 `analysis/main.js.backup-r181`。
- 验证：r194-flare.png（确认后火星四溅 + 火盆变大）、r194-mobile.png；全量回归 bot 1600 tick → 1656 m / 18 转弯；build 1.03 s；console 0 error / 0 warning。

2026-10-23（第一百八十二轮）：全量审计（1:1 清单 + 性能 + 资源）。
- 帧率：桌面/移动端均 60fps（median 16.7ms，p95 16.8ms）。
- 渲染负载：中段 draw calls ≈400–800、三角形 2–11 万；首帧 calls 199 / tris 9.3k。
- 资源增长：整跑 189→281 geometries、29→40 textures 后饱和；2.8km 长跑复核无持续增长。定位到主要发生在第 1 个弯后的瓦片回收/地貌懒构建阶段（一次性）。
- 音频：真实时间下 created==ended、active 0；模拟快进会出现节点累积（WebAudio 时钟不随 advanceTime 前进，属测试假象，已记录）。
- 功能矩阵实测：换道 lane 0→2、跳跃 jumpY 1.02、滑铲 sliding 0.90、金币拾取、护盾拾取全部通过。
- README 新增「1:1 还原对照清单（第 182 轮审计）」与「性能与资源」两节。
- 截图：r195-final.png（弯前 4m：地面双箭头 + 边缘箭头 + 顶部提示）。

2026-10-23（第一百九十六轮）：结算/复活/重开状态机全链路 QA。
- 全流程实测：死亡 → 宝石复活 → 再死（已用）→ 再点复活（无反应）→ 重开 → 暂停/继续 → 回主菜单 → 新一局，状态全部正确（ended→playing→ended→playing→paused→playing→menu→playing）。
- 修复无障碍/防误触：复活按钮之前只用 CSS 类 `.disabled`，原生 `disabled` 属性一直是 false；现在 `updateReviveButton()` 在「已用 / 复活过期 / 币不足」三种情况下同时设 `btn.disabled=true`，可用时设 false。实测：本局已复活后原生 disabled=true 且点击无效；重开后再次死亡会正确恢复可用（宝石复活 ◆1）。
- 验证：r196-revive.png（结算面板：宝石复活 ◆1 可用态）、r196-mobile.png；全量回归 bot 1600 tick → 1656 m / 18 转弯；build 通过；console 0 error / 0 warning。

2026-10-23（第一百九十七轮）：复活按钮三态统一（金币/宝石/币不足）。
- 金币态：翅膀 + 「金币复活」 + 金币图标 + 金色数字（numHTML），如 ⛁ 50；
- 宝石态：翅膀 + 「宝石复活」 + 宝石图标 + 数字，如 ◆ 1；
- 不可用态：按钮置灰 + 原生 disabled + 「币不足」角标，下方提示「需要 50 金币或 1 宝石（本局 X 金币 / Y 宝石）」。
- 新增 CSS `.revive .cost .cost-ico`（17px、下移 3px、投影）与 `.cost` 的 inline-flex 对齐。
- 实测三态截图：r197-revive-coins.png / r197-revive-gems.png / r197-revive-none.png；移动端 r197-mobile.png。测试后已把存档宝石恢复为 161。
- 全量回归 bot 1600 tick → 1656 m / 18 转弯；build 通过；console 0 error / 0 warning。

2026-10-23（第一百九十八轮）：暂停面板加「本局转弯」并用 2×2 网格。
- 新增本局计数 `runTurns`（`completeTurn` 时 +1，`reset` 清零），暂停面板显示「本局转弯」。
- 暂停统计区改为 2×2 网格（本局距离/本局金币/本局转弯/当前倍率），避免 4 项挤在一行时第 4 项换行、面板高度跳动；`justify-items:center` + `min-width:0` 保证窄屏不溢出。
- 验证：r198-pause5.png（桌面 2×2）、r198-mobile.png（移动端）；全量回归 bot 1600 tick → 1656 m / 18 转弯；build 通过；console 0 error / 0 warning。

2026-10-23（第一百九十九轮）：长跑审计发现并修复「追逐者长时间挡镜头」。
- 2.4km 脚本长跑（持续护盾）截帧发现：玩家在 2566m 被护盾连续抵挡撞击后，**带翼追逐者停在相机与跑者之间约 8 秒**（chaseGap 卡在 3.65m），大面积遮挡跑道。
- 根因：`chaseGap` 的目标值用 `stumbleCooldown>0`（8 秒）驱动，而不是「扑击窗口」；等于每次绊倒都在镜头前挂 8 秒。
- 修复：新增独立 `stumbleLunge=1.6`，只有扑击窗口内 chaseGap 目标为 3.6m，窗口结束立即阻尼回 11.5m（隐藏）。玩法不变：8 秒内再撞仍会被扑到（stumbleCooldown 计时保留）。
- 实测：绊倒后 0.22s gap 3.74m + 追逐者可见（扑到镜头前）；2.6s 后 gap 8.37m、不可见（退回远处）。
- 验证：r199-lungeA.png（扑击瞬间）、r199-lungeB.png（迅速退回、跑道无遮挡）；bot 1600 tick → 1656 m / 18 转弯；build 通过；console 0 error / 0 warning。

2026-10-23（第二百轮）：护盾视觉重做（半透明能量罩）。
- 问题：护盾原来的球壳是普通混合 + DoubleSide + opacity .22，渲染成一层灰白雾，几乎盖住角色。
- 修改：`shieldBubble` 改 `THREE.AdditiveBlending` + `FrontSide`（单层叠加）+ 颜色 0x8fdcf4，运行时透明度 .28±.07 呼吸——现在是带青蓝边缘光的「玻璃能量罩」，角色清晰可见。
- 缩放脉动保留（1.05/1.25 ±5%），护盾抵挡撞击时的破碎粒子/闪光不受影响。
- 先备份 `analysis/main.js.backup-r187`。
- 验证：r200-shield.png（旧）、r200-shield3.png（新：角色透出、青蓝罩子）、r200-mobile.png；全量回归 bot 1600 tick → 1656 m / 18 转弯；build 通过；console 0 error / 0 warning。

2026-10-23（第二百另一轮）：磁铁视觉改成双层能量环。
- 原磁铁只有一圈 .62 半径的橙色圆环，像「呼啦圈」。现在改为两层：
  * 内环 .62×.035（0xff7a52，透明度 .85），绕自身 z 轴 3.2rad/s 旋转并前后倾斜；
  * 外环 .92×.028（0xffb994，加色混合、透明度 .5），反向 2.1rad/s 旋转、独立倾斜相位；
  * 两环 y 1.15 上下浮动，形成交错的「磁场」观感，角色仍清晰可见。
- 生命周期与磁铁状态同步（reset/死亡/过期全部隐藏）。
- 先备份 `analysis/main.js.backup-r188`。
- 验证：r201-magnet2.png（双层环）、r201-mobile.png；全量回归 bot 1600 tick → 1656 m / 18 转弯；build 通过；console 0 error / 0 warning。

2026-10-23（第二百另一轮）：低矮拱门障碍造型重做（滑铲可读性）。
- 问题：原「树枝拱门」是两根木柱 + 横枝 + 三团苔藓球，远看像悬空绿灌木；横梁 2.15m 高，视觉上更像能从底下跑过去，与「必须滑铲」的判定不符。
- 重做：横梁降到 **1.34m**（站跑明显过不去），柱顶加石帽 + 金边，梁上压 3.1m 宽石质门楣（obstacleStone + 金条），苔藓球改为 4 条下垂的苔藓细条（细圆柱），整体读作「低矮神庙门洞，必须滑铲」。
- 碰撞/判定参数未改（仍为 `arch → 滑铲`，高度阈值不变）。
- 先备份 `analysis/main.js.backup-r189`。
- 验证：r203-arch.png（改造前）、r203-arch2.png（石楣+苔藓条）、r203-arch-slide.png（滑铲穿过低梁）、r203-mobile.png；全量回归 bot 1600 tick → 1656 m / 18 转弯；build 通过；console 0 error / 0 warning。

2026-10-23（第二百另一轮）：车道石台障碍（block）改金边雕饰。
- 问题：石台正面是一条苔藓色横带，在暖光下偏青绿，和周围黄石路面不协调，也不像“神庙祭台”。
- 修改：苔藓带换成两条金边雕饰带（mats.gold，1.6×.14 与 1.5×.10），保留顶部火盆 + 火焰作为“别撞我”的最强提示。
- 先备份 `analysis/main.js.backup-r190`。
- 验证：r204-block2.png（金边石台 + 火盆）、r204-mobile.png；全量回归 bot 1600 tick → 1656 m / 18 转弯；build 通过；console 0 error / 0 warning。

2026-10-23（第二百一十三轮）：坑洞（gap）加宽到整条路宽，修复「看得见能绕、实际全宽必踩」的视觉/判定不一致。
- 问题：坑洞平面只有 3.9 单位宽（整条路 8 宽），但碰撞是 full（整路宽），右侧看起来还有可走的路面，实际却算踩空。
- 修改：主洞加宽到 7.5，副洞 6.1/4.6；石质崩口从 7 块增到 13 块（i=-6..6）覆盖全宽；两侧金线 3.9→7.4；火盆柱 ±2.05→±3.4；水面缩回 1.3×1.35 避免溢出到路面。
- 先备份 `analysis/main.js.backup-r191`。
- 验证：r205-gap3.png（整路宽坑洞 + 双火盆）、r205-mobile.png；跳跃实测 peak jumpY 1.57、state playing；全量回归 bot 1600 tick → 1656 m / 18 转弯；build 1.05 s；console 0 error / 0 warning。

2026-10-23（第二百一十四轮）：火焰障碍改为叠加广告牌火舌。
- 问题：原火焰墙主体是 6 个发光圆锥，截图里像一排硬边的黄色三角锥，缺乏火焰质感。
- 修改：圆锥透明度降低（outer .88→.6、core .95→.72），每个喷口改为两层加色 `FX.flame` 广告牌（宽底焰 1.0×1.5 + 内侧高火舌 .55×1.25，颜色 0xffb066 / 0xffe0a8），并保留外圈 glow 与火焰抖动。
- 先备份 `analysis/main.js.backup-r192`。
- 验证：r206-fire.png（柔和火舌墙）、r206-mobile.png；火焰跳跃实测 fired=true、peak jumpY 1.57、state playing；全量回归 bot 1600 tick → 1656 m / 18 转弯；build 1.10 s；console 0 error / 0 warning。

2026-10-23（第二百一十五轮）：完整验收记录。
- 逐项验收：启动/交互/转弯/面板/结算/复活/移动端/帧率，全部通过（详见 README「验收记录（第 193 轮）」）。
- 关键数值：jumpY 0.86、sliding 0.90、lane 1→2、Escape→paused→继续→playing、cue 39m 内确认 → turnCount 1、漏按 57+2m 死亡、宝石复活可用；移动端 60fps（worst 23.5ms）。
- 截图：r207-accept.png（桌面 magnet 中）、r207-mobile.png（移动端结算）。
- 至此 README「1:1 还原对照清单」所有模块均为 ✅，本轮起进入维护/细节模式。

2026-10-24（用户反馈三连修）：预览鬼畜 / 提示挡视线 / 弯道“刷新才出现”。
① 切人物预览鬼畜
- 根因：预览模型用 `scale=0.27` + `position.y=1.32` 后只居中 XZ，人物脚在 -2.2m、整体偏出画布；且换人时异步 `runnerRig` 纹理覆盖旧材质，先后材质并存造成闪烁。
- 修：`fitPreviewRig()` 按 bbox 自动框选（`scale=1.62/maxDim`，最低点落到 y=0，相机 (0,1.32,5.8) 看向 bbox 中心）；`setPreviewChar` 改为通过 `previewToken` 丢弃过期的异步 rig 加载结果，确保最后一次点击生效；预览默认静止（可拖拽旋转）。
- 实测：`preview()` 返回 bbox y 0→2.63、pos y 1.23；快速连点 7 个角色无闪烁（r208-store-final.png）。
② “nicejob”提示遮挡视线
- 原 `#hint`（漂亮的转弯！/绊倒了！等）固定下方但 z-index 低、位置压在路面中央（top 约 44%）。改为底部小胶囊：`bottom: calc(112px + env(safe-area-inset-bottom))`、`top:auto`、半透明深底，位于方向盘上方、不压路面。
③ 路看着是直的、一刷新成弯道
- 根因：弯道路口原本在 `nextTurn-42m` 才 `buildJunction`，入弯段（`nextTurn-72m`）才改 path；在此之前远处“看起来是直路”，刷新/重生时预建才把弯道放出来，产生“直路突然变弯”的跳变。另本轮发现 `beginTurn()` 每帧重入会清空 `turnQueued`，导致已按键也判漏弯。
- 修：① `preBuildTurn()` 提前到 `nextTurn-72m`，把弯道几何/路口/翼墙一次性预建，入弯段再旋转路径时几何已就位（不再有直→弯跳变）；② `beginTurn()` 加 `turnCueShown` 一次性守卫，`completeTurn`/`reset` 复位，修复队列被清空；③ 入弯段保留低矮扶墙（仅在 2.5m 内隐藏瓦口），高植被/光柱在 16m 内隐藏，避免拐角出现空洞或树冠挡屏。
- 实测：入弯 49m/54m/58m 帧（r208-approach49e / r208-midturn / r208-hint-bottom4）；全量 bot 2600 tick → 1656m / 18 转弯，转弯点 57,249,345,429,465,561,765,789 稳定；build 1.26s；console 0 error / 0 warning；期间顺手修了 `nearTurnWide` TDZ 崩溃并重启 5173 dev server。
- 备份：`analysis/main.js.backup-r200`（预览修复前）。

2026-10-23（第二百一十九轮）：NICE JOB 弹窗遮挡 + 切皮肤加速 + 人物模型三连修。
1) NICE JOB 弹窗：原来 `top:43%` 在路中央、金框大牌 → 改为 HUD 下方的小牌子（top:calc(208px+safe)，art 22px / 文字 12.5px），只停留 2s；`msPop` 关键帧起始 opacity .55 避免动画首帧不可见；`highscore.png` 只在 m ≥ max(1000, 历史最佳) 时用，否则用 nicejob.png。新增 `__templeDebug.pinMilestone(sec)` 便于截图验证。
2) 切皮肤“越跑越快”：根因在 store 3D 预览 `renderCharPreview` 把 `previewRig.update(1/60, now/3200)` 的第二个参数当作动画 timeScale——它随页面运行时间线性增长，所以预览里的角色越跑越快。改为常数 1。实测游戏内速度不受切皮肤影响（Jhony/Selene 1s 均 12m）。
3) 人物 3D 建模：CHARS 增加 `rig`/`rtex` 字段，9 个角色分别加载 APK 里各自的原版 SkinnedMesh + 对应贴图（girl / Simone / Halloween_Runner / indi / china / MysticMonk / conquis / Scarecrow），并新增：
   - `normalizeRunnerRig()`：按 rest bbox 统一高度（2.55）、躺平模型自动立起（rot.x −90°）、脚底归零；
   - runnerRig.js `computeBindRest()` + bind-relative 重定向（q_target = q_restT * q_restS⁻¹ * q_src），解决 "Bone X" 骨架无动画轨的问题；
   - 仍有空轨的骨架用程序化 run/jump/slide（按骨骼名在世界轴换算到局部轴）兜底；预览/游戏中切换均有 token 防串台。
   - 已知遗留：APK 里的狼人/骷髅/宇航员是 skin bundle 里的独立网格，尚未导出，所以「万圣狼人」目前用万圣跑者网格、「骷髅」用稻草人网格，下轮补导出。
验证：store 逐个角色预览截图（werewolf/scarlett/ghost/conquistador/skeleton/selene）、游戏内 werewolf 跑动截图、rapid-switch 压测无 console error；bot 1600 tick → 1656m/18 转弯；build 1.44s；console 0 error。

2026-10-23（第二百二十轮）：人物全量对应 + 跑步姿势 + 商店预览吸附。
1) 从 APK 单独资产文件导出剩余人物：Werewolf(prefab e9748226 / mesh a321c7a3 / tex playerTextureHalloweenWerewolf)、SeleneAstronaut(085e0e7f / 7b485b7b / d05b6f22)、XiXueGui(b3b1e5f8 / 155210c9 / ee3bf64e) → `web/public/assets/characters/rig-{werewolf,selene_astronaut,xixuegui}.json` + `tex-*.png`（解析 prefab 外部引用 → mesh/material/texture 文件，导出同样 schema）。
2) 跑步姿势：APK 里高级皮肤骨架是 `Bone X`，自带 Run/Idle 剪辑（sharedassets0 path_id 159 Run 25 轨 / 161 Idle 34 轨 / 162 Run01 7 轨）。写了 `inject_clips.py` 把 Run 轨按骨骼名注入所有空 clips 的 rig（Simone/Jean/Viking/DragonQueen/Nutcracker/MysticMonk/Scarecrow/Halloween_Runner/hat/xixuegui），不再用 bind-relative 重定向生成跑步 → 万圣/宇航员等跑步不再诡异；默认男/女（Bip01 原生轨）不变。
3) 商店 3D 预览改为 `position:sticky; top:0; z-index:4` + 投影，列表滚动时预览固定不动（桌面 1280×720 与移动 390×844 均验证）。
4) 人物对应：selene→SeleneAstronaut、werewolf→Halloween_Werewolf、ghost→XiXueGui、scarlett→girl_Export1；「骷髅」在 APK 里只有贴图/prefab 桩没有网格，改为「稻草人」并对应 Scarecrow 模型。
5) 头像：新增 `previewShot()`（preview renderer 设 preserveDrawingBuffer），9 个角色从各自 3D 预览渲染头像覆盖 `web/public/assets/ui/avatar-*.png`，头像与模型一致。
验证：9 角色预览/头像/游戏内 werewolf+astronaut 截图；store 滚动吸附（桌面+移动）；bot 1600 tick → 1656m/18 转弯；build 1.12s；console 0 error。

2026-10-23（第二百二十一轮）：修复高级人物「喝多了」的手部动作（动画重定向）。
- 根因：APK 里只有万圣跑者（Halloween_Runner）这套骨架带 Run 剪辑（sharedassets0 path_id 159/161/162），其它高级皮肤骨架同名（Bone …）但 rest 姿势/骨骼顺序不同，直接把 clip 的绝对局部四元数套上去会导致手臂/骨盆扭成奇怪姿态。
- 方案（离线 `/tmp/charexp/retarget_run.py`，结果写回 `web/public/assets/characters/rig-*.json`）：
  * 以 Halloween_Runner_mesh 为源骨架，计算每帧「源世界旋转 × 源绑定世界旋转⁻¹」得到 bind-local 增量；
  * 目标骨架按 世界 = 目标绑定世界 × 源bind-local增量 逐帧解算，再转回局部四元数；可跨父子顺序/骨骼数量差异；
  * 对 rest 差异 >20° 的骨头（如吸血鬼骨盆 90°、稻草人上臂 85°）改用「目标rest × 源rest⁻¹ × 源局部」公式，避免整身倾斜；
  * 吸血鬼（XiXueGui，43 骨、多裙摆骨）重定向后仍会身体倾斜，改为直接套原版 clip（站姿自然，手臂略收）。
- 验证：rig-preview 固定 t=0.18 帧（宇航员/狼人/稻草人/Simone/Viking 均为自然摆臂跑步），商店预览与游戏内宇航员/狼人跑动自然；avatar 用新姿势重渲染。
- bot 1600 tick → 1656m/18 转弯；build 1.52s；console 0 error。

2026-10-23（第二百二十二轮）：按模拟器里的原版反馈逆向并补齐 5 项。
逆向证据（IL2CPP global-metadata.dat 字符串）：`AllowTiltToTurn`、`AllowFallOnCliffs`、`CanPathExtendOnSide` / `CanPathExtendOnSide2`、`DoesSidePathHaveObstacles`、`kPathLevelCliff`、`kObstacleTreeJump/TreeSlide/TreeStumble`、`CoinMagnetMultiplier`、`FootStepsCliff`。

1) 蓝色天空：天空渐变改为 #2f7fc4→#8fc4e2→#e6eff2，雾色 0xb9d6e4 / 0.0105，环境光转冷；删掉正上方两层树冠（只保留远处高位的树冠边缘），画面顶部露出蓝天；远山改半透明蓝灰雾色。
2) 转角视野干净：拆掉转角的高墙（7m→1.9m）、挂旗、神殿剪影、9.2m 柱廊、守护兽、墙头猴子；仅保留低矮翼墙 + 火盆 + 地灯 + 地面箭头 + 圆盘地纹，转弯时能直接看到天空与出口。
3) 两种树墩：跳跃＝带年轮切面 + 根基的树墩排（高 ~1.0m）；滑铲＝横架在两根切面树墩上的倒木（离地 ~1.0m，玩家从下面滑过）。
4) 倾斜手机换道吃金币：deviceorientation gamma 超 ±18° 时在 0.28s 节流下换道；在路口窗口内仍优先触发转弯（AllowTiltToTurn），Options 文案更新。
5) 断桥/悬崖窄路（AllowFallOnCliffs / CanPathExtendOnSide）：从 120m 后每 10 个 tile 有连续 3 个 tile（36m）只剩一条车道，车道由 tile 序号决定（左/中/右）；缺失车道覆盖黑色深渊 + 断裂石板边缘 + 残墙 + 雾气；入口处三连金色箭头 + 火把提示；踩到缺失车道上会「踩空坠下悬崖」死亡（fall 动画），且该段内障碍/金币/宝石只生成在存活车道。
- 修复点：narrow 覆盖层按 section identity（from+keep）重建，避免 tile 循环复用时残留。
- 验证：天空/转角/两种树墩/窄路桌面 + 移动端截图；踩空死亡 reason=踩空坠下悬崖。；build 1.12s；console 0 error / 0 warning。

2026-10-25（新环境首次启动）：修复「整条路面全黑」的渲染问题。
- 现象：新克隆仓库 `npm install` 后启动，石板路面是一条纯黑带（远景正常、近景全黑），追踪者模型同样发黑；HUD/墙柱/植被正常，且与 README 截图不一致。
- 定位：`temple-road-tile.obj`、`mesh-96-enemy.obj`、`temple-paving.obj` 等 APK 导出 OBJ 的面定义为 `f v/vt/vn`，但文件里没有任何 `vn` 段。OBJLoader 因此从空的法线数组取索引（得到 NaN），`normal` 属性整片是 NaN，MeshStandardMaterial 的光照结果被 NaN 污染 → 渲染成黑色（MeshBasicMaterial 截图可正常显示贴图，说明几何/UV 无误）。
- 修：新增 `web/src/objNormals.js#repairObjNormals()`，按三角形位置重算面法线（跳过零面积三角形，剩余顶点回退到“向上”），在路面 / 障碍预制体 / 追踪者 / 兜底角色加载后调用；`track-preview.js` 同步修复。
- 验证：全场景 2234 个 mesh，`normal` 含 NaN 的 0 个；自动 bot 1937m / 20 转弯（含悬崖窄路换道）无 console error；`temple:build` 通过；生产构建（vite preview）跑通、路面正常受光。

2026-10-25（新环境 · Bug 修复 + 重构第一轮）：
1) 「暗坑」实为看不见的断桥：`createObstacle` 里有一段重复的空 `else if(kind==='gap'){ }else if(kind==='gap'){...}`，第一个分支命中后直接返回，坑洞的黑色洞口/水光/断石/火把全部成了死代码——碰撞照常（掉下去即死），画面却什么都没有。删除空分支后 pit 的视觉完整出现。
2) 四个皮肤的跑步畸形根因（逆向 APK 数据的结论）：`rig-werewolf` / `rig-selene_astronaut` / `rig-xixuegui` / `rig-Scarecrow_mesh` 的 `clips.run` 与来源骨架（Halloween_Runner）**逐骨骼数值几乎完全一致**（最大差 1.6°），但它们的 bind rest 与来源差异巨大（Scarecrow 平均 81.8° / 最大 158.7°，XiXueGui 平均 111.6° / 最大 179.6°，后者 bind 姿态甚至是躺着的：pelvis→head 指向 -X）。也就是说 APK 里这套 Run 轨道是按另一套骨架录的，按骨骼名原样注入到不同骨架必然扭曲四肢。
   - 修：`runnerRig.js` 新增“按骨骼朝向重定向”（`retargetClipWorld` + `pickAimChild` + `buildAimTable`）：对每根骨骼，把它在静止姿态下指向目标子骨骼的方向，用四元数旋到源骨架当前帧的同一方向，再回解局部旋转。只匹配方向、不匹配世界旋转，因此不受水平/局部轴向差异影响；`loadRunnerRig` 检测到非 Bip01 命名的骨架时自动丢弃其烘焙轨道走该路径。宇航员 / 狼人 / 吸血鬼 / 稻草人现在的跑步、跳跃、滑铲姿势均正常（rig-preview 与游戏内截图核对）。
3) 重构启动：新增 `web/next.html` + `web/src/game/**`（TypeScript + 手写 ECS + three.js 渲染层）+ `web/src/ui/**`（Vue 3 SFC）。ECS 用组件 store + 显式 order 的系统调度；`config.ts` / `path.ts` 承载数值与 90° 弯道数学；`state.ts` 作为 Vue 的单一响应式数据源；`game.ts` 已有轨道生成、转弯、跳跃滑铲、五类障碍判定、金币/宝石/道具、追逐者、相机、死亡结算与调试接口。`npm run temple:typecheck` 通过，`npm run temple:build` 同时产出两个入口，`vite preview` 下 next.html 可正常开跑。
   - 待补：地貌变体、能量条/连击、猴子、里程碑、目标/升级/统计、复活、脚步与环境音、横屏/安全区。
   - 补：`normalizeRigHeight()` 从旧版提到 runnerRig.js 共用，v2 换肤后按 2.55 世界高度归一化，修复 v2 里 Selene 等皮肤明显变小的问题。

2026-10-25（重构第二轮）：v2 补齐玩法与地貌。
- `game/terrain.ts`：四类地貌判定（bridge/hall/cliff/temple，周期性）与 120 m 后的单车道窄路；窄路段驶离存活车道直接坠崖（`die('踩空坠下悬崖')`）。
- `render.ts`：木桥（木板桥面/绳栏/灯柱/峡谷水面）、柱廊大厅（切图柱身/横梁/红毯/暖光）、断崖（破碎石板/深渊/迷雾）、窄路覆盖层（黑色深渊 + 断口石板 + 三连金箭头）。
- 场景修复：天空球半径 160 但轨道跑到 600 m 后相机飞出球体导致背景变黑，改为天空跟随相机；柱身用墙图集切块贴图，不再出现整张图集图案。
- 玩法：能量条（金币充能，满格随机道具）、连击倍率（3 s 未吃金币归零）、500 m 里程碑、猴子偷金币（5.5 s 后偷 3 枚）、宝石复活、9 角色商店（金币/宝石定价与解锁）、4 条目标、2 项升级、统计面板、设置持久化。
- 音频：`stepTemple/stepPlank/stepCliff` 三套脚步循环随地貌切换并按速度调节 rate，桥下水声、大厅混响；死亡/重置时停止循环。
- 验证：`temple:typecheck` 0 error；`temple:build` 双入口通过；v2 bot 1280 m / 17 转弯 / 153 金币；商店购买（2000→1700 解锁 Selene）、宝石复活（5→3）、目标领取、窄路坠崖均实测通过。
- 截图：docs/screenshots/v2-{narrow,bridge,hall,objectives,upgrades,mobile,run}.png。

2026-10-25（重构第三轮）：入口切换与表现补齐。
- 默认入口切换：`web/index.html` 现在是 TypeScript/ECS/Vue 版，旧版移到 `web/legacy.html`；`temple:build` 双入口（index + legacy）。
- 追踪者改用 APK 原版 `mesh-96-enemy.obj` + enemyTexture（不再是几何体占位）。
- 结算面板接入 4 张原版死亡插画（坠崖/被吃/撞树/滑铲），按死亡类型切换。
- 设置新增“倾斜转向”（DeviceOrientation，±18° 阈值、280ms 节流、iOS 权限请求）。
- 验证：根路径与 legacy.html 均无 console error；类型检查/构建通过。

2026-10-25（重构第四轮）：商店 3D 预览、首次教学、皮肤速度与逐项验收。
- `StorePreview.vue`：独立 WebGL 渲染器 + 转台 + 拖动旋转 + 自动旋转，实时预览选中角色（复用 `runnerRig` + `normalizeRigHeight`）。
- 商店改为“选中预览 → 装备/解锁”流程，价格/币种/已拥有状态都在预览下方展示。
- 首次进入显示滑动/按键教学（localStorage 记忆），确认后开跑。
- 转弯平台加金环、翼墙与地面金色箭头（方向随转弯方向）。
- 皮肤速度差异接入（狼人 0.8、Scarlett 1.09 等），与旧版 CHAR.p 一致。
- 修复调试接口 `setSkin` 未透传 `force` 导致换肤无效的问题。
- 验收：四个角色（宇航员/狼人/血鬼/稻草人）在 v2 中跑动正常；坑洞在 v2 中可见（黑坑+水光+断石+火把）；面板全流程、购买、复活、目标、教学均通过；v2 bot 2344 m / 30 转弯仍在跑；typecheck/build/preview 通过。

2026-10-25（用户反馈修正）：角色“倒着跑”。
- 根因：`runnerRig` 的 holder 自带 `rotation.y = Math.PI`，v2 又把跑者组额外转了 180°，合计 360°，导致模型正面朝相机、看起来倒着跑。改为跑者组只用路径朝向；追踪者同样修正。
- 追踪者：按原版逻辑放在 `distance - chaseGap` 并抬高/放大（原偏移会落到相机视锥下方），绊倒后能像旧版一样出现在跑者侧后方。
- 复核：四个特殊皮肤、跳跃、滑铲、追踪者、商店 3D 预览均确认朝向正确；typecheck/build 通过。

2026-10-26（重构第五轮）：局域网二维码、里程碑金牌、路口接缝。
- `QrCard.vue`：浏览器端用 `qrcode-generator` 生成 SVG 二维码；`vite.config.js` 增加 dev-only `/__lan-url` 中间件（读取网卡 IPv4），桌面上直接给出可扫描的局域网地址，点击地址可复制。
- 里程碑改用原版 `nicejob.png` / `highscore.png` 金牌（`state.showMilestone` + HUD 弹窗，2 s 自动消失）。
- 路口铺装改为按“进入方向”旋转的 9.6 m 方形 + 16 m 垫层，消除 90° 转角处露出的峡谷缝隙。
- 验证：`/__lan-url` 返回 `http://192.168.1.3:5173/`；页面二维码 SVG 正常；里程碑弹窗实测出现；typecheck/build 通过。

2026-10-26（路口补缝修正）：跨路口瓦片不再斜穿。
- 复核 9.6 m 方案时发现：真正把路口盖成“石阵”的不是铺装尺寸，而是中心落在转弯点 6 m 内的 12 m 瓦片——它整体按新朝向旋转，墙体斜穿另一条路，铺装再大也盖不住。
- 修：`ensureTiles` 跳过跨转弯点的瓦片（已有瓦片一并移除），路口用 12 m 铺装广场 + 20 m 垫层补洞；铺装仍按进入方向对齐，并抬到 -0.012 贴近路面。
- 验证：105 m 神庙左转、436 m 木桥左转前后截图，转弯处无斜穿墙体/露缝；typecheck 0 error；build 通过；桌面 1280×657 与移动 390×844 均检查。
