# BV1ypuKzPErT 参考分析与实现验收

更新：2026-10-31。当前状态：逐秒参考采集完成；第一轮画面修正完成；整体还原目标仍在进行，不能标为完成。

## 参考身份和证据

唯一主参考：[神庙逃亡1纯跑 4分20秒 世界第三 国内第一](https://www.bilibili.com/video/BV1ypuKzPErT/)。CID 30965762531，网页标注 271 秒，视频原始画幅 828 × 1792。用户本轮没有要求以旧的 BV1GW411N794 视频决定玩法。

本地保存 0–270 秒共 271 张 414 × 896 JPEG，路径 `docs/screenshots/BV1ypuKzPErT/000.jpg` 至 `270.jpg`。通过已授权浏览器播放器定位时间、等待 seeked 和解码就绪、从视频本身采集，保留录屏计时器与水印作为取证信息。没有将参考截图做成游戏背景冒充实时渲染。直接媒体下载遭遇 403/567，最终未依赖视频下载。

最终采集记录见 `capture-audit.json`；图像文件 SHA-256 与时间、场景归类见 `frames.json`。自动校验 271 文件完整、连续完全相同的帧数为 0。此前两轮抽帧曾遇到缓冲错帧，已用最终采集覆盖全部 271 文件。`capture-validation.json` 是早期尝试的局部解码时间戳记录，不应当作最终完整验收。每秒采样不足以精确测量短于一秒的起跳、落地与转弯窗口，相关窗口仍需高帧率补采。

交互浏览：`docs/screenshots/BV1ypuKzPErT/index.html`，支持逐秒定位、石桥/木桥筛选、点击大图、左右键逐帧。文字只标注可确认的代表性事件，其余秒保留场景分类，不伪造逐秒动作。

重建拼图和浏览页：`python3 tools/build-reference-gallery.py`。

## 时间线（视频时间，不是画面中的紫色计时器）

| 时间 | 可以确认的画面 | 实现含义 |
| --- | --- | --- |
| 0–2 s | 暂停/菜单、兽口神庙，计时器尚未开始 | 需要真正的开场镜头与神庙资产 |
| 2–7 s | 镜头从入口侧面转到跟随位置，三只猴追出 | 当前直接开始直跑缺少完整开场 |
| 8–66 s | 暖黄石桥、石台直角弯、树根、浮雕石门、断口、成串金币 | 并非昏暗森林隧道；保留水面和远雾 |
| 67–110 s | 连续木桥、绳索、骷髅端头、交叉支架、横梁和断桥 | 木桥是完整主题路段，不能只换地板纹理 |
| 111–144 s | 转回石桥，大型树干门洞、喷火雕像、多个直角弯 | 喷火是横向动态障碍，需要判定与动画一起复核 |
| 145–212 s | 青色透明角色效果、石桥、长条蓝色缺口、红黄金币串 | 透明效果不能解释成永久翅膀；缺口需要真实几何 |
| 213–239 s | 再次进入木桥；木桥低障、断口、转弯 | 不等于每 168 米固定换材质 |
| 240–262 s | 返回石桥、喷火障碍、末段跳跃 | 按路段拓扑安排组合 |
| 263 s | 结算面板，47240 分，计时器 4:20.9 | 需要原版结算布局，不能直接套自定义卡片 |
| 264–270 s | 结算后的画面及再次开跑 | 最后数秒不可当成同一条连续赛道继续推导 |

## 对旧分析的纠正

1. 旧文档分析了另一个 BV，关于永久翼、63× 的判断不能套到本轮视频。
2. 本轮无常驻蓝橙翼；145 秒后出现的是青色透明角色效果。
3. 石桥支持横向位置变化，不能因为透视显得窄就判成“只能单车道”。视频中侧边金币串与横向避让要求进一步校准连续倾斜移动。
4. 环境是开放水域、蓝灰远雾、暖色石面及零星巨树。原实现的黑绿天空、球形密集树冠、路边整排火把来自旧参考偏差。
5. 视频可见倍率 20×；旧文档“原版最高 5×”没有在本轮获得支持，不能再作为验收依据。当前程序的金币连击倍率和视频计分倍率不是同一个概念。
6. 视频里的紫色计时器、弹幕、水印属于录制层，不应抄进游戏 HUD。

## 差异与当前状态

| 维度 | 修改前问题 | 第一轮修正 | 尚未完成 |
| --- | --- | --- | --- |
| 画幅 | 手机壳、不同纵横比、巨幅网页介绍占位 | 采用 828:1792 比例，移除工程介绍侧栏与手机壳 | 移动设备安全区与多种比例继续验收 |
| HUD | 自定义 SCORE 卡片、品牌标语、大提示、四颗触控键 | 接入原版藤蔓/柱子/雕像图集，分数右上、暂停右下；辅助提示仅 `?assist=1` | 分数外框、原版数字字体、充能槽及自适应定位仍需精修 |
| 颜色 | 黑绿天空与过暗背景 | 蓝灰天空/雾、暖色石面，并修正天空 shader 色彩空间 | 按相同视频帧做颜色直方图和构图校准 |
| 水面 | 大块不透明地面遮挡水，离开原点后背景不连续 | 世界坐标焦散水面随相机覆盖整个旅程 | 当前是程序近似，尚非原版水面贴图与反射 |
| 植被 | 球形树冠与竖直细藤，像悬浮盆栽 | 清除球形树墙；少量原版树模型保留开放水面 | 大树根、岩石岸线和水中石柱尚需组合 |
| 石门 | 直接缩放完整 prefab，出现悬空三角墙 | 用原版砖石/浮雕图集重组正常横跨道路的石门；同步修正 tile 池使用路径 | 轮廓、冠顶和雕像仍不与视频完全一致 |
| 镜头 | 角色过大，纵横比改变时 FOV 突变 | 统一竖屏 FOV、降低角色占比、减少横移跟随与跳跃带镜头 | 开场环绕、转弯惯性和逐帧参数拟合未完成 |
| 追逐者 | 单猴悬浮在一侧，脚不落地 | 三只猴横排，接入 rig-enemy.json 原版 run 蒙皮动画，落在路面；开场接近后撤离 | 追逐距离、动作同步及跳跃/扑击片段仍需逐帧校准 |
| 主题 | 168/144m 周期交替，难以和视频对齐 | 本轮尚未改生成参数 | 需要按视频路段长度与节点重做，不凭肉眼乱填距离 |
| 路口 | 20m 广场、圆环和箭头、早早排队转弯 | 本轮尚未改拓扑/输入窗口 | 原版直角石台、真实 T 选择与连续横移 |
| 碰撞 | 3 固定 lane，时间宽容可越过本该碰撞的障碍 | 保留现有机制以便画面修改可单独验收 | 几何、运动和碰撞统一；火墙/喷火横障拆分 |
| 计分 | 距离直接加分，倍率仅加在金币 | 本轮尚未改计分 | 需要从视频距离/倍率读数与旧版原始逻辑验证公式 |
| 开场/菜单 | 普通网页菜单，无兽口场景镜头 | 去除“TS/ECS 重构版”等工程文案 | 原版神庙、目标、商店、暂停与结算完整复原 |

## 第一轮验证

- `temple:typecheck`：通过（使用本机 Node 的绝对路径运行 vue-tsc）。
- `temple:test:spawner`：通过，23 个 OBJ / 9 个定义 / 10000 seeds。
- 浏览器操作检查：跳跃 0.73m、滑铲剩余 0.95s、完成一次直角转弯后保持 playing。
- `temple:build`：通过；已有 legacy CSS 的 bar-track/bar-gold 路径警告，以及 Three.js 分块大小提示，未在本轮解决。
- 浏览器实机采样：加载原版 rig、石桥、原版 HUD、连续水面；用 `__templeGame.advance()` 与 `freeze()` 固定帧，避免把不同时间截图当成精确对照。
- 同步发现并修复开发热更新中未完成初始化对象的 dispose 崩溃。
- 实测一张石桥帧约 56 draw calls / 8.4k triangles，仅代表该帧，不能据此声称所有路段或手机达到 60fps。

## 后续验收顺序

1. 完成 2–7 秒入口镜头和三猴动作；石桥场景与视频 10/20/40 秒并排验收。
2. 以原版 rig 身高和桥宽定唯一物理尺度，采样转弯/跳/滑前后 30–60 fps，而不是继续凭逐秒图猜窗口。
3. 用真实可走表面生成残缺路面与木桥断口，去掉“在完整桥上盖黑片”的表示。
4. 统一相机、连续横移、直角转弯和 T 路口选择，验证成功和失误两条路径。
5. 按参考重建木桥完整路段、喷火雕像、主题过渡和障碍组合。
6. 最后校准计分、HUD 数字、原版菜单、音效与死亡动作；每项记录对应证据，未验收的项目保持未完成。

## 连续倾斜移动修正

本轮检查发现 `Input.enableTilt()` 每 280ms 把角度转换成一次 left/right 指令，`move()` 又会在提前转弯区自动确认方向；因此倾斜手机会同时换道和确认路口。这与视频所体现的横向位置控制不一致。

现已将传感器轴与滑动动作队列分开：开启时以首次有效读数校准握姿，2° 死区，额外 20° 达到横向范围边缘；这组参数是待真机调整的初值，不是已测出的原版参数。倾斜只产生连续横向位置，不产生转弯指令。滑动和键盘仍负责转弯。设置面板显示当前倾斜开关状态，重新打开面板不再错误显示“关”。

侧面障碍现在使用角色实际横向位置和身体宽度判断重叠；金币也按实际位置拾取，移除“目标 lane 相同就提前拾取”的条件。车道索引仍保留给生成器和旧测试；缺口边界与完整连续表面碰撞尚需后续统一，不能据此声称已全面完成连续碰撞。

验证：`npm run temple:test:steering` 覆盖握姿校准、死区、中间位置、范围钳制、无效读数、重新校准、移动中侧面障碍，以及持续倾斜不产生任何滑动/转弯事件。类型检查通过。未连接真实手机传感器，本轮没有验证手机握持手感。

## 木桥结构修正

对照 68s、76s：用每个 12m tile 的 24 块独立横铺木板替换平面桥面；木板保留微小接缝和边缘错位。加入木质承重梁、桥下交叉支架、缠绳木柱和原版 atlas 的骷髅端头，去除视频中未见的桥侧灯笼与细双层护栏。木桥不再用 leaf 贴图叠一层局部水，统一显示世界水面。骷髅贴图使用颜色掩码去除 atlas 的赭色包装背景，不生成新的美术素材。

本轮尚未解决：木板纹理的细节频率仍需与参考同尺寸校准；桥宽与柱间距仍沿用当前世界尺度；木桥断口仍是完整桥上的覆盖表示，不能宣称真实断桥几何已完成。`current-wood-structure.png` 为固定位置实机证据，约 130 draw calls / 16.8k triangles 的样本只用于识别当前成本，不能代表全程性能。类型检查和构建通过，未改变障碍生成规则。

## 全幅断桥真实切口

本轮去掉 gap / gapLong 的黑色覆盖平面与遮挡水面的整块坑洞 prefab。地面瓦片标记可行走表面，将该表面的三角形按障碍 hitbox.z 的同一个纵向区间切除，切口可跨 12m 瓦片边界，保留插值 UV。桥下承重梁和支架不属于可行走表面，因此木板缺失时仍可看到它们和水面。几何在瓦片回收时恢复并释放临时缓冲，避免污染共享模板及池中下一段桥面。

证据：`current-real-gap.png`，固定在木桥约 246m，前方 15m 放置 gapLong；画面缺口直接显示水面与支架。浏览器中同一测试不跳为 dying，起跳后越过缺口为 playing（267m）。`npm run temple:test:surface` 验证切除面积、没有跨缺口的残留三角形、UV 范围、原始模板不变、跨瓦片切口与整片移除。

范围：目前只覆盖全幅 gap/gapLong。半边路和左右分路仍有覆盖表示，木板碎裂断缘和石桥断面尚未补齐；现有跳跃宽容时间也尚未按高帧率参考重新拟合。不能把本轮结果扩大为所有道路缺口和碰撞已还原。

## 半边路真实表面

将 half-road 的深色平面覆盖改为可行走表面及缺失侧外墙的横向几何切除，露出世界水面；去掉缺失侧错误摆放的整段 prefab、覆盖水面的深色底片和不属于视频 HUD 的金色指向锥。断沿面置于存留路面内，碎石下落到路面以下。

可视边缘和坠落判断共享 `NARROW_EDGE`，倾斜移动时不再等目标车道索引跨过 .65 才判定；当前 .55 的边界沿用既有世界尺度，不宣称是从视频直接测出的原版尺寸。还处理了半边路起止点落在瓦片内部的情形：只切实际纵向区间，保留瓦片中完整的入口/出口。

验证：`current-half-surface.png`；浏览器 101m 安全侧 playing，向缺失侧移动后 dying。表面测试新增左右边界、横向切除面积、瓦片内部的局部矩形切除，类型检查通过。分路中心缺口、真实 T 节点选择、坠落动画和自然碎裂断面仍未验收，不能声称整套道路拓扑已经完成。

## 天空/水面接缝与焦散

检查现有 APK inventory 的 Texture2D/Material/Shader 名称，未发现可直接复用的 water/caustic 贴图；本轮没有声称已经找到原版水面资源。已修复天空自定义 Shader 未经过 tone mapping、而水面已经过 tone mapping 导致的远处色差。两者现在共享色调映射与输出色彩空间。水纹由规则正弦网格改为随时间变化的不规则 Voronoi 边缘焦散，加入导数抗锯齿，依旧属于程序近似。

浏览器证据 `current-water-fog.png`：没有着色器错误。与上一轮同为 414×896 的 `current-game.png` 对照，在 x394..408 / y245..259 接缝小区域统计逐行 RGB 中位数差的 L1 最大值由 29 降为 6；原始数值见 `horizon-comparison.json`。这个局部指标只用于确认该处接缝减弱，不能证明整体画面或水面已与视频一致。焦散尺度、运动速度、颜色仍需按参考近水区域校准，移动端着色器成本尚未真机验收。

## 转弯输入与换道分离

此前 move() 在 TURN_CUE_DISTANCE=48m 内接受转弯，并且接着将 lane.index 加减一次，导致很早就确认拐弯且把角色挪到边道。现将提示距离与输入窗口分开：只有到达路口前 6m 至后 2m 范围才接受正确方向，成功消费的转弯指令不再执行换道。调试 API 也走同一验证路径，无法绕过方向或时机检查。

窗口目前依据现有 12m 路口平台设置，是修正旧“48m 提前确认”的初始参数，不是已经从参考测出的原版反应窗口；还需要高帧率补采与实际平台/碰撞统一校准。不会把这次修改称为操作节奏完全还原。

`temple:test:turn` 验证早期输入、左右方向、前后边界、重复与无效输入。浏览器证据 `turn-input-check.json`：earlyAccepted=false，转弯输入前后 lane 均为 1，完成 1 次转弯且保持 playing；不输入则 dying。新增 steering/surface/turn 检查已接入 CI 配置，但尚未运行远端 CI。

## HUD 原版数字字形

分数与金币显示改用已有 score-0.png 至 score-9.png 原版位图字形，移除 Georgia 字体数字；按各数字原始宽度排版，长数字适当缩小，不更改实际计分逻辑。单个计数提供完整 aria-label，各数字图片为装饰，避免读屏重复逐位读出。负值和非有限值显示 0，超过 JS 安全整数的显示值钳制以避免科学计数法拼接出不存在的图片路径。

实机：十位分数显示宽约136px、六位金币约72px；`current-sprite-numbers.png` 是主动注入 9876543210/123456 的布局测试截图，不是真实跑分。负数、NaN、1e30 的显示回退均未出现破损图片。类型检查通过。数字字形替换不等于计分公式、倍率或整个 HUD 已还原。

### 原始兽口入口模型确认与接入

对 APK 中 117 个静态 Object 网格制作可视缩略图后，确认视频开场的兽口建筑是 `Object218-Pivot`（GUID `3b2c1504a7d5e43878b4afd4e594403e`）。先前按 `templeHead_prefab` 名称推断的 Object282，以及 Object12，均与视频轮廓不符，未作为最终入口使用。

`tools/export-entrance-search.py` 现在可从 base APK 重建检索网格和正式 `temple-entrance.obj`。将源 Z-up 坐标转换为 Y-up，移除场景偏移，按源道路 Z=-15 对齐高度；使用原始墙面图集。菜单展示正面，起跑保留入口建筑。实机证据：`../screenshots/BV1ypuKzPErT/current-original-entrance.png`。类型检查、生产构建通过，浏览器无新增错误。

仍待校准：开场绕行镜头、入口道路障碍生成、入口与跑道宽度比例、亮度与雾、原始菜单。当前不能据此认定与视频一致。

### 起跑镜头与起点地表修正

根据参考 003/004/005.jpg（录屏约 1/2/3 秒），新增约 3 秒的正面→侧面→追尾镜头。`introCamera.ts` 保留这些姿态的近似参数，明确不是恢复出的 Unity 原始关键帧；每次开始/重开都以本局 elapsed 为基准，暂停不推进镜头。绕行阶段先看角色，后移至前方道路，避免竖屏下角色被过早的远方注视点移出画面。实机固定步进核对 2 秒、3.2 秒和重开，截图 `current-intro-2s.png`、`current-intro-3s.png`、`current-intro-start.png`。

修复起点负距离被地表循环取模映射到木桥末端的问题；开场石路不再带木桥交界横梁，后续真实地表转换仍保留交界。原有 spawner 测试增加负距离/起点/后续循环边界回归，通过 10000 seed 测试。移除首 80 米直道自动装饰拱门，避免绕行遮住角色；不改变实际障碍碰撞生成器。类型检查、构建通过。

差距仍明显：本实现 2 秒时的侧向角度大于参考，入口在画面中的停留时长、角色动画、追兵数量/队形、第一转弯距离、整体环境密度、地表比例仍需校准。这里只完成开场过渡和已定位的错误修复，不构成整体还原验收。

### 计分的确定错误修复

参考 263.jpg 结算显示 20x 加成；官方 https://imangistudios.com/thefaq/how-does-scoring-work-in-temple-run/ 确认跑步、金币等所得分数使用计分倍率。当前实现此前每米仅计 1 分，并每帧用当前连击倍率重算历史金币，导致连击结束后分数回退。

新增 scoring.ts：距离按已跨过的整数米增量计 20 分，不再覆盖已经获得的金币/宝石分。参考 003.jpg 的 140 分对应 7 米基础分。此处只校准无币距离分，金币/计量槽/目标奖励的具体数值尚未证实，不把官方泛述当作完整公式。test-scoring 验证分帧一致性、已有奖励保留、反向不加分、7米=140；类型检查、构建通过。仍不能从这次修复推断能重现视频结算 47240 全部奖励来源。

### 追兵动画错误诊断与修复

检查 rig-enemy.json 与原始人类跑者 clips：run/jump/slide 各有 24 条同名骨骼轨道逐值相同；直接应用这些局部平移/旋转会覆盖猴子骨架关节长度和轴向。此前截图的细长尖片轮廓不能视为原始猴子效果。

追兵现在强制使用已有按世界关节方向的重定向，保留猴子 bind pose 的关节长度，避免直接使用人类局部轨道。仍然是重定向近似，不是已恢复的猴子原始动画。另修复 setTime 的循环控制：默认仍供预览单帧使用，调用 setTime(t,true) 可在错相后继续循环；此前追兵三个错相调用会关闭 run 循环。

新增 temple:test:enemy：验证错相后跨周期继续播放、40帧顶点有限；实机 3.2 秒截图 current-enemy-retarget.png 可见身体宽度和关节轮廓恢复，仍需原始动作/队形/朝向逐帧对照。类型检查通过。

### 巨树贴图和生成修正

对照 006/007/010.jpg，树干需要靠近护墙。现有 decor-tree-a.obj 为原始 Object57_Pivot，模型本身已 Y-up；原先 material.tree 没有 map，虽然 treeTexture 已加载，树干实际只有纯深绿色。补回原始 treeTexture、去除绿色自发光，左右树朝向统一。横向偏移由 10.5 调至 6.2，生成候选间隔由 72 米调至 36 米，左右交替。

实机首次检查未出现预期树干，进一步定位树木被拱门的 26 米转弯清场范围过滤；树木改用独立 8 米转弯避让。再次实机截图 current-tree-material.png 可见右侧贴近护墙的有纹理树干，控制台无错误。此间距是参考近景密度的近似，尚未恢复原始 prefab 随机分布；树根跨路的确切轮廓、树体比例和连续背景还需校准。类型检查通过。

### 转弯平台结构修正

参考 009.jpg 显示狭窄、带外侧护墙的桥面转角。旧 buildJunction 使用 12米方形+20米铺装底板、四个火盆、金环和三个箭头，形成参考中不存在的广场。

改为道路宽度 7米的三块连续桥面（中心方块、入口臂、出口臂），内弯保留水面，增加对应 L 形护墙，移除火盆/金环/地箭头。桥臂延伸到被跳过的 12米道路瓦片端点，不依靠大面积铺装掩盖接缝。截图 current-narrow-junction.png；实机转弯 accepted=true、turnCount=1、63米仍 playing。

新增 test-junction，射线验证左右角均包含入口和出口、内侧8×8位置无桥面，铺装面积168平方米，并检查无火焰 sprite/金环。类型检查通过。现仍是程序几何，护墙图集与原始直道护墙的尺寸/接缝明显，需要后续校准，不是原始 prefab 的完整恢复。

### 护墙重复与转角宽度纠正

检查 temple-road-tile.obj 的顶点分布：它不是单独路面，而是含两侧齿状护墙的完整道路预制网格（地面约Y=-1.36，墙顶Y=0，经ROAD_TILE_LIFT对齐）。原逻辑在该预制体上又生成两道 track-wall-straight-a，形成重复墙体。现在使用原始道路时不再追加独立墙体，缺失原始道路的回退路径仍可生成护墙。

这也推翻上一轮按基座外界估算7米桥宽的假设：实际可见墙间宽约4米，转角改为4米桥面，铺装面积由168改为96平方米，护墙同步移到±2.1附近。current-single-parapet.png 可见单排齿墙及连续窄转角，移除了两侧伸出的铺装平台。实机过弯 turnCount=1、63米仍playing；左右转几何测试、表面切割测试、类型检查与构建通过。

转角当前依然使用程序护墙，和直道原始护墙的顶部/材质仍有差异，不能记作原始转角模型已经恢复。

### 原始转角 Object76 接入

继续检查已导出的 track-wall-corner-a.obj（Object76-Pivot），顶部顶点分布确认其包含完整 L 形内外齿墙和桥面，并非单面独立墙。模型包围盒中心不等于两条道路中心线；按道路轴线平移1.08、横向缩放.18、竖向.2、底部下沉6后对齐。左转镜像X，右转使用原朝向；沿用直道原始墙图集与道路材质。

buildJunction 优先使用原始转角替换中心区域程序护墙，两条路臂约5.6米以外仍用连接段补到12米网格端点。current-original-corner.png 已可见参考009.jpg中的金色方纹饰带和原始齿墙。实际右转 accepted=true、count=1、phase=playing；控制台无错误。test-junction 增加真实 OBJ 读取，射线验证左右转中心/两条道路轴线均为近y=0桥面，不被墙体阻断。此前几何连通检查也通过。

连接段仍为临时几何，齿墙间距和原始瓦片相位未完全连续；整个场景的透视、动态布局、动作、环境还未通过逐帧验收。

### 原始水面材质恢复

重新合并 APK 的127个 sharedassets0.assets.split（必须按数字序号而非字典排序），发现此前 apk-inventory 逐文件清单不包含这份合并资源。Water 材质 pathID24 的 _MainTex 明确引用 pathID58 terrainTexture；读取原图确认其为视频中的绿色焦散水纹。不能从纹理命名推断无原始水面资源。

新增 tools/export-water-reference.py，可从 base.apk 自动重组、追踪材质引用、无损导出 terrainTexture.webp，并记录 sharedassets/output SHA256 至 analysis/water-source.json。合并资源 Texture2D/Material/AnimationClip 清单另存 shared-assets-inventory.json，后续可用于确认原始追兵动画（含Run01等，尚未确定引用关系）。

水面 shader 删除9格Voronoi循环，改用原始贴图、世界坐标UV、重复采样和已有雾化。current-original-water.png 实机显示原始纹理；控制台无错误，类型检查与构建通过。当前UV重复尺寸、滚动速度和雾色仍为近似参数，未恢复Water原始shader全部行为，不代表水面逐帧验收完成。

### 猴子原始 Run 动画恢复

从合并 sharedassets0 沿真实组件引用追踪：GameObject enemy(220) → Transform1072 → parent monster(553/Transform1405) → Animation1919 → Run clip129。Run01(162) 属于其他骨架，不能凭名称选作猴子动画。原始 Run129 含33条未压缩旋转/位移轨道，周期0.5666666627秒；此前 rig-enemy 0.4秒片段是错误的人类曲线。

新增 tools/export-enemy-animation.py，从base.apk重组资源、按引用找到原片段并重建rig-enemy.json的run曲线，嵌入组件ID和sharedassets SHA256。去掉追兵运行时人类动画重定向，改为直接使用原片段。保留错相循环修复。

实机首次检查暴露 normalizeRigHeight 的宽体动物误旋转：猴子原片段已Y-up，其身体长于高度，被“横躺人物”启发式再转了90°。新增autoOrient可选项，追兵明确false；角色皮肤保留原默认行为。test-enemy增加原片段来源/周期、头高于脚、无额外X轴旋转、循环与40帧顶点有限检查。current-native-monkey-animation.png 是固定步进场景下的代表性错相姿态，不作为逐帧动作时序验收。类型检查通过、控制台无错误。

待核对：三只猴子的整体体型/追赶间距/队形和动画播放速度；当前曲线采样仍使用现有线性位置与四元数插值，未实现Unity全部切线插值。

### 开场追兵退出近景时序

对照005.jpg（计时约3秒，追兵仅头部在底边）与006.jpg（约3.9秒，近景已无追兵），旧呈现逻辑保持1.2米贴身到5秒、8秒才拉开，明显过久。新增openingChaseGap，将退后区间近似为2～3.8秒平滑过渡，后续完全使用实际chase.gap；不改捕获判定，也不隐藏绊倒后追近的模型。移除附加的正弦弹跳/侧摆，避免覆盖原始Run动画已有身体运动。

实机固定步进4秒截图 current-opening-retreat.png 已退出近景，控制台无错误。test-chase验证连续单调退后、4秒恢复实际间距、后续绊倒仍返回3米、开场实际更近时不强行推远。类型检查和构建通过。此为逐秒画面估计，仍需亚秒动画/镜头的联合校准。

### 默认角色滑铲循环恢复

沿 Jhony_Export3 的 Animation1915 引用找到 Run123、Jump131、Slide Start150 和 Slide Loop156，均有31条未压缩轨道。新增export-runner-animation.py，可从base.apk重组资源、按预制体引用恢复默认角色四段原始曲线并记录来源。此前slide只有约0.1333秒的起始段，结束后夹在末帧；现在起始段后切入约0.2秒的slideLoop循环，动作结束恢复run。其他无slideLoop的皮肤仍可使用原有slide片段。

移除runnerGroup额外Y轴0.55压缩，避免把原始仰躺姿态再次压扁。current-native-slide.png 实机可见与参考005/006.jpg相符的仰躺伸腿、双臂展开；0.8秒后sliding=0且phase=playing，控制台无错误。test-runner-slide验证起始段夹住、循环段顶点持续变化/循环、切回run和比例不压缩。类型检查通过。

固定步进advance现在每步也同步骨骼与场景物体，最后渲染，后续截图不再只推进物理距离而保留旧动画姿态。此前已说明为代表性错相姿态的追兵截图不作为精确时序证据。滑铲持续时间和与障碍判定的匹配仍需动态校准。

### 连续下滑的动画与判定重新同步

slide() 接受重复下滑时已刷新remaining/lastSlideAt，但setClip默认忽略同名片段，因此在0.133秒起滑阶段重复输入不会重播起始动作。现在每次地面有效下滑显式setClip('slide',true)，随后仍按起滑时长转入slideLoop。空中下滑仍走原有快速下落分支，没有擅改其规则。

实机固定步进证据 repeat-slide-check.json：第一次slideTime=.075；再次输入后时间=.025（从头重新推进），随后clipName=slideLoop且time=.1，remaining=.825，整体scale=[1,1,1]。截图current-repeat-slide.png。test-slide增加重复起滑时间回归，类型检查、构建通过。该修复解决画面与当前判定时钟不一致，不证明已精确恢复原作输入缓冲和空中下滑规则。

### 原始方形金币恢复

沿 coinYellow_prefab（b1f5ad...）的MeshFilter外部引用找到 f741ff87347e21645aeb41b83dc44b31 / Box01；MeshRenderer引用Box01Mat，其_MainTex指向wallTexture。网格有20个顶点，是带厚度的菱形方币，UV对应图集红色方环，不是圆币。

新增 export-coin-reference.py，可从APK引用恢复并导出coin-yellow.obj，居中并统一缩放.18（高度约.66，仍需与透视联合校准）。渲染优先使用原始网格和图集，圆柱拼接仅保留为资源失败回退。current-native-coins.png 实机可见红色中心方纹与侧面厚度；沿原路径收集5币、过弯1次、仍playing，控制台无错误。类型检查和构建通过。尚未恢复不同里程的红/蓝币视觉与原作币值规则，旋转速度/间距仍待校准。

### 卷轴结算页恢复

对照263.jpg，替换通用结束卡片为原始图集卷轴底板、死亡插画、得分数字及距离/金币/20x纵向统计。底板使用egUI_Buttons2x左上原始区域，通过CSS图集定位显示，未用参考视频覆盖层作素材。export-result-art.py从sharedassets0导出deathIllustrationWater@2x（鳄鱼插画），用于错过转弯落水；之前的WaterB仅是水花，不能代替鳄鱼。其他死亡类型继续使用各自已有插画。

真实漏转死亡流程进入结算，显示61米/5币/1270分；current-result-scroll.png记录布局，点击“再跑一次”后phase=playing。类型检查和构建通过。按钮目前仍为可用文字控件，非原版图集按钮，卷轴入场/分数结算动画、不同死亡文案与字体细节尚未完全恢复，整体目标仍未完成。

### 起跑距离与首转节奏校准

根据无币开场分数/20换算，约1/2/3/4/5秒对应7/18/30/43/56米，009.jpg约6.9秒接近首个转角（76米）。旧实现立即12米每秒起跑、57米首转，约4～5秒便到角，明显过早。新增一秒线性起跑加速，首转距离81米（保留现有12米网格相位），并将无用户显式选择时的默认难度从额外challenge改为classic。已存难度偏好及显式query仍优先，不强行覆盖。

opening-pacing-check.json 实机1～5秒距离为6/18/30/43/55米，无拾币，仍playing；current-opening-pacing.png记录第5秒。随后6.7秒在77米排入转弯，7.7秒90米turnCount=1且playing。test-opening-pacing验证采样距离误差小于1.5米和5秒未提前到首转；类型检查和构建通过。

这些为视频数据拟合参数，并非恢复出的原始速度函数。后期速度、受阻减速、后续直道分布、地表切换时序仍需全程对照；不能据开场吻合推断全局运动已还原。

### 长石路/木桥边界校准

重新检查066/067/069、110/111/113/114、212/213、240/242/243.jpg：第一段木桥约从计时1:05持续至1:50，第二段约3:31至3:59；此前“67–110秒木桥”的粗略标注只是预览范围，不能当作角色已越界的精确时间。按无币HUD分数/20估计并对齐12米网格，边界暂设564/984/1908/2172米。奖励分偏移与切换画面中的前视距离使其仍有不确定性。

surface.ts移除168/144米短循环，改为上述长段：石路→420米木桥→924米石路→264米木桥→末段石路。视频之后暂延续最后已见石路，不凭单次录像发明重复周期；无限路线的原始地表随机生成规则尚未恢复。

spawner测试更新为长段及各边界first/last/global-from检查，10000seed通过；类型检查、构建通过。实机跳转初次截图只见水，重新加载并稳定镜头后619米显示连续木桥（current-long-wood-section.png），1120米显示石路且playing，控制台无错误；未将初次空画面当作通过。此截图为调试定位，非录像同时间对照。

木桥模型仍明显过宽、表面平整、护桩密度/树木遮挡不符；该修改仅纠正地表长段分布，不代表木桥造型已验收。晚期速度及滑铲/受阻减速尚需校准，因此不能由距离边界推断时间边界已一致。

### 原始木桥 Object59 恢复

沿 plankStraightVert_prefab（7c51a...）的MeshFilter外部引用定位c4e9b0aa... / Object59-Pivot。export-plank-reference.py从APK读取网格并烘焙完整子/父Transform、UnityPy X反射与游戏缩放，保留原始UV，按原桥面Y约-15.25对齐当前y=0。生成plank-road-tile.obj，约12.2米长、包含板缝、缠绳/骷髅短护桩及水下支撑；宽6.49米是含支撑的外界，不应拿它当可跑桥宽。

buildBridgeDeck优先使用原始网格，程序木板/圆柱/剪影骷髅仅作为加载失败回退。木桥不再额外生成贴路巨树。current-native-plank.png实机可见原始细节；该图是调试720米后固定步进，不与视频同时间等同。控制台无错误，类型检查、构建及表面切割测试通过。

native-plank测试验证12米网格长度及三跑道桥面采样。原始板缝有真实缺损，不能要求每个点都命中y=0；密集射线记录板面覆盖率约74～75%、最大缺损约.45～.55米，不将其自行填平。当前小板缝属于装饰，整段缺口仍由障碍判定。木桥转角仍错误混用石桥构件，入口/出口高差和后期布局尚需恢复，不能视作木桥全套验收。

### 木桥原始转角恢复

plankTurnA_prefab（c64e53...）引用605dac... / Object64-Pivot。export-plank-reference.py扩展为可指定预制体和输出文件，沿用完整TRS导出plank-corner.obj。原模型进出方向经旋转/镜像映射到左右转，连接到12米网格的短臂使用截取后的原始直木桥，而非石板或程序填充。

junction缓存key现在包含surface和direction，避免木桥复用石路转角。实机current-native-wood-corner.png显示木平台、尖桩、骷髅，实际转弯accepted=true、count=1、phase=playing。test-junction增加真实木转角左右方向中心及连接臂附近的小脚部区域射线检查；单点恰落原始缺板时不能当成导出失效，保留原缺板细节。类型检查、构建通过。

这只修复木桥内部转弯混入石质构件的问题。接口接缝、左右镜像纹理差异、木桥与石桥的入口/出口高差、完整路线时序仍未验收。

### 石桥/木桥交界原始构件调查

沿 templeToPlankCapAVert(ec2ac...) / BVert(78cb...) 定位原始Object75/Object73，使用通用TRS导出器恢复至 analysis/transition-caps/，未放入运行时public资源。inspect-cap-heights.ts密集读取中轴射线，将高度剖面保存为analysis/cap-height-profiles.json。

在当前统一缩放与桥面坐标下，A构件石路一端约y=3.0494，沿斜面至约1.56；B构件相反朝向，另侧带开放区域。与现有木桥y≈0不同，这是带高差/开口的交界模型，而非可直接替换平面横梁的装饰。参考111/240.jpg亦可见高起的石桥断面。若直接放入当前flat path，会造成悬空地面及视觉/碰撞高度不一致。

本轮完成可复现的交界网格和高度剖面恢复，改变后续实现依据；没有将其草率平移后声称入口恢复。下一步需要联合路径高度、角色着地、镜头高度及开口判定处理，当前运行时仍保留原平面交界。该项明确未完成。

### 地面高度的原始序列化依据

继续追踪交界而非猜测物理：global-metadata.dat v31含CharacterPlayer.groundHeight/SetGroundHeight/IsGroundHeightChangeHigher。解析TypeDefinition与FieldDefinition，确认Region2D字段顺序为Points、TestPoint、Height、testProjectedPoint、testIsIn；预制体脚本引用globalgamemanagers.assets/1065，对应Region2D类。

新增inspect-transition-regions.py：校验版本/字段顺序/剩余字节长度，读取Region2D点数组及其后12字节TestPoint引用槽之后的Height，记录原始字节、预制体SHA256。四个独立预制体的解码结果为：stoneStraight.Height=0、plankStraight.Height=-15、capA/B.Height=0；与已测网格石路高于木桥约3米（当前缩放.2）一致。transition-region-source.json保存该可复现依据；点数组同时确认交界A/B分别只覆盖相反方向的半段区域，不能用同一个横梁无方向替换。

这里的高度数据已从单纯画面估计推进到原始组件/字段支持，但还未恢复CharacterPlayer.SetGroundHeight对上升/下降、跳跃、落地的具体行为。视频112.jpg只能证明此时角色已到石路，1Hz截图不能证明中间有没有输入跳跃。运行时尚未接入交界高度，避免未验证的自动抬升或穿模；后续应使用上述区域/高度而非重新随意设定台阶。

### 原始相机视野参数恢复

从level0 Camera3873 / Main Camera读取field of view=50、near=5、far=500、背景约RGB(50,82,86)，与GUI Camera（正交）及UI Camera Main menu（98.2度）区分。export-camera-reference.py记录原始组件及level SHA256至camera-source.json。

当前创建、resize、运行帧统一使用CAMERA_FOV=50，移除原58度估值及随速度扩大的视野效果。current-native-fov.png为实机4.3秒滑铲检查，角色与道路完整可见，控制台无错误，类型检查与构建通过。裁剪面尚未照搬原数值，因为运行时单位已缩放且天空/水面不同，不能把原始数字未经转换全盘套用。

GameCamera元数据字段还确认FollowHeightRun/Jump/Slide、FollowDistanceRun/Jump/Slide、FocusHeightRun/Jump/Slide、GroundHeight等分项；原脚本存在不同动作的相机处理，当前web统一跟随高度仍未还原。此次仅恢复静态主相机FOV，尚不能证明运行时脚本从未改变视野，仍需全程对照。

### 原始红/蓝币资源与面值

扩展export-coin-reference.py，按coinRed/coinBlue的MeshFilter恢复各自原始网格与UV（657564... / 0e4006...），保留原始红蓝图集区域。buildCoin支持1/2/3面值对应网格；拾取对象保存value，对象池按coin:value分开，避免复用造成颜色/面值错配，拾取按面值累计。

参考160.jpg分数28740（约1437米）仍为黄币，175.jpg分数31540（约1577米）黄红混排。referenceCoinValue以约1500米作为本录像暂估边界，后段采用黄红混排；这是复刻近似，不是原始随机分布/升级配置。元数据确认GameController.DistanceToChangeDoubleCoins/TripleCoins及GetDoubleValueCoinSpawnDistanceForUpgradeLvl等，但APK RemoteConfig/defaults.json为空，具体阈值尚未证实。蓝币资源已恢复，但不凭空设置自动激活阈值。

实机current-native-red-coins.png可见原始红币，5个黄红币序列拾取合计7币且playing，转弯accepted=true。coin-values测试验证三色UV不同和该序列面值合计，类型检查、构建通过。此前升级每级25%累计小数的旧公式仍未恢复为原作阈值升级，不能称计币全规则已完成。

### 青色无敌效果与翅膀分离

参考150/160.jpg为青色半透明角色，原元数据CharacterPlayer也分别有HasInvincibility/InvincibilityTimeLeft和HasAngelWings/AngelWingsTimeLeft。旧web将shield画成翅膀、碰撞一次消耗，不符合这一效果。恢复sharedassets0 / playerGlowTexture(57)，export-invincibility-texture.py记录来源与哈希。

runnerRig新增可复用的半透明青色材质，使用原始发光贴图，无敌期间切换，结束恢复原皮肤同一材质；关闭将无敌当翅膀的表现。shader参数/透明度.55仍是画面近似，非原始shader完整恢复。内部power名shield保留兼容，用户文案改“无敌”。障碍碰撞不再首次消耗power，持续到until；实机连续通过两个hurdle仍playing，材质单测验证开启、复用、恢复。默认HUD隐藏额外无敌秒数与连击徽章，assist=1仍可显示。

current-native-invisibility.png记录画面；类型检查、构建通过，控制台无错误。尚未恢复原作临近结束闪烁、缺口上的临时地面，以及半边路/分路下的完整无敌规则；不把当前一般障碍免疫当成全部原作逻辑已完成。原作持续时间和升级阈值亦仍待核对。

### 原始安全地面动画与无敌地形判定

在sharedassets0定位Safety Net Visual(193)、Safety Net Sprite(216)、UISprite1982及UISpriteFrameAnimation1966。动画prefix/suffix为safetyNet/.png，帧1～5、15FPS；UIAtlas1957记录EffectsTexture2x五个80×240区域。父级.25×Sprite80/240×当前.2缩放得到4×12米覆盖。export-safety-net-source.py保存引用、矩形、FPS和来源SHA256。

新增safetyNet.ts使用原始五帧图集，跟随玩家所在路径，平面放在正常路面下方，仅在缺口/缺板处显露，结束或重开隐藏。原始atlas共享但UV变换用独立Texture，避免污染其他特效。当前height仍按平面路线，后续随地面高度系统一起更新。

无敌期间取消半边路和中心分路缺口的直接坠落判定，保留错过转弯判定。实机safety-net-gap-check.json：普通断桥dying/掉进断桥，无敌playing；safety-net-narrow-check.json：普通缺侧dying/踩空，无敌playing。current-native-safety-net.png可见蓝色临时地面。单测验证五帧15FPS、4×12尺寸、独立UV与depthWrite关闭，类型检查、构建通过。分路合流细节、结束闪烁及地面高差情况下的行为仍待验证。

### 地表规则统一：移除未经视频支持的短周期

旧 terrain.ts 每 36/48/60 块插入短木桥、柱廊、峡谷及周年金色场景。即使 surface.ts 已设置两段长木桥，石路仍会被这些周期覆盖；脚步音效与障碍生成也使用旧规则。现统一从 surfaceAt 查询 terrain，转弯附近也保持实际地表，不再额外插入上述场景。半边路完整区间必须位于同一石路区段，不能跨入木桥。

新增 temple:test:terrain：以 0.5 米步长遍历 0–3000 米，核对普通/临近转弯时的地表一致性、木桥边界和半边路落点。地表测试、障碍生成 10000 seeds 和类型检查通过。注意：两段木桥边界仍为 HUD 距离估算；这次修复只消除实现内互相矛盾的规则，并未恢复原版随机地图算法或精确视频路线。旧 main.js 未参与当前 TypeScript 游戏入口，不作同步改写。

### 无敌结束时重新检查坑洞支撑

发现普通障碍的一次碰撞标记 passed 同时用于坑洞：受保护穿入坑洞后即永久跳过检查，保护在坑洞内结束也不会坠落。现坑洞持续使用原有纵向扫掠碰撞和跳跃判定；其他实体障碍维持一次接触规则。重复坑洞检查不重复播放穿障音效或提示。

浏览器固定步长实测：无敌9.5秒时生成前方3米坑洞，9.75秒距离117米仍playing，10.1秒距离120米且坑洞中心后4米时dying。截图 current-power-expiry-gap.png。对照在9秒生成相同坑洞，10.2秒已离开中心13米仍playing（power-expiry-gap-exit-check.json）。这证明结束后恢复坑洞碰撞且不会在离开坑洞后误杀；并不证明原作结束闪烁频率或升级持续时间。类型检查与构建通过，构建仍有旧版CSS两张进度条路径及包大小警告。

### 相机跟随参数：恢复继承关系，保留未验证边界

新增 tools/inspect-camera-follow.py，读取 metadata v31 类型记录并确认 GameCamera 继承 MovingObject，后者还具有14个字段。原先从 MonoBehaviour 的32字节头后直接按 GameCamera 自有字段解析会错位。level0 的 GameCamera 6397 共304字节；112/124/136偏移分别引用4117 MovingObject、6392 CharacterPlayer和1950 Transform（水面，初始y=-30.5）。注意这些引用不能简单按全部元数据字段逐项对应，私有、静态及未序列化字段会省略。

164偏移起九个float确认为35/35/6、50/50/60、20/20/14；可疑对应 FollowHeightRun/Jump/Slide、FollowDistanceRun/Jump/Slide、FocusHeightRun/Jump/Slide。按当前缩放0.2为高度7/7/1.2、距离10/10/12、注视高度4/4/2.8。该分组仍是候选，不能把紧邻IntroDuration=8的布局吻合视作字段属性与算法已被证明。输出 camera-follow-source.json 保存组件原始字节、场景/metadata哈希、继承字段、引用和候选分组。当前运行镜头未改；需要恢复字段访问/SerializeField属性以及MainCameraFocusPoint运行更新算法，再和截图核对。

### 相机字段分组验证与常规跟随接入

从 XAPK 的 arm64 split 中提取 libil2cpp.so，脚本现可用第三个参数解析 ELF LOAD 段和 AArch64 RELATIVE relocation，再读取 MetadataRegistration 类型表中的 Il2CppType。GamePlayer attrs=1（私有），SharedInstance attrs=0x16（public static），ShowMainMenuAfterFollow attrs=1；其余相机字段为public。按这些属性解析本组件，九个跟随float从164开始，SnapCamera结束于304，与完整组件长度严格吻合。camera-follow-source.json已保存二进制SHA与每字段偏移/原始字节。此验证针对该APK，注册表地址有版本绑定，不能泛用于其他版本。

运行镜头常规参数由高度5.8/后距7.1改为原始值×0.2的7/10，注视点高度4；移除无来源的jump.y百分比相机位移。注视点沿路径位置与缓动仍为web实现，尚未恢复MovingObject更新算法。低位参数1.2/12/2.8在实机直接绑定每次slide后导致追兵挡住大半画面，与005/008参考帧不符，因此撤去无证据的slide绑定，保留独立NeedsToDuckCamera语义，暂不触发低位镜头。不能把“已恢复参数”宣称为“已恢复完整相机行为”。

新增temple:test:camera逐个读取证据文件字段原始float，核对常规、跳跃、低位参数缩放及组件末端304。测试、类型检查和构建通过。常规画面current-native-follow-camera.png仍显示地表材质、障碍布局、树木及HUD比例差异，整体目标未完成。

### 恢复道路原始光照贴图与UV1

本轮确认石路2e264…与木桥7c51…的MeshRenderer均引用4d1def25…「Temple Run Material」，其shader为sharedassets0/108「Imangi/MachuLightmap/Opaque VertexFog」。主贴图wallTexture之外还引用21e49…的lightMapTexture（1024²）。从压缩shader blob解出GLES源码，明确采样TEXCOORD0主贴图、TEXCOORD1光照贴图并逐通道相乘；雾量在顶点处以世界位置到相机的欧氏距离计算。源码保存machu-lightmap-original.glsl。

新增export-native-lightmap.py：提取无损lightMapTexture.webp，读取Unity MeshHandler的m_UV1，按现有OBJ的三角面索引展开并导出伴随.uv1.json。四种模型：石路1206、木桥1356、木转角1158、石转角1122展开顶点，均与浏览器OBJLoader匹配。nativeLightmap.ts实现原始采样乘法与径向线性顶点雾，关闭toneMapped，不再给上述原生路面叠加动态暖灯与emissive。原型裁切保留UV1，阴影随原始UV分布，未重画纹理。原始场景RenderSettings 4099雾色RGB50/82/86、起止100/400原单位，当前缩放后20/80；同步雾及纯色背景，水面取消额外ACES处理。水面滚动/尺度仍是近似，其他树木、障碍及人物材质尚需逐一恢复。

temple:test:lightmap验证四个OBJ的UV1长度、缺失/错位数据拒绝、坑洞裁切插值后UV1与位置一致。类型检查、构建通过。浏览器石路与木桥均正常显示且无着色器错误，截图current-native-lightmap.png、current-native-plank-lightmap.png。与参考视频仍存在物体布局、材质家族、HUD尺寸、镜头动态等差异，未达到整体一致。

### 树木与障碍的原始光照扩展

查明「Temple Run Trees Material」资产378718…也使用sharedassets0/108 MachuLightmap，DetailTex为21e49…光照贴图、MainTex为866d35…treeTexture。新增export-environment-lightmap.py，从obstacle-manifest的原始mesh_files及track OBJ来源头导出25套UV1：22种原生障碍、大树、石门、直护栏。导出前核对每个源Mesh的UV0与现有OBJ的vt逐顶点一致，避免仅凭顶点数相等误配。各模型UV1与OBJLoader展开流匹配，数据及哈希保存environment-lightmap-source.json。人工生成的stone-pedestal无原始UV1映射，保持回退材质。

原生树木、树根/倒树障碍使用treeTexture×lightMapTexture，石门/护栏及石障碍使用wallTexture×lightMapTexture，取消上述原生模型额外动态暖灯。测试扩展到全部29套模型并检查坑洞裁切UV1插值；类型检查、构建通过。原版角色、敌人、入口及部分回退几何仍有材质差异，继续按来源逐类核对。

### 角色与追兵恢复原始无光照材质

sharedassets0 shader113「Imangi/Unlit/Opaque」解压后的GLES源码确认片元仅输出texture2D(_MainTex, UV0)，未读取_Color，亦没有光照、雾和色调映射阶段。即使orig_default材质保存灰度0.588，也不能据此额外染灰；该值是未被着色器消费的遗留属性。export-actor-material-source.py验证17套现有rig关联材质均引用113，来源与哈希保存actor-material-source.json，原始源码actor-unlit-original.glsl。

新增nativeUnlitMaterial，CPU蒙皮角色/三只追兵及静态追兵回退改用白色MeshBasicMaterial、toneMapped=false、fog=false。移除追兵回退额外棕色染色与橙色自发光，不改变UV或原始动画。无敌材质切换仍缓存且在结束时恢复同一个原始无光照材质。增强invincibility测试验证材质类型、白色、关闭雾/色调映射；该测试、enemy循环动画测试、类型检查、构建通过。浏览器无着色器错误，常规视角截图current-native-actor-material.png。

实机同时发现未解决的大偏差：开场约2秒的近似环绕镜头会穿过入口模型并遮住角色（本轮曾截图观察），参考视频此时应能看见追逐。不能将常规角色材质验证扩展为开场镜头已还原；下一步应修复入口/环绕轨迹之间的几何关系。

### 开场遮挡定位与视角修正

上一条“镜头穿过入口”的判断经射线定位修正：2秒camera(-10.53,6.24,-10.72)至角色的视线先击中tile1的decor-tree-a，距相机5.77/7.20米。罪魁是旧周期规则在12米放置的巨树，并非入口模型。新增cameraOcclusion调试读数，仅检查可见实体且排除角色自身；最初对Sprite直接射线缺camera导致调试异常，已改成仅测试Mesh，正常游戏渲染未受影响。

移除12米的首棵周期树，首棵沿路树从48米开始；不采用临时隐藏穿帮物体。按004.jpg（游戏计时2秒，镜头在角色斜前方、道路朝右上延伸）延后环绕，2秒视点由角色后侧改为斜前方，随后于3秒衔接常规镜头。末端高度7、后距10、注视高度4和前视距离0与已恢复的常规参数一致，消除原先5.8/7.1/.65/10.5造成的切换突变。轨迹仍为依据逐秒画面拟合，非恢复原版插值方法。

实机在无遮挡视角还暴露开场1.2米呈现间距让原始追兵模型遮住角色身体，改为3米，让追兵位于角色后方；保持后续实际chase.gap及捕获判定不变。此距离仍为画面估计。新增temple:test:intro验证1秒正面、2秒斜前方、3秒连续衔接及参数有限，chase测试验证退后连续性；类型检查和构建通过。截图current-clear-intro-2s.png，射线读数intro-visibility-2s-check.json。角色/追兵大小、数量分布与入口构图仍有参考差异，整体未完成。

### 开场角色纵向构图校准

对照004.jpg的脚部约y=650/896，上一轮移除遮挡后的画面脚部仍在画面中部，原因是开场一直注视0.65米而普通跟随已恢复为4米。现开场初始注视高度5米在0.8秒内过渡到4米，并保持到常规跟随；保留已校正的斜前方轨迹，不额外偏移模型或HUD。

新增投影断言：50°视野、414:896比例下，以2秒实际pose投影地面角色脚点，画面高度比例0.726868（约651/896），落在参考下半部范围。浏览器2秒runnerNdc.y=-0.453736与纯投影一致，角色视线无模型遮挡；1秒、2秒、3秒均实机截图current-intro-framing-1s/2s/3s.png，3秒相机与角色保持7米高度/10米后距/4米注视高度，无遮挡、控制台无错误。intro测试、类型检查、构建通过。

此为构图校准，不代表已恢复视频动作序列：003.jpg角色出入口时有离地姿态，005.jpg已滑铲，而当前无输入时仍运行Run。入口侧向构图、材质和追兵形态仍有差异，整体目标保持未完成。

### 入口原始光照与周边模型的反证

确认temple_prefab 80ad52…的Object218-Pivot renderer引用Temple Run Material，故入口也应使用wallTexture×lightMapTexture及UV1，不能继续额外暖色MeshStandardMaterial。入口1179原始顶点及UV0顺序核对通过；现运行时接回UV1与nativeRoadMaterial，去掉染色、动态光照与材质复制。入口用容器管理显示状态，几何位置保持原先对齐。

同时发现预制体还引用Object12-Pivot/087b5f…与树木材质。新增export-entrance-surroundings.py，核对两条父级旋转/位移/缩放一致、子级旋转/缩放一致，按原始子级位移差(339.999878,710.000061,0)导出周边模型，保存变换来源。该组合在2秒视线检查无遮挡，但正面截图显示岩壁挡住兽口，与003.jpg相矛盾。已撤回周边模型的运行时加载，保持研究文件，不能把“预制体里存在”当成当前视频场景实例的正确摆放证据。需要继续检查level0实例变换/使用预制体与旧版差异。current-complete-entrance.png为试验组合，非最终状态。

光照测试扩展至31套UV1（其中周边模型仅研究、未启用）；类型检查与构建通过。最终入口截图current-native-entrance-front.png应在撤回周边模型后重录，保留光照修复。整体任务仍未完成。

### 黑洞效果的真正原因：不透明材质的Alpha泄漏

inspect-entrance-aperture.ts射线核对：洞口并不缺背板，入口原始662/665三角面在UV约(0.764638,0.640381)采样wallTexture RGB(0,1,0)。仅关闭入口雾后仍有蓝灰区域，实机entranceSample证实实际命中相同三角面、fogEnabled=0，故不能继续归因于雾或用新黑平面盖住。检查到lightMapTexture为RGBA且Alpha范围34–241；浏览器现有WebGL画布attributes.alpha=true、premultipliedAlpha=true。自定义ShaderMaterial即使transparent=false，也会把低Alpha写入透明画布，最终与页面背景合成；Unity Opaque材质在原生帧缓冲并无这种页面合成语义。

现nativeLightmapMaterial强制片元Alpha=1，RGB仍按原主贴图×光照贴图计算，保留道路顶点雾。入口选用原始着色器实际存在的无雾版本（machu-lightmap-no-fog-original.glsl已导出），依据002/003黑色洞口画面；尚未恢复原脚本切换keyword的逻辑，不能宣称该选择来自已反编译的运行逻辑。没有加黑背板、换纹理或删除原始几何。

实机current-black-entrance.png，31套UV1测试、类型检查、构建通过。entrance-opaque-pixel-check.json比较同一1秒正面构图：修复前洞口矩形175:235×450:510平均通道均>20，修复后全部<3；中心三点由蓝灰恢复黑色。该问题也影响所有共用道路/环境ShaderMaterial，本修复按不透明材质语义统一纠正。入口比例、周边模型摆放、开场离地动作仍未还原，整体目标未完成。

### HUD图集裁切与基础排版

发现此前hud-left/hud-vines等手工区域并非UIAtlas原始sprite矩形，左图腾遗漏上段、其他图有边界偏移。export-reference-hud.py读取sharedassets0 UIAtlas1969和Texture2D72 InterfaceTexture2x，按精确rect导出：jungleA 673×227、totem 193×662、scoreboard129×328、scoreboardPanelScore271×67、idol188×278、pause40×44、coin55×61。来源、rect与输出哈希保存hud-atlas-source.json。更换HUD金币图为原始coin.png，不再借用其他界面的coin-face；暂停符号使用原始pause.png而非文本Ⅱ。

在414×896参考画幅下，藤蔓显示140高、完整图腾从顶部起、分数牌top110/right0，分数字形28高，背景随内容宽度扩展。底部偶像和暂停符号相应校准。位置来自截图目测与尺寸对照，不是已恢复原版UI布局脚本；尝试模板RGB匹配误差偏大，因此未把其输出当作精确坐标。不同画幅的原版适配规则仍需恢复。

实机三位数980分数牌89.48宽、四位数1360扩到105.65宽，高均38，无挤压；暂停glyph相对画幅top837.48、高24。通过可访问按钮点击暂停，PAUSED/继续奔跑/重新开始弹层正常出现。current-native-hud.png记录最终HUD。类型检查、构建通过；构建仍有旧版进度条路径及Three包大小警告。整个游戏与视频仍有大量路线、动作、地面高差等差异，目标未完成。

### 开头两处路口与转弯跟随修正

008/009/010.jpg明确第一处向右，016/017/018.jpg明确第二处也向右。零金币分数/20与转角前后画面给出第一处约76–85米、第二处约143–162米的观测区间，按当前12米网格选择81、153米，均为估计。旧实现每次随机方向，且第一处后按96–120米随机间距，因此第二处落在177–201米，明显偏晚。新增referenceRoute.ts记录这两处已核对的方向、网格距离和帧索引，classic使用该开头，challenge维持自身规则；未核对的后续路线仍未录入，不把fallback随机路段称作视频还原。自定义debug跳转/路口会因距离不匹配跳过该前缀，避免在角色身后插入153米路口。

实机两个右转输入均被接受：77米接近81米第一处，83米完成后next153，149米接近第二处，156米turnCount2且playing。reference-opening-route-check.json记录完整状态；该检查使用无敌隔离随机障碍，只证明路口接续，不证明沿途障碍/金币/时间节奏已匹配视频。视频第二处约游戏15秒，而当前速度曲线仍更快，不能仅按距离匹配推断时间一致。

截图还发现旧相机取path.at(distance-10)会在转弯后留在上一条路臂，画面指向水面。followCameraBack改为从角色当前平滑位置沿当前heading后退10米，再用原缓动跟随；高度/注视高度仍为已恢复的7/4米。此空间跟随方式修复实现几何错误，非已反编译GameCamera运动代码。实机第二处156米时runnerNdc.x=0.0727，163米稳定后0.00155，角色回到画面中心、前方道路可见。截图current-reference-second-turn.png；控制台无错误。

新增temple:test:route验证已观察前缀、未知后缀与自定义跳转隔离；camera测试增加四个朝向下的10米后距与方向。上述测试、类型检查、构建通过。第三处方向/距离、障碍、侧路及转弯模型接缝仍需继续核对，整体未完成。

### 开头两棵树根：位置与类型经近景复核

006/007/008.jpg把第一棵根的接近/通过限制在零金币HUD距离约56–66米；014/015/016.jpg把第二棵限制在约133–143米。新增referenceObstacles.ts暂选63、141米，均为截图估算而非原版生成坐标。此前nextSpawn80且路口±42米排除，第一路口前完全没有障碍，与画面直接矛盾。classic按已核对的开头生成两棵固定原生树根，再从213米开始未知随机后缀；challenge保持旧规则。不在这两个观察障碍前自动生成随机金币跑道。原生障碍本身已有完整树干，邻近24米不再叠加周期装饰树，避免重复树干。

近景核对产生两次重要纠正，最终实现如下：第一棵为TreeTrip，使用tree-trip-left，其在当前旋转转换后树干位于画面右侧，不能按left/right资源名直接推断画面方向。第二棵最初误配TreeSlide，实机显示中央主干/双根拱门，与015.jpg右侧主干横根不符，已改为TreeJump/tree-jump-left。视频角色不停滑铲，不代表所有接近的树都MustSlideUnder；仍使用原生目录中TreeTrip/TreeJump的跳跃/非致命绊倒规则。

测试验证两个距离落在观察区间、prefab与定义对应、纵向碰撞范围在两个路口地面前结束、未知后缀不覆盖开头。实机不启用无敌：57米跳过低根，77米右转输入接受，136米跳过高根，147米仍playing且chaseGap保持11.5；reference-opening-obstacles-check.json记录。反例对高根滑铲，146米仍playing但chaseGap降到3.8，reference-root-wrong-action-check.json记录。current-reference-opening-root.png与current-reference-opening-trunk.png为最终朝向/外形截图，后者以滑铲作画面对照并会绊倒。类型检查、reference-obstacles测试和构建通过，控制台无错误。

还未解决：路口中央自动金币导致本实现开头会收币，与视频整局0币不一致；第二路口具体布景、时间速度曲线、后续树根/转弯和完整随机规则尚待核对。不能用这两棵障碍通过测试证明全路线已还原。

### 开头金币带从路口中央移到参考左侧

009/010/011/012/013.jpg显示：第一处右转后金币沿左侧排列，带有上拱高度，至约104米仍有尾部，约114米已消失；016/017.jpg第二路口没有同样的中央提示金币。旧updateTurnCue无条件在所有路口中心生成5枚，正常保持中路会自动收币，直接违背参考开头0币画面。

新增referenceCoins.ts：已核对第一路口暂拟左侧84–110米、2米间距14枚、base1.3米加sin弧高2.4米。枚数/精确间距/高度均为画面拟合估计，非恢复生成代码。第二个已核对路口返回空提示，不凭路口自动生成中央金币；未知路口及challenge仍保留自身规则，不能把其后缀称作视频还原。没有禁用金币收集。

实机不启用无敌、跳过两棵树根并连续右转，86米0币、157米0币，reference-opening-zero-coins-check.json。对照主动靠左，到90米收到3币，reference-opening-left-coins-check.json，说明修正来自布局而非禁用收集。current-reference-left-coins.png记录左侧金币弧与0币HUD。新增reference-coins测试验证左侧/后转弯区间、104米后尾部、高度弧、第二路口无中央提示以及未知路口隔离；类型检查、构建通过，控制台无错误。

仍需处理：当前拾取只判断纵向/侧向距离，未区分高弧金币与角色实际高度，因此“靠左可收币”不能证明高处拾取规则正确；原始石门仍被程序几何代替，转弯平台材质/衔接、金币外观与完整路线也存在差异。整体目标未完成。

### 两种原始石门替代程序门框

近景明确两种不同门：010.jpg为带黑色浮雕牌的高塔门，016/017.jpg为低横梁门。旧buildStoneGate始终用长方体与裁切贴图拼门，原始gate资产虽已加载却未使用。检查Object84/track-gate-a发现它还包括完整道路，并且原始低门位于侧边（高于y40的部分x约12–24、横跨z），不能整块叠到现有路面。nativeGate.ts按几何高度分离原门面片、保留全部属性和UV1，去掉道路/护栏重复面，再按原路面y30及0.2缩放将侧向门转为独立跨路门。门宽6.72、顶高6.01、厚2.37，中心通行；原始两侧门柱保留，±1.3米侧向射线会击中，不能横向拉宽来强行通过三车道。

第一次实机显示低门不匹配010.jpg，已改第一处使用Object01/tower-arch的原始高塔门，第二处保留Object84低门。高塔同样分离道路面，保留柱脚原面片而非加新底座；顶高24.70，底座约0米。最初仅按高面筛选漏掉了柱脚，测试minY2.53揭示悬空，已增加原柱脚区域，最终minY约-0.00064。所有选中面片保持源UV0/UV1，使用原始烘焙材质；此几何分离规则是本实现的提取方式，不冒充已恢复原版子网格。

referenceRoute为已核对开头记录门朝向：第一处沿右转后的出口放高塔门（路口后约8米），第二处路口正前方放低门（中心前约2米，实际右转沿另一臂行进）。位置来自画面近似；已观察开头180米内不再重复周期门。未知后缀和challenge仍使用自身门规则。

新增temple:test:gate验证两种原始模型尺寸、中心通行、侧柱保留、UV1长度、柱脚路面高度；route测试验证两处门型/未知路口隔离。测试、类型检查、构建通过。实机不使用无敌，通过两棵根和两次右转至161米仍playing/0币，native-opening-gates-check.json，控制台无错误。current-native-first-gate.png与current-native-second-gate.png分别核对两种门。

尚未证明侧向门柱与角色完整碰撞联动，不能把中心通过当成全宽通行测试；门所在平台/柱脚与转角的更精确衔接、后续门分布、金币高度拾取、时间节奏和完整路线仍未还原，整体任务未完成。

### 高弧金币的高度拾取与磁铁范围

旧updatePickups仅判断前后/左右，即使人物在地面也会收到3.7米高的弧顶金币。检查原始黄色金币预制体b1f5…未发现标准Sphere/BoxCollider，它使用BonusItem（继承MovingObject）脚本；元数据无显式拾取高度/半径字段，当前未恢复原始脚本阈值。不能凭经验数值声称恢复原判定。

inspect-runner-height.ts用原始rig归一到当前1.85米后精确遍历渲染顶点：Run上界约1.91、SlideLoop上界约0.66，原始币OBJ半高0.330327。新增pickupReach.ts按这些尺寸，加明确标记为近似的0.4米拾取容差，结合Jump.y与Slide状态检查金币高度。仅金币新增高度判定，其他道具保持旧行为，不能把本修复扩展宣称成完整3D拾取系统。pickupHeightAt共享原上下浮动公式，渲染与判定使用同一高度。发现磁铁原9米close又被后续±3米条件截断，移除冲突的外层限制；9米仍是当前实现配置，非本轮恢复的原版值。磁铁绕过常规高度检查以吸取高币。

新增pickup-reach单测覆盖低币奔跑/滑铲、浮动全过程、高币需要跳跃、脚下远处金币拒绝和磁铁。实机6组控制测试pickup-height-runtime-check.json：3.7米币ground=0/jump=1；1.3米币run=1/slide=1；0.1米币在跳起经过时=0；6米前高币magnet20毫秒=1。所有case均playing，无无敌/其他金币干扰；控制场景远离树根。current-high-coin-ground.png与current-high-coin-jump.png记录同位置地面/跳跃对照，后者在Jump.y≈1.395时已拾取1币。尺寸、源哈希和未恢复边界保存pickup-reach-source.json。

类型检查、单测、构建通过，实机控制台无错误。原版BonusItem真实距离算法、磁铁吸附动画/升级参数、其他道具高度与地面高差仍待恢复。完整视频路线与速度节奏也未完成。

### 第三路口：原始T形、左右分支与前方断桥

024/025.jpg明确左右两出口，026.jpg随后直路右侧树干与左转后的空间关系一致，第三处记录方向暂选左；225米为222–230米画面区间吸附到网格后的估算。前方断桥暂选213米，属于206–222米前后帧间的估计，未恢复原随机种子。referenceRoute已扩到第三处，gate=null/junction=tee；referenceObstacles加入pit，未知随机障碍从285米以后开始，防止213米再随机选成树根。后续路线仍未录入，距离之外的时间节奏仍不一致。

找到原版templeTUp预制体c1df7…/Object85-Pivot/e0da77…，export-native-t-junction.py完整应用子级/父级TRS、反射坐标转换与0.2缩放，没有按包围盒随意居中。MonoScript确认为Region2D，其8点多边形对应[-30,30]横臂、[-10,10]入路，Height=0。来源、变换与哈希保存t-junction-source.json，模型与UV1已导出。buildTJunction使用原始T形路面/外墙，截短与已有来路重叠的末段，再用同一原始石路的短条连接左右出口，保留UV1和烘焙材质。首次射线测试在6米拼接边界发现微小浮点缝，连接条增加2厘米接合余量；正前方墙体较低，0.6米射线会从横栏上方穿过，0.2米脚部射线确认墙体，未凭空抬高墙。前方树干按025构图近似摆放，非恢复原场景布置算法。

T形外观不再搭配单向强制输入：在合法转弯窗口内左右输入均可选择已有TrackGraph对应分支，重建前方路面；未输入仍按原错过路口判定。默认参考方向为左，不把右侧可见道路做成假出口。实机无无敌两组：均跳过两树根与断桥，到232米playing/0币/turnCount3，graph最后节点分别left/right，摄像机forward.x分别约+0.959/-0.959，native-t-branches-check.json。负例不跳断桥在207米dying/掉进断桥，native-t-pit-no-jump-check.json。测试还暴露重开累积旧fork历史，已新增TrackGraph.reset清空forks/nodes、重置active路径与节点id，复测每局只保留本局3处分支。

新增temple:test:t-junction验证左右0–9米路面连续、入路、前墙脚部射线、合并后UV1与图重置，更新route/reference-coins/reference-obstacles测试。测试、类型检查、构建通过，控制台无错误。current-native-third-t.png为第三处接近构图。还需核对断桥真实宽度/跃起抛物线（当前含既有宽容时间）、未选分支远景、完整碰撞和后续271秒路线；整体未完成。

### 标准断桥：原始安全边缘、岩壁和真实腾空判定

原始templeStraightHoleHorz 2a052…包含两个Region2D（脚本类型已核对）：横向运行轴原单位[-30,-25]及[25,30]，Height=0，中间[-25,25]没有地面。按0.2缩放，整块12米、两端各1米安全边缘、中间缺口10米。export-native-pit-region.py保存原始点/Hash至native-pit-region-source.json。旧def切成10.4米且模型完全返回空组，既错过原始斜岩壁，也与安全区域不一致。

标准pit危险范围改为[-5,5]；新增surfaceCut[-6,6]替换整块旧路面，由原始pit OBJ以0.2缩放提供两端岩边、侧壁和破碎造型。长缺口尚未恢复完整区域/模型，本轮未冒充解决。原始岩边图形是斜面（中心线在±5.5米处约y=-0.43），原始虚拟支持平面仍为Height0，因此不能把每个渲染三角形都当作实际物理地面高度。

缺口改为当前脚下点的地面支持检查，不沿用实体障碍的加宽扫掠区：落在远岸后即使上一帧仍在洞内也安全。空中允许正y或向上速度，移除缺口中lastJumpAt仍在宽容窗口就无条件通过的规则；落地在洞内立即坠落。根类障碍宽容规则不变，完整原版跳跃速度/重力仍未恢复。debugState添加distanceExact便于边缘输入验证，不暴露到产品HUD。

实机native-pit-physical-jump-check.json：206.06米起跳，216.60米在缺口内落地→dying；207.655米起跳，220.77米已在远岸落地→playing，且无无敌。native-t-branches-check.json已按新腾空时机重录，左右分支均到232.84米playing/0币。native-t-pit-no-jump-check.json更新为208.086米不跳即坠落。此前206米起跳仍通过的T形测试为旧宽容逻辑，已被本轮记录替代，不能再作为物理腾空证据。

temple:test:pit读取原始区域记录验证danger/surfaceCut，检查岩边/中心开口、原始模型实际进入buildObstacle、洞内落地坠落、远岸落地安全。spawner 10000 seeds、类型检查和构建通过。current-native-pit.png记录原始岩壁与腾空画面，控制台无错误。整体视频路线、时间节奏及长缺口仍未完成。

### Fourth and fifth route nodes, frame review

Frames 032–034 show the next tree-front T junction: score 5600 (280m) approaching, 5760 at the junction, 5900 (295m) after the left turn, with the tree now on the right. The authored estimate is 285m, snapped to the existing 12m tile-center grid. Frames 043–045 show a left-only stone corner: score 7480 (374m) before and 7660 (383m) after; authored estimate 381m. `referenceRoute.ts` now fixes these nodes instead of resuming random generation after 225m. Both estimates are observation brackets, not recovered original route coordinates. Route unit tests check their directions, junction kinds, continuity, and fallback after node five.

This change only fixes route topology. The new spans still need their visible gaps, left coin arcs, and distant pickup reconstructed; extending the route does not establish visual or gameplay parity for those spans.

### Fourth-turn outgoing pit

Frames 034–036 show a full-width stone pit immediately after the tree-front T. Added the native standard pit at estimated 297m (observation bracket 295–310m), with its existing original mesh/Region2D collision and 12m replacement cut. Its tile starts at 291m, exactly after the preceding T deck; the position remains a fitted grid estimate needing tighter video alignment. Random spawning now starts at 381m so the previously generated 345m root/center coin trail no longer pollutes the observed clear span toward the fifth corner. This does not yet restore the visible left coin trail or yellow pickup.

Browser verification (`native-fourth-gap-check.json`): normal, zero-coin traversal through right81/right153/left225/left285, no powers; jump starts 291.7439m, airborne at 298.2700m, lands safely at 305.0018m with jumpY=0 and phase=playing. Only the intended gap is present in this span. Screenshot `current-native-fourth-gap.png` records the original pit mesh during this traversal. Reference obstacle tests and TypeScript checks pass. Visual parity is still unproven: monkey chase presence, water texture scale, detailed timing, distant scenery and coin/power placement remain materially different from frame035.

### Native pickup sprites and fourth-run left coins

Identified the yellow circular symbol in frames034–037 as `pickupCoinBonus.png`, not the arrow-shaped boost icon. Source prefab `ca1c5ef40178fbf42b358fa5c1aa41b4` uses UISprite11, atlas1957, Effects Material38, EffectsTexture2x81 and FaceCamera12. Sprite child scale160×160, parent0.1 and world0.2 yield3.2×3.2; sparkle child89×179 yields1.78×3.58. UISpriteFrameAnimation10 serializes sparkle1..11 at15FPS. Shader115 is `Unlit/Premultiplied Alpha/Transparent Colored (+1)`. `tools/export-native-pickups.py` exports verified atlas rectangles/provenance; `nativePower.ts` now uses camera-facing unlit premultiplied-alpha sprites for magnet, invincibility, boost and coin bonus, replacing the invented glowing octahedron and torus. Sparkle UV advances at native15FPS. These source dimensions are confirmed for coin bonus; sibling icon dimensions remain based on this shared pickup presentation rather than individually reconstructed prefabs.

Fourth turn now emits a fitted left coin arc/tail at288..318m,16 coins (estimated count, spacing and height), plus the observed bonus on lane0 at329m,height3 (fitted). Initial321m placement appeared too close at310m; moved to329m using the two visible screen-size/depth observations. At318m the native icon renders clearly with score6360/coins0, no powers needed through the prior four turns. Render remains imperfect versus frame037: icon size/offset, camera, terrain background and monkey chase differ. Yellow pickup gameplay semantics still use the existing web bonus mechanism and are not claimed to reproduce original CoinBonus behavior. Source-level native sprite/animation tests and coin-run tests pass; TypeScript and Vite production build pass (existing legacy CSS path/chunk warnings remain).

### Individual pickup prefab verification

Extended `export-native-pickups.py` to inspect all four native prefabs rather than applying coin-bonus dimensions to every power: vacuum3c3dd106..., boost53b67a9e..., invincibility67889826..., bonusca1c5ef4.... Their root scale is0.1; icon child160×160 except invincibility154×160. Corrected invincibility world width3.2→3.08 while retaining3.2 height. Each prefab's UISpriteFrameAnimation resolves via MonoScript897 and independently confirms sparkle1..11 at15FPS. Source JSON now records each prefab SHA256, transforms, frame range and playback rate. Native-power tests and type checks pass.

Investigated CoinBonus semantics without changing reward behavior: metadata includes GameController.CoinBonusValue and NumMegaCoinsPickedUp, and BonusItemType.kBonusItemCoinBonus. The level0 GameController6396 serialized public field stream has CoinBonusValue=0 at428, VacuumDuration=0 at432, InvincibilityDuration=0 at436, BoostDistance=0 at440. Neighboring fields CoinMagnetMultiplier=1 at424 and AverageScorePerBlock=100 at416 are consistent. These zero initialization values do not establish runtime power values or upgrade calculation; do not implement zero rewards or guess a fixed amount from them. The current timed bonus mechanism remains an identified fidelity gap, pending original runtime method/config reconstruction.

### Original water plane and removal of invented monkey event

Recovered level0 Water Plane GameObject13, transform1950, MeshFilter3877→shared mesh98 Water_Plane, renderer3876→material24 Water. The original mesh has121 vertices/600 indices, ±1000 source-unit extent and UV0 approximately[-25,35] with swapped spatial axes; material MainTex scale1/offset0. At world scale0.2 this is a400m plane at sourceY−30.5→−6.1m. Previous code used a360m plane at−2.1, world UV*.2 and invented time drift. `export-native-water-plane.py` now exports the actual positions, reflected winding and original UV0 with file hashes; `nativeWater.ts` constructs this geometry, and the water renderer consumes UV0 without the added drift. Texture source and existing fog approximation remain. Camera-follow plane translation is still the existing web behavior; original GameCamera.Water movement code is not yet recovered. Water appearance is not claimed identical merely because geometry/UV are native.

A same-distance browser screenshot exposed an unrelated brown primitive monkey on the roadway. `updateMonkey` was randomly spawning a coin-stealing side monkey after260m, a fabricated web event absent from the reference. Disabled its automatic spawning in classic mode (challenge/debug behavior retained). Native trailing demon-monkey chase is separate and unaffected. Source water geometry/UV/winding/height tests and TypeScript checks pass. Browser normal traversal to318m remains playing, score6360/coins0.

### Water shader vertex fog and Gamma color space

Recovered shader113 `Imangi/Unlit/Opaque` variant `IMANGI_VERTEXFOG_ON` directly from its LZ4 compiled GLES program. It calculates radial camera distance, normalizes using unity_FogStart/End, clamps at each vertex, then interpolates that fog coefficient; fragment stage mixes MainTex RGB with unity_FogColor. The web water shader had recalculated fog per fragment, losing the behavior of the native40m vertex grid. Corrected it to vertex fog; original GLSL and hashes are saved in `water-vertex-fog-original.glsl`/`water-shader-source.json`.

Globalgamemanagers PlayerSettings confirms `m_ActiveColorSpace=0` (Gamma). The prior water path decoded sRGB, mixed fog in linear RGB, then encoded output. Original shader uses Gamma-space mixing. Water alone now samples encoded texture RGB (`NoColorSpace`), receives raw RGB50/82/86 fog and emits encoded RGB without an extra colorspace chunk. This is a source-backed correction, not a saturation adjustment; other scene material color paths have not been changed in this step. Earlier suspicion of duplicate conversion was not supported: texture decode/output encode round-trip was valid, but the intermediate fog blend differed. Geometry-follow behavior, surrounding scenery and full video-frame equivalence remain unresolved.

### Gamma baked-material correction and pacing follow-up

Applied the confirmed Gamma project setting to `nativeLightmapMaterial`: native MainTex×DetailTex and fog mixing now operate on encoded RGB and emit encoded output, matching the compiled original GLSL. Shared sRGB textures used by fallback materials are preserved; a WeakMap caches NoColorSpace clones for native variants so fog/no-fog instances do not create duplicate encoded views. Tests cover unchanged source color space, encoded clone reuse, raw fog RGB, no second output encoding, plus all31 UV1 streams and cut interpolation. TypeScript and a normal no-power traversal to318m pass; browser console has no errors. Screenshot `current-native-gamma-lightmaps.png` records the resulting scene. This does not establish matching camera/scenery/chase or all original material variants.

Pacing audit found a missing behavior: web stumble changes chase distance but updateRunner overwrites speed solely from distance growth every frame. Video score increments fall after the first and second root events, consistent with cumulative slowdown rather than the web's monotonically increasing distance-based speed. Current APK PlayerConfigData metadata default fields decode as StartRunVelocity100, MaxRunVelocity210 and StumbleSlowDownPercent≈0.85; the video opening's observed12m/s does not agree with blindly scaling the APK default initial velocity by0.2. Remote config/build differences and the actual runtime slowdown method remain to be resolved. Do not apply these defaults wholesale or label the existing speed curve recovered. No speed/physics changes made in this step.

### Native consecutive-stumble window

`tools/inspect-native-character.py` now reproduces CharacterPlayer6392's public serialized field layout using IL2CPP type attributes, skipping private/static fields and resolving reference arrays. The128..900 byte extent closes exactly; material refs113/111/57, character/texture arrays and GUI refs all match scene objects. StumbleKillTimer is7.0 at320, while StartRunVelocity/MaxRunVelocity and StumbleKillVelocityPercent are zero-initialized runtime state. Saved full fields/provenance in `character-player-scene-source.json`. Replaced web stumbleCooldown8 with native7 via `nativeRunnerRules.ts`; chase recovery cooldown remains separately unchanged because it is not proven to share this parameter. TypeScript and diff checks pass.

Important pacing limitation: video score-derived distance is currently treated as world metres throughout authored route estimates. The native pit is10 world metres wide, while the current jump at video-implied8 world metres/sec cannot span it with the web0.73s flight. Therefore blindly fitting score/20 to world velocity would break traversal and is not justified. The relationship among native score, displayed distance, world scale and runtime motion must be established before changing the speed curve/slowdown amount. Prior observations of smaller score increments are valid; interpreting their ratio as a confirmed world-speed ratio is not yet proven.

### Missing third root and second-run coin row

Frames018–020 reveal an additional transverse, moss-covered root after the second right turn:162m approaching,172m airborne over its side-reaching mass,182m past it. Added native `tree-jump-left` / treeJump at fitted177m, bracket162–182. It had been absent from the fixed route. Suppress periodic ambient trunks near it using the existing reference-tree exclusion. An initial TreeSlide candidate was rejected after the runtime screenshot showed its central vertical trunk, unlike the reference's right-side tree and lateral root; the final TreeJump geometry matches that silhouette and native MustJump behavior. Final runtime screenshot replaces the rejected candidate; no TreeSlide change remains in the authored route.

Frames019–022 also show a low left-side coin row after this root, gone by023. Added20 fitted coins177..205.5m, step1.5, normal coin height (count/spacing/position remain estimates). This replaces the previous empty second-turn coin cue; it does not introduce a centerline guide. Browser run without powers: jump at172m, airborne at176.0588m, landed and playing at184.0023m, chaseGap11.5, coins0. Evidence `native-third-root-check.json` / `current-native-third-root.png`. Tests verify native prefab/action, observed brackets, no ambient duplicate trunk, left/low coin bounds; TypeScript passes. All prior browser replay scripts must now jump this new root around172m when checking a clean traversal; old scripts that omit it can stumble and no longer represent an obstacle-free comparison. The later tall gate visible in021 remains incorrectly represented by the periodic low portal and needs a separate placement correction.

### Straight tall gate and removal of fabricated opening half-roads

Frames020–023 show the tall glyph-panel portal after root177, whereas the web's periodic tile192 decoration used the low portal. `referenceScenery.ts` now records a tower variant on tile192 (existing exit-edge placement198m, fitted). Tile pooling keys include gate variant, preventing low/tall reuse. Native tower material/UV1 and center opening are preserved; no duplicate gate was added.

Runtime inspection revealed periodic narrow/side-path rules cutting the opening road at192m and leaving the left coin row floating over water. The reviewed opening through381m has full-width base slabs between explicitly recorded pit obstacles. Classic mode now routes rendering, collision, spawn checks and debug queries through shared narrow/side wrappers that suppress those invented periodic cuts in this interval. Explicit pit surface cuts remain independent; challenge/unreviewed suffix rules retain their behavior. Screenshot `current-native-straight-tower.png` confirms the full-width roadway and tall gate. Browser clean jumps at57/136/172m reach190.1129m, score3800/coins0; narrow(192)/sidePath(192) both null. Continued center passage to204.0603m remains playing. Route/gate geometry tests and TypeScript pass. Placement, camera scale and full scene fidelity remain estimated/unverified; this does not resolve original pillar collision physics or source route generation.

### Fifth outgoing span: two successive pits and tall gate

Reviewed045–055: first outgoing pit jumped in046 (391 score-distance), a second pit visible048/049 and jumped in050 (421), followed by a tree-front T in051/052 and a new outgoing pit in053–055. Added the first two pits at fitted grid centers393/417, observation brackets383–399/406–428. These are source native pit meshes/regions, not random substitutes. Added fitted fifth-turn left coin arc382..404.5m (16 coins,1.5m spacing, estimated heights), gone by048 (406m), and a tall gate at tile420's exit426m. Suppress nearby periodic low portals within36m of reviewed tall-gate tiles to avoid a second fabricated portal appearing behind it. Random obstacles now begin465m, leaving this reviewed span clear; full-width base-road interval extends441m, explicit pit cuts remain.

Browser traversal with no powers, coins0: all five fixed turns; new first jump387.6m lands at400.0445m; second jump411.6m is airborne418.0513m and lands safely by430.0299m. Route/obstacle/coin tests and TypeScript pass. `native-fifth-double-pit-check.json` records traversal; `current-native-fifth-double-pit.png` records second jump. Crucial remaining mismatch: sixth T topology/distance is visibly missing from the current random continuation (test selected next501m), and053+ outgoing pit/coin row are not authored. Direction at that T is not established from the one-second images alone; do not infer it from the random result. The game is not a faithful full-route replay yet.

### Subsecond direction evidence: sixth and seventh T junctions

Refreshed the public Bilibili playurl for the same BVID/CID and sampled two2s clips at5FPS (video51.5..53.5 and58..60). This resolves ambiguity in the one-second set: display00:50.3/score8780 and00:57.6/score9920 both show the actor turning toward the screen's upper-right arm before the camera aligns, confirming RIGHT. Retained `turn-six-mid-right.jpg`, `turn-seven-mid-right.jpg` and `subsecond-turn-evidence.json`; no expiring CDN URL is stored.

Added T-right441 and T-right501, seventh exit tall gate, and sixth outgoing native pits453/477 plus fitted left arc/low tail444..472.5m. Random obstacle boundary moves525m; full-width base-road interval through501m; nearby periodic low gates also respect reviewed exit gates. Distances remain tile-grid estimates, not exact video coordinates: the seventh actual turn occurs near score9900 (~495 assumed score-distance), while the current canonical501m grid node is offset. The score/world-unit/geometry alignment issue remains explicit rather than treating the successful runtime as proof of timing fidelity.

Normal browser traversal uses jumps57/136/172/207.6/291.7/387.6/411.6/447.6/471.6m and turns R,R,L,L,L,R,R. At505.1885m phaseplaying, coins0, turnCount7; graph confirms each branch, no powers used. `native-seventh-turn-check.json` and `current-native-seventh-right.png` saved. Route/obstacle/coin tests and type checks pass; browser errors none. Remaining source061 comparison shows next pit replacing the current random525m arch and a500m plaque layout differing from the current NICE JOB overlay. Neither is fixed here; full replay remains incomplete.

### Native 500m hanging milestone plaque

Source061 shows a top-center hanging distance plaque; the web used NICE JOB/HIGH SCORE art in a rounded status pill. Recovered UIAtlas1969 `messageBoard.png` rect[196,230,297,280] from InterfaceTexture2x72 and added it to the reproducible HUD exporter/source manifest. Hud.vue now displays that native board plus original score digit sprites and unit text; removed NICE JOB art and the two obsolete milestone CSS layouts/pop/toast animations. At414×896 the board is190×179, top−2, centered; this fits the observed stone panel near115..167px high. Unit `m` remains a Georgia font approximation; native label font/anchor hierarchy is not yet recovered. Default milestone timeout behavior is unchanged.

Browser normal traversal through all seven turns reaches507m and naturally reports accessible `里程500`/`m`. For visual capture only, the short-lived milestone state was then pinned through Vue's existing component state after its normal timeout; this is a test setup, not a production timing change. Screenshot `current-native-500m-plaque.png` confirms native vines/stone board, gold500m and top-center placement without NICE JOB. TypeScript, production build (before final10px position adjustment), diff checks pass; browser errors none. Source061 still has a different next obstacle and scenery; full scene parity remains unproven.

### Seventh outgoing span and first wood entry

Source061–066 shows a pit immediately after the seventh exit gate and another before the first wooden causeway; the prior random525m root was incorrect. Added source-native pits at fitted513/549m, brackets507–524/532–550. Added a fitted left coin row525..559.5m with an arc537..555m over the second pit. Last pit's12m surface replacement ends555m, before the564m surface boundary; test asserts it cannot cut the wood entry. Full-width base slabs now persist through564m; random obstacles resume621m. Initial random power spawning also respects this authored boundary rather than placing a600m power ahead of the reviewed empty bridge entry. These are authored reference-prefix constraints, not original generator rules.

Removed the procedural stone/gold crossbar added at every surface change: source067–070 shows no such trim, and runtime revealed it floating across the wooden deck. Native board/pile meshes meet the preceding stone road without this invented threshold. Plank geometry tests pass.

Clean no-power run through seven turns and jumps507.6/543.6 reaches558.0228m with jumpY0/coins0, then578.0805m remains playing on wood. Final558m screenshot revalidated after cap removal; browser errors none. Evidence `native-bridge-entry-check.json` and `current-native-bridge-entry.png`. Route/obstacle/coin tests, TypeScript, diff checks pass. Remaining mismatch is visible: the next turn still comes from the random fallback597/609/621 rather than the video's first wooden T near621m. Source072/074 confirms a wooden T (not current L), source076 shows its outgoing broken plank span; native wooden T geometry and its direction must be restored next. Do not treat the entry traversal as complete wood-segment fidelity.

### First native wooden T junction

Recovered `plankTUp_prefab`877fa763afcd24c26bcc77fc313e8905, mesh21bdad2d265814a92b8f3c0095cba7b8/Object60-Pivot. `export-native-plank-t-junction.py` bakes complete Unity TRS, preserves UV1 and aligns authored floor−15.25 at worldscale0.2; source Region2D is the same eight-point T footprint as the stone T, Height−15.0. Runtime now loads a separate native plankT mesh and `buildTJunction(assets,'wood')` uses wood center/short plank arms; it no longer substitutes a stone T when the path is wooden. Full source transform/hash/region evidence retained in `plank-t-junction-source.json`.

A5FPS clip video74.5..77 resolves direction: display01:13.2/score12420 shows the right-turn intermediate pose. Saved `turn-eight-mid-right.jpg`, updated subsecond manifest. Added fixed T-right621 (eighth turn), fitted low left approach coins600..619.5m, cleared periodic side/narrow rules through621m; random suffix starts693m. Original wooden center/arms preserve board gaps: footprint probes at z−.25/0/.25 give left88.8%/right82.7% ray support with max0.4m seam. A centerline-only ray initially fell along a native board seam; expanded probes model foot width rather than filling the original mesh. Existing stone T tests still pass.

Normal no-power traversal through eight turns reaches614.0661m before the wooden T and630.0460m after accepted right input, playing/coins0. Graph eighth branch621/right, nine active segments; screenshot `current-native-wood-t-approach.png`, evidence `native-wood-t-check.json`, browser errors none. Route/coin/native-T tests, TypeScript and diff checks pass. Important remaining mismatch: source076's broken plank span immediately after this T is absent. The new T does not establish complete wooden-route or obstacle fidelity, and the unreviewed suffix remains random.

### Native broken plank obstacle after the first wooden T

Recovered `plankStraightHoleVert_prefab`7cc44320ed33046d1a8045ba2112f764, meshbba1242191b3249df884e15bbc003145/Object281-Pivot. Full Unity TRS and UV1 are exported by `export-native-plank-pit.py`, floor−15.25 aligned at scale0.2, preserving the native crossed underwater braces and broken side boards. Exported mesh is already in world scale, so runtime skips the legacy obstacle rotation/rescale for this asset. Unlike stone pit prefabs, this prefab's two MonoBehaviours have null script references and32-byte empty headers; sourceJSON explicitly records stripped components and marks collision interval as a geometry-based estimate, not recovered Region2D.

Added plankPit (weight0, reference-only) with estimated12m unsupported interval/cut[-6,6], rendered original mesh. Native centerline ray tests confirm no top board across−5.8..5.8m. Grounded collision falls; positive airborne feet avoid support loss; far-end landing safe. Recorded first wooden hole at633m, source076–078 bracket628–644, with fitted left jump coins624..646.5m. Mapping/spawner tests now cover24 OBJ files with unchanged9 random playable definitions/10000seed checks. UV1 stream suite includes both new wooden assets (33 total).

Full normal no-power traversal through eight turns, jump626.6m: airborne633.0542m, grounded/playing644.0847m, coins0. Focused fresh-run no-jump check teleports626m and falls627.0305m; this isolates support-loss behavior without claiming a full no-input replay. Evidence `native-plank-pit-check.json`, `native-plank-pit-no-jump-check.json`, screenshot `current-native-plank-pit.png`. Native pit/reference/spawner/lightmap tests and TypeScript pass. Remaining fidelity concern: long T exit arm meshes can extend into adjacent hole cuts because junction geometry is not clipped by cutTileSurface, which currently handles ordinary tiles only. Collision range is explicit but the selected-branch visual cut needs a subsequent correction. Later wood route/obstacles remain unreviewed/random.

### Junction exit geometry now respects adjacent holes

Closed the prior visual-support mismatch: `cutTileSurface` clipped ordinary tiles but not the T/L junction arm extending into the next hole. Added `junctionGapCuts` using actual incoming/outgoing path headings: outgoing holes cut localX on the selected arm; nearby incoming holes cut localZ. Cuts stop at the next path segment and only affect junction-range geometry. Game applies these through the same cached, UV-preserving surface-cut implementation as ordinary tiles. Changing a T branch restores the previous source geometry before cutting the opposite exit. Removed/reset junctions also release generated cut geometries instead of retaining them.

Native stone/wood T tests in rotated paths verify selected-arm floor absent in the adjacent gap, unused arm intact, near support retained and UV1 preserved. Wood support samples cover foot width and several nearby points to respect authored plank seams. Existing native pit tests and TypeScript pass.

Full runtime right traversal: at633.0542m playing/airborne, junction621 cuts[[x,6,18]], landed644.0847m. Alternate left-input run: prebuilt right cut[[x,6,18]] becomes[[x,−18,−6]] immediately after selection, then lands644.0648m playing/coins0 with graph621/left. Evidence `native-junction-cut-check.json`, `native-junction-opposite-cut-check.json`, screenshot `current-native-plank-pit-joined.png`. This corrects local visual floor clipping; original stripped wood-hole collision parameters, scoring/world scale, further wood obstacles and complete recorded-route fidelity remain unresolved.

### Ninth right corner and original skull-beam obstacles

Source078–081 clearly shows a right-only wooden corner, now fixed at fitted669m (655/664m approaching,673m after). Source081–086 shows two skull-hung low beams, now authored681/717m; fitted brackets673–692/701–720. Approach coin tail after the first plank hole extends648..655.5m; low left row700..728.5m spans the second beam. Full-width base road interval through765m and random obstacle/power boundary789m avoid the previous unrelated wood roots/powers. Further turn selection after669 remains random; these limits are authored reference constraints, not original generator rules.

Recovered native `plankStraightTowerVert_prefab`8c7332108b6e1445380f44f706ae3e99, meshcd30131f1614349b0bfd66434f3ba3c4/Object275Vert-Pivot, complete tilted/scaled child TRS, original UV1, excluding prefab root's global scene placement. Source Region2D13 is full12×4m floor Height−15; collision Region2D15 spans sourceX±10/Z±2.5 with Height−8. Obstacle14 serializes MustJumpOver=true/MustSlideUnder=true/DoesKill=true. `plankBeam` implements slide with alternate jump escape, fatal standing contact, collisionZ±.5m and virtual height1.45 relative to the existing−15.25 floor normalization. This interprets both native action flags as permitted escapes within the web collision framework; native runtime branching/jump grace are not recovered here. The full prefab supplies its own floor/mossy island/columns/beam/skulls, replacing12m of base deck rather than layering a second road. Shared replacement cuts now also handle non-gap authored tiles and adjacent junction arms.

Clean no-power run reaches first beam681.0061m sliding, turnCount9, all branches R,R,L,L,L,R,R,R,R. Second beam jumped at711.5m, airborne718.0261m (jumpY1.573), grounded/playing727.0261m, coins0. Focused fresh standing check from679m dies680.26m. Evidence `native-plank-beam-check.json`, `native-plank-beam-standing-check.json`, screenshot `current-native-plank-beam.png`. Native beam/source region/action/floor tests,25OBJ mapping/10000seeds,34UV1 streams, route/coins/pit/T tests, typecheck and production build pass (existing legacy CSS/chunk warnings). Remaining prominent mismatch: camera near low beams still uses the general7m follow height; source frame082 suggests the native duck-camera pose is triggered there. Exact trigger and precise position/score/world scaling remain to be established; this is not yet a matching full-video replay.

### Fundamental correction: native progress is not world distance

Resolved arm64 native method pointers through Assembly-CSharp CodeGenModule0x2730788 (5306 methods), metadata v31 method definitions36 bytes and ELF RELATIVE relocations. Reproducible standard-library-only `tools/inspect-native-runtime-methods.py` disassembles the library without executing it; named methods/hashes/runtime fields are saved under `analysis/native-methods/`. GameController.ComputeDistanceTraveled isRVA0x126e280/token060003f3; CharacterPlayer.AddScore isRVA0x1298a8c/token06000525. Cross-module resolution confirms the repeated call0x24bf450 is UnityEngine.Time.get_smoothDeltaTime (NOT ordinary deltaTime). PreviousLocation is CommonPlayer+0x7c; the method takes X/Z displacement only.

Native sequence: speed=horizontalRawDisplacement/smoothDt; s=speed*(float32 1/60); metricDelta=(smoothDt/(1/60))*s²/20. Thus metricDelta≈rawDisplacement²/(1200*smoothDt), or worldDisplacement²/(48*smoothDt) at scale0.2. It accumulates DistanceTraveled(+0x124), carries integer DistanceRemainder(+0x120), then AddScore multiplies integer progress by CharacterPlayer.ScoreMultiplier(+0x13c), adding Score(+0x138). At stable20 world units/sec, progress is≈8.333/sec, not20; doubling physical speed quadruples progress. Therefore all earlier `score/20 = world metres` interpretations are disproven. Existing route/obstacle/surface coordinates are temporary legacy fits, not recovered physical positions; added explicit warnings in their source comments. This also resolves why matching video score increments by lowering physical speed made native-width gaps impossible to clear.

Added isolated `nativeProgress.ts` and source-linked tests for the recovered formula, axis symmetry, speed-squared behavior and integer carry across30/60/120FPS. Uses JS double arithmetic, so not claimed bit-identical to original float32 accumulation. It is deliberately not yet wired into live scoring: doing so without recalibrating route/world speed together would combine incompatible units. Full physical movement/route/score migration remains required.

### Verified native airborne camera offsets

Native GameCamera.UpdateRVA0x12af8bc confirms CharacterPlayer.IsJumping(+0xf8). When airborne and NeedsToDuckCamera(+0xcc) is false, FollowHeightJump and FollowDistanceJump each add0.5*(playerY−GroundHeight); FocusHeightJump adds0.25 of the same height. Implemented these offsets using actual jumpY; the independent duck flag still takes priority and is not guessed from sliding/beam proximity. Exact duck-trigger writer remains unresolved.

Camera tests match source serialized bases and native half/quarter offsets. Browser normal first-turn run: standing cameraY7.0000/lookY4.0000; at jumpY1.47, smoothed cameraY7.5506/lookY4.2978; after landing cameraY7.0027/lookY4.0004, phaseplaying. Evidence `native-jump-camera-check.json`, screenshot `current-native-jump-follow.png`. TypeScript/native-progress/camera tests pass. This is an active camera correction plus a source-backed scoring foundation, not a claim that the full game's scoring/pacing or video alignment is fixed.

### Recorded score curve and actual gameplay font

Recovered the live HUD Score Label4359 on level GameObject249 (`Score Label / Score Text / Score / Top Right / Game GUI Root / GUI 2D`). It references shared UIFont1955 Cheboygan_Arty2x, material40, FontAtlas2x texture71. Verified serialized UIFont glyph records against the APK BMFont TextAsset439d27717fbf1af4b9a419d097ee0139. `tools/export-native-score-font.py` exports original RGBA glyphs plus metrics/hashes/source references. Native digit advance36, lineHeight82, and per-glyph bearings differ from the prior proportional score sprites. New NativeScoreNumber uses these metrics and original gold pixels for the live score only; coin/milestone/end-screen font identity remains separately unverified. At414px width the current display uses0.5 font scale; plate padding adjusted from source009 visual comparison. Screenshot `current-native-score-font.png` pins UI score1520 for comparison only, then browser reloaded to restore normal gameplay. This fixes the font, not the still-inaccurate gameplay/world pacing.

`tools/read-reference-scores.py` matches those native glyphs against source frames002..263 with normalized correlation and writes `analysis/reference-score-observations.json`.261 gameplay frames002..262 read successfully, minimum per-glyph confidence~0.827;263 is an end screen and correctly flagged unreadable by this HUD reader. No temporal correction is applied. These are automated observations, not261 individually manually verified readings. Early corrections:004=360 and005=600, superseding older manual380/620 readings.

Directly reviewed263: final score47,240, distance2,312, coins0, multiplier20. Thus the previously observed1,000 point discrepancy is real. Largest one-second increments are680 at146 and660 at182; subtracting an inferred500 award at each yields local normal increments180/160 and final progress2312. The exact native cause of these two awards remains unverified; do not represent them as recovered pickup logic. This also supersedes any provisional suggestion that the final distance might have been misread as2312 instead of2362.

`tools/calibrate-reference-progress.py` saves `analysis/reference-progress-calibration.json`, separating inferred awards, progress, interval RMS world speed and explicitly approximate constant-speed travel. Native squared-speed formula plus one-second samples gives cumulative estimate5360.855 world units, versus2312 progress units. This is not exact path length: smoothDeltaTime/frame timing, integer carry, turns and within-second acceleration are unresolved. Existing route coordinates must be jointly migrated with physical motion and score; no runtime score-only switch made. TypeScript and production build pass; existing legacy bar texture/chunk warnings remain. `git diff --check` passes.

### Native water-follow grid and acceleration source recovery

Actively corrected water anchoring. GameCamera.UpdateWater RVA0x12b02e4 reads camera world X/Z, divides each by200 raw units, converts float to signed integer (toward zero), then multiplies by200. It preserves waterY. At worldscale0.2 the grid is40m. Previous continuous camera-follow translated UV features every frame. `nativeWaterAnchor` now applies the source grid to both camera axes, including negative coordinates; it keeps the recovered height−6.1. Tests cover both signs and just before/at grid boundaries. Browser saved `native-water-follow-check.json`: cameraZ−36.6887→waterZ0;−55.8263→−40;−94.4830→−80;−145.6685→−120, all phaseplaying and waterY−6.1. Screenshot `current-native-water-grid.png` is a debug-position render, not time-matched reference proof. Reload restored normal loop. Native-water tests, typecheck and production build pass (same legacy warnings).

Expanded `inspect-native-runtime-methods.py` to named disassembly of HandleControls, HandleBonusItemPickup, StartCoinBonus, PlayerConfigData constructor, config getters and other motion-related methods. No APK/native code executed. Constructor defaults are source-confirmed: native start velocity100, maximum210, stumble factor0.85; AccCurveThresholds integers[50,65,85], AccCurveForces[3000,1000,150,50]. GetAccelerationCurveThreshold/Force divide list values by100. HandleControls compares current run speed / max run speed with thresholds, chooses the corresponding force, applies it along normalized transform-forward and suppresses regular acceleration while jumping or sliding. These are APK constructor defaults, not yet confirmed live video remote configuration. Therefore they remain evidence for the forthcoming joint motion/route/score migration, not a live speed-only patch. Exact boundary comparisons and MovingObject force integration still need preservation.

HandleBonusItemPickup at12710e4 reads BonusItem+0x7c and passes that Value directly to CharacterPlayer.AddScore. Non-coin type switch then applies its power. StartCoinBonus RVA1298cb0 calls AddCoins with its argument and clears CharacterPlayer+0x184; it is an instantaneous award, contradicting the current web timed bonus power. The amount comes from GameController.CoinBonusValue+0x154 at12711d8, so no guessed fixed amount was installed. Native award prefab Value population/config and the two observed500 score awards still need linking before replacing active pickup rewards.

### Instant coin bonus and verified500-point power awards

Resolved the previous unknown CoinBonusValue. Native LoadLevelInformation126a178..126a220 initializes GameController+0x154 to50 and uses jump table6b7876 to map native upgrade levels1..6 to[50,75,100,125,150,150]. This is separate from the web's invented coin-value upgrade; current implementation uses source base50 without pretending that web upgrade levels equal native ones. `inspect-native-coin-bonus.py` asserts instruction words, branch targets and source jump-table bytes, emitting `native-coin-bonus-source.json` with binary hash.

Active pickup behavior now adds50 coins immediately, preserves any active timed power and does not start a bonus timer. The existing random meter-grant branch, when selecting bonus, also awards immediately; the random power-from-meter system itself remains unverified. HUD terminology changed from金币加成 to金币奖励. Native reward upgrade purchase UI is not yet restored.

Also resolved the score award: BonusItem.Instantiate12961ec computes BonusType−1; jump table6b7a7f bytes[3,5,7,0,0,0,0] sends native types4..7 to1296534, assigning Value25 at+0x7c. HandleBonusItemPickup12710e4 passes that Value to AddScore; AddScore1298a8c multiplies by run ScoreMultiplier. Thus all four native power pickups award25×20=500 in this recording. Added this score for actual magnet/shield/boost/bonus pickups (not arbitrary meter grants). Updated calibration assumptions:500 amount/cause is verified, sampled event seconds146/182 remain inferred. Coin Value assignment5/10/15 was observed too, but coin-meter score/logic is not migrated here.

Browser focused check with shield active: before score240/coins0/distance12.22257, after bonus score740/coins50/distance12.23472, shield still active9.999s. Next ordinary coin raises coins to51 and retains shield. Evidence `native-coin-bonus-check.json`, screenshot `current-native-coin-bonus.png`. Debug spawning is explicit test setup, not source video timing. Browser reloaded afterward. TypeScript, native instruction verification, progress calibration regeneration and production build pass; existing legacy texture/chunk warnings persist. Overall motion/route/score unit migration and full-video replay are still incomplete.

### Speed-dependent native slide duration and pacing baseline

Recovered MovingObject.ApplyForce12e08ec and Simulate12e0054: force is accumulated, then velocity += force * Time.smoothDeltaTime; force/flag are cleared after application. GetRunVelocity12982d8 takes X/Z magnitude; GetMaxRunVelocity129833c returns MaxRunVelocity, with2×/2.5× boost branches. HandleControls compares horizontal/max ratio to0.5/0.65/0.85 and applies raw forces30/10/1.5/0.5 along normalized forward, suppressing normal forward force during jumping/sliding. Exact50% enters second band;65% stays second,85% stays third. Native constructor default start100/max210 correspond20/42 world speed. Added source-linked nativeMotion functions and boundary/action-suppression tests; forward acceleration and native jump impulse remain isolated until route/motion/scoring units migrate together.

`compare-native-pacing.ts` generates `analysis/native-pacing-comparison.json` for all261 recorded observations using a120Hz no-input/default-config baseline, explicitly without jumps/slides/stumbles/powers. At7s baseline progress99.58/speed28.42/world182.17 versus observed76; at30s baseline588.19 versus observed280. This does not prove remote config mismatch: source input/stumble events and sample phase are missing. It shows why simply swapping default speed is not a validated replay. Original observed score-derived RMS physical travel estimates remain separate from this no-input baseline.

Actively restored slide timing: CharacterPlayer.Slide12987d8..12987f4 computes min(raw horizontal speed * float32 literal0.007000000216066837,0.75). Native flags reject already-sliding/airborne/dead attempts. Web slide now uses actual web horizontal speed (including its existing skin/boost factors), converts with worldscale0.2, stores duration separately from remaining time for animation phase, and rejects repeat slide while active. Removed the stale1.05s constant. Native jump velocity is clamp(raw horizontal speed,80,100) and gravity force magnitude250 (world16..20 impulse, gravity50); these are recorded but not installed piecemeal into the old route pacing.

Browser early slide at speed~12.14 has duration0.425006s. After100ms remaining0.324006; repeat input then1ms yields0.323006, not a reset; after another600ms remaining0 and stillplaying. Focused woodbeam run from678: at681.02m speed20, duration0.70000002, remaining0.55000002, playing; after694.02m remaining0/playing. This is collision regression at debug positions, not time-matched whole-route proof. Saved `native-slide-duration-check.json`, `native-slide-beam-check.json`, `current-native-slide-duration.png`; reloaded normal loop afterward. Native-motion and slide-animation tests, typecheck and build pass; existing legacy texture/chunk warnings remain. An initial test invocation used a nonexistent runner-slide alias, then the actual temple:test:slide script passed.

### Opening action evidence and persistent stumble slowdown

Re-fetched public video4.0..8.0s at5FPS to inspect game~2.0..5.8s. Contact sheet `opening-action-subseconds.jpg`, retained source frames `opening-tree-hit-before/during/after.jpg`. Upright atgame2.0; low/prone pose by2.8 and through root approach. Root passes the actor around5.0..5.4; chase pack is visibly close by5.8. Pose suggests repeated slide, but no input telemetry exists, so exact accepted slide intervals are not asserted. This confirms why a no-input acceleration baseline is inadequate.

Original one-second score observations give pre-root progress rate(1120−600)/20/2=13/sec overvideo5..7; post-root(2080−1320)/20/4=9.5/sec overvideo8..12. With the recovered squared-speed progress formula, inferred horizontal speed ratio sqrt(9.5/13)=0.8548504, close to native float32 stumble multiplier0.85000002384. Saved `analysis/opening-stumble-evidence.json`; RMS assumptions and quantization remain explicit. This is evidence for a stumble, not proof of exact input timing or path length.

Fixed active behavior: previous web stumble only moved chase enemies and left speed intact. Native CharacterPlayer.Stumble multiplies velocity, so accepted stumble now scales horizontal Speed and Jump.v by the native factor. The speed drop persists across frames instead of being overwritten by the legacy distance-speed formula. Recovery adds native forward acceleration, suppressed during jump/slide, until reaching the existing legacy cruise target. The cruise target and scoring remain unconverted; this is a verified stumble correction, not full native movement restoration. Restart also clears stumbleCooldown: discovered old cooldown carried into a fresh run and could kill the player on its first stumble.

Two consecutive actual runs from the entrance (no debug teleport) both show before distance59.70262/speed12.71567, hit59.76620/speed10.808967, measured ratio0.850051 (includes one5ms cruise-growth step), chasegap3.8, phaseplaying. After starting slide, speed remains exactly10.808967 for two100ms checks; after slide/recovery it reaches12.853825 at71.47346, stillplaying. Both restarts produce the same safe first hit, verifying cooldown isolation. Evidence `native-stumble-motion-check.json`. An earlier teleport check missed the already-spawned root because debug jumpTo clears objects without rewinding referenceObstacleIndex; discarded as collision evidence. Another preliminary run exposed the cooldown carryover and prompted the reset fix. Native-motion tests, typecheck, build and diff-check pass; existing legacy warnings remain.

### Joint classic-mode physical movement / authoring / score migration

This section supersedes the prior statement that native progress and motion remain isolated. Classic gameplay now starts at the recovered APK default20 world units/sec, accelerates through the native ratio bands toward42, suppresses forward acceleration while jumping/sliding, uses native jump impulse clamp16..20 and gravity50, and preserves the0.85 stumble velocity reduction. Classic skins no longer change physical speed. Boost is still the existing approximate1.35 timed effect, not a claim of native boost restoration; challenge retains its legacy motion rules.

Classic RunStats.distance now accumulates the recovered progress metric, not TrackPos.distance. Each step measures actual smoothed path X/Z displacement (including lateral motion), feeds nativeProgressDelta and integer-remainder AddScore logic. HUD distance,500m milestones, saved best/result distance use this metric. Physical path coordinates remain separate in TrackPos and debug state; debug now exposes progressDistance and score. First-second browser test gives physical21.6725, progress9.79467, score180: these are intentionally distinct quantities. JS double/timestep smoothing still differs from exact native float32/Time.smoothDeltaTime behavior.

`calibrate-reference-progress.py` now also reproducibly emits compact runtime `referenceWorldCalibration.json` knots. `referenceCoordinates.ts` maps the old score/20 authoring coordinates through the sampled physical-travel estimates. Reviewed turns/obstacles snap to the existing12m junction-center grid, surface/straight-gate tiles to12m tile centers; coins and pickups use interpolated physical positions. Original logical positions remain as legacyDistance and collision brackets remain original score-derived brackets. These are physical placement estimates, not exact recovered scene coordinates. Current turn centers are177,333,501,645,885,1029,1185,1473,1581; native obstacle centers129,309,381,477,681,909,969,1065,1125,1209,1293,1497,1617,1689. First wood entry now1332, rather than the erroneous564 physical units. Source500-point award inference is separated from progress, and later authoring remains uncertain.

Additional video8.8..10.2 at5FPS (`first-corner-subseconds.jpg`) shows first turn at game~7.4, around source score1600..1640. Interval RMS-only mapping rounded its center to165 and runtime turned at6.89 under repeated-slide test. First junction was fitted one tile later at177; identical test now turns at7.43. This is a source-timing authoring adjustment, not native generator recovery. Under inferred repeated sliding from2.7s, root stumble occurs5.11s (source contact~5.0..5.4). Scores are still too high: native-default runtime at8s is1880 vs source~1700. Initial/remote config, exact inputs and smoothDeltaTime remain unresolved; no counter offset or fabricated slowdown was added to hide that discrepancy.

Continuous no-power/no-coin runtime replay traverses all9 authored turns, jumps every recorded root/pit, slides first native wooden beam1617, jumps second1689, and lands at physical1725.0187 / progress1181.25535 / score23620 / coins0 / turnCount9 / phaseplaying. `native-physical-prefix-replay.json` records23 actions. This replay uses safe test actions, not the video's repeated-slide input stream; it proves playable geometry/physics integration, not time-identical video reproduction. The first run exposed a random turn at1677 overlapping the final reviewed beam1689; next random turn is now constrained beyond the reviewed prefix at1857. Debug jumpTo also rewinds referenceObstacleIndex so focused checks reinsert relevant obstacles after clearing their objects.

Corrected classic yellow/red/blue coin score from invented combo points to native Value5/10/15×20 =100/200/300; classic physical coin count uses native base value1/2/3 instead of the web's unrelated25% upgrade modifier. Native CoinMeter/full-meter reward behavior and upgrade UI remain unverified. Power pickup Value25 still gives500; coin bonus still instant50. Native source verifier now asserts the coin value switch too.

Updated coordinate-dependent route/coin/obstacle/surface/spawner checks; removed the obsolete pacing test that treated score/20 as metres and asserted a match to the wrong speed formula. Tests now verify separate physical/progress units, native hole-spanning jump, converted coordinate placement and retained observed content. Route, recorded coins/obstacles, pacing,10000-seed spawner, terrain, late coin colors, native T/adjacent cuts, native pits, native motion/progress, typecheck/build and diff-check pass. Build retains existing legacy bar-texture/chunk warnings. Full271-second route, exact speed/config/input replay, boost, meter/upgrade rules, camera duck triggers and remaining visual differences are not complete.

Follow-up migration checks: focused classic run physical21.6725/progress9.79467/score180; one yellow coin yields coins1/score280, then coin-bonus pickup yields coins51/score780 and retains shield. Saved `native-migrated-reward-check.json`. Classic intro now follows its time-based orbit through3s instead of prematurely cutting it when the faster physical runner crosses50m.

Visual inspection of the migrated first exit exposed another old-coordinate remnant: gate offset8 placed the tower behind the camera too early. Fitted physical exit offset20 for recorded exit towers; nearby duplicate suppression uses the same offset. This remains a visual fit rather than recovered placement code. Screenshot action sequence now includes a jump at7.6s after the turn, matching the source010 airborne pose rather than comparing it to continuous sliding.

That view also exposed incomplete lower gate supports. Original tower lower support triangles span |x|~9.3..15.9 / |z|~5.2..18.7. The previous all-vertices |x|>=12 / |z|<14.1 selector retained isolated fragments, so its old min-y test passed even while glyph pillars visibly floated. The selector now retains complete above-floor low supports (|x|>=8, |z|<19, minY>=.01), preserving original geometry/UV1 and excluding the y0 road slab. Added ray checks through both pillars at worldx±2.3 and y.2/.8/1.5/2.2; all pass along with existing centre-passage/UV1 checks. Before/after visual inspection confirms source stone supports connect the glyph panels toward the roadway. These geometry-derived selection limits are not claimed original submesh boundaries. Final `current-native-migrated-opening.png` shows the restored supports and fitted gate; camera angle, score1880 vs source~1700 and other source differences remain visible. Gate test, final typecheck/build and diff-check pass. Browser returned to normal playable menu after deterministic captures.

### Recorded route extended through the first wood exit (frames086..113)

Visually reviewed the next28 source seconds; saved contact sheets `later-wood-086-101.jpg` and `later-wood-102-113.jpg`, plus structured `analysis/wood-extension-observations.json`. Source088/091/099/102 clearly show additional native skull beams on stone/moss islands. Source096/108 show full-width broken plank spans with the same native hole structure. Source097 approaches a left-only wooden corner and098 shows the left turn;109 approaches another left-only corner and110 is on its outgoing arm. Order/identity/direction are reviewed, exact centers/coin counts remain fitted.

Added four plankBeam placements at legacy745/777/857/887 (physical1761/1821/2001/2073), two plankPit at817/937 (physical1917/2181), tenth left corner837→physical1953 and eleventh left corner957→physical2217. Preserved correct corner geometry rather than introducing a T choice. Added source092..095 right low coins778..806.5 on the long ninth outgoing straight,100..103 left low coins856..887.5 after the tenth turn,110..113 right low coins960..991.5 after the eleventh. All use the existing physical conversion and native assets, not new approximating primitives.

Source111(score19400 / old coordinate970) is still at the wooden exit while112(score19620 /981) is on stone. Revised the first wood end from old984 to fitted976, physical2256. This supersedes the previous rough984 boundary. Full-width protection covers reviewed coordinate993 plus a96m visibility buffer; random obstacle/power/next-turn boundary is now legacy1041/physical2409. The buffer is a presentation policy to prevent unreviewed random content appearing inside a reviewed shot, not recovered generator behavior. An initial extended run exposed random shield/centre coins ahead of2290 with boundary1005; those were removed by the larger boundary. Source113 still differs in distant trees/camera and other details.

Full continuous no-power/no-coin replay now executes31 actions from the entrance, passes11 turns, all recorded roots/pits/beams and crosses back to stone. Final physical2290.24711, metric1620.49093, score32400, coins0, turnCount11, phaseplaying, terraintemple, next turn2409; no random obstacles or pickups in the reviewed view. Saved `native-wood-extension-replay.json`. Intermediate native hole1917.19284 has jumpY3.51/playing (`current-native-wood-hole-two.png`). Final stone screenshot `current-native-wood-exit.png`. This is a safe-input integration replay, not source-input timing; source frame113 score19780 is not expected to match this faster jump-based test. Exact repeated-slide input/config replay still remains unresolved.

Visual inspection of the stone exit found another invented low stone gate produced by the old index%7 periodic decorator. Classic periodic gates are now suppressed inside the reviewed/full-width buffer, while explicitly recorded straight/turn gates remain. Final continuous replay was repeated after this cosmetic change and passed. Source-reference route/coin/obstacle checks,10000-seed spawner, terrain boundary checks, typecheck, build and diff-check pass; existing legacy bar-texture/chunk warnings remain. Source route beyond113, powers later in the video and full visual matching remain incomplete.

### Stone short turns, duck camera, enemy units and native flame (frames114..146)

Reviewed per-second frames114..145 and125 subsecond frames at5FPS for video120..145. Saved contact sheets later-stone-114-129, later-stone-130-145 and stone-turns-subseconds-a/b plus analysis/stone-short-turn-observations.json. Added ten turns: legacy1055L(T),1081R,1103R(exit gate),1127R,1147L,1165R,1187R,1207R,1231R,1253L. Subsecond frames088/113 specifically confirm137.4R and142.4L; earlier provisional opposite directions were rejected. Added low root1007, flame1031 and jump root1271, side coin rows and centre shield1290. Coordinates/counts remain physical fits, not recovered generator state. Full-width review protection now covers through legacy1311 plus96m visual buffer, random boundary1365/physical3105.

Recovered native camera duck flag: Update clears when not sliding; nearest active obstacle sets it for MustSlideUnder and (sliding or invincible without MustJumpOver). The flag remains latched until sliding ends. Web nearest-element mapping currently uses a12m obstacle footprint approximation. Native camera uses duck height1.2/behind12/focus2.8 and normal7/10/4, plus recovered jump offsets. Camera tests and browser slide2332 show descent, latch past the tile and reset. This supersedes previous unresolved duck trigger notes.

Recovered native enemy presentation from SimulateEnemies: raw lowerbound11.5 is NOT world maximum11.5. Target base uses time-since-stumble t: max11.5 of t/10*46-23, values above25 jump to75; scale.2. Duck+sliding adds75raw; otherwise intro adds10raw. Outward rate200world/s while ducking, otherwise20; inward20. Reset starts t=7. Classic presentation now uses this, so normal later gap15 and duck gap30 keep enemies out of the low camera. Legacy chase/death gameplay and intro-duration approximation remain separate and incomplete. Source method evidence is recorded in native-methods/source.json.

Replaced invented flame geometry/two side jets with full native prefab26a999... mesh TRS, UV1 and one original UISprite fire1..10 at15FPS. Native flags jump/slide/fatal and collision region raw±2.5 longitudinal,±10 lateral,height8 produce world Z±.5,X±2,height1.6. Flame includes native floor and replaces ordinary tile±6. Source sprite parent position maps to [0,4.26649,-.215527], dimensions3.84000015×2.01000008, canonical horizontal orientation reversed; values now derived from serialized transforms. Runtime billboard behavior and per-frame resizing are not recovered; fixed serialized quad is used. The earlier claim that the centre lane is safe was wrong and is superseded. Standing now dies; slide and sufficiently high jump pass, without fake action-grace windows. Native plank beams also use strict action timing.

Low root prefab b749... has slide-only/fatal flags and world collision height1.6,Z±.6,X±2. Restored scale.2 and strict sliding. Existing tree-slide OBJ exports tree Object99 only, omitting separate floor Object27, so base road is retained; applying a floor replacement here made a false hole and was removed after geometry ray testing. Other tree prefab scales/collisions remain unverified. Native base magnet/shield durations recovered as15s and applied to classic pickup/grant/debug flows; boost remains approximate.

Final continuous44-action replay, after tree scale/strictness and flame orientation fixes: physical2967.00987, progress2165.38383,score43800,coins0,turnCount21,phaseplaying,next3105; screenshot current-native-stone-invincible.png and native-stone-final-replay.json. CDP observation exceeded3s but the simulation completed; following state confirmed completion. This is safe-input integration, NOT source timing/input equivalence. Source146 score26220 still differs substantially from this jump-heavy replay; exact input/config/smoothDeltaTime remain unresolved. Browser focused flame checks: standing fatal, active slide valid, jump above1.6 valid. Native flame, camera, chase, route/coins/obstacles,10000-seed spawner, typecheck and production build pass. Existing legacy bar texture and chunk-size warnings remain. Entire route after146 and full visual equivalence are unfinished.

### Later stone obstacles through frame177

Reviewed146..177 plus5FPS subsecond video150..177. Added151.2 left corner (legacy1357),155.2 right T1393,171.4 right T1545 and176.2 right corner1585. Added treeJump1335, pits1371/1397, treeSlide1427, three flame towers1455/1479/1505, pit1533, treeJump1565, two tall straight gates and observed side coin rows. Native prefab identity/order is reviewed; positions/counts remain fitted estimates. Buffer protects through1592 with random boundary1647/physical3717. Source enemies visibly overlap camera during parts of the invincible sliding sequence; current enemy scalar follow formula is recovered, but complete camera-relative arrangement still differs.

Continuous prefix44 actions followed by13 new actions passes all25 turns and later obstacles at physical3620.21499, progress2708.04228,score54660,coins0,phaseplaying. New-turn immediate pit3177 was crossed with a jump immediately after turn3165, confirming collision/tile continuity. Saved native-later-stone-replay.json and tools/browser-stone-replay.js (earlier44-action prefix). Route/reference obstacle/coin checks pass. This replay is integration evidence, not source-score/time identity. Source after177 remains to implement.

Final captures were refreshed from continuous entrance replay (not debug teleport): low root3255 and first later flame3311, both playing with active slide. Native fire still differs in apparent integration with tower caps; serialized centre-pivot4, position/scale/rotation are verified, but NGUI runtime sprite handling remains to inspect. An attempted isolated jumpTo screenshot was rejected because debug teleport resets custom graph/camera and can introduce random obstacles; it was overwritten by continuous replay captures. Final typecheck/build/diff-check pass. Additional source178..193 was visually inspected and5FPS turns185.2R/189.0R/193.8R confirmed, but these later turns are not yet implemented. Long-hole A/B source analysis shows separate near/far endcap prefabs with only one safe rim each; current old pitLong definitions remain unrecovered and should not be treated as accurate. No long-hole change was made from visual guesswork.

### Second shield and actual narrow floor families (frames178..210)

Reviewed per-second178..210 and5FPS intervals178..194/194..209. Saved source-pickup180, source-turn185/189/193/199/204/207 and source-gap195-198 contact sheets. Added six right corners near185.2/189.0/193.8/199.2/203.8/207.2 (legacy1683/1711/1747/1791/1829/1861); route now has31 observed turns. Source207 has a central moss medallion still absent from the chosen corner variant. Added flame1609, narrow left rock1627, right-root trip1669, side holes1697/1719/1725, left trip1731, consecutive right-side narrow blocks1765/1771/1777 and1801/1807/1813, left trip1783, right-root jump1817, full pit1841 and flame1877. Later root/Long-vs-Small narrow identity and tile counts remain visually fitted, not recovered scene instances. Full-width scenery protection now throughW1887+96; random boundaryJ1941/4401.

Important correction: enlarged source187/191 show a surviving right road strip. The initially authored standard full-width pits there were wrong and are superseded by native narrow floor pieces. Source195..197 and200..202 show longer surviving left strips, fitted as three consecutive12m native blocks. These counts are estimates; no claim of exact native generator sequence. Centre invincible sliding is allowed over missing support; unprotected players can use the surviving strip or jump shorter spans.

Recovered four NarrowLong/Small prefab meshes with complete parent TRS and original UV1. Native support is Region2D11 Height0, with NO Obstacle blocker component. LongUp (web narrow-wall-left) safe X=.4..2 for Z±6; LongDown safe X=-2..-.4. SmallUp/Down have9-vertex concave polygons that retain full-width approach/far rims and progressively remove the opposite side near the centre. This contradicts old lane-blocker/dodge definitions. Runtime now cuts the ordinary floor for these native12m tiles, renders their original road/rock mesh at scale1 (world scale.2 already baked), and queries current grounded feet against the exact polygon. Any positive airborne clearance crosses unsupported ground; recent jump-button grace does not. Source polygons exported in nativeNarrowRegions.json and audited native-narrow-source.json. Tests verify safe strips, boundaries, concave approach regions and actual y0 floor rays.

Also restored native HoleLongA/B endcap full TRS/UV1 and their one-rim support polygons. A is the far/negative-Z cap, B the near/positive-Z cap. A paired B100/A112 yields22m unsupported ground95..117 with real rims. Previous gapLong renderer returned an empty group; now actual meshes render. Paired support testing exposed a false walkable point at a shared tile boundary; native polygon regions now include tile-boundary queries rather than skipping both intervals. Ordinary standard-hole rim boundaries are unchanged. Unpaired long-hole caps and the invented fireWall were removed from the random standalone pool; they cannot be valid native standalone obstacles. No long-hole cap was inserted into this recording merely from uncertain visual resemblance. Native-long-hole-source.json and native-long-hole tests record the source and paired behavior.

### Recorded shield upgrade and duration correction

The earlier15-second classic shield used the native base value, but BOTH source effects last about25s: pickup145.6..expiry170.6 and pickup181.4..181.6..expiry206.6. Recovered LoadLevelInformation's actual upgrade switches: InvincibilityDuration levels1..6 =15/17.5/20/22.5/25/25, VacuumDuration15/20/20/25/25/25. Native jump tables6b787c/6b7882 and stores126a2dc->15c /126a3a4->158 are asserted by inspect-native-coin-bonus.py. Thus the reference has the25s invincibility duration of level5 or6 (these cannot be distinguished from video); classic reference shield now uses25. Magnet stays at base15 until source evidence exists. This does not pretend the unrelated web store upgrades are the recovered native account state.

Second shield is authored centre lane at fittedW1637/physical~3706, within the source500-point jump, height3. Trimmed overlong side coin tails after source162/175/179: no extra right row remains beside the181 shield. Runtime focused duration test: at15.01s shield has9.99s remaining, at24.99s .01s, at25.02s power cleared, all playing. Saved native-reference-shield-duration-check.json. Continuous entrance replay at3706.25067 picks up shield with24.97s remaining and jumpY3.51; current-native-narrow-shield.png refreshed after the coin correction.

Continuous entrance replay now passes31 turns, physical4270.17810, progress3259.62608,score66180,coins0,phaseplaying,next4401. Saved native-stone-210-replay.json plus reproducible browser-second-shield-replay.js/browser-stone-210-replay.js, chained after earlier entrance/later-stone scripts. Second shield protects the long narrow centre crossings in this run, as intended by that test; this is integration evidence, not unprotected lane-dodge proof or source-input/timing identity. Actual native polygon tests independently cover unprotected safe/unsafe feet. Screenshot current-native-long-narrow.png shows source-style surviving left strip and safety net over the broken right side. World/score timing still differs substantially from reference due unresolved config/input/smoothDeltaTime, so reference power expiry is not expected at the same physical coordinate in the faster safe replay. Route beyond210 remains to implement; full fidelity is not achieved.

Final verification for this extension: native narrow and paired long-hole tests, standard/plank pit support, native lightmap34streams, steering,10000-seed spawner, native flames/powers, recorded routes/obstacles/coins, typecheck and production build pass. Diff-check clean; live browser warning/error capture empty. Existing build warnings remain for legacy bar-track/bar-gold paths and553KB sound chunk. Browser restored to playable menu. Source reference after210, exact timing/config/input replay, remaining UI/scene variants and complete visual matching remain unfinished.

### Second wooden section and first-run route to its ending (frames210..263)

Reviewed210..263, plus130 source frames at5FPS for216..242 and105 at5FPS for242..263. First final-stone fetch terminated with zero frames; a fresh official playurl request succeeded, not a restart of a still-live process. Saved source-turn218/229/232/236/242/244/246/248/249/252/259 sheets. Wooden turns confirmed219.3 right T,230.4 left corner,233.7 right corner,237.0 right corner. Final stone confirms243R,244.8R(T),246.4L(T),248.2R,249.8R,252.8R,260R. All42 turns of the first recorded run are now authored; exact positions remain calibrated estimates. The264..270 footage is a separate restarted run with a different opening, not more first-run route. Its alternate seed is not implemented.

Added narrow1897, broken planks1911/1949/1999/2055/2083/2123, native plank beams1983/2027/2143, source-visible uncollected coin-bonus1937 at centre height3, and side coin rows across the second wood section. Entry1908 is bracketed by212 stone/213 wood; exit2172 by240 wood/241 stone, retained as estimates. Pit2123's final edge exactly meets the next junction deck edge; placement validation now allows equal touching edges while still rejecting actual overlap. Added final right trip2261, low root2287, flame2307, recorded tall gate2313, left narrow2327 and final right narrow2359/2363/2367. The final three native blocks are adjacent12m cells; initial old coordinates2365/2371 skipped a cell after conversion and were corrected. Geometry-derived adjacency is checked. Narrow count and root subtype identity remain visual fits. Reference scenery guard throughW2380+96 and random boundaryJ2433/5529 prevent invented random content in the last reviewed view.

### Recovered native pickup collision; correction to earlier reach approximations

New centre-height3 bonus exposed a real integration error: updatePickups checked height only for coins, so walking beneath any high power collected it automatically. Initial second-wood replay incorrectly awarded50 coins and500 points. Recovered GameController.HandleBonusItemPickup: per-type pickup sphere intersects CharacterPlayer.GetWorldSpaceBounds through MovingObject.DoesSphereIntersectBoundingBox, with Bounds.SqrDistance <= radius². Native bounds relative to player raw position are min[-1.74690008,-.16485,-1.74690008], max[1.74690008,9.58664989,1.74690008]. World scale.2 yields half-width/depth .349380016, y[-.03297,1.917329979]. There is no sliding branch: visual slide does NOT shrink these pickup bounds. The earlier custom slide-height coin reach was a web approximation, not native behavior.

Radius raw types1..6 =3/2.25/2.25/2.25/3/3, default boost2.25; type4 bonus,5 shield,6 vacuum,7 boost are confirmed by the native switch destinations. World radii yellow/shield/magnet .6, red/blue/bonus/boost .45. Classic non-magnet pickups now use exact three-dimensional sphere-AABB distance, including corners and vertical separation, for both powers and coins. Magnet attraction still uses the old approximation and remains incomplete. Bounds/pickup instruction checks and raw constants exported reproducibly by inspect-native-pickup-reach.py to native-pickup-collision-source.json/nativePickupCollision.json. Earlier pickup-reach-source.json's 'native thresholds unknown' is superseded by this recovery; visual bobbing/spawn heights remain fitted.

The safe input test's first shield jump moved from2927 to2932 so it reaches the height3 shield rather than relying on the old height-blind pickup. This is test input authoring, not recovered source input; current unrecovered treeJump root interval/grace remains a limitation. Runtime verifies first shield24.85s at2967 and second24.98s at3706. Under the new native intersection, the uncollected216 bonus is correctly missed: second wood exit4935.40419,progress3834.38428,score77680,coins0,turnCount35,phaseplaying,powernull. Previous erroneous50-coin screenshot and replay were overwritten. Current-native-second-wood-exit.png is the corrected continuous capture.

### Continuous full first-route integration check

Starting at the entrance with the chained safe-input scripts: passes42 authored turns, all prior obstacle sequences, two shields, both wood sections, final roots/flame and reaches5350.29749,progress4197.89321,score84940,coins0,phaseplaying,jumpY3.3. Final jump naturally lands on missing support at5373.39749; phase becomesdying,reason'掉进了断桥',kindfall,progress4218.10571,score85360,coins0,turnCount42, then ended after1500ms. No forced death event or score override was used. Saved native-final-stone-replay.json/native-final-fall-check.json and current-native-final-narrow.png/current-native-result.png. Reproducible browser-second-wood-replay.js/browser-final-stone-replay.js extend earlier prefix scripts.

This proves playable route integration, NOT identical recording reproduction: source ends47240/2312, while this faster jump-heavy test ends85360/4218. Exact pacing/config/input/smoothDeltaTime are still unresolved. Actual source263 uses the eaten illustration/message, current natural fall uses FallA/reason; that endscreen cause/art mismatch remains visible and uncorrected. Final source lateral actor alignment, native treeJump/trip collision recovery, UI fonts/layout, terrain variants and second-run seed remain unfinished. Goal is not complete despite the first-run turn list being fully authored.

Follow-up coin audit trimmed the final incoming wood row to stop before its2190-area corner and removed one coin crossing the snapped2133 corner by.2m. Added a late-route invariant: incoming runs stop before the next junction rather than duplicating outgoing rows. This cosmetic correction does not alter collisions or scoring in the zero-coin replay. Existing pickup-reach-source.json now links the recovered native collision source; legacy height-helper comments explicitly restrict their approximate scope.

Final checks after this extension: native pickup sphere/AABB, native power atlas behavior, recorded routes/obstacles/coin-tail boundaries, native plank beam/pit,10000-seed standalone spawner, typecheck, production build and diff-check pass. Full chained replay stages are collected in tools/browser-reference-replay.js; split execution avoids CDP3s observation timeouts. Existing legacy bar texture and sound-chunk warnings persist. Current first-run coverage does not establish identical gameplay, score/timing, ending UI or the second run. Browser returned to the normal playable menu.

### Opening timing diagnosis at10FPS; no fitted slowdown added

The prior turn made concrete route/pickup progress. This turn extracted130 additional source frames1.5..14.5 at10FPS, read their HUD with the verified glyph matcher and saved opening-score-timing.json. These sample labels have a different phase from the old1FPS extractions; old003 score140 and new~3.0 score160 should not be treated as the same exact PTS. FPS-bin phase remains uncertain.73/130 samples are flagged under the strict.8 correlation threshold, many because small compressed glyphs correlate.75..8;67 valid/multiple-of20,confidence>=.7 samples2.7..9.3 are used for the opening study. No temporal score correction is applied. Source first slide is visually around4.7, root response around7.2..7.5 and first turn around9.4..9.6. Saved source-opening-onset/first-slide/first-root/after-first-turn sheets.

compare-opening-timing.ts integrates recovered motion/progress constants at200Hz and stops before the first turn. No-input baseline score RMSE183.01; repeated sliding107.87; fitting only video onset phase31.39; fitting onset2.02 and initial acceleration availability delay.65 gives6.91. These are nuisance-model fits, not proof of engine timing or remote config. Native Update does have an IsIntroScene/TimeSinceGameStart<=1 guard before HandleControls, CharacterPlayer.Hold initiallytrue, and HandleControls returns if NearestElement is null; their exact animated entry geometry/time mapping is not ported. Pixel RMS crops show the world IS changing during2.0..2.6, so a simple frozen-video/loading-hitch claim is unsupported. The fit also depends on the still-fitted first root position and predicts contact7.52, near but not identical to visual response. No constant.65 delay, score offset or artificial speed curve was added to production to make these samples pass. Startup/intro control gating, original inputs and long-run smoothDeltaTime remain unresolved.

### Native stumble window correction

The old7-second kill window came from treating a scene/public/reset value as a live comparator. Actual CharacterPlayer.Stumble at1297a4c compares TimeSinceStumbleStart to literal10;1297a60 takes the safe stumble branch for age>=10. Reset129846c/1298478 stores literal7 into initial age11c. These values serve different roles; the public serialized StumbleKillTimer7 is not evidence of a7-second live death window. Classic now uses age<10 for caught death, otherwise scales velocity by the recovered.85 and resets age0; challenge retains its old cooldown behavior. Native intro Hold would additionally affect when the age starts advancing and remains unported; pure reset-age assertions are not a claim that the full native first-second timing is restored.

Browser focused checks: first trip at1s is caught; trip at4s survives; a second trip8s later is caught;10.1s later survives and slows again. Saved native-stumble-window-check.json. Initial isolated checks were invalidated by random obstacles at2489, because debug jumpTo reset nextSpawn below the reference guard; jumpTo now preserves classic random obstacle/pickup boundaries and those checks were rerun cleanly. Source instruction assertions and native motion tests independently cover the10s threshold and reset age7.

### Native root meshes, regions and fatal flags

Recovered full parent transforms of the four horizontal tree prefabs. Runtime meshes now have world scale.2 baked, original UV1 and canopy height~30.95m, replacing old.14 scaling. Only native tree MeshFilter16 is exported; separate source road MeshFilter15 remains omitted, so base road is retained (no incorrect floor replacement). Native-tree-source.json preserves hashes/transforms/flags/Region24; nativeTreeCollision.json supplies runtime hitboxes. Existing file names left/right are historical labels: Up assets labelled 'left' actually have the tall trunk on positive canonical X. Visual direction must be read from transformed bounds, not filename.

TreeTrip flags jump/nonfatal, height.2m, longitudinal±.2; Up lateral[-1,2], Down[-2,1], leaving the opposite outside strip clear. TreeJump flags jump/fatal, height1.2m, longitudinal progress+.6..+1.4 (its root is offset within the native tile), lateral±2. Old1.35/.72 heights,±3m padded intervals, all-lane trip and nonfatal high jump root were inaccurate. Native collision passes previous/current2D positions to Obstacle.DoesLineSegementIntersect; web now sweeps a point segment against exact native rectangular regions, including lateral movement, without invented body padding. Strict current feet height replaces recent-button grace for these roots. Per-prefab hitboxes are stored at spawn and used during live collision. Main TreeSlide remains its earlier recovered separate definition.

Enlarged source015/019/144/148 and later root frames also corrected authoring:177 uses the opposite high-root variant;1271 and1565 are thin trip roots, not the large moss high root;1335 uses the opposite high-root variant.1669/1731/1783/1817/2261 variants were corrected for the actual side of the transformed trunk. The tree names had previously encouraged wrong mirror selection. Other placement values remain fitted.

Pure tests verify exact trip/high-root thresholds, native fatal flags, clear opposite trip strip, no padded early hit, thin-root swept collision, diagonal lateral crossing, full canopy height and retained base road. Runtime continuous sliding before the first root: physical124.008 at5.03s,speed26.1,score1280; after240ms physical130.07625,speed22.18500062,score1340,phaseplaying, confirming one .85 stumble. Current-native-trip-region.png shows the updated original-scale trunk/root. Source score/time still differ; this is not a matched source replay.

All42 safe-input route turns were rerun with these stricter roots:5350.29749/progress4197.89321/score84940/coins0/playing, then natural final fall5373.39749/progress4218.10571/score85360. Native-tree-full-route-check.json records this. This validates integration after native collision changes; it does not close timing/score, intro Hold, ending illustration, alternate seed or overall visual fidelity gaps.

Native source record now also asserts the1s intro gate (126cb8c), Reset Hold=true (12983dc), release Hold=false (126cba0), with IsIntroScene106/TimeSinceGameStartd0/Hold1b0 field names resolved. This is stronger than fitting a delay, but animated entry/initial transforms and first accumulated score still need tracing before live integration. Native stumble animation/ground-fall category and intro hold remain distinct unfinished work; the10s window alone does not restore those systems.

Final verification this turn: native motion/stumble and tree swept-region tests, pickup collision, route/obstacle placement,34 native UV1 streams, steering,10000-seed spawner, typecheck, production build and diff-check pass. Browser warning/error capture empty and playable menu restored. Existing legacy bar texture/chunk warnings remain. Overall goal remains incomplete: actual source-input pacing, intro motion, result artwork/layout, alternate opening and remaining scene/animation details still differ.

### Native entrance path: absolute nodes and endpoint easing

Extended the reproducible method exporter with MovingObject.Update/AddFollowingPathNode/StartFollowingPath and GameCamera.SnapStartGame/Reset. Source record now asserts the constant at0x698110 = [2.75,-20,45,210]. GameStart constructs nodes at time0/current camera position, .25/EndLocation and2.75/[-20,45,210], flags false/true/true. SnapStartGame sets camera to serialized EndLocation [0,10,100] before construction, so the first segment holds this position. These are raw Unity coordinates (world scale.2), not player-relative offsets. MovingObject.Simulate at12e0554 branches on endpoint flags: neither linear, start-only u³, end-only 1+(u−1)³, both cubic ease-in-out. The flags do not request relative coordinates.

Important static verification: the four-byte MovingObject.Update at12e0050 is `b12e0054`, a tail branch into Simulate, NOT an empty return. GameCamera.Update invokes it first, then the IsIntroScene branch at12afcf4 skips normal follow-position adjustment while still reaching look-at. Thus the path advances before focus tracking. Earlier speculation that another later Simulate call overrides normal follow is unnecessary.

LoadLevelInformation initializes player rotationEuler[0,0,0], then non-tutorial intro position[0,0,-10] raw at126a714. The speculative player-start Z200 interpretation is rejected. Native +Z forward versus browser -Z and browser origin reset must be reconciled before transplanting absolute camera coordinates. The recovered1s Hold gate and3s intro flag also require simultaneous clock/progress validation. Current browser introCamera.ts remains explicitly fitted; this research step does not claim a visual or timing restoration. The exporter completed with opcode/constants assertions; the native library was disassembled only and never executed.

### Live native intro Hold/path and complete entrance transforms

Classic now skips runner motion/score and jump/slide/turn/lane swipe controls while elapsed<=1s, matching controller Hold release. Stumble age also waits through Hold. Browser native-intro-hold-check.json:990ms retains distance0/progress0/score0/jump0/slide0/lane1/speed20 even after jump/slide/left inputs; at1040ms distance1.01125, speed20.3 and movement resumes. Challenge mode retains the previous opening behavior. The simulation still uses discrete frame steps at the release boundary, as native does; exact source update ordering/root animation remains unverified.

Classic camera now uses absolute path positions, not actor-relative orbit offsets. With Unity initial actorZ=-10 raw and scale.2, path distances relative to actor start are22→44m, lateral0→-4m, height2→9m. Nodes0 and.25 share initial position;2.75 reaches the endpoint; it stays there until intro ends3s, then existing follow update takes over. Native Unity+Z becomes browser-Z, X is retained. Camera focus follows actor at4m. Endpoint/midpoint/domain tests pass. This replaces the earlier fitted orbit for classic; legacy challenge orbit tests remain explicitly labelled as such. Camera follow smoothing and focus details are not fully restored.

This exposed another source of mismatch: entrance exporters manually removed pivot coordinates, rotated the facade and placed it atz7.3. New export-native-entrance.py restores both facade and surroundings through their entire native child/parent TRS, omitting editor root placement and baking scale.2 plus browser Z reflection. Render uses identity scale/rotation andz1 translation, mapping native actor start to browser PLAYER_Z3. OriginalUV1 streams remain valid (all34 lightmap stream checks pass). Native-entrance-source.json records transforms, mesh IDs, source hash and bounds. Existing old search/surroundings scripts are historical approximate exporters; use the new native exporter to regenerate live meshes.

Saved fresh current-native-entrance-1.65s.png and2.65s.png after immediate rendering. At1.65s distance14.3925/progress6.3971/score120; at2.65s distance37.4675/progress17.4969/score340. These are diagnostic game-clock samples, not asserted exact video timestamps. Compared to source003/004, facade restoration improves scale/origin substantially, but camera/runner projection still differs: source004 feet around650px vs current2.65s around720px, and source entrance remains more visible. Do not claim matched framing from native parameters alone; source-version differences, focus, actor root motion/scale and exact start clock remain unresolved.

Opening comparison now includes an actual1s no-motion Hold model (not the earlier artificial acceleration-only control delay). Fitting only video onset gives1.35s and scoreRMSE27.6438 over67 early readings, stumble video7.645. This does not reproduce the earlier two-parameter fitRMSE6.91; no fitted onset is inserted into production. Actual slide input sequence and route placement remain assumptions. Full goal remains incomplete.

After live changes the existing safe-input prefix ran continuously to physical2967.02014, progress2165.40067, score43800, coins0,21turns, phaseplaying; saved native-entrance-prefix-check.json. This checks opening integration, not source timing. Native motion/Hold and intro tests, typecheck, originalUV1 checks, production build and diff-check pass. Build retains existing legacy bar texture and sound chunk warnings.

### Native speed-limited following and direct focus

GameCamera.Update12afeb8..12afecc computes max camera movement |CharacterPlayer.Velocity|*1.25*smoothDeltaTime, clamps to the target if it can reach it, otherwise advances a normalized Euclidean step. Exporter asserts fmov1.25 opcode at12afebc and records cameraFollowStep. This replaces classic camera's arbitrary exponential position blend8. Native focus copies full player position and rotation, then sets Y=GroundHeight+FocusHeight (12afa44..12afcd0); no independent look interpolation is present. Classic now uses full lane lateral offsets in camera target/focus, replacing .22/.3 attenuation and look damping10. Challenge retains its earlier behavior. Camera helper tests cover 3-4-5 normalized step, speed scaling, clamping/no overshoot, stationary motion and coincident target.

Browser native-camera-lateral-check.json: at physical75.83 laneX=-1.085111, focusX and cameraX both=-1.085111, focusZ=-72.83 and cameraZ=-62.83, height7/focus4. Thus ordinary straight running reaches the exact10m target rather than retaining artificial lag. Native-camera-turn-check.json and current-native-camera-turn.png confirm first right turn remains playing at193m, turnCount1, camera follows the new +X heading10m behind. No console warnings/errors. Typecheck, camera tests, build and diff-check pass; existing legacy texture/sound-chunk warnings unchanged.

Scope limits: camera velocity currently uses forward speed and jump velocity, not a fully restored native lateral-force/boost velocity model. GroundHeight remains the current flat road height; native forced-snap flag, banking/bob and falling-ground tracking remain incomplete. Intro node/focus parameters are recovered but source framing discrepancy from the preceding section persists; this turn corrects follow behavior, not that unproven correspondence. Native path→follow handover reaches the chase target quickly as the original speed-limited rule permits. Overall source input, score/time and full visual/result/alternate-opening fidelity remain unfinished.

### Corrected reference death identification and native result resources

Correction to earlier notes: source263 shows deathIllustrationWater@2x (green crocodile), NOT deathIllustrationEaten@2x (black pursuing monkey). Direct asset inspection proves the distinction. The previous Eaten identification was wrong. Current classic reference route is over water; grounded gap/narrow/side-support failure now produces explicit water death, while fatal solid obstacles produce impact instead of the previous catch-all fall. Challenge falls retain fall. Native-water-result-check.json records real injected-gap collision atphysical3.07875, water reason, ended after death delay; native-impact-result-check.json records actual hurdle collision at4.1325, impact/dying. These are isolated collision integrations, not full-route replay. Source final route water type still needs a fresh end-to-end replay after this change.

GameOverOverlay maps water to the native crocodile image and source caption“你做的点心很好吃。”. Caught still uses Eaten, falls useFallA. Missed retains its earlier Water presentation; exact native missed-corner/terrain-dependent death taxonomy is not fully recovered. Flame/slide still share generic impact artwork and need more detail.

Recovered End Game GUI score font from level0 Score Label5012→localUIFont5729, Cheboygan_White2x; actual serialized color[.964705884,.839215696,0,1]. Export-native-result-font.py verifies each BMFont record against UIFont bytes, crops shared FontAtlas texture71(page508,0), multiplies native tint, and exports0..9 plus comma with original offsets/variable advances. NativeResultNumber uses these glyphs and grouping commas, replacing incorrect SpriteNumber font and missing comma. Native-result-font-source.json preserves hashes and pointers. Display scale36/43 and CSS positions are frame-fitted, not claimed recovered GUI scaling.

Native end paper is also not a full-height stretched atlas crop. UISprite6188 references shared atlas1959/endGameBackground@2x outer[1,1,490,534], and three other backdrop sprites use endGameBackground_tile[1542,1,490,400]. Export-native-result-ui.py extracts these exact crops; current paper repeats tile without vertical stretch. Original heading bars are atlas2250/texture77 Header_UI_Left[0,237,120,135], Right[520,237,120,135]; extracted assets replace the inaccurate plain Unicode lines. Source layout positions/width are fitted to414×896 reference263. Actions remain reachable below first viewport; native animation/button timing has not been established. Browser clicked“再跑一次”successfully and returned to playing HUD.

Saved current-water-result-layout-fixture.png with explicitly injected UI score47240/distance2312 for visual comparison only. This does NOT demonstrate matching runtime score/distance! Fresh crop uses actual canvasDOMRect(x811.5,y41.5,w414,h896), replacing stale saved y69.5 crop; future screenshots must re-read canvas bounds. Older fixed-crop screenshots may carry a28px vertical offset and must not support precise pixel claims without recapture. Fresh fixture aligns score/header/metrics closely with263; top scroll ornaments, Chinese fonts, background/death animation and full native behavior remain incomplete.

Typecheck, production build and diff-check pass. A temporary Vue template import.meta compile error was fixed by moving BASE into script; the logged HMR failures are from that intermediate build. Final rendered result and restart succeeded. Existing legacy bar texture and sound chunk warnings remain. Goal remains active/incomplete.

### Result entrance coroutine: correct temporary offscreen controls

Recovered EndGameUI.SlideIn/SlideInAnimation and generated <SlideInAnimation>d__61.MoveNext through the verified Assembly-CSharp method table. The coroutine saves initial button positions, temporarily translates RunAgain/MainMenu down by200raw at12bf134/12bf1a0, runs a.5s SlideInOffset tween at12bef90, waits.75s at12bf2fc, then restores RunAgain with.25s TweenPosition at12be9ac. MainMenu follows with its own.25s tween at12bea70, with other controls following. Exporter asserts the.75 and.25 opcodes and saves field mapping MainMenu68/RunAgain70/SlideInOffset60. This disproves the previous permanent below-viewport workaround; source263 is a transient result-frame, not evidence of permanently hidden controls.

Result overlay now keeps its normal viewport height and brings restart in after.75s with.25s slide, followed by links after1s. Native final responsive coordinates, tween easing, ad branches, exact sequential store/main menu layout and score-count animation are not yet restored; bottom5cqh layout is still a web approximation. It no longer requires scrolling to restart. Original ribbon_button_wide atlas1959 rect[1005,353,535,118] extracted by export-native-result-ui.py replaces flat gold restart styling. Native-result-buttons-check.json records actual DOM rectangles: restart y756.52..808.20, links817.20..851.20 inside896px overlay, visibilityvisible at animation1300ms; inspected500ms hidden. Browser click successfully restarted. Current-result-buttons.png is the real20-point isolated collision result, not the47240 UI fixture.

Reran the entire safe-input42turn route after native Hold, camera, entrance and water-result changes. Passed to5350.29749/progress4197.89321/score84940/jump3.3/coins0/42turns. Continuing without another jump naturally hits final unsupported narrow tile at5373.39749/progress4218.10571/score85360, deathkindwater, then ended. Native-water-full-route-check.json preserves before/hit/end. This closes the missing full-route water-classification integration check from the prior section. It does NOT establish source input/time/score equivalence: source ends47240/progress2312, while this jump-heavy safe replay reaches42m/s. No runtime counters were replaced with reference numbers.

Typecheck, production build and diff-check pass. Existing build warnings remain. Native coroutine exact full UI/animation integration, source-action reconstruction, score/timing, alternate opening and remaining visual fidelity gaps keep the original objective incomplete.

### Action-policy diagnosis: repeated slide explains much of replay score inflation

Added read-only runElapsed to browser debug state and tools/browser-reference-slide-replay.js. This is an explicitly hypothetical developer replay, not recovered video touch events. It repeatedly requests slide between existing safe obstacle/turn actions after physical55 (approximate first visible slide), intentionally omitting the safe bot's jump over first trip root. Gameplay constants and input behavior were not changed.

First short prefix passed4turns/physical700.0468 in32.67game seconds, score6460/progress323.4586/speed21.641. At physical173 turn request, game8.33/progress85.74/score1700; at301 jump,14.25/progress143.56/score2860;329turn,15.54/progress156.15;373jump,17.57/progress176.02;467jump,21.92/progress218.46;497turn,23.30/progress231.92;641turn,29.96/progress296.96. These progress values are substantially closer to first source authored brackets than the accelerating safe replay, without altering physics. Repeated-slide-prefix-check.json preserves all raw states. The source first high-root bracket133..143 and second162..182 are early alignment evidence, not a whole-run match.

Blind repeated sliding then failed at physical1617.8416/game75.09, first plank beam impact, with slide remaining0. Source CharacterPlayer.Slide12987a0..12987c4 explicitly refuses while IsSliding/IsJumping/dead, so do not remove the live duplicate-slide guard to make this bot pass. A repeated request while remaining>0 cannot refresh the native duration. The one-frame expiry/contact issue demonstrates action phase matters. Repeated-slide-long-prefix-check.json records the failure.

Diagnostic replay now reserves the approach to specifically authored slide actions (stops starting another slide within speed*.75+1m), so the intended slide can begin fresh. This permitted all21prefixturns to physical2967.1362/game129.8/progress1433.3881/score28660/speed26.121/coins0. Repeated-slide-reserved-prefix-check.json records it. Same-place earlier safe bot score43800; changing only actions removes15140points of inflation. But reserve windows themselves allow acceleration: speed21.641→22.761at1614→23.601at1758→23.741at1998→25.181at2332→26.121at2382. Thus the policy is neither continuous native sliding nor the original player's input. It must not be presented as solved timing. It also reuses high-speed spatial jump points; first shield capture at height3 needs retiming for slower motion, so score/power equivalence is not established. Full video action reconstruction still required.

No production speed curve, score offset, automatic slide or special reference-only counter correction was introduced. Browser input still rejects key repeat, matching its prior adapter behavior; a user-specific keyboard hold mode has not been inferred from a touch recording. This turn adds reproducible action/timing evidence and debug observability. Typecheck and diff-check pass. Goal remains incomplete, with exact source input, time alignment, route physical calibration and remaining scene/UI/animation gaps still unresolved.

### Direct10FPS source action evidence for the first two high roots

Fetched only source video13..21s at10FPS into80native414×896JPEGs; all persisted under first-jumps-10fps with SHA256 verified against first-jumps-score-timing.json. No signed playback URL was logged or saved. Source request/ffmpeg completed exit0/80frames. Native bitmap glyph NCC read all80scores without temporal correction; per-frame confidence preserved. Annotate-reference-jumps.py verifies frame dimensions/hashes and emits reference-first-jump-actions.json plus first/second-jump-10fps-contact.png.

Direct visual observations: first high-root airborne onset bracket15.0..15.1, landing15.6..15.8 (enemy occlusion); second onset18.7..18.8, landing19.5..19.7 (slide transition). Approximate sampling timestamps have±.05s uncertainty. First score evidence:15.0=2680(.798),15.1=2700(.754),15.3=2740(.780),15.5=2780(.805),15.7=2800(.816),15.8=2820(.746). Second:18.7=3400(.795),18.8=3420(.775),19.1=3480(.807),19.3=3520(.796),19.5=3560(.808),19.7=3600(.798). These are visually reviewed pose bounds, not invisible touch times. Both flight intervals are consistent with recovered native~.8s maximum duration, but camera/animation occlusion prevents asserting an exact impulse from these images alone.

Frames13.3/14.1/18.0 also show brief upright/arms-out slide transitions. A1FPS pose classifier or manual review could mistake these for extra jumps. They are not labelled airborne without visible foot clearance. This is why replay must use dense local source review around transitions instead of assuming every upright1FPS pose is a jump.

Current repeated-slide replay atphysical301 starts its first high-root jump atgame14.25/progress143.56. Source visually takes off atscore2700/progress135. The difference does not by itself authorize moving the obstacle or jump start by a progress-derived world delta: world/progress conversion is speed-dependent and the route physical calibration remains estimated. No production jump placement, speed or score was altered this turn. Next required correspondence is source turn/root contact geometry together with observed timings, followed by actual browser replay verification. Broader video action stream, end-to-end matched timing and overall clone fidelity remain incomplete.

### Dense corner action review and second-root handedness correction

Video000/001 are a preceding run's death/result transition, not a main menu. No menu replacement is justified from those frames. Reviewed the already-extracted16.0..17.9 dense source frames instead. In addition to the two high-root jumps, the player visibly jumps during the second corner: takeoff17.1..17.3, landing17.8..18.1, with camera rotation/occlusion limiting precision. Annotate-reference-jumps.py now preserves3jump intervals plus turn-jump-10fps-contact.png. First/second refer to high-root crossings, not an assertion that only2jumps occur in13..21s.

Added diagnostic jump at physical335 after the329turn request; this spatial value is fitted, while the source's airborne action itself is directly observed. Browser repeated-slide-corner-jump-check.json shows the action accepted: physical335.39595/game15.82/progress158.94289, jumpY.195, score3160,2turns. Full21turn prefix still reaches2967.13619/game129.8/score28660; the added jump changes visible action without changing aggregate score because it replaces a no-acceleration slide interval. This demonstrates that score alone cannot uniquely reconstruct the action stream.

Pose snapshot after350ms reaches physical343.18671/game16.19/jumpY3.75375, score3240. Source17.5(046.jpg, score3160) has a closely comparable arms-up flight pose, but this is provisional phase alignment, not exact timestamp/score matching. Current-observed-corner-jump.png is actual rendered gameplay with no UI score injection.

That direct view exposed a production geometry error: the second high-root (legacy177) still used nativeDown/tree-jump-right, showing its high trunk on the road's left. Dense source046 and the18.8..19.3 root approach show the high trunk on the right. Changed that one reference prefab to nativeUp/tree-jump-left (same as first high root), verified the actual rendered screenshot now has the high trunk on the right. This supersedes the earlier report claiming177's opposite variant was correct; historical filename interpretation and prior sparse review were insufficient. No mesh, collision, physical location or speed constants changed. Second-root-direction-check.json confirms actual jump across it remainsplaying atphysical400.09313/2turns/coins0. Reference obstacle and native-tree tests, build and diff-check pass, existing warnings unchanged. Source timing, overall physical calibration, full animation/scene fidelity and alternate opening remain unfinished.

### Low-speed shield jump and interval checks

Retimed only the diagnostic first-shield jump from2932 to2947. First native pickup centre is fitted2961.953545; at26m/s the old~30m lead lands before the height3 sphere, while a~15m lead intersects during descent. This also leaves the preceding trip root grounded instead of jumping across it, consistent with the source's trip-before-power sequence. Actual replay now reaches2967.03171/game130.0/progress1430.86645/score29100/coins0/21turns, speed22.20285, chase3.8, shield24.73s. Repeated-slide-first-shield-check.json proves actual collection and stumble effects; no synthetic power call or score replacement. Source145.6 start remains~16s later than this provisional video phase, so overall timing is still not matched.

Added browser-reference-slide-second-shield.js to continue with repeated slides and the same reserved explicit-slide windows. It records first shield expiry atphysical3545.01025/game154.74. Second pickup atfitted3706.12502 uses a diagnostic jump lead speed*.65, a descending flight phase derived from native jump/bounds, not a production assist. Actual reached3710.07972/game161.22/progress1800.90675/score37000/coins0/25turns, second shield24.82s. Repeated-slide-second-shield-check.json preserves rows and expiry. First pickup~129.73→second~161.04 is31.31s vs source145.6→181.6=36s; unpowered gap~6.3s vs source11s. Thus successful power collection alone is insufficient evidence of source timing.

Tried a separate compact-window scheduling hypothesis to reduce acceleration during the earlier conservative reserved slide approaches. It preserves speed near21.94 (instead of rising26) but fails at2336.93321/game108.04/progress1064.60189/score21280 on TreeSlide, sliding0. Generic target+3m/expiry-band timing is not exact obstacle/action geometry and is rejected as an improved source replay. Kept browser-reference-slide-compact-experiment.js and repeated-slide-compact-window-check.json as reproducible failed evidence; restored the known passing first/second-shield diagnostic scripts to their conservative reserve policy. Do not propagate the experimental scheduler or change slide refresh guards into gameplay. Native first/second pickup sphere and physics remain unchanged. Exact source slide onset/expiry phases, later trip interactions and physical route/time correspondence still require dense source review.

This turn changes diagnostic input scripts and evidence, not production mechanics. Goal remains active/incomplete.

### Native slide expiry strict comparison and float32 accumulation

Recovered CharacterPlayer.Update129787c..12978c0 precisely: when IsSliding100 is true, float32 TimeSinceSlideStart104 += smoothDeltaTime; comparison12978b4 against duration108 takes b.le12978b8 to KEEP sliding on equality; IsSliding is cleared only for elapsed>duration at12978c0. The previous browser remaining-=dt/max0 ended on equality, and float64 repeated subtraction could expire one frame earlier. This was a real runtime mismatch, independent of the diagnostic scheduler. Exporter now asserts opcode540001cd and records slideTimer fields/rule.

Classic Slide now stores elapsed, advances it with Math.fround float32 addition, and derives remaining from native strict comparison. At exactly elapsed==duration, a positive EPSILON represents the separate original IsSliding bool for existing remaining>0 consumers; it does not extend elapsed, add spatial padding or supply a post-slide grace interval. Once elapsed>duration it returns0. Native slide duration multiplication now rounds to float32 as the native stored field does. Accepted new slide resets elapsed0. Classic animation uses actual elapsed; challenge keeps its earlier countdown behavior. Duplicate slide requests during active sliding remain rejected.

Tests cover exact.25s steps reaching.75 while still active, next-step expiry, float32.01 accumulation75steps still below.75, next-step expiry, native duration float32, and actual TreeSlide collision at equality safe/next expired frame hit. Browser native-slide-expiry-boundary-check.json: after750ms on capped slide, remaining1.788139e-7/speed21.75; next25ms remaining0/same speed, confirming actual live usage. This validates the timer boundary only; full Unity script callback ordering relative to GameController collision still requires separate verification. Do not infer that every failed blind-slide replay is now solved.

Fast safe prefix after correction passes21turns to2967.29312/game86.88/progress2165.51551/score43800/coins0/playing, recorded native-slide-timer-prefix-check.json. Motion/collision boundary tests, typecheck, build and diff-check pass; existing build warnings remain. Full source-input/score/time fidelity and remaining visual/alternate-opening gaps keep objective incomplete.

### Jump integration order and raw float32 precision

Resolved CommonPlayer.Update1297e40 and verified CharacterPlayer.Update applies raw gravity250 at1297614, calls CommonPlayer.Update1297648→MovingObject.Update/Simulate, then reads/clamps Y against ground at1297664 onward. Therefore existing semi-implicit gravity→move→ground order was correct; no swap is justified. The tail call1297f68 is CharacterPlayer.AdjustAnimationSpeed, not the physics base update (method-table resolution now explicit). MovingObject.Simulate position translation clamps smoothDt at literal69761c=.06666667014360428 (1/15), while force/velocity integration uses full smoothDt. Fields and vector operations are float32 native Unity units.

Classic vertical motion now goes through stepNativeJump: world height/velocity converted to raw units, float32 gravity integration and raw Y update, positional timestep cap, then flat-road landing clamp. Existing challenge gravity kept. Native jump impulse/gravity constants are unchanged. This does not restore all falling terrain/death state flags or full forward/lateral native quantization; it restores the active jumping calculation on the flat reviewed route. Existing browser RAF cap50ms makes the native66.67ms position limit inactive in normal RAF updates, but the helper preserves the native rule explicitly.

Regression tests verify20m/s jump first.025s step givesy.46875/v18.75, discrete.025s apex3.75, landing31..32steps near.8s, and a.1s diagnostic step producesv15 while positional displacement is capped~1m instead of1.5m. Source jumpIntegration record preserves method/constant addresses. Browser native-jump-integration-prefix-check.json passes21turns atphysical2967.01539/game86.89/progress2164.64298/score43780/coins0/playing. The20point difference from prior fast prefix43800 is a numerical integration consequence, not a source-score match. Motion tests, typecheck, build and diff-check pass; known legacy texture and sound chunk warnings remain. Goal remains incomplete.

### Native analog steering position dynamics and intro gate

Extended method recovery with GameInput.HandleAccelerometerForce, TouchInput.GetAccelerometerForceX/.ctor and PCInput.SimulateTilt. Resolved CharacterPlayer.PlayerXOffset at190. Native acceleration mapping12abddc..12abe00 is -sign(x)*min(abs(x)*10.125,1)*7 raw, giving±1.4world. TouchInput constructor stores sensitivity.5 and filter interval/kernel[.0166666675359,.10000000149], so native per-update low pass is alpha~1/6. HandleControls ordinary-road movement126f6e8..126f714 and126f970..126f984 uses error*min(dt,1/15)*50*(sensitivity*1.75+.25)*.1, a proportional frame step, not exponential damp12. Native specific element boundary/edge branches remain separate and not fully restored.

Classic opt-in tilt now uses native±1.4 target and rawfloat32 default-sensitivity position step instead of±1.3 and damp12. Keyboard/swipe lane adapter remains unchanged. Added pure native acceleration mapping/filter helpers, but deliberately did NOT wire them to the browser orientation source yet: current gamma grip calibration/dead zone is not a verified Unity acceleration equivalent, sensor axes/sign, per-frame sampling and real-device permission flow require verification. Thus this is analog position dynamics restoration, not a claim of fully native phone sensor behavior.

GameInput also tests controller IsIntroScene at12abd9c/12abda0 and skips PlayerXOffset writes during intro. Classic therefore ignores tilt until elapsed>3s, independently of the1s runner Hold. Initial synthetic-device test native-tilt-position-check.json was before adding this gate and is superseded for intro behavior. Final native-tilt-intro-check.json: applied syntheticgamma0 then22 atgame1.5; x stays0 through1.52 and2.99, after3.01 x=.1575000048, after another600ms x=1.36729002, turnCount0. These match one20ms native5.625 response step and continued approach to1.4, without issuing a turn. This is synthetic desktop developer verification, not actual mobile sensor validation. Reload clears the test-only tilt state and leaves menu playable.

Steering tests cover native gain/range/filter, response/return, timestep cap,3s intro boundary and existing sensor-does-not-enqueue-turn invariant. Typecheck, build and diff-check pass; known build warnings unchanged. Overall input sensor mapping, source replay time/score and remaining geometry/animation/alternate-opening fidelity remain incomplete.

### Native AnimationState speed on all character actions

Recovered CharacterPlayer.AdjustAnimationSpeed1297f68. It reads full VelocityXYZ, calculates sqrt(x²+y²+z²)/100*.6499999761581421 at129803c..1298078, enumerates all AnimationStates and calls set_speed248d3cc. Independently resolved UnityEngine.AnimationModule CodeGenModule284a150 (90methods) to verify that248d0e8 is Animation.GetEnumerator and248d3cc is AnimationState.set_speed; these must not be looked up through the game module's5306rows. Native coefficient is at6975f0. BaseAnimationFPS serialized0 is not the divisor used here.

Previous web runner used clamp(worldSpeed/16,.65,1.55) only for run, while jump/slide remained fixed1. At20m/s that meant run1.25 versus native.65, a large visible tempo error. Added nativeAnimationSpeed using rawfloat32 3D velocity; classic passes its factor to every player clip through an optional scaleAllClips argument. Legacy/enemy callers retain their earlier API behavior. Classic Hold skips native AdjustAnimationSpeed, so default factor1 is retained during the initial Hold; exact carried animation state across native restart remains unverified. Full lateral/boost velocity integration and queued-animation blending are still approximate.

Slide start→loop now waits for actual clipTime to reach the start clip's duration, instead of comparing unscaled physical slide elapsed against clip length. This prevents premature start truncation at native slower playback. Browser native-animation-speed-check.json: at21.75m/s after100ms, slide clipTime.07068749666 (native factor.7068749666); after300ms in slideLoop time.07068749666; after550ms loop time.04740616083. Tests verify factor.65 at20, sqrt2*.65 for20forward/20vertical, no arbitrary1.55cap, all run/slide/slideLoop/jump clips consume the passed native speed, and legacy callers keep prior action timing. Physical motion/collision timers unchanged.

Also corrected pause rendering: world clock already stopped, but syncObjects continued animating runner/pack and moving presentation gap. Paused sync now returns without animation/presentation updates while rendering/UI remain active. Native-animation-pause-check.json verifies real live RAF pause: player clipTime identical.37098508999943813 before/after independent checks, pack position unchanged[0,0,-74.38], phasepaused. UI resume succeeded. This is actual live-loop evidence, not g.advance's preexisting paused early exit.

Slide tests, typecheck, production build and diff-check pass. Known build warnings unchanged. Source visual pose/tempo is closer in mechanism, but exact source frame comparison, action timing/score, remaining native animation state transitions and alternate opening still need work; objective remains incomplete.

### Native stumble clip, action timer and jump/tilt restrictions

AnimationModule method lookup confirms Slide uses Animation.Play248cf4c then PlayQueued248cfe8, not a CrossFade; existing direct start/queue-loop mechanism is appropriate. The default Jhony Animation1915 also references an omitted Stumble clip143, WrapModeOnce1, duration.3666667938. Export-runner-animation.py now exports it alongside the4existing clips, preserving original curves/source IDs. Native Jump clip131 is ClampForever8; no invented additional jump loop was introduced.

Recovered IsStumbling10c, elapsed114, duration118 independently of the10s StumbleKillTimer11c. Stumble scales velocity first, then GetRunVelocity*literal6976ac=.0049999998882, caps duration.5 at1297adc..1297b08, starts IsStumbling and plays Stumble→queues Run at1297b50/1297b78. Update1297930..1297950 increments float32 elapsed and clears only for elapsed>duration (asserted b.le129794c). Jump1297bbc rejects IsStumbling; GameInput12abdc4 skips tilt-offset writes during it. Slide itself does not check10c, so no unsupported slide lock was added.

Classic now has this separate native action timer, rejects jumps while active, retains the previous analog tilt target while still moving toward it, and plays native Stumble/queued Run. New accepted jump/slide replaces the queued stumble state; existing slide expiry also restores Run as the native Update does. This remains a small queue-state implementation rather than a complete Unity Animation engine; cross-skin retarget/blending and exact callback/input buffering order remain unverified.

Native-stumble-action-check.json actual injected trip: atgame4.3, speed23.2625, stumbleRemaining.45, clipstumble/time.05658. Immediate jump remainsY0 with.44timer and clipstumble; after500ms, jump succeedsY.19499999 with remaining0. Native-stumble-tilt-check.json: changing tilt direction during stumble continues toward old positive target (x1.30850→1.35009), then after release responds left (x−.27392). This uses synthetic browser orientation events, not real-phone validation.

Updated only the diagnostic repeated-slide tool to defer its planned jump while native stumble is still active; this is replay input rescheduling, not a production input buffer. Reran21turns to2967.20635/game130.47/progress1425.2153/score29000/coins0/speed22.01585, first shield24.72s, playing, recorded native-stumble-prefix-check.json. Original source timing/score is still not matched. Motion/stumble duration tests, native clip/Once tests, typecheck, build and diff-check pass; known build warnings unchanged. Overall objective remains incomplete.

### Native pre-Kill fall thresholds and normal result delay

Recovered CharacterPlayer.Kill1297eb0 and SetGroundHeight12982bc plus GameController.EndGame1272148. Kill sets IsDead true and DeathType, stores prior run speed, clears VelocityXYZ at1297ed8..1297edc; CharacterPlayer.Update immediately returns while dead. Thus freezing velocity after Kill is native. The missing web behavior is unsupported freefall BEFORE Kill, not an invented falling animation after death.

Controller Update126d274..126d2a0 compares playerY with GroundHeight−6raw, skips if already dead/invincible, then Kill(type4). Sixraw is1.2world; actual water mesh−6.1world is NOT the death threshold. Character Update has separate support/recovery behavior: if over ground and falling within6raw below it, it may snap to road and stumble when lower than2raw (.4world); unsupported branch bypasses this ground snap and continues gravity. These findings require an unsupported-ground phase that can recover on reaching a supported tile. Do not extend the last narrow hole solely to force a high-speed test bot to die; faster input could cross the unsupported region before the native death threshold. Exact callback order and final source trajectory remain to verify. No pre-Kill fall phase was yet inserted this turn.

Normal dead branch calls EndGame(.5,false) at126d418, while tutorial has its own2s path. EndGame zeroes elapsed controllerd8 at1272198 and stores delay11c at127219c. Update126c7e8..126c804 advances float32 elapsed and retains wait while elapsed<=delay. Replaced classic's arbitrary1.25s death countdown with this.5s native strict float32 timer; challenge retained prior behavior. Added nativeDeath.ts, source deathSequence record and boundary tests (.25+.25 equality waits, nextstep completes).

Actual injected fatal hurdle test native-result-delay-check.json: at impact phase dying/elapsed0/delay.5;450ms later stilldying/elapsed.450000077; after another100ms phaseended/elapsed.5000000596 (float32 accumulated twenty.025 steps crosses.5). No UI fixture/counter replacement. This corrects one result timing stage, not the unresolved pre-Kill falling process. Motion/death boundary tests, typecheck, build and diff-check pass; known build warnings unchanged. Overall source falling/action timing, score and remaining visual/alternate-opening gaps leave the objective incomplete.

### Unsupported fall phase and recoverable landing (2026-10-31)

Classic mode now samples native gap/support polygons before vertical integration. Walking off a surface starts gravity with zero initial vertical velocity; jumping across a missing surface retains its jump trajectory below road height. Support no longer causes an immediate water-result death. The flat-road contact branch kills strictly below −1.2 world units, clamps a recoverable supported landing to zero, and stumbles on recovery below −.4 when the preceding frame was falling. Jump, slide and lateral controls cannot restart motion while falling. Jump camera offsets also retain negative height rather than clipping it to zero.

Evidence: `docs/screenshots/native-ground-fall-phase-check.json` contains isolated browser tests. Continuous unsupported motion descended through −.03125, −.09375, …, −1.125 while playing and died at −1.40625. A deliberately early jump into a gap descended to −.5 at distance41.72, then regained support at42.39875 with Y0 and a .475-second remaining stumble. Attempted jump/slide/left input during a walking fall left lane1 and slide0 while Y continued from −.09375 to −.1875. These are injected obstacle diagnostics, not the source video's input sequence. `current-native-prekill-fall.png` records the diagnostic rendering.

The safe-input prefix still passes21 turns to distance2967.01539, score43780, coins0, shield24.85s; full evidence `native-ground-prefix-check.json`. This verifies integration only: run86.89s and the score still differ substantially from the recording. It does not establish a video-identical run. Unit motion/camera checks, Vue typecheck and production build passed. Existing legacy texture-path and sound-bundle warnings remain.

Native enum terminology correction: metadata defaults identify DeathType4 as **Ledge**, not a literal Water enum (Unknown0, Fall1, Tree2, Slide3, Ledge4, Burnt5, Eaten6, Tangle7, SceneryTree8, SceneryRock9). The current water/crocodile result is presentation of this ledge fall. This supersedes earlier wording calling the native enum itself Water. Native floor variation, exact controller callback ordering and the last death tick's progress accumulation remain to be audited. Full safe-route final-fall evidence from before this phase must not be treated as verification of the new support recovery behavior.

### Final fall tick ordering and full-route recheck (2026-10-31)

Static call order in GameController.Update computes distance at126cc78 before ledge Kill126d2a0. Classic XZ progress accounting now runs immediately after horizontal motion instead of being skipped by an early fall-death return. HUD distance is also synchronized from RunStats in syncHud: the old early return could leave result distance one frame behind even when the score had synchronized. Browser boundary test `native-fall-final-hud-check.json` advances42.881973→43.272797 progress and840→860 score on the fatal frame, then retains these values through death/ended. Rendered result correctly shows43m/860 (`current-native-final-tick-result.png`). This injected gap test establishes update/result consistency, not source score fidelity.

Full safe-input replay with the unsupported fall phase completed42 turns and all six route stages (`native-ground-full-route-check.json`). At5350.31382 it is playing, score84900/coins0. The last jump crosses below road at5373.83382 (Y−.1999999), continues through five negative-height samples, then dies at5375.93382/Y−1.2749999, progress4218.19235/score85360. This supersedes pre-phase instant-fall evidence. The intermediate `current-native-ground-route-result.png` was captured before the HUD fix and shows stale4217; it is a recorded failure, not the corrected display. The boundary test above verifies the corrected UI. Run145.84s, progress4218 and85360 remain far from source ending~262s/2312/47240; safe replay is not source input and must not be presented as a match.

Animation audit: Jhony_Export3 Animation references exactly five native clips143/150/123/131/156 (Stumble/Slide Start/Run/Jump/Slide Loop). The apparent event23 in CharacterPlayer.Update129785c calls AudioManager.PlayFX12955bc, not an animation playback function; no unverified falling clip was invented. This conclusion uses the Assembly-CSharp AudioManager method identity; same token rows in unrelated assemblies are not valid address resolutions.

Native progress/motion tests, Vue typecheck and production build passed. Existing legacy texture and bundle-size warnings persist. Remaining callback/varied-ground ordering and audio behavior are not proven by these checks.

### Airborne action rejection, instead of invented fast descent (2026-10-31)

Native Slide12987a0..12987b4 rejects IsSliding100, IsJumpingf8 and IsFallingf0. Jump1297bb4..1297bc8 rejects IsJumping, IsStumbling10c and IsFalling; successful jump clears IsSliding at1297c4c. Classic web Slide previously accepted a near-floor height shortcut and otherwise set vertical velocity to−8 on every airborne down input. This behavior is absent from the native method and could shorten visible jumps under repeated input. Classic now rejects slide while jump.airborne, and Jump checks the same airborne state instead of a .02m threshold. Challenge retains its prior input behavior. This is a native behavior correction, not a fitted source-speed constant.

Reproduction before change (`native-air-slide-before-check.json`): same Y2.875 at200ms; control continues toY3.5625 at300ms, down input instead forced Y1.7625. Corrected browser integration script `tools/browser-native-action-gates.js` verifies both air-down and air-up preserve Y3.5625/vertical velocity5; grounded slide remains active, and an accepted jump clears it. All four checks pass in `native-air-action-guards-check.json`. `current-native-air-slide-ignored.png` is an injected flat-road diagnostic, not a video frame match. Native actionGuard records are regenerated from verified instruction bytes in `tools/inspect-native-runtime-methods.py`.

Repeated-slide long-prefix regression still reaches21 turns/distance2967.20635, time130.47, score29000, coins0, speed22.01585, shield24.72 (`native-air-action-prefix-check.json`). Thus this diagnostic has no unexpected route regression, but its unchanged source-timing mismatch remains unresolved. Existing dense video evidence still has the first root jump15.0..15.1→15.6..15.8, corner jump17.1..17.3→17.8..18.1, second root18.7..18.8→19.5..19.7; these pose windows are not recovered touch timestamps. No game-speed or route-scale change was justified solely by this input bug.

Vue typecheck and production build pass; known legacy texture-path and bundle-size warnings remain. The full identical-game objective is incomplete.

### Pacing diagnosis: replay waiting confound and the missing FIRST corner jump (2026-10-31)

This turn changes reference evidence and diagnostic replay, not production speed/geometry. Previous long-prefix scripts reserved up to a complete .75-second slide before each explicit slide action. Grounded waiting permits acceleration, so those scripts are not neutral measurements of source motion. A new isolated experiment, `tools/browser-reference-slide-phase-experiment.js`, reserves only when the predicted slide expiry/no-slide interval overlaps one of five measured native slide-only windows (1617/1761/2001/2337/2385). It leaves runtime collision, acceleration and timers unchanged. The expiry envelope is a diagnostic policy assumption, not a recovered source gesture stream.

| Same prefix endpoint near physical2967 | Prior reserved replay | Short-reservation experiment |
|---|---:|---:|
| Run time |130.47s|137.46s|
| Score including picked500 bonus|29000|27420|
| Progress|1425.2153|1346.6298|
| Final speed|22.01585|18.53085|
| Turns / coins|21 /0|21 /0|
| Shield remaining|24.72s|24.68s|

Short reservations total.08s. The fixed2947 shield jump initially missed the pickup at lower speed (`native-phase-slide-shield-miss-check.json`); a speed-dependent takeoff about.6s before its measured center restores collection (`native-phase-slide-prefix-check.json`). This is input scheduling, not widened pickup reach. Source146s score26220 still differs by1200 from the experiment endpoint27420; source first pickup~145.6s still occurs later. Endpoint scene placement and run/video clock also remain approximate. Therefore the lower score is not a completed pacing match.

Dense first-corner evidence now confirms a previously omitted action: takeoff9.4..9.5, airborne through the first right turn, landing10.2..10.4 (enemy occlusion). Fifteen new10FPS stills at `first-corner-10fps`, raw score readings/hashes `first-corner-score-timing.json`, reviewed annotation `reference-first-corner-jump.json`, and `first-corner-10fps-contact.jpg` preserve the evidence. Native gruntJump waveform matches source audio onset9.71544 atNCC.9017. Audio is later than visual onset, so its onset must not be used as the touch timestamp. Earlier evidence/scripts that model only the SECOND corner jump17.2 are incomplete. The phase experiment now includes a first-corner jump at estimatedphysical179; the world coordinate is fitted, not a recovered touch input. Updated prefix still passes21 turns with the same endpoint totals (`native-phase-slide-corner-prefix-check.json`). Current diagnostic first-corner apex isphysical185.8566,run8.92,score1820,Y3.6075 (`current-native-first-corner-jump.png`); this is not a phase/score match to source9.8s/1680.

Fifty additional19.5..24.4s stills (`second-root-exit-10fps`) and raw glyph readings (`second-root-exit-score-timing.json`) locate another source motion change. A continuous two-line least-squares fit across36 readings19.5..23.0 finds a19.86s rate change,199.24→154.53points/s,RMSE5.37points. Under the recovered progress formula this corresponds to RMS21.87→19.26worldunits/s. Knot grid.01s is fitting resolution, NOT timestamp certainty; frame bins retain±.05s uncertainty. This observed decrease is missing from a constant-speed diagnostic first segment. It must not be hidden by globally slowing the game.

Cause remains unproven: source19.8..20.2 shows a brief upright/open-arm pose after the second root; waveform matching trip audio peaks20.2114 atNCC.399, much weaker than the known jump18.9741/.956 and landing19.7848/.733. First known trip also only matches.412, and pitch scanning.7..1.3 does not produce a strong isolated match. Pose/rate/audio together motivate a landing/stumble/edge-contact audit, but do not authorize inserting a synthetic obstacle or unconditional slowdown. `tools/compare-reference-vocals.py`, `compare-reference-vocals-pitch.py`, `read-score-window.py`, and `analyze-reference-pacing.py` preserve reproducible diagnostics. Native prefab inspection confirms its extra MonoBehaviours are SceneryElement and root Region2D, not an independently verified second trip collider.

No production movement constants or route placement changed based on these fits. This evidence narrows the next investigation to the observed post-second-root speed loss and source gestures. Full visual/mechanical/alternate-opening fidelity remains incomplete.

### Post-second-root stumble confirmed by simultaneous native sound effects (2026-10-31)

The weak gruntTrip-only correlation from the previous turn was caused by an incomplete event template. CharacterPlayer.Stumble1297b1c/1297b30 calls AudioManager.PlayFX for Effects16=gruntTrip AND20=monkeys, both volume1. Effects enum names were recovered from Assembly-CSharp metadata; AudioManager.PreloadSounds enumerates the35 effects and uses their names as resource keys. Both methods are now independently exported by the native resolver.

Updated `compare-reference-vocals.py` compares each effect and the simultaneous waveform sum. At20.2114375s, monkeys alone matchesNCC.93762 and gruntTrip+monkeys matches.95448. Positive-control first stumble7.454125s matches monkeys.94157/composite.95922. Jump18.974125 still matches.95593. Together with the pose/rate change, the paired waveform confirms a nonfatal stumble after the second root; this supersedes the prior claim that the event itself remains unproven. `reference-second-root-stumble.json` records evidence and the remaining distinction: trigger/collider/gesture is UNKNOWN. Audio onset is later than visual onset and cannot be used as an exact touch timestamp. No hidden obstacle or timed speed drop was inserted.

Production classic stumble previously played only gruntTrip; added the native monkeys.wav effect on successful nonfatal stumble. Kept the existing monkeyRoar key separate (it is a different file). Browser check `native-stumble-dual-audio-check.json` injects one safe trip after intro: one stumble request, one monkeys request and two actual AudioBufferSource nodes are created. The first fast simulation attempt preceded asynchronous audio decoding and created only one node; the retained proof repeats after decoding and confirms both. Existing vocal gain/mixing and character voice selection remain approximate, so this is event/file restoration, not full audio fidelity. Typecheck/build pass; known texture and bundle warnings remain.

Further static control audit found the likely missing mechanism for future investigation. TouchInput.TouchMoved12acc7c calls delayed Stumble(.25) on flat-road rejected left/right turns (12ad190/12ad35c), with player offset magnitude9.5raw=1.9world; the branch excludes jumping/sliding/strafing and requires AllowSwipeStumbleDeath. Constructor ControlsConfigData129e470 explicitly initializes fall-on-cliffs/narrows/swipe-stumble-death true, while swipe-to-strafe/slam-down/tilt-to-turn remain zero-initialized false (field offsets verified in source.controlsDefaults). Current classic move() instead shifts a lane on a rejected turn. This is a real unresolved control mismatch; do not substitute synthetic source collisions for it. Native delayed stumble/camera/offset handling and a usable desktop tilt adapter need to be considered together before replacing lane behavior.

Scope clarification for earlier airborne-slide correction: Slide itself rejects jumping, but TouchMoved separately calls SlamDown129884c when AllowSwipeToSlamDown is enabled; SlamDown writes−60raw=−12world vertical velocity while jumping/not falling. The constructor default is FALSE, consistent with the current classic behavior. It is therefore incorrect to generalize “native always ignores airborne down” to remote configurations with slam enabled. No remote override has been verified. The new source.controlsDefaults and actionGuards records preserve this conditional behavior.

### Flat rejected-turn behavior and desktop tilt adapter (2026-10-31)

Classic horizontal arrows/swipes previously changed a lane when queueTurn rejected them. Native default AllowSwipeToStrafe=false instead routes a flat-road invalid turn into Stumble(.25), writes PlayerXOffset magnitude9.5raw=1.9world, and only later performs the actual stumble. Integrated this flat-road branch: valid turns retain priority; jumping, sliding, falling and active boost ignore failed turn input; delayed stumble subtracts float32 smoothDt and fires at<=0. Repeated mistakes within the native kill window can now be caught. Run reset/revive clear the pending delay and offset. Native camera shake, ground-dependent branches and exact accelerometer/offset callback ordering remain approximate; the forced offset currently latches across delay/stumble and then recenters.

Correction to the previous static notes: field174 is **HasBoost**, not strafing. The TouchMoved guards read IsJumpingf8/IsSliding100/HasBoost174. Source controlsDefaults now records the correct field; production includes the active boost guard. No remote controls override is assumed.

To retain a usable desktop equivalent of phone tilt, classic A/D now provide continuous analog lean through the recovered steering response, key release returns toward center, and window blur/run reset clear held keys. Arrow keys and pointer swipes remain turn requests. Existing phone orientation steering and challenge lane controls remain available. Menu instructions now state “← → 转弯 · A/D 横移.” This is a browser input adapter, not a claim that original mobile input contains A/D keys.

`tools/browser-native-rejected-turn.js` passes seven browser checks (`native-rejected-turn-check.json`): after200ms pending delay=.04999998 with no stumble; after300ms stumble active and speed reduced; a second mistake is caught; airborne/sliding/boost cases are ignored; valid first corner turns successfully. `native-keyboard-lean-check.json` tests DOM keyboard event listeners: hold A300ms yields side−1.17285 with no pending stumble, release500ms returns side−.05661. These events are synthetic DOM events because the browser connection does not expose raw CDP keyboard dispatch; they verify the handler path, not a physical-key hardware test. `current-native-rejected-turn.png` is an injected flat-road diagnostic.

A separate diagnostic trace (`browser-reference-rejected-swipe-experiment.js`) tries a rejected RIGHT swipe atphysical391 after the second root jump, then waits through its delay/stumble before resuming slides. No obstacle, collision padding or timed slowdown is added to production. It reaches21 turns/physical2967.03892/run138.89s/progress1333.21236/score27160/coins0/shield24.68s (`native-rejected-swipe-prefix-check.json`). This is only1.43s slower and260points lower than the previous phase replay, and still differs materially from source first pickup~145.6s/score~26220. The inferred swipe/world coordinate and subsequent input cadence are NOT proven source inputs; the experiment does not establish the cause of the confirmed source stumble. Native default acceleration can recover quickly during standing stumble, so input timing remains consequential.

Native-delay equality/overshoot unit checks, Vue typecheck, native source instruction assertions and production build pass. Existing legacy texture-path and large sound-bundle warnings remain. The full identical-game objective remains incomplete.

### Complete audio event scan and corrected unsupported-water death (2026-10-31)

The old `/tmp/temple-reference.mp4` is truncated: its header reports270.4s but only131.7s of audio decodes. The first full scan therefore failed integrity/positive controls (`reference-audio-events-truncated-attempt.json` is a retained FAILED attempt). Retrieved the complete public DASH30280 audio for this same BVID/CID via the playurl API's supplied backup URL, HTTP200/3,697,573bytes. Persisted it in `analysis/reference-media/BV1ypuKzPErT-audio.m4a` with provenance/SHA256. `extract-reference-audio-events.py` now verifies decoded versus declared duration and adds the audio stream's.015011s start time. Omitting that start caused the first scan's15ms anchor error;8kHz sampling could also miss phase-sensitive peaks. Final scan uses16kHz/350..5000Hz and passes all four previously verified jump/stumble positive controls.

`reference-audio-events.json` contains thresholded detections over the complete270.4s recording:87 jump,82 land,13 paired gruntTrip+monkeys,2 bonusPickup,1 splash and1 splat. No slide/turn effects crossed the thresholds; this is NOT proof that no such actions occurred. These are audio onsets, not recovered touch timestamps, and can still omit quiet/overlapping effects. `reference-jump-land-pairs.json` pairs82 jumps to subsequent detected lands (durations.597/.725/.768/.811s); unmatched jumps188.659/219.593/248.009/260.041/261.022 must not be labelled failed landings solely from missing sound.

Detected stumble AUDIO onsets:7.454,20.211,31.219,46.750,66.291,112.158,129.523,147.742,160.201,174.281,186.441,209.865,241.438. Minimum spacing11.008s is consistent with surviving the independently recovered10s repeat-stumble window. Pickup onsets145.950/181.705 and splash262.046 provide additional anchors. The two pickups were already visually verified as25-second shields: stumbles147.742/160.201/186.441 occur inside those intervals (`reference-stumbles-and-shields.json`). Native obstacle/falling-landing stumble branches suppress collisions while invincible, whereas failed-swipe input can still schedule Stumble. This supports input mistakes as a missing source mechanism; exact direction/touch/collider for every event remains unproven. No synthetic speed events were inserted into production.

The full audio scan also exposed a significant error in earlier fall work. Source ending matches **splash**, but native Kill switches Fall1→Effects28 splash, Ledge4→Effects29 splat. CharacterPlayer.Update1297994..12979ac kills Fall1 at absolute rawY<−35 (worldY<−7). The controller's shallower GroundHeight−6raw comparison is NOT an unconditional water threshold: old GroundHeight loaded126ce18, previous support126cc94 and new support flagw20 gate126d244..126d254; flat missing support withw20=0 skips the ledge branch. It applies to a raised/recovered ledge, not continued descent through empty space. This **supersedes** prior statements/tests equating every unsupportedY<−1.2 with a water death, including `native-ground-full-route-check.json`'s old end classification.

Production now separates: unsupported falling continues until absoluteY<−7 and dies as water/Fall1 with splash; re-entering supported ground below−1.2 dies as ledge/Ledge4 with splat; shallower recovery still clamps/stumbles as appropriate. The web `fall` art is used for ledge presentation; full native ledge UI variants and varied terrain remain unverified. It is no longer labelled water merely because a fall occurred. `source.deathSequence` and `fallSupportGate` preserve exact instructions and semantic distinction.

Six browser checks pass in `native-water-vs-ledge-check.json`: walking off a long diagnostic gap remains playing below−1.2, reaches−7.21875 and dies as water with one splash/no splat, and transitions to ended after the normal.5s delay. A shorter gap regains support atY−4.25 and dies as ledge with splat. An early jump recovering atY−1.03 still lands/stumbles and stays playing. `current-native-water-fall-result.png` is an injected960-point result, not a source-score match. Unit boundary/recovery tests, Vue typecheck, native instruction assertions and production build pass; existing texture-path/bundle warnings remain.

No post-change full42-turn source-fidelity claim is made. Exact final route support, all87 observed jump alignments, control timings, video-clock alignment, geometry/camera, final2312/47240 reconciliation and alternate opening remain incomplete. The complete event scan now provides stronger evidence for that work than the earlier sparse safe-input traces.

### Native script order and cross-frame forward force (2026-10-31)

`tools/compare-audio-motion.ts` now compares full measured jump/stumble/pickup events against the native motion defaults on a deliberately flat, straight diagnostic road. Missing slide cadence, AV latency, start clock and sample phase are labelled hypotheses. With fixed onset.9/latency.22/score phase−.1, known jumps alone predict170280 final points; adding13 stumbles predicts102000. Immediate continuous sliding predicts14820; a.025s unobserved slide gap predicts43400. A nuisance grid's best immediate model uses onset.8/gap.03/latency.22, RMSE671points and45760 final versus47240; all87 sound-confirmed jumps are accepted. This is NOT a successful game replay or authorization to tune production constants. No lateral/turn/ground geometry is included, and death is stopped at the observed splash time minus assumed audio latency. `audio-motion-comparison.json` preserves all samples/scenarios.

The useful result is a recovered causal difference, not the fitted gap: original MonoScript execution orders are TouchInput−3, PCInput−2, GameInput0, CharacterPlayer220, GameController280. `inspect-native-update-order.py` records pathIDs/assetSHA and asserts these serialized values. CharacterPlayer.Update calls MovingObject.Simulate, consuming/clearing the current Force. Later GameController.HandleControls produces forward Force after the player's action timers have expired. The force is consumed by the NEXT character update. The old web implementation instead applied new acceleration immediately before movement and before slide expiry. Thus it lost the native expiry-frame force when the next slide started immediately.

Classic now stores queuedForwardForce across ticks, integrates it into raw float32 velocity next frame, then clears it. The controller stage captures a new force after movement/actions/collisions. New jump/slide input cannot erase the prior frame's queued force; native suppression means “no NEW force while jumping/sliding,” not “no acceleration can possibly occur on an action-start frame.” Reset, revive and intro hold clear the stored force. Challenge motion is unchanged. Other native callback/floor ordering remains approximate.

Five live browser force-order checks pass (`native-forward-force-order-check.json`): at27.05 with queued2, starting a slide consumes the previous force to27.10 and queues0; next sliding frame stays27.10; expiry queues2; immediate renewal consumes that old force to27.15 despite sliding; the following frame again stays27.15. This verifies the actual engine path, not just helper arithmetic. Raw float32 integration unit checks, Vue typecheck and production build pass.

Frame rate is consequential but remains unproven for the recording. Native MainMenu.Start12c92e4 loads60 and calls Application.set_targetFrameRate12c92ec; another caller is FTPSGraph.Start12fbe68 using its configured field (active state/value not verified). Encoded video is~29.97FPS; that does not establish Unity's achieved update rate. No fixed30Hz game loop was introduced to force a match. Queued diagnostic models with no extra slide gap predict27320 at120Hz,38780 at60Hz,49360 at30Hz; the30Hz case still hasRMSE1606/final+2120, not a complete match. These show why undocumented cadence/update timing cannot be replaced by one arbitrary speed correction.

The current short-reservation safe-input prefix still passes21 turns tophysical2967.17453, score29280/progress1439.73418/run128.75s/shield24.71s (`native-forward-force-prefix-check.json`). Its time/score change is expected because it has only a small subset of the source's87 jumps/13 stumbles; it is not source input. Seven rejected-turn and six water/ledge/recovery live checks also pass under the new force pipeline (`native-forward-force-regressions.json`). `current-native-forward-force-slide.png` is an isolated diagnostic screenshot, not a frame match. Existing build warnings persist. Earlier immediate-acceleration pacing fits and exact safe-prefix totals are historical evidence, not the current runtime.

Full source input alignment, runtime frame behavior, route/camera/mesh fidelity, final2312/47240 and alternate opening remain incomplete. The new update-order proof removes one mechanical mismatch while retaining those discrepancies explicitly.

### Camera projection, native local translation shake, and roll audit (2026-10-31)

Main Camera3873 already has the correct50° FOV. Its original near/far5/500 raw units were still rendered as.1/190 in the browser, despite the established.2 scene scale. Classic now uses1/100 world clip planes. The constant-colour background sphere is scaled to80 so it remains inside that far plane; its shader/colour are unchanged. Challenge retains.1/190. This restores projection clipping, not a verified frame match or a reason to resize the runner.

Recovered GameCamera.Shake12ac828 and Update12affb0..12b0058. Direct trip collisions call magnitude1/duration1.5/frequency1 at12716d8; fatal obstacle/ledge calls use duration1. The original phase **decreases** from zero, magnitude decays by smoothDt*(initialMagnitude/duration), and the resulting local camera translation isX=mag*sin(phase*35*frequency),Y=mag*sin(phase*50*frequency),Z0, scaled.2 in web units. Independently resolving UnityEngine.CoreModule confirms24c3214 is **Transform.Translate(float,float,float)**, not Rotate;24c368c is LookAt. The negative phase is preserved rather than “fixed.” `nativeCameraShake.ts` now implements that actual local displacement. Camera position retains the displacement for the following native MoveTowards step.

Direct obstacle/ledge triggers are wired at their own collision branches, not inside every call to Stumble: failed input and shallow recovery do not automatically gain an unsupported shake effect. The earlier plan to add bad-turn delayed shake was revised after inspection: TouchMoved writes(.25,1,.5,1) into ShakeAfterDelay fields, but GameCamera.Update does not read that flag. A scan of ordinary LDRB offsetf9 in the game-code range found CharacterPlayer/SavedCharacterPlayer/UICamera reads, no camera consumption. This build's dormant parameter writes are insufficient evidence to implement an active delayed effect. `source.cameraShake` records this distinction. Broader reflection/other-build behavior is not inferred.

Classic's legacy rotateZ((x−laneX(index))*−.03) was unrelated to native camera tracking and caused roll changes at discrete lane-index thresholds. It now remains only in challenge. Native LookAt followed by local XY shake supplies the classic orientation. GameCamera's serialized execution order300 follows GameController280 (`native-update-order.json`). During the.5s death wait, classic presentation now continues camera shake with zero following speed; world movement/scoring stay stopped. Post-result camera behavior and other native scene/menu animation branches are not proven by this change.

Eight live checks pass in `native-camera-presentation-check.json`: native1/100 planes, nonfatal collision activates1.5s local translation, damping expires to zero, shield pass stays unshaken, failed swipe does not invent a delayed shake, camera right-vectorY stays zero during lateral offset, fatal impact starts1s shake, and shake continues dampening during death. Helper tests verify native clip serialization, negative-phase35/50 sine axes, world scaling and expiry; existing follow-camera tests/typecheck/build pass. Known legacy texture and sound-bundle warnings persist.

Natural first-root diagnostic (`current-native-camera-trip.png`) reachesphysical131.138/run6.38/score1320: shake phase−.11/magnitude.926667/local offset[.120583,.130760,0], camera[.120583,7.125246,−118.17555], actor rootNDCY−.733123. No score/time/frame-match claim is made. Root and enemy presentation remain to compare at aligned source actions.

Runner sizing was deliberately not changed from fitted1.85 without transforming the original hierarchy. New `inspect-native-runner-transform.py` preserves the unique renderer1936 under Jhony_Export3 owner548 (transform1061 localY5.359628/scale5.398473) and its mesh/bounds in `native-runner-transform-source.json`. Bounds alone include animation range and do not prove a replacement visual height. This is a source for a subsequent exact skinning/transform audit, not a new guessed scale.

Overall video timing, geometry/actor framing, final totals and alternate opening remain incomplete.

### Independent default-runner skinning audit

`tools/audit-runner-skinning.ts` reconstructs `boneWorld * bindPose * vertex` from serialized bone local TRS, absolute animation tracks and world scale 0.2; compares every vertex against the production CPU rig after holder transforms. The 26 raw local TRS entries were independently checked against SkinnedMeshRenderer1936's actual bone references in sharedassets0: maximum component difference zero. Root ancestors1400/1029 are identity in the serialized prefab. Renderer local scale5.39847 is already encoded by the bind-pose relation; multiplying it again would double-apply it.

20 poses (Run, Slide Start, Slide Loop, Jump, Stumble at 0/.05/.1/.15 seconds) agree in shape to roughly 0.00002 world metres after one constant scale/translation. The production normalization yields holder scale0.189712276 and Y0.864780759. Independent native-world geometry is approximately production *1.05423 +[0,-0.14695,0]. Thus there is no evidence here of a clip-specific root-offset distortion or malformed skinning. The existing fitted sizing is about5.14% smaller than this raw native reconstruction and lifted by about0.1394m before rescaling. Native run-start vertex bounds are Y[-0.14694,1.80337], versus production[0,1.85]. The lowest vertex alone cannot determine native ground contact.

Evidence: `target/temple-run/analysis/runner-skinning-audit.json`. Production sizing remains unchanged pending runtime actor-parent/ground-offset verification against video. This audit shares production's linear-position/spherical-rotation interpolation between exported samples: it does not validate Unity's original tangent interpolation, which the current animation exporter omits. That is a separate fidelity question. No APK or native library was executed.

### Restore serialized position-curve tangents

The original five clips retain unweighted (`weightedMode=0`) finite in/out derivatives on every position key. `export-runner-animation.py` previously discarded them. It now exports both slope arrays for position/rotation and rejects unsupported weighted curves. `nativeAnimationCurve.js` evaluates unweighted cubic Hermite position components with derivatives scaled by the actual key interval; tangent-free legacy rigs preserve linear interpolation. Rotation still uses slerp: the presence of quaternion derivative arrays alone does not prove the exact native rotational interpolation algorithm.

`temple:test:animation-curves` verifies an independently specified cubic t³ on [1,3], derivative time units, exact key endpoints, tangent-free fallback and stepped tangents. Source analysis restricts measurements to bones with positive mesh weights and their ancestors, excluding unused Footsteps. Maximum position differences from prior linear interpolation at quarter/midpoints (native .2 scale): Stumble0.058931m, SlideStart0.008985m, Run0.011144m, Jump0.009048m, SlideLoop0.000530m. These are local-bone position differences, not measured final rendered vertex displacements. Evidence: `analysis/native-position-curve-check.json`.

Independent skinning audit updated with its own Hermite evaluation: 20 pose comparisons remain within0.00001655m RMS after constant scale/translation. Typecheck and production build pass (existing UI texture path and sound-chunk warnings persist). Browser diagnostic confirms airborne Jump and active Slide clip0.0671s; screenshot `docs/screenshots/current-native-position-curves-slide.png`. This is injected-input smoke coverage, not source-video action timing or proof of full visual fidelity. Menu restored after check.

Unity's official curve documentation describes tangent-controlled interpolation and possible overshoot: https://docs.unity.com/en-us/engine/6000.0/manual/animation-section/animation-mecanim/animation-clips/animation-editor-guide/editing-curves . The implementation is scoped to the observed unweighted source position curves; exact legacy Unity quaternion sampling remains unresolved.

### Resolve native runtime model offset; replace default posed-height normalization

The earlier raw-prefab comparison omitted a runtime transform. `CharacterPlayer.SetupCharacter`0x1298500 instantiates the selected actor, calls Transform.set_parent at0x12986d8→0x24c2e44, then sets localPosition(0,1,0) at0x12986fc→0x24c1e28. Method names independently resolved from UnityEngine.CoreModule's own CodeGenModule, not Assembly-CSharp token aliases. Argument instructions0x12986ec/6f0/6f4 set s0=0,s1=1,s2=0. This is a model offset0.2 world units, not a dynamic foot-floor clamp. `CharacterPlayer.SetupCharacter.asm` retained; `inspect-native-runner-transform.py` verifies instructions/branch targets and records both binary and asset SHA256.

Default Jhony now uses authored serialized bone local TRS, absolute root position tracks, native unit scale0.2 and model Y0.2. `normalizeRigHeight(1.85)` and Run-first-root rebase are bypassed for this default only. Other shop skins/enemy retain their existing retargeting/sizing pending individual native audits. Relative to the previous fitted rig, the default is approximately5.42% larger and its geometry Y equals previousY*1.05423+0.05305. Earlier report's negative0.14695 was the raw-prefab comparison without the runtime +0.2 and must not be interpreted as the actual in-game correction.

`temple:test:runner-skinning` now requires absolute vertex agreement against independently reconstructed native TRS/position curves including model offset, without fitting a scale or translation to pass. All20 poses across5 clips pass; max absolute RMS5.50e-8m, best fitted scale effectively1. Quaternion interpolation remains the shared/unverified slerp model. Original game runtime execution was not used.

Typecheck and build pass; existing warnings unchanged. Browser confirms modelScale[.2,.2,.2], modelPosition[0,.2,0], Run clip active; evidence `docs/screenshots/native-runner-transform-browser-check.json` and `current-native-runner-transform.png`. Final screenshot/data use natural opening advanced4.5s without teleport (an initial debug-positioned capture was blank and was replaced after visual inspection). It is not a matching video timestamp. Full camera/action/route alignment remains open. Default menu restored and ready.

### Native chase-pack formation and opening population

Visual comparison of005/006/008 shows lateral tilt and Slide/SlideLoop states, so the standing centered browser opening is not an equivalent pose. No camera-height tuning was made from that unequal comparison. A concrete chase presentation mismatch was found: the web always spawned3 animals in a symmetric hand-positioned row. Native `GameController.SimulateEnemies`0x1271828..0x12718b4 keeps8 during intro and removes indices3+ after IsIntroScene clears. Tables0x6b78bc/0x6b78d8 determine front/back and left/right offsets; the first animal has zero offsets, subsequent indices use table[index-1].

`inspect-native-controller-scene.py` parses the GameController6396 serialized public-field prefix through EnemyPrefab (32..616 of744 bytes; remaining fields intentionally not claimed parsed), using IL2CPP visibility/type attributes. Scene values: EnemyCount8, spreadLeftRight12raw, spreadFrontBack6raw, initialFollowDistance7.5raw. `inspect-native-enemy-formation.py` captures binary coefficients with source SHA256. First three offsets in world units: (side0,behind0), (-0.6933333,0.5454546), (1.0133333,0.7636364). Earlier web offsets(-1.3,0),(0,0.2),(1.3,0) had the wrong ordering/spacing.

`nativeEnemyFormation` now supplies all8 offsets; opening pack uses8 rigs and hides indices3+ at the existing3s intro transition. Hidden rigs are not animated. Existing approximate chase-group base anchor, enemy posed-height normalization, playback scale and staggered animation phases remain unresolved, so this is not proof of exact whole-pack motion through turns or original enemy dimensions.

`temple:test:enemy-formation` independently reads source-table JSON and verifies all8 rows. Typecheck/build pass; existing build warnings unchanged. Browser confirms8 visible at2s,3 at4s, center-first and staggered front/back; natural no-input first stumble and approach captured at6.8s. Evidence `docs/screenshots/native-enemy-formation-browser-check.json`, `current-native-enemy-formation.png`. These are current game-clock samples, not source-video frame alignment. Menu restored ready.

### Restore native enemy dimensions, absolute skeleton and run playback

The prior screenshot's very large chase animals were not explained by formation alone. Native prefab202 `monster_prefab` Transform1054 and child1405 `monster` both have identity TRS. Renderer1940 uses mesh96, descendant1072 `enemy` (mesh rotation-90°X already represented by bind-pose relations). All exported bone local TRS values match the renderer's serialized bone references exactly. `inspect-native-enemy-transform.py` captures this with asset/native binary SHA256. No actor-style runtime +1raw model Y is evidenced for enemies.

Previous `normalizeRigHeight(1.65)` changed scale .2→.291931138 and modelY→.904076318 (before the tangent addition), inflating the animal roughly46%. At Run0, original world geometry Y[-.014824,1.115580] versus fitted[0,1.65]. Enemy rigs now use native scale.2/modelY0, authored local TRS and absolute root curves, bypassing arbitrary normalization/rebasing. Enemy export now preserves finite unweighted position/rotation tangent arrays; position Hermite evaluation follows the player fix. Quaternion sampling remains unverified slerp.

`Enemy.Start12ae0f0` tails to Reset12ae0f4. Reset selects the Run AnimationState, calls Random.Range(0,1), and tails12ae1a8→248d344. Independent UnityEngine.AnimationModule method table confirms this is `AnimationState.set_normalizedTime`, **not set_speed** (set_speed is248d3cc). Enemy.Update retained as named disassembly; no player-speed animation multiplier there. Classic enemy animation now advances in real time, replacing speed/RUN_SPEED. Per-animal initial phase remains the existing deterministic stagger; original random phases are not reconstructed. Native jump/ground callbacks and turn anchor remain unresolved.

`temple:test:enemy-skinning` compares absolute vertices to independent raw-bone reconstruction at4 Run times; max absolute RMS7.63e-8m. `temple:test:enemy` checks original scale, pose orientation, continuous looping and finite vertices. Both pass; typecheck/build pass with unchanged texture/sound warnings. Browser at player speed27.4025 verifies all visible enemy clip times advance0.100000s over100ms, modelScale.2 and modelPosition0. Natural no-input first-stumble approach6.8s screenshot now has animals largely below the runner instead of covering most of its body. Evidence `docs/screenshots/native-enemy-transform-browser-check.json` and `current-native-enemy-transform.png`; not a source-timestamp match. Menu restored ready. No native code executed.

### Enemy material audit and current-facing chase anchor

Renderer1940 material26 `orig_default` references shader113 Imangi/Unlit/Opaque and MainTex53. The current nativeUnlitMaterial intentionally uses an opaque, front-sided, unlit map. No alpha-discard behavior was evidenced, so no transparency workaround was added for black mesh silhouettes. Exact triangle/culling artifact comparison remains open.

Another concrete chase discrepancy: `SimulateEnemies`12b1b70..12b1c20 positions each animal relative to the player's current forward/right vectors. The old web base sampled `path.at(distance-gap,lane*.4)`, leaving the pack on the old road arm immediately after turns. Classic now uses the player's current point/heading and translates backward by the current native gap; formation offsets rotate with that same basis.

Native non-jumping lateral anchor branch12b1c3c..12b1e.. rounds the perpendicular absolute coordinate to a60raw (=12world) grid then takes halfway from player coordinate toward that centre. Airborne skips contraction. `enemyFollowAnchor` implements half lateral offset relative to the current fitted path centreline, versus old .4 offset; it preserves full side while airborne. **Limitation:** original absolute tile-world origins are not reconstructed, and fitted route corners do not all coincide with native global grid. This adapter uses the fitted centreline as grid centre; it is not a claim of exact native absolute-grid snapping. Enemy ground/jump callbacks and per-animal initial random phases remain open.

`temple:test:enemy-anchor` covers straight, rotated, just-turned, grounded half-side and airborne full-side relations. Typecheck/build pass; existing warnings persist. Browser fixture teleports to173, initializes the upcoming177 junction with a10ms tick, queues its actual direction and jumps;500ms later phase playing, turnCount1, heading-π/2, chaser offset projected onto current backwards vector agrees with native gap within debug rounding, and Z matches the new road arm. Earlier fixture attempts before direction initialization were rejected and are not passing turn evidence. `docs/screenshots/native-enemy-anchor-browser-check.json`, `current-enemy-turn-anchor.png` retain only the final valid fixture. This is an injected turn test, not source action replay or timestamp comparison. Menu restored ready.

The final turn screenshot was replaced with a continuous first-corner smoke replay (jump atphysical121, turn input173, run through190), with no teleport: turn accepted, playing, turnCount1, current-heading backward offset15m. At game8.29s, heading-π/2, actor(13.13,0,-174), pack(-1.87,0,-174). Both final injected fixture and continuous replay are retained in the browser-check JSON. This replay's actions/score2080 are not the source video's controls/timing. The screenshot also shows coin side faces as bright rectangles; native coin material/mesh sampling warrants a subsequent visual audit rather than treating this frame as fully restored.

### Native coin pivots, root height and angular speed

The bright rectangles were observed when the native thick diamond is viewed from the side; the shape alone is not proof of broken geometry. A direct source audit found the web exporter had recentered all coin meshes and scaled them .18. Native coinYellow/Red/Blue prefab hierarchies have identity model transforms. Their original mesh pivot retains a positive Y offset; yellow rawY[.521300018,4.19159985] gives worldY[.10426,.83832]. Export now preserves original pivot and unit conversion.2 for all3 meshes. Material UVs/indices remain native. `temple:test:coin-presentation` compares every exported OBJ vertex to independently captured source mesh vertices*.2.

`BonusItem.Instantiate`1296554..1296560 writes raw float0xc3808000 = **-257 degrees/s** to MovingObject.AngularVelocity for the first3 coin enum cases (switch targets1296540/48/50, radii5/10/15). BonusItem.Update is a tail into MovingObject.Update; MovingObject.Simulate12e04b0..12e0518 rotates around the object's own pivot using angularVelocity*smoothDeltaTime. Renderer handedness changes Y rotation sign, so web spin is+257degrees/s, replacing+2.4radians/s (~137.51degrees/s). Each coin now uses age since its current spawn, reset on pooled reuse; prior absolute global elapsed phase was unsupported. Exact native incremental f32 quaternion integration and original per-pattern initial yaws/spawn batches remain unresolved.

`PathElement.AddCoins` standard row branch12e5404 (and neighboring row placements) sets local rootY3raw (.6world), with mesh's own positive Y offset intact. Classic spawn maps existing reference arc height offsets onto this .6root baseline, replacing centred-mesh baseline1.3. Classic coins have no extra sine bob; pickup collision and render use the same root. Native coin prefab Animation has no bound clips; prefab velocity/force zero and BonusItem.Update adds no sinusoid. Existing reference coin arc trajectories/count/spacing remain fitted, not recovered generator output.

`inspect-native-coin-presentation.py` captures3 asset/mesh SHA256, world vertices/bounds, exact angular instructions/switch targets and standard rowY instruction. It also preserves shader109 `Temple Run/WP8 (Custom Fog)` original GLES code: directional Lambert ×MainTex×Lightmap, custom fog. Runtime lighting/material selection remains unresolved (no serialized Light in level0), so no guessed light or alpha patch was applied; current MeshBasic coin shading is still a known fidelity gap.

Tests: coin presentation vertex/rotation/pivot/arc-offset checks, reference coin rows, native pickup collision, typecheck and build pass (existing UI texture/sound warnings unchanged). Browser injected coin root staysY.6 over100ms, yaw advances.4485496rad, minimum geometryY=.704260, center-lane pickup increments1coin, pooled respawn age resets to.001s. Natural first-corner smoke replay stillplaying/1turn/0coins at190m, screenshot `current-native-coin-presentation.png`; JSON `native-coin-presentation-browser-check.json`. Coin faces are now shown at a different, source-derived spin phase, not a claim that shading or timestamp matches the video. Menu restored ready. No native library executed.

### Coin radial Gamma fog and opaque culling; lighting still unresolved

`trace-native-material-writes.py` independently resolves UnityEngine.CoreModule Material.set_shader/Renderer shared-material setters, scans BL/B instructions in named Assembly-CSharp methods in11a77c4..1400000. Direct shader replacement sites found only in UIDrawCall and CharacterPlayer textures; no BonusItem coin shader replacement found. This bounded direct-call scan does not prove absence of indirect/native/reflection changes. No serialized Light is present in level0. Bundle wallTexture and current WebP atlas have the same layout/content visually with compression differences; no wrong-atlas replacement was justified.

Shader109's preserved GLSL explicitly computes radial camera distance per vertex and visibility clamp((FogEnd-distance)/(FogEnd-FogStart)), then mixes encoded Gamma texture values with fog color. Current coins previously used MeshBasicMaterial's standard linear-working-color fog at camera depth. `nativeCoinMaterial.ts` now restores native Gamma sampling (clone NoColorSpace, leaves shared source sRGB texture unchanged), radial vertex fog20..80, opaque alpha and backface culling. Shader109 pass state `culling.val=2`, zWrite1, blend1/0 supports this state. **Native directional Lambert×Lightmap bindings remain unresolved and are not implemented in this partial material.** No arbitrary light/intensity factor was introduced. Near-coin brightness may therefore still differ from source; this is not the complete original shader.

`temple:test:coin-material` verifies clone/color/fog/state configuration. `browser-native-coin-gpu.ts` bundles the production material into a detached1px WebGL target: input texture[255,200,0,alpha0], at radius10→[255,200,0,255]; radius50→approximately[153,141,43,255]; off-axis(30,0,-40), same radius50, matches the same middle fog (would differ under camera-depth fog); radius90→[50,82,86,255]. All GPU pixel assertions within1byte pass; back-facing quad returns transparent clear[0,0,0,0]. Evidence `docs/screenshots/native-coin-fog-gpu-check.json`.

Typecheck/build pass; known warnings unchanged. Continuous first-corner smoke replay remainsplaying/1turn/0coins/score2080 at190m, screenshot `current-native-coin-fog.png`. Farthest coins fade into the scene instead of retaining the old fog color path. This action sequence is not the video input timeline; no exact visual-match claim. Menu restored ready.

### Ground-plane texture motion: independent early-run speed evidence

`tools/measure-reference-floor-flow.py` rectifies video4.8..6.9s (63 samples30fps,296×640 decoded) to the ground plane using serialized FOV50, cameraY7, behind10 and focusY4. Horizontal sampleX[-3,-.25]m and ahead[4,32]m; plane grid.05m. Fixed camera projection: imageX=W/2+f*x*sqrt109/(10*ahead+121), imageY=H/2-f*(3*ahead-40)/(10*ahead+121). This is an assumed steady native follow pose, not fitted from the score curve.

NCC matches successive rectified floor patches at.1s spacing, jointly searching lateral and forward translation, with local subpixel Z refinement. A known random-texture translation independently verifies sign and grid units (NCC1, recovered9.00043Z pixels/-2X pixels for true9/-2). Initial search range was too short for a25m/s runner; expanded to0..3.5m per.1s before accepting any source evidence. Current JSON retains the full final search results and rejects NCC<=.9/search-boundary peaks. Early rotating-camera samples fail and are not used.

42 valid matches span5.1..6.7667s: NCC.9000..9742; inferred forward speed24.9858..25.5246m/s, median25.1045. Within5.1..6.0, median25.0802. Independently visible source scores005=600 and006=860, multiplier20, no coin/power award in this window, imply sqrt((860-600)*48/20)=24.9800m/s under recovered distance metric. Agreement within~0.4% supports the steady camera/scale assumption and establishes about25m/s before the first stumble; it does **not** prove start speed25 or justify replacing native acceleration with a fitted constant. Source actions before that window can explain different achieved speeds.

Separate near/far ground regions test depth consistency. When both NCC>.9, median near-minus-far speed difference−.0451m/s; some frames differ up to~.92m/s (shadow/occlusion/camera/pixel effects), so precision is not absolute. Native clock/input alignment, exact camera pose, source version compatibility and subsequent route geometry remain open. No production speed, score or obstacle location was changed from this measurement alone.

Evidence in `target/temple-run/analysis/reference-floor-flow/`: `measurements.json` with every peak/score/depth check and SHA256 for all63 persisted PNG frames, plus `rectified-road-contact.png`. Source media SHA256 recorded. The input low-resolution MP4 was revalidated as truncated: ffprobe decodes3951frames then reports partial-file/NAL errors despite its270s header. The measurement window is inside its valid prefix. Full-stream retrieval/validation is being handled separately; do not extend this file's samples into the missing tail.

### Full reference video stream recovered and decoded

`tools/download-reference-video.py` fetches public API-returned URLs for BVID/CID, chooses AVC quality16, and validates HTTP200/full Content-Length plus full ffprobe frame decoding before atomic rename. One API-provided CDN returned567; the alternate API-provided URL succeeded. No guessed CDN URLs or partial-file substitution.

Persisted `target/temple-run/analysis/reference-media/BV1ypuKzPErT-video.m4s`:14,191,987bytes (exact declared length), SHA25626946aaa6cac6be126a30e767f861c2ddfc4dd60cbdb7d6fdada7f58f4c39dfb, AVC296×640,30000/1001fps,270.383s, **8103decoded frames with no ffprobe error output**. `video-source.json` records API/stream/codec/frame evidence. Full audio remains the separately verified30280 m4a. `tail-268.png` verifies the closing alternate opening is reachable. The old `/tmp/temple-reference.mp4` remains a truncated prefix and must not be reused for full-video analyses.

This turn changes analysis evidence/media, not production pacing. The initial63-frame ground-flow measurement still records the old prefix hash and is valid in its early window; future windows should use the complete saved stream and keep timestamp uncertainty explicit.

### Dense final-scene audit: surviving side corrected and false wide-road return removed

Complete video257..263.5s extracted at20fps into `analysis/reference-final-20fps/` (130JPEGs; per-frame times/hashes/source SHA256 in `observations.json`). `contact.png` and `final-jump-contact.png` make the ending inspectable. The latter shows last Jump becoming visible around260.8..260.9, then the runner falling beside the collapsed **left** part while the **right** strip continues to the fog horizon. There is no visible road endpoint in front of the runner and no return to a full-width road. Runner exits lower image around261.7..261.8; these image times are not asserted as exact touch/Kill callbacks. Raw resized-glyph observations show47240 by261.6 then unchanged; match confidences around.73..79 are retained and not treated as exact callback timing. Final result47240/0coins visible separately.

The old final3 tiles at legacy2359/2363/2367 were `narrowWallRight`, whose actual rendered mesh retains the left strip. Browser inspection exposed the mirrored choice. They are now `narrowWallLeft`, and the corresponding native support polygon switches with the mesh: left side unsupported, right side supported. Earlier reports describing that final row as narrowWallRight are superseded.

The old row also ended atphysical5379 and exposed full-width floor beyond, contradicting the persistent narrow strip in261–262. `REFERENCE_FINAL_NARROW_CONTINUATION` adds8 native12m copies at5385..5469; `REFERENCE_VISIBLE_OBSTACLES` joins these to observed obstacle data for runtime spawning. Original score-coordinate observations stay separate; no fake legacy score distances are assigned to distant continuation tiles. This is a fog-visibility continuation/lower bound, **not a recovered true end or complete native generator**. It uses the same one-sided support polygons and cut intervals, not decorative meshes on top of a hidden safety floor. Random suffix remains48m+ beyond the last visible copy.

`temple:test:final-narrow` checks all contiguous12m tile/cut intervals and explicitly verifies native polygon rejectsX-1.3/acceptsX+1.3. Existing reference-obstacle tests now distinguish final surviving-right row from earlier surviving-left rows. Typecheck/build pass; warnings unchanged. Debug-only snapFollowCamera was added to inspect teleported fixtures without thousands of metres of camera lag; normal follow behavior unchanged.

Browser synthetic A/D tests begin on full road5335: holdingA falls into water at5356.94, side-1.17285,Y-7.21875, then result after normal.5s; holdingD remainsplaying, grounded at5404.22, side+1.4, past the old5379 cutoff. This is isolated support validation, **not the original last-jump input/timing or final47240 reproduction**. Evidence `docs/screenshots/native-final-narrow-browser-check.json` and `current-final-narrow-continuation.png` show surviving-right geometry. Initial screenshot with the wrong side was replaced after inspection. Native water/ledge thresholds were not changed based on uncertain visual timing. Exact final trajectory/clock still open; menu restored ready.

The support fixture's restart banked its left-fall diagnostic as one local run(51m/1020score). Inspection showed runs1,totalDistance51,bestDistance51,bestScore1020 with currency0; these exactly identified this test record. Only those four counters were restored to their pre-test0 values under an exact-match guard, preserving equipped skin/settings/currency. Reload confirmed menu best0 again. Future browser fixtures that can finish/bank a run must snapshot `temple.v2.progress` before testing and restore that snapshot afterward, rather than inferring an undo from counters.

### Earlier narrow-section audit: short notches and native long-hole endcaps

Compared source180/181/182,186/187,190,195/196,200/201,210/211 and259 in `analysis/narrow-side-source-contact.png`. A single short notch has full-width approach/exit rims and concave support; a long partial collapse tapers into/out of a continuous one-sided strip. The previous implementation reused straight LongUp/Down middle meshes for both forms, making short notches and long-hole ends abrupt and sometimes mirrored.

`export-native-narrow.py` now also follows native prefab LongUpA/BHorz and LongDownA/BHorz, exports full TRS geometry + UV1 and exact serialized ground Region2D polygons. Four added meshes: narrow-wall-left-a/b and right-a/b. Canonical B has a full-width near end at Z+6 and narrows toward centre; A restores full width at far Z-6. Their lowest geometry extends to~-7.07world versus straight middle~-6.0; no invented flat collision slab. `native-narrow-source.json` now records8 variants with prefab hashes/chain/bounds/support.

Observed/fitted route assignments corrected: legacy1627/1697→short narrowBeamLeft;1719/1725→left B/A;1765/1771/1777 and1801/1807/1813→right B/middle/A;1897/2327→short narrowBeamRight (surviving left);2359→left B followed by original left middles2363/2367 and the final visibility continuation. Source spacing and exact timings remain fitted; the native generator/seed has not been reconstructed. Earlier source reports calling all these entries narrowWall middle are superseded.

The source's bright blue surface at186..201 is the **invincibility Safety Net effect**, not evidence for a special waterfall mesh/material. Source is shielded in this interval (second pickup181.705 audio); enabling shield in the same current cap scene reproduces that class of blue animated overlay. No water shader was patched based on the colour. Current Safety Net positioning/timing still needs an exact native audit; this comparison is not proof it is aligned.

`temple:test:narrow` now raycasts8 native meshes: actual safe floor atY0, unsupported centre crossing remains airborne-only, and each A/B mesh restores the otherwise missing side at its full-width end. Exact exported support polygons independently distinguish B near and A far rims. Reference-obstacle/final-narrow tests, typecheck and build pass with previous warnings unchanged. Browser fixture at3860 holdsD850ms: reaches3883.32 on right strip, playing/grounded; screenshots `current-native-narrow-caps.png` and `current-native-narrow-caps-shield.png`, JSON `native-narrow-caps-browser-check.json`. The latter shielded screenshot is a diagnostic scene without source coin layout/timestamp. Local game progress was snapshotted before the fixture and restored afterward. Menu restored ready.

### Safety Net ownership correction (2026-10-31)

Static inspection only: PathElement.InstantiateSafteynet 0x12e68c8 parents the visual to the PathElement transform (0x12e6994). AddSafteyNet 0x12e6348 writes local position with raw Y -1 for ordinary temple tiles (0x12e64a8,0x12e6610); scale .2 gives ground-relative -.2 world units. RecursiveVisibility 0x12e87cc enables each extant sprite using static sSafetyNetEnabled (0x12e88b8..88c8), then applies a four-float value via 0x11ebc78. Exact fade/color semantics are not yet decoded. This differs from the invisible GameController SafetyNetRegion used for physics.

Removed the single runner-following plane at Y -.035. Visible hole/narrow entities now receive pooled fixed 4×12 planes at their path positions, Y -.2, sharing the five-frame/15FPS atlas. All pool entries hide on reset or shield expiration. Current flattened wooden terrain uses the same relative height; original level-transition tilts remain unimplemented. Native per-sprite animation phase and late-shield color modulation remain unverified; shared world-clock phase is still an approximation.

Browser fixture: start, freeze, shield, advance beyond intro, teleport to 3860, snap follow camera. Ahead 13/25m narrow caps both show fixed blue sheets, full-width road under runner does not. Screenshot docs/screenshots/current-native-safety-nets.png. This is an injected presentation check, not a replay of source input. Saved temple.v2.progress is restored after the fixture. Typecheck/build pass (existing missing bar textures/chunk size warnings remain).

### Safety Net warning modulation decoded (2026-10-31)

Resolved 0x11ebc78 to UIWidget.set_color via Assembly-CSharp method tokens. GameController.HandleInvincibility 0x1270b14 reads CharacterPlayer invincibility flag +0x154 and remaining time +0x158. When remaining >2.5, intensity is 1. During the last <=2.5 seconds it subtracts smoothDeltaTime twice from previous color alpha (+0x58); if the result is <=0 it resets to 1. The final DUP/STUR at 0x1270c20/24 writes identical RGBA to PathElement.sSafteyNetColor +0x4c. This is a repeating linear dim/reset, not a sine wave or an on/off blink.

Implemented float32 arithmetic and shared mesh material RGB/opacity modulation; reset inactive intensity to 1. Native gamma-space vertex-color shading versus Three material color multiplication remains a shader-level fidelity question. Test temple:test:safety-net covers exact 2.5 threshold, <=0 wrap, float32 step, zero-dt stability, shared material and dimensions; typecheck passes. Browser injected shield fixture at elapsed23.135s renders dimmer nets on two narrow tiles (current-native-safety-net-fade.png); far-teleport GPU screenshot required a second render to avoid a stale blank capture. This does not establish source-frame timing equivalence. Progress restored and menu retained.

### Native player invincibility material correction (2026-10-31)

Previous goal turn made verified progress (Safety Net final-2.5s modulation); this turn independently checked the player material. Scene-source CharacterPlayer references shader111 and texture57. Extended export-invincibility-texture.py to preserve decompressed original GLES shader and render-state evidence in invincibility-material-source.json. Shader111 is Imangi/Unlit/Transparent ConstColor: fragment output is sampled texture × constant RGBA, no fog or lighting. Render state has SrcAlpha(5)/OneMinusSrcAlpha(10), ZWrite0, CullBack(2), LEqual(4). CharacterPlayer.SetInvincibilityTexture 0x1298b0c changes shader/texture, then calls SetAlpha(.5) at 0x1298c10. SetAlpha 0x1296ee4 ordinary branch 0x1296ff8..129700c passes white RGB and requested alpha to Material.set_color. Debug-color branch is excluded by serialized ColorDebugging=false.

Corrected runner glow material from guessed cyan0x66eee5/opacity.55/DoubleSide to white/.5/FrontSide; disabled fog and tone mapping to match the original shader. Player texture stays the extracted asset. Existing test-invincibility-material.ts now verifies these evidenced properties plus reuse/restoration; test passes. Typecheck/build pass (existing bar texture/chunk warnings persist). Browser fixture at distance3860, elapsed3.51 with injected shield saved as current-native-invincibility-material.png: single-sided translucent actor now shows the native glow texture without the added cyan tint. Original video camera/pose/input timing equivalence remains unproven. Test progress snapshot restored before retaining menu.

### Native invincibility texture motion and independent warning alpha (2026-10-31)

Previous turn changed authoritative material state and passed validation, classified progress. Further static audit of CharacterPlayer.Update reveals two omissions: 0x1297384..12973b0 uses material alpha (GetAlpha at0x1297098), subtracts 2*smoothDeltaTime during remaining<=2.5s, and wraps <=0 to .5. This is independent from the Safety Net's 1..0 cycle. 0x12973f4 gets mainTextureOffset; 0x1297404/10 obtains smoothDeltaTime and 0x1297428..743c adds 2*dt to BOTH offset axes. The same applies to attachments. Restore function0x1297c78 resets texture offset to0 at0x1297d48..54 and restores alpha1. Texture57 serialized wrapU/V=0 (Repeat), filter1.

Runner effect now owns a cloned repeating texture, keeps rendered UV unshifted, resets offset on expiry/re-entry and implements the independent .5-alpha warning cycle. Shared loaded atlas is not mutated. Caller supplies dt and shield remaining, rather than an arbitrary world-time sine. CharacterPlayer's boost-specific branch (keeps .5 while boost distance>=50raw) is not mapped by this shield-only change. Shader111 does not multiply UV by _MainTex_ST despite the native offset writes; IMPORTANT: the extracted GLES source uses raw in_TEXCOORD0 directly. Therefore native CPU offset updates may have no visual effect on this shader variant. Both compressed platform blobs were checked: each contains four raw-UV assignments and zero _MainTex_ST references. Offset scrolling was therefore removed before delivery; only the evidenced opacity cycle is rendered.

Final validation: invincibility test/typecheck/build pass. Updated browser screenshot current-native-invincibility-motion.png uses final static-UV shader behavior at injected elapsed23.135s, showing reduced player opacity independently of the net. Progress restored and normal menu retained. Original video's exact warning-phase alignment still depends on unresolved input/pickup clock reconstruction; this fixture proves implementation behavior only.

### Delayed enemy jumps restored (2026-10-31)

Previous turn was progress (independent player warning alpha). Returned to source opening screenshots006/010: source010 shows an airborne player and a pack of visible enemies, prompting audit of missing enemy aerial movement. Current implementation had kept every enemy parent Y=0 permanently. Static direct-BL scan finds Enemy.Jump's caller GameController.HandleDelayedJumping126fcf4. On successful CharacterPlayer.Jump it iterates enemies and computes planar player-enemy distance divided by player speed (126fe4c..70). Enemy.Jump12ae1b4 rejects jumping/falling, queues positive delays, or sets raw vertical velocity80 immediately. Enemy.Update12ae284..334 decrements delay, applies rawgravity250 through MovingObject, and snaps to GroundHeight only while IsOverGround and below it. Enemy run animation is not changed by Jump. Reproducible method disassemblies/hashes now exported by tools/inspect-native-enemy-jumps.py into native-enemy-jump-source.json. APK/library were never executed.

Added enemyJump.ts with delayed launch, existing native raw float32 vertical integration, 16world-unit/s jump velocity, hold gating, airborne rejection and flat-ground landing. Successful classic player jumps queue each active enemy using actual current world XZ separation/speed; per-enemy parent Y is updated without changing authored skeleton/run clip. Reset clears all pending jumps. Existing fallback/challenge actors remain unchanged. This implements the flat-road aerial behavior; original SimulateEnemies falling/ground-level updates after a player falls are still not mapped. Do not treat the fixed ground plane as native support-region equivalence on every terrain.

Test temple:test:enemy-jump covers hold, delay threshold, launch, airborne rejection and landing. Typecheck/build pass (existing warnings remain). Injected browser check: start/freeze, advance3.5s, jump, advance.45s: playerY3.65625; first three enemy parentY2.3625/2.3375/2.3375, all keep run clip. Screenshot current-native-enemy-jump.png. This confirms distinct delayed enemy trajectories, not original-source input phase equivalence. Saved progress restored; playable menu retained.

### Enemy jump launch-speed correction (2026-10-31)

Previous turn was progress but its fixed16 world/s jump launch was incomplete. SimulateEnemies1271a9c..1271ad4 updates Enemy.JumpVelocity+0x80 on every ordinary placement frame: player GetSpeed, clamp raw80..100, store. Enemy.Reset's raw80 is only the initial default. Enemy.Update reads that field when the queued delay expires. Corrected immediate and delayed launches to nativeJumpVelocity(currentSpeed), sampled at launch rather than queue time. Added tests for low/high clamp and a pending jump whose player speed changes from25 to18; the launch uses18 before applying gravity. This supersedes the prior fixed16 claim and screenshot height expectation.

Browser repeat of same elapsed3.95s fixture: playerY3.65625; enemiesY3.5625/3.4375/3.4375 (prior fixed-speed values2.3625/2.3375/2.3375). New screenshot current-native-enemy-jump-speed.png. Enemy run pose stays unchanged. Tests/typecheck/build pass; existing build warnings unchanged. Progress restored and playable menu retained.

Falling audit: SimulateEnemies1271a48 writes player's GroundHeight to each enemy. At1271a4c it skips ordinary placement entirely while player IsFalling is true. Therefore enemy fall behavior cannot be derived by simply disabling the ground clamp while continuing the current group-follow placement. No speculative falling implementation added; native world-position retention/ground flags after player falls still require a separate audit. Exact original video jump timing remains unverified.

### Enemy placement during player fall (2026-10-31)

Previous turn was progress (launch-speed clamp correction). Static SimulateEnemies1271a48 copies GroundHeight, then1271a4c..50 branches directly to the next enemy if player IsFalling. Transform rotation and XZ placement are both below this gate (1271a54 onward). Thus current classic chaser group must retain its existing world position/heading while the player falls; Enemy.Update vertical simulation and run animation continue. Added that gate around group placement, rather than inventing enemy floor removal or attaching enemies to the falling player.

Browser synthetic A-hold fixture: after intro, teleport5335 and holdKeyA until stepping off the left edge. Five25ms samples show player distances5344.12625→5346.77875 and heights-.03125→-.46875, while chaser root remains[-.6,0,-5336] throughout. Evidence native-enemy-fall-placement-check.json and current-native-enemy-fall-placement.png. This is an edge-fall fixture, NOT original video's final jump replay; it falls before the final narrow span. Typecheck/build pass; known build warnings remain. Saved progress restored and normal menu retained. Source-ground levels, unsupported-enemy flags and exact final-run input synchronization remain unresolved.

### Opening exact-PTS evidence and HUD score refresh audit (2026-10-31)

Previous turn was verified progress (fall placement gate). Shifted from small effects to opening time alignment. New tools/read-exact-opening-frames.py decodes actual source frames n%3==0 within1.5..10.5s from the verified full video, without fps resampling. ffprobe best_effort_timestamp_time is persisted per frame, together with source/frame hashes and raw glyph NCC. Output reference-opening-exact contains90frames and contact.jpg. This removes the old opening-score-timing.json's nominal ±.05s resampling phase assumption; old fitted onset values are not promoted into production constants.

Visually verified exactPTS2.603 frame012: HUD shows0; exactPTS2.703 frame013 shows100. First high-confidence nonzero100 at2.703 (NCC.807), last sample1780 at10.411 (NCC.833). OCR is still raw and sometimes wrong: e.g.6.507 reads0 despite contact-sheet-visible1000. Such samples must be rejected/visually reviewed rather than temporally filled or treated as speed changes. The source recording timer is an overlay, not an engine clock.

New static tools/inspect-native-hud-score.py preserves GameGUI.Awake/Update/SetScore method hashes in native-hud-score-source.json. GameGUI.Update12bf954 compares CharacterPlayer.Score+0x138 with cached score+0x80 every frame; when changed it immediately calls SetScore12bf4e8, integer-to-string then UILabel text setter127b770. No .5-second throttle or interpolation exists in this path. Therefore do not explain initial visible0→100 jump by inventing delayed HUD updates. Initial transform/score initialization, capture behavior, or version difference remains to investigate. No production timing constant changed from this evidence alone.

### Full-rate first-score transition and initialization exclusions (2026-10-31)

Previous turn produced exact-PTS evidence and changed the next investigation, classified progress. Extended read-exact-opening-frames.py with all11 actual source frames2.5..2.85s, persisted as reference-opening-exact/first-score plus exactPTS/SHA metadata and enlarged first-score-contact.png. Visually confirmed frame80 PTS2.669667 still0; frame81 PTS2.703000 shows100, frames82/83 remain100 and frame84 shows120. Thus the0→100 transition is present in the30FPS source, not created by10FPS decimation or an OCR-only hypothesis.

New inspect-native-initial-score.py preserves GameStart, ComputeDistanceTraveled, CharacterPlayer.Reset/AddScore and CommonPlayer.Update method hashes. Reset12983e4 explicitly zeros Score; Reset12984e8..ec caches current XYZ as PreviousLocation. CommonPlayer.Update1297e68..6c caches current transform before simulation. AddScore1298a8c only adds positive integerDelta×multiplier. Reproducible direct-BL scan across bounded Assembly-CSharp types finds callers ComputeDistanceTraveled, HandleBonusItemPickup and AnimateBonus coroutine. No explicit startup100 award was identified. This is a bounded static exclusion, not proof that every possible runtime behavior/version matches this APK. Initial transform changes, first-update phase and capture/version behavior remain open; do not insert arbitrary100 points or alter speed to fit this one discontinuity.

No production edits in this evidence turn. Playable menu remains unchanged; no run/stats mutation was needed. Full video/input/route equivalence remains incomplete.

### Spawn displacement explains initial score jump (2026-10-31)

Previous evidence turn was progress, narrowing initialization sequence. LoadLevelInformation126a634..644 sets player transform to origin,126a678..680 calls virtual reset (CharacterPlayer.Reset metadata slot7), and126a70c..71c subsequently sets position(0,0,-10) raw. Reset had cached origin as PreviousLocation. Execution order CharacterPlayer220 precedes GameController280; while Hold is true CharacterPlayer skips its CommonPlayer.Update, so cached origin survives. On the release frame Controller clears Hold and ComputeDistanceTraveled observes the2world-unit displacement before the actor's next movement. At60FPS: delta=2²/(48*(1/60))=5 metric, ×20=100. This explains the observed first100 without an arbitrary startup award. Native initial-score inspector now includes LoadLevelInformation and this evidence; earlier 'unexplained' entries are superseded by this mechanism, while exact video phase remains open.

Classic player now starts physical distance-2. Its first released update counts the spawn displacement and skips movement for that frame; existing controller force capture prepares the next frame. Tests verify frame dependence:100 at60FPS,40 at30FPS,200 at120FPS, so no fixed100 bonus. Browser60FPS fixture confirms score0/physical-2 before release, score100/progress5 with physical still-2 on release, then next frame physical-1.665 and score100. A second run's absolute-elapsed subtraction placed release one frame later at the1s boundary (known float-clock phase issue); subsequent elapsed1.3/1.8 score140/240 match source nominal points, elapsed2.3/2.8 scores340/460 versus source360/480. No assertion of exact source-clock equivalence. Evidence native-spawn-score-check.json and current-native-spawn-score.png. Typecheck/build pass, progress restored and menu retained. Full control/route replay still incomplete.

### Per-run float32 clock eliminates restart-dependent release phase (2026-10-31)

Previous turn made production progress (spawn displacement score), exposing a1-frame difference between repeated runs. GameStart126b328 zeroes TimeSinceGameStart+0xd0. Update126c998..126c9b0 loads its float32 value, adds smoothDeltaTime through single-precision FADD, stores float32. Prior implementation subtracted runStartedAt from a global JavaScript double world.elapsed; rounding at the1s threshold depended on previous run duration. Added an independently reset float32 accumulator and routed classic run-relative intro/input/camera/enemy-formation checks through it. ECS world clock/power lifetimes remain on their existing clock. This changes authored timing to the recovered native accumulation, not a fitted video offset.

At1/60s steps native age after60 frames=.9999997019767761 (still held); after61=1.0166664123535156 (release). Unit test covers exact values and independence from prior elapsed. Browser three consecutive runs all produce identical frame59..62 records: frame60 score0/physical-2, frame61 score100/physical-2, frame62 score100/physical-1.665/speed20.1. native-run-clock-check.json preserves all rows; current-native-run-clock.png shows first100 during entrance camera. Typecheck/build pass, existing build warnings remain. Saved stats restored and menu retained. Full source-video startup phase and later input synchronization are still not proven.

### Intro camera absolute-origin correction (2026-10-31)

Previous turn was progress (float32 per-run clock). Audited camera coordinates after moving classic spawn to distance-2. Runtime GameCamera.StartLocation is +0xd4 (menu camera); EndLocation is +0xe0 (intro start). Serialized EndLocation at220 is(0,10,100) raw. GameStart126b410..424 copies EndLocation into the .25s path node; second path node is binary constant698110 = (time2.75, X-20,Y45,Z210). Reproducible inspect-native-intro-nodes.py asserts these values and writes native-intro-nodes-source.json.

Old intro function used distance22→44, measured from the previous spawn-relative origin. With path0 now corresponding to nativeZ0, correct absolute node distances are20→42 (height2→9, side0→-4). Removed the extra2m from both nodes, preserving the existing interpolation/times. Updated endpoint tests, typecheck/build pass. Source-frame phase/interpolation fidelity is not established by endpoint checks alone.

Browser at62×1/60s: runElapsed1.0333330631, score100, player distance-1.665; screenshot current-native-intro-origin.png shows the corrected first-score entrance framing. Playable menu and original progress restored. NativeStartLocation(90,110,150) is a separate menu value; it must not be mistaken for intro EndLocation. Remaining visual differences in entrance pose/geometry/camera timing still require comparison, so full objective remains incomplete.

### Intro aperture comparison and entrance origin correction (2026-10-31)

Previous turn was progress (absolute camera nodes). Verified MovingObject.Simulate12e053c..12e05c8 normalizes between node times and, with both node ease flags true, computes u<.5 ?4u³:1-4(1-u)³. GameStart sets both flags. Existing intro formula is therefore supported; no speculative easing replacement. Native scalar operations are float32, web expression is still double arithmetic.

New compare-opening-mouth.py compares source exactPTS2.703 frame013 with current elapsed1.033333/score100 (one60Hz frame after release), preserving hashes, full screenshots and largest4-connected dark aperture mask (RGB max<35, y390..709). Before correction aperture IoU=.741638, sourcearea51925/bounds[47,438,329,677], currentarea63934/bounds[8,416,349,672]. This revealed another stale origin: render.ts entrance translationZ1 was justified by mapping native spawn-2 to old web PLAYER_Z3. After adopting absolute path0/native0, TrackPath.at0 isZ3 and classic spawn-2 isZ5, so the native entrance must share originZ3. Changed entrance translation to PLAYER_Z instead of1, leaving native extracted mesh scale/TRS unchanged.

Repeat at same elapsed gives IoU=.832932, currentarea47825/bounds[43,428,329,651], horizontal centroid186.480 versus source186.891 (difference-.411px). Before record retained as mouth-comparison-before-origin-fix.json; after JSON/image mouth-comparison.json/png, screenshot current-native-intro-alignment.png. Remaining bottom-bound difference26px and centreY difference14.74px are not solved; mask is a silhouette proxy and pair has one-frame phase uncertainty. Do not claim whole-frame equality or fit camera height from this mask alone. Typecheck/build pass, existing warnings unchanged. Original progress restored and playable menu retained.

### Aperture phase bounds and floor-occlusion audit (2026-10-31)

Previous turn was progress (entrance origin). Verified GameCamera.Update12afb90..12afba0 selects FocusHeightRun (20raw), then12afcc0 sets focus Y=GroundHeight+FocusHeight before intro flag branch12afcf4. Thus current intro lookHeight4 is supported; Reset's initial FocusHeight14 is overwritten during Update. No height adjustment from screenshot fitting.

Captured seven sequential60Hz frames61..67 after start using current production code (all score100), preserving camera/state and PNGs in reference-opening-exact/current-phase. compare-opening-phase.py computes the same aperture-mask diagnostic for each against sourcePTS2.703. IoU range.78248..84992, best frame63; bottom bounds stay650..654 throughout, versus source677. Top changes424..444 and passes source438. Therefore phase can change top silhouette/IoU but the sampled first100 window does not explain the bottom-bound gap. This is sensitivity evidence, not a chosen camera fit or proof of synchronized clocks. Screenshots retain original overlays and rendering context.

Investigated whether base road could be removed beneath the doorway. New inspect-entrance-floor.ts raycasts actual exported entrance triangles fromY.1 downward2m along centreline after world-originZ3 placement. Distances-12,-6,-2,0,2,4,12 have no near-ground hit; distance6 hitsY-.34143, distance8 hitsY-.62160. Thus entrance mesh alone does not supply a complete walkable floor; deleting all initial road would expose a gap. Saved entrance-floor-ray-check.json. Remaining discrepancy may involve road overlap/occlusion or source geometry placement; no speculative production change made. Camera/initial floor continuation needs further audit. Browser fixture progress restored and normal menu retained.

### Duplicate origin road clips native aperture (2026-10-31)

Previous turn made progress through phase/geometry exclusions. Inspected native Temple prefab80ad52...: it has only facade Object218 and surroundings Object12 mesh children, not a separate continuous floor. LoadLevelInformation instantiates PathType37 kPathTemple at origin; current ensureTiles nevertheless generated ordinary road cells at negative indices and0 over that entrance root. Geometry overlap, not absence of a floor mesh alone, needed testing.

Actual browser entranceSample rays at elapsed1.03333 show pixel640 first hitting entrance Object218 atY.1156/Z-1.6135 (dark UV~.76465,.64038). Pixel650 first hits an ordinary fogged road mesh atY.00441/Z-2.0703, in front of the native entrance face atY-.06274/Z-1.6558. Pixels660..680 likewise hit ordinary road ahead of the sloping dark entrance plane. Saved native-entry-floor-rays-before.json. This establishes current occlusion directly; it does not reconstruct every native generator cell.

Classic ensureTiles now skips indices<=0, leaving the Temple root's visible entrance and virtual gameplay support at origin; regular grid cells begin12m. This removes duplicate origin/behind road drawing without removing the subsequent road. Original generator equivalence outside this initial overlap remains unproven. At same62-frame fixture, aperture IoU improves.832932→.865666, area47825→49862 versus source51925, bottom651→658 versus source677. Comparison before/after JSON retained; updated mouth-comparison.png and current-native-entry-floor.png show partial correction. Some positive-cell rail pillars remain visible and need variant/placement review; no claim all extra geometry is solved.

Browser no-input traversal samples elapsed1.283..3.033, physical3.541..43.748, allY0/fallingfalse/playing. Saved native-entry-floor-run-check.json. Typecheck/build pass, existing warnings remain. Progress restored and playable menu retained. Full source-frame/route/input equivalence still incomplete.

### Restored native ordinary-road width (2026-10-31)

Previous turn was progress (duplicate root road). Traced remaining entrance pillars into ordinary road geometry, not added decoration. render.ts buildTile had an unevidenced road.scale.x=.84, also applied to fallback junction arms. Static prefab2e264130d2f724b88884e268337c7894 templeStraightVert has unit scale at all three transforms (child5,parent6,root4). New inspect-native-straight-transform.py exports its complete authored TRS into analysis/native-straight-authored.obj plus native-straight-transform-source.json, asserting unit scales. Authored mesh boundsX[-4.0011,3.9989], floor nearX±2. Current canonical mesh has bounds±4 and no native basis for the extra.84 compression, which narrowed floor4→3.36m while native gap/narrow collision geometry remained4m.

Removed .84 X scale from ordinary road and fallback straight arms. Existing canonical mesh's vertical normalization/lift1.36 was retained: full authored versus canonical+lift comparison under XZ180-degree conversion gives per-coordinateRMS.00338m and mean residual[-.00110,-.00497,.00291]. Exact ordinary-tile orientation versus generator direction still requires separate review; this width correction does not claim all mesh transforms are byte-exact.

Same62-frame entrance comparison after width restore: apertureIoU.865666→.942113, area54965 versus source51925, bounds[43,428,336,678] versus source[47,438,329,677], centroid[186.720,558.085] versus[186.891,560.767]. Before record retained as mouth-comparison-before-road-width.json. Current screenshot current-native-road-width.png and updated mouth-comparison.png show pillars moving outside the aperture, rather than deleting original posts. One-frame source pairing/threshold mask limitations remain; this is not full-frame94% similarity. Typecheck, geometry checks and build pass; existing warnings remain. Progress restored and menu retained. Whole-game/video fidelity remains incomplete.

### Straight-road replacement pipeline audit (2026-10-31)

Previous turn was progress (native width restored). Audited remaining orientation instead of rotating production geometry without UV verification. PathElement.Instantiate12e1958 calls SetupTerrain12e1c18; named disassemblies preserved. Neither directly calls the known Transform rotation setters, but nested prefab attachment/generator placement still needs review, so this alone does not prove all runtime orientation.

New audit-native-straight-geometry.py compares full authored691 vertices/402 triangles against production canonical OBJ. rotateY180(current vertices with Y+1.36) matches authored with coordinateRMS.00338358 and mean residual[-.00109905,-.00496965,.00290525]. UV0 differences are only decimal rounding. However all402 triangles have exactly reversed corner order in the full-authored export versus current file. Production UV1 is expanded using current face order, so directly replacing OBJ while retaining UV1 would misassign lightmap coordinates. native-straight-geometry-audit.json preserves source hashes, counts and residuals.

No speculative production orientation change in this turn. Next valid replacement must export authored vertices/normals, face winding and expandedUV1 together and validate both geometric front faces and lighting. Existing width correction remains in place; playable menu/stats unchanged. Complete source fidelity remains unproved.

### Authored straight mesh, face winding and UV1 exported together (2026-10-31)

Previous audit was progress, identifying replacement constraints. Further geometric check found all87 horizontal faces in the old canonical OBJ point downward; full authored TRS export has all87 pointing upward. Old OBJ also contained face normal indices despite no vn stream. Unlit/double-sided rendering had masked these defects. Added export-native-straight.py to export full prefab TRS and expandedUV1 in one face iteration. When native mesh has no normal stream, emits valid v/vt corners without dangling normal indices, allowing OBJLoader to compute finite geometric normals. Updated temple-road-tile.obj/.uv1.json and regenerated native-lightmap-source.json via the existing lightmap exporter. Old extraY1.36 placement/lift was removed from ordinary road and fallback arms; authored coordinates now carry floor height directly. UnitX scale from prior turn remains.

New test-native-straight.ts verifies87 upward horizontal triangles, finite computed normals, front-side-only upward floor hits acrossX±1.95, no reverse-side floor hit, and floor within.01m of0 with no added lift. Existing34-mesh UV1 face-stream checks pass. Source proof native-straight-production-source.json preserves asset hashes/fullTRS/source mesh references. Runtime generator orientation remains less thoroughly reconstructed than these mesh-local facts; this change restores authored local geometry instead of retaining the proven upside-down canonical face convention.

Browser same62-frame entrance screenshot current-native-straight-authored.png shows reordered native paving/lighting. Advancing2.5s reaches physical56.36, score660, groundedY0, fallingfalse, playing; ray hits Object81-Pivot_0 with native lightmapped material. No white/missing-texture road observed. Typecheck, surface/narrow geometry checks and build pass; existing warnings persist. Progress restored and menu retained. Full video phase, route generation and complete pixel fidelity remain unresolved.

### Four native turn prefabs recovered with UV1 (2026-10-31)

Previous turn made progress (authored straight production replacement). Current stone junction still uses legacy corner scale(direction*.18,.2,.18), offset(direction*1.08,-6,1.08), flat plane arms and procedural parapets. This no longer matches restored unit-width authored straight road, so audited true source variants before replacement.

New export-native-corners.py statically identifies/export four prefabs: A1becaf9516c7d49d68ea229f76ab704f, B5e190b79677e8422cafcd4ec07f9049b, C63940869115aa4e729551ac691044cba, D32155dae0b7b24917a1ec698c80c7204. Complete child/parent TRS, native faces and matching expandedUV1 are persisted in analysis/native-corners with source hashes. Each has79 upward horizontal faces and no downward horizontal faces. A boundsX[-6.002,4.000]/Z[-4.001,6.002], B X[-4.001,6.002]/Z[-4.000,6.002]; C/D cover corresponding other orientations. Floor is authored nearY0, wall top~1.36, underside~-6.

New temple:test:corner-assets verifies A(left)/B(right) support along incoming+Z and outgoing±X to5.5m,4m arm width, open inside bend, no opposite exit and UV1 expanded counts. Passes. These are mesh-local checks, not full runtime placement proof. Exported assets are not yet production-integrated.

Integration constraint: ensureTiles uses global index*12, while source-fitted first turn177 causes tile180 to be skipped as crossing turn and next centre192 begins186; native corner reaches turn+6=183, leaving3m if inserted alone. Existing hand-built arms mask that gap. Next implementation must connect native corners with native straight stubs or recover per-segment placement, preserving complete floor continuity. Do not swap raw corners and silently leave the hole. No production rendering changes in this evidence turn; playable menu/stats unchanged. Full original-generator equivalence remains open.

### Authored stone corners integrated with native connectors (2026-10-31)

Previous turn recovered/tested native variants, classified progress. export-native-corners.py now persists all four production OBJ/UV1 pairs under track/stone-turn-a..d, with A/B loaded as explicit left/right templates (no guessed mirror scale). buildJunction stone branch uses the correct native template at unit scale and floorY0. Added two connector stubs from the authored straight mesh, clipping localZ outside[-3,3] with attribute interpolation and positioning centres9m on incoming/outgoing axes. Thus native corners reach6m and stubs cover6..12m to the current global grid. Removed legacy .18/.2 corner transformation, flat plane decks and procedural parapets from this production branch; fallback code remains for missing assets. All corner/stub meshes are marked walkableSurface for existing obstacle cuts.

New temple:test:stone-junction checks both turn directions at.25m steps along0..12m axes, verifies open inner bend and3 authored groups, and checks UV1 counts after clipping. Expanded lightmap test covers four new assets. Typecheck, lightmap, existing junction regression and build pass. Stubs are an integration bridge to the current fitted grid, not proof of original generator placement or seamless source texture phase across every turn.

Browser first test via jumpTo173 selected next237 automatically; no turn was accepted (diagnostic teleport's lookahead, not gameplay regression). Explicit setNextTurn177 then accepted and remainedplaying/grounded at184.03; this is reference T junction, so does not prove the new ordinary L branch. Separate injected L at200 accepts left turn, remainsplaying/grounded at207.2238, with turnCount increment. Screenshot current-native-stone-junction.png is the injected L approach at191; native-stone-junction-browser-check.json labels referenceT and injectedL separately. Fixture collects4coins; exact saved progress is restored afterward, not treated as source zero-coin replay. Full original input/route/score alignment remains incomplete.

### Native plank terrain/water frame mismatch identified (2026-10-31)

Previous turn was progress (native ordinary stone junction integration). Audited larger bridge perspective mismatch. Persisted transition-region-source.json proves stoneStraight Region2D Height0raw and plankStraight Height-15raw (world-3). native-water-plane-source.json proves water transformY-30.5raw (world-6.1). GameCamera.UpdateWater12b02e4 obtains camera position, quantizes XZ to200raw grid, reads existing water transform then replaces X/Z only; Y remains unchanged. Thus original water does not follow GroundHeight.

Current wood meshes are baked with authoredY+15.25raw before scale.2 (export-plank-reference.py, plank-beam/pit/T exporters), while runner ground and camera remain at0 and7. Original wood ground-to-water distance3.1m is rendered6.1m, and normal camera-to-water distance10.1m becomes13.1m. This is a genuine coordinate-frame mismatch, not a fog/tint change. Added inspect-native-height-frames.py and native-height-frame-audit.json with source hashes, exact native/current heights, and required migration consumers.

Browser injected wood-distance1600: grounded jumpY0, cameraY7/lookY4/waterY-6.1; centreline mesh ray atpixel800 hits plank Object59 atY-.05845 before water. native-height-frame-browser-check.json preserves state/camera/ray. Shape variation means actual rendered board is slightly below normalized0; native exported deck alignment shift is3.05m whereas collision GroundHeight shift is3m. Future correction must preserve that distinction.

No isolated water-height patch or partial terrain lowering applied. Migration must coordinate meshes, actor/enemy bases, pickups, camera ground/focus, safety nets, transition caps and absolute-vs-relative death thresholds. Current fitted transition boundaries and missing cap placements need audit. This is a concrete next implementation target; full bridge/video equivalence remains incomplete. Progress restored and playable menu retained.

### Absolute water plane separated from terrain-relative contact (2026-10-31)

Previous height-frame audit was progress, identifying a3m bridge perspective error and required migration. Before terrain lowering, extended nativeGroundContact with optional groundHeight (default0): relative y+groundHeight is compared against absolute water plane-7, while supported ledge depth1.2 and landing/stumble tests remain relative to the current floor. CharacterPlayer.Update1297994..12979ac proves absolute rawY<-35; controller ledge checks subtract current GroundHeight. This avoids moving the death plane down to-10world when bridge ground becomes-3. Existing flat-road calls remain unchanged until coordinated terrain integration supplies native height.

New temple:test:ground-height-contact verifies wood ground-3 reaches water at relative<-4, equality at absolute-7 survives, stone at same relative depth survives, ledge depth remains1.2 relative on both surfaces, supported wood landing, above-floor nonlanding, and water-death precedence. Existing native motion/death tests plus typecheck/build pass. This is a necessary collision-frame change, not a claim that bridge rendering has already been lowered.

Further CharacterPlayer.Update1297668..12977b0 audit: IsOverGround gates grounding; an already-falling actor only recovers within[GroundHeight-6raw,GroundHeight], while nonfalling actor at/below ground can snap. IsGroundHeightChangeHigher can trigger a stumble for depth between2raw and6raw, rather than serving as an unrestricted exemption from all ledge logic. Grounding sets worldY=GroundHeight, zeroes vertical velocity, sets IsOnGround and clears height-change flag. Terrain migration must preserve callback order and these conditions; do not add a guessed blanket step-up rule. No partial camera/water-only lowering in this turn. Playable menu remains available and stats untouched.

### Native wood height frame integrated across gameplay/rendering (2026-10-31)

Previous turn made progress (absolute-vs-relative contact). Added nativeGroundHeightAt (-3 wood,0 stone) and nativeMeshHeightAt (-3.05 wood,0 stone) on the existing reference section boundaries. Classic tile/junction/obstacle geometry now undoes the plank exports'3.05m normalization. Actor/enemy bases, coin/power positions and reach deltas, safety nets, follow camera height/focus, debug camera snap and optional monkey position use the native ground frame. Water stays at-6.1. Ground-relative hitbox checks include actor/obstacle floor difference near boundaries. Plank beam collision height corrected1.45→1.4: rawRegionHeight-8 minus nativeGroundHeight-15, scaled.2. Updated source-driven beam test to use Region2D ground, not graphical deck normalization.

Player relative jump height rebases when floor changes, preserving worldY during downward transitions; gravity runs while above the new floor even if IsJumping=false. A supported upward change snaps a nonfalling actor below the new floor, matching native nonfalling grounding branch. Absolute water contact now supplies nativeGroundHeight. Enemy relative Y similarly rebases with parent height and continues gravity above floor. Debug teleport sets the ground frame explicitly/reset enemy aerial states. Landing audio now requires prior IsJumping, as native1297698..12976b0, so merely dropping onto a lower ground plane does not invent a jump landing sound. Existing reference transition placements remain fitted; exact original callback ordering and transition-cap geometry are still not fully reconstructed.

Browser stable wood1600: ground/worldY-3, chase rootY-3, cameraY4/lookY1, waterY-6.1. Screenshot current-native-wood-height.png. Injected coin remains collectible (1). Boundary entry1332 preserves worldY0→-.03125→-.1875→-.875→-2.0625→-3; remainsplaying, settles by1342. Exit2256 switches wood-3 to stone0 without false death. Two overlapping injected holes on wood produce water death at relativeY-4.25/worldY-7.25 (25ms steps), proving absolute plane not shifted to-10. Full rows in native-wood-height-migration-check.json. These are injected integration fixtures, not original video controls/timing. Tests terrain-heights, ground-height-contact, native-motion, plank-beam, enemy-jump, typecheck/build pass; original beam test initially failed because it used obsolete+15.25 reference, then was corrected using independently extracted native groundHeight-15. Build warnings remain. Progress restored and menu retained. Missing authored transition caps and full source replay remain required work.

### Native stone/plank transition caps and half-cell support integrated (2026-10-31)

Previous turn was progress (coordinated wood height migration). Reviewed source067: stone apron, tall asymmetric triple-skull timber posts and lower plank road ahead. Recovered full authored templeToPlankCapAVert ec2ac1073385a4e75a471af09c40a587 and BVert78cb6eeafe4a343ea91773d6fba74641. New export-native-transition-caps.py exports complete TRS/faces/UV1 plus hashes into analysis/native-transition-caps and production stone-plank-cap-a/b. Both have28 upward horizontal faces/no downward horizontal faces, topY4.7606, underside~-9.117. These are half-stone end caps with an unsupported side, not a uniform full-width sloping road.

Source Region2D A rawZ[-30,0] maps webZ[0,6] (incoming stone); B rawZ[0,30] maps webZ[-6,0] (outgoing stone), height0. On the existing fitted reference grid entryA replaces centre wood.from-12, exitB replaces centre wood.to. NativeTransitionSupported exposes entry interval(from-12,from-6) and exit(to-6,to) as unsupported. Ground switches to plank-3 at the near edge of first regular plank cell (from-6), remains-3 through unsupported exit half until stone cap centre to. This preserves previous ground in the missing region instead of raising it early. Placement uses fitted section boundaries and native cell spans; exact original spawn coordinates/generator remain unproved.

ensureTiles loads/clones authored caps at their stone rootY0, marks geometry for surface cuts, and skips the replaced ordinary tile. Added transition-cap tests for face-order UV1, correct half-floor directions and four reference entry/exit gaps/ground levels. Lightmap suite now covers40 assets. Typecheck, terrain-height/cap/source geometry tests and build pass (existing warnings remain).

Browser injected approach1310 screenshot current-native-transition-cap.png shows source-like asymmetric skull posts and lower bridge. Walking down passes: worldY0→-.1875→-.875→-2.0625→-3 by1329, remainsplaying. Walking exit2244 reaches2256.397/worldY-4.71875 then diesLedge/fall (not water); jumping from2247 rises through the gap and lands on stone by2263.335, remainsplaying. native-transition-cap-browser-check.json records walk/jump separately. These are integration controls, not the source's exact input timing/score. Saved progress restored and menu retained. Full scene alignment and video replay still incomplete.

### Continuous native-height regression replay (2026-10-31)

Added browser-height-prefix-replay.js and browser-height-full-replay.js. These diagnostic controls advance10ms, repeat slides and use authored turns/jumps, adding2247/4911 jumps for ascending transition gaps. No teleport, invincibility injection or game collision changes. They are NOT recovered source controls. Prefix repeats deterministically to2967.04844,21 turns,0 coins,score30680. Two initial full runs missed elevated second shield: early3695 jump and grounded traversal both failed near3881..3883; saved missed-shield JSONs retain failures. Replacing that diagnostic input with later3699 jump collected second shield and passed5350.12071 with42 turns,0 coins,score57700/progress2835.48192. Score minus floor(progress)*20=1000, consistent with two500 power awards. Both scripts pass node --check.

After controls ended,28 steps25ms naturally reached water death at5369.98925,worldY-7.0875,42 turns,0 coins,score57940/progress2847.23069,runElapsed214.50160. Did not advance death delay/bank result. Full rows: docs/screenshots/native-height-continuous-replay.json; ending JSON and current-native-continuous-ending.png. This verifies coordinated corner/wood-height/cap traversal and natural final fall only. Source final47240/distance2312 and ~260s run remain unmatched; exact inputs/speed history, scene lighting and full-frame alignment remain incomplete. Original saved progress restored and playable menu retained.

### Remove invented native power bob (2026-10-31)

Previous turn produced progress (42-turn continuous replay evidence), not source-input completion. Continued authoritative presentation audit. New inspect-native-power-motion.py resolves BonusItem.Update1296068 tail-call through MovingObject.Update12e0050 to Simulate12e0054, captures Instantiate and FaceCamera assembly hashes, and checks all four original prefab component sets. No Animation/Animator or independent vertical animation exists: BonusItem, FaceCamera, two UISprites and UISpriteFrameAnimation; boost/bonus additionally UIPanel. MovingObject handles force/velocity/path and transform integration; ordinary unforced power roots do not use a sinusoidal bob. Native-power-motion-source.json records hashes and explicit remaining limits.

Classic coins already bypassed invented sin(elapsed*3+distance)*.08; classic powers still applied it in both simulation pickup collision and rendering updates. Added shared pickupPresentationHeight and use fixed authored baseY for all classic non-gem pickups in both paths. Legacy challenge height animation retained. This removes up to8cm invented motion and time-dependent collision displacement. Reference power heights/coordinates still fitted; no new claim about their accuracy or native magnet attraction. Tests check stationary high shield stays unreachable while grounded and reachable after1m jump across source-relevant global times; native-power test, typecheck, build pass (existing legacy bar/chunk warnings).

Browser debug injected shield at physical3700/baseY3 retained position[0,3,-3697] over0.5s. Its sprite boundsY stayed[1.21,4.79]. This is runtime state evidence only: attempted debug screenshots did not display the road/runner/power, so visual verification of that teleported fixture is UNPROVEN. Preserved native-power-height-debug-render-unverified.png as invalid visual evidence, not a fidelity screenshot. Do not infer normal gameplay rendering failure or successful visual alignment from that fixture. Original progress restored, menu text verified, tab retained. Full video score/input/scene alignment remains incomplete.

### Power sparkle crop/padding and render audit (2026-10-31)

Previous turn was progress (removed invented native power bob). Diagnosed prior blank screenshot: normal start, restart, single and repeated debug teleports can all render the scene correctly; blank capture also recurred in a frozen fixture, with identical21 draw calls/6828 triangles, valid camera/player NDC and no context loss or warnings. Exact cause remains unresolved; no speculative render change. One tool-displayed capture showed the fixture correctly. A later saved capture can still be blank; no saved image is accepted as visual verification yet.

Inspected source180: original shield and sparkling effect. Found concrete production difference: native UISpriteFrameAnimation.Update12cbd14 invokes virtual slot7, UISprite.MakePixelPerfect128433c. It includes Sprite.paddingLeft/Right/Top/Bottom (metadata names verified), while our renderer stretched every sparkle crop to89x179. Atlas stores11 distinct crops, all sharing173x283 untrimmed canvas; frame3 is83x63, previously stretched vertically179/63=2.84. Exporter now preserves all11 integer pixel paddings, asserts shared canvas dimensions, and runtime sets each crop's actual world width/height(.02 per pixel) and Three.Sprite.center from asymmetric padding. Shader, 15FPS playback and current global phase unchanged. Pixel-perfect sizing/padding method hashes captured in native-power-motion-source.json. FaceCamera.Update native calls Camera.main, Transform.get_position/get_up, then LookAt (CoreModule method pointers resolved), consistent with facing the camera rather than geometric rotation.

Native-power tests cover short-frame scale/center and all11 shared canvases; typecheck/build pass (existing warnings). Browser tool displayed a near-shield fixture after normal run/restart with road, runner and cropped sparkle. However rereading the subsequently saved current-native-power-trimmed-sparkle.png revealed a blank world again; that file is invalid visual evidence. Visual verification remains incomplete. Injected diagnostic scene, not source-position/time replication. Original storage restored even though natural unattended diagnostic crossed first turn and banked a test result before freeze. Menu verified after reload. Full video controls,score,lighting,route alignment remain incomplete; sprite per-instance phase and exact NGUI initial pre-update scaling still unverified.

### Atomic renderer capture for visual evidence (2026-10-31)

Previous turn made progress (native sparkle crop/padding correction), but saved frozen browser captures remained invalid. Added debug API captureFrame(): syncObjects(0), renderOnce(), then renderer.domElement.toDataURL('image/png') in one synchronous task, returning that frame's debugState. This avoids separating WebGL rendering from pixel readback; no preserveDrawingBuffer flag, gameplay time advancement, physics or camera parameter change. Capture is canvas only, so excludes HTML HUD/overlays and cannot establish full composited-frame fidelity. Do not call it a fix to the external screenshot pipeline or assert the exact compositor cause is proven.

Browser independently rendered frozen fixture physical200.272800415, injected shield210/baseY3, after430x10ms intro steps. Two separate capture calls produce identical828x1792 PNGs, each SHA2560b7562636e3bd7ec8162e6f846f194c19b7302057d85034b78a2d9130b9429af. native-power-sync-a/b.png and native-power-sync-state.json. Viewed actual exported bytes: road, runner, shield and cropped sparkle visible. This is valid saved visual evidence for that diagnostic fixture, superseding the prior blank capture limitation for this fixture only. It is not original video input/position/time replication. Typecheck/build pass; existing build warnings unchanged. Original saved progress restored, playable menu text verified and tab retained. Overall video score/input/path/lighting/pose fidelity remains incomplete. Native FaceCamera's position-facing orientation versus screen-aligned Three.Sprite and coordinate-handedness of the sparkle padding deserve next comparison; do not infer exact billboard orientation from crop-size tests.

### Native power FaceCamera orientation and horizontal handedness (2026-10-31)

Previous turn made progress (atomic renderer capture). Revalidated native FaceCamera.Update: resolve UnityEngine.CoreModule code-generation table independently of Assembly-CSharp; calls2494ecc=Camera.get_main,24c2674=Transform.get_position,24c2ac8=Transform.get_up,24c3628=Transform.LookAt. The component faces camera POSITION using camera world UP, rather than keeping a screen-parallel plane. Shader115 culling.val0 (CullOff) independently parsed. Source180 shows sparkle on shield's screen-right at that phase.

Added test-native-power-facing.ts first: old implementation failed group forward[0,0,1] versus expected[-.19245,.19245,.96225] in an off-axis fixture. Replaced native power THREE.Sprite children with unlit, double-sided PlaneGeometry/MeshBasicMaterial. updateNativePower now receives actual camera, copies world-up and LookAt(camera world-position). Native +Z→web-Z reflection is improper, so local UI X must also reflect to preserve original world orientation; negative child X scale and reflected crop position preserve native trim padding. Test independently computes native camera basis with reflectedZ and verifies rendered horizontal axis. Plane dimensions/UVs/padding/premultiplied material remain covered by native-power test. Both runtime update paths receive camera, with syncObjects running after camera update. Collider/height/spawn/score untouched. Original source motion exporter records resolved calls, hashes, CullOff and new plane rationale.

Native-power/facing tests, typecheck/build pass, existing legacy-bar/chunk warnings unchanged. Atomic native-power-facing.png shows same injected physical200.2728/shield210/height3 fixture with sparkle on screen-right; compare prior native-power-sync-a.png left-side sparkle. This supports corrected handedness and rendering, not full source alignment: reference180 shield distance/phase/source controls are not matched. Native initial icon trim scaling, per-instance animation clock and exact f32 rotations remain unverified. Saved progress restored, menu verified, tab retained. Overall goal still incomplete: source final47240/2312, input/route history, whole-frame lighting/pose and alternate opening remain outstanding.

### Per-instance native sparkle countdown (2026-10-31)

Previous turn made progress (FaceCamera planes/handedness). Continued source animation audit: UISpriteFrameAnimation.Start12cbbf0..bf8 copies firstFrame into nextFrame; constructor12cbda4 initializes direction+1. Update12cbc94..cc8 subtracts Time.deltaTime from remaining(f32), returns while positive; otherwise adds explicitly(60/fps)/60(f32), assigns next sprite, calls MakePixelPerfect, increments exactly once, wrapping at first+count. It is not floor(globalElapsed*15), and not a catch-up while loop. New nativeSpriteAnimation.ts mirrors this per-instance countdown and preserves negative debt on long frames. Source inspector asserts arithmetic opcodes and records constructor/hash/rules.

Each native power now owns its own WeakMap clock, retained with pooled object and not advanced while inactive. Removed duplicate animation update from collision/updatePickups path; only syncObjects(dt), after camera update, advances the clock. syncObjects(0)/capture/freeze updates facing/UV without advancing. Debug pickupDetails exposes copied animation state for integration evidence. Exact original pool activation/spawn history remains unverified, so do not claim source-matched animation phase merely from the native countdown.

Tests native-sprite-animation (fresh/independent instance, zero-dt, eleven-frame loop, long-frame single-step/debt), native-power and power-facing pass; typecheck/build pass with existing warnings. Browser injected two shields0.1s apart: older frame1(next2,remaining.02333335392), newer frame0(next1,remaining.05666667223). Zero-based indices. Atomic capture leaves before/after pickupDetails identical. native-power-independent-clocks.png/json contains actual canvas and states; this is diagnostic fixture evidence, not video controls/positions. Original saved progress restored and playable menu verified. Full objective remains incomplete: original controls/speed/path, final score/distance, lighting/pose and alternate opening still require verification/alignment.

### Source-action-conditioned pacing sensitivity (2026-10-31)

Previous turn made progress (per-instance sparkle countdown). Returned to central unresolved score/time discrepancy: diagnostic continuous run ended214.5s/57940, source around262s/47240. Added compare-audio-conditioned-pacing.ts using existing native force, queued velocity, jump/slide/gravity/progress helpers with all13 detected stumble events imposed and87 jump onsets attempted. Release2.7031 from exact opening HUD, fixed60Hz, flat supported floor, two500 shield awards at final. Three audio-to-action offsets0/.15/.3s are sensitivity scenarios, NOT recovered touch timestamps. Production gameplay parameters unchanged.

No-slide scenarios yield102140..102200/physical~7903,85 accepted jumps and2 rejected. Repeat-slide immediately yields35140/physical4584.6..4584.8 with87 accepted. Beginning repeat-slide at source video4..5 yields36860..37880/physical4697.7..4759.3, versus source47240/progress2312 and score-derived physical estimate~5361. These policies are not formal mathematical bounds; acceleration/jump timing couples to action state. They demonstrate that using observed stumbles alone does not recover source pacing, and global audio latency shifts do not account for the large difference in this model. Do not tune native speed/score coefficient from this diagnostic, claim remote config mismatch, or present imposed stumble speed reductions as recreated collisions.

Created build-reference-pose-contact.py, source reference-pose-004-035.png and conservative manual reference-opening-pose-observations.json. Source004 running versus005 sliding brackets initial visible slide transition in[4,5]s;17 clear slide samples and5 airborne samples through035, remainder uncertain/occluded. Single1fps pose does not prove continuous sliding or a swipe time. Contact-sheet crop can miss high jumps; uncertain entries are not inferred run states. Native-action/speed reconstruction must next use denser transition frames and these visual constraints, not the old safe-input bot. Output audio-conditioned-pacing.json stores all15 full residual curves. Script compiled/executed successfully; no production changes or browser/progress mutations this turn. Overall original goal remains incomplete.

### Full-rate first slide and repeated upright pulses (2026-10-31)

Previous turn made progress (audio-conditioned pacing sensitivity and conservative1fps pose annotations). Added extract-reference-pose-window.py: actual decoder frames/PTS, source video SHA256, individual PNG hashes, no fps resampling, labelled body contact sheet. Exported first-slide-full-rate4.6..4.95(11frames), second-slide-full-rate5.45..5.8(10frames), third-slide-full-rate6.2..6.55(11frames). Also viewed existing exact opening decimation around3.8..7.1; those contact sheets are first-slide-contact.png and first-slide-continuity-contact.png.

Manual full-rate observations in reference-first-slide-transitions.json: frame141PTS4.705 running;142PTS4.738 first lowering;147PTS4.905 prone. Repeated pulse1: frame165PTS5.506 prone,166PTS5.539 upright,172PTS5.739 prone again. Pulse2:188PTS6.273 prone,189PTS6.307 upright,195PTS6.507 prone again. Two upright pulses separated23 source frames=.767433s (rounded PTS difference.768). The earlier1fps samples missed these brief transitions; do not use their slide labels to infer uninterrupted sliding.

Independent float32 strict elapsed>.75 expiry audit:30Hz23ticks=.766667nominal;60Hz46ticks=.766667;120Hz91ticks=.758333. Source pulse spacing is compatible with recovered capped native slide timer plus sampled/restarted animation, but does not prove original simulation FPS or exact swipe times. Upright pose may be a restarted slide-start clip instead of an acceleration interval. No production physics/animation parameters changed on this evidence. The next reconstruction should align native slide-start/loop poses with these source frames before assigning input timestamps; full-run lateral/slide controls and final score/path fidelity remain unresolved.

### Slide cycle comparison and capture side-effect regression (2026-10-31)

Previous turn was progress (full-rate source slide transitions). Resolved AnimationModule table284a150/count90 (not CoreModule): CharacterPlayer.Slide1298820 calls Animation.Play(string)248cf4c;129883c calls Animation.PlayQueued(string)248cfe8. Current exported slide-start duration.1333334446, loop.2000000775. Natural restart,180steps1/60,then accepted slide gives speed24.66661/playback.80166477. Browser repeated-slide cycle: tick45 slide.remaining5.96e-8, tick46 expires/run, tick47 accepts next slide; brief upright run pose occurs naturally. Source5.539/6.307 upright samples are compatible with this mechanism; this does not recover exact source control timing or prove queued clip overflow semantics.

Found reproducible evidence contamination: captureFrame called syncObjects(0); at slide-start clipTime=.1333334446 it switched clip from slide to slideLoop/time0. freeze had same side effect. Reproduced actual before/after via developer browser. Removed syncObjects(0) from both debug methods; they now render current state only, with freeze additionally cancelling RAF. Callers needing newly spawned objects positioned must advance a simulation frame; capture does not invent one. No normal gameplay physics/animation transition change.

Added browser-capture-pose-regression.js at real slide clip boundary. After fix, runner/state/pickups unchanged across capture and freeze, and both PNGs byte-identical. Persisted capture-pose-regression.json. Regenerated all11 slide-cycle-NNN.png and native-slide-cycle.json after fix (earlier in-turn captures superseded). Native slide cycle contact and slide-pose-comparison.png compare prone/upright/lowering with source5.506/5.539/5.606; viewed saved composite. Labels explicitly say pose-only: positions,camera,clip phase and dimensions are not matched. Native tick10 now correctly remains slide/end until a real update selects loop; screenshots no longer consume that transition. Typecheck/build pass with existing warnings. Original saved progress restored, playable menu verified, tab retained. Full source score/input/path/lighting/pose/alternate-opening fidelity still unproven.

### Gameplay-wide pose review and sustained post-landing run (2026-10-31)

Previous turn made progress (pure capture/freeze and native slide-cycle evidence). Rechecked native HandleControls126fa70..7c: CharacterPlayer+f8(IsJumping) and+100(IsSliding) both branch past force production. Retain recovered acceleration gates; no gameplay coefficient changes. Extended labelled body contact sheets through262 and reviewed all259 gameplay samples004..262. New annotate-reference-pose-samples.py preserves manual labels and each frameSHA; reference-gameplay-pose-observations.json counts128 prone-slide,39 upright,49 airborne-pose,18 lowering/rising,25 uncertain. Labels are visible poses, NOT swipe events/IsJumping or IsSliding flags. Upright can be a brief slide restart. Introduction/results/alternate opening excluded. Do not use crop-missed/occluded samples as proof of absence of a jump.

Extended extract-reference-pose-window.py with actual-source-frame stride (default1), explicitly retained in selection metadata. second-stumble-slide-window19.5..21.5/n%3==0 gives20 actual source frames, no fps interpolation. Manual review finds sustained alternating-leg upright run samples19.621/.721/.821/.921, after landing bracket19.52..19.621; minimum visible run span.3s. Then stumble/recovery20.021..20.722, lowering20.822/.922, prone by21.021. Matched audio land19.784761 and stumble20.2114485 are delayed relative to visible events; do not equate them to input timestamps. Full intervals/caveats in reference-second-stumble-run-window.json.

This specifically contradicts the diagnostic policy of immediate persistent sliding after every landing in this window. It does not prove native speed parameters differ, reconstruct every post-landing delay, or infer active acceleration during hidden stumble flags. Next source-action reconstruction should incorporate verified run intervals and dense transitions rather than repeat-slide everywhere or fit speed to final score. No production/browser/storage mutations this turn; existing playable menu unchanged. Full final score/input/path/lighting/pose/alternate-opening requirements remain incomplete.

### Correct reset-score contamination in physical authoring calibration (2026-10-31)

Previous turn made progress (gameplay-wide pose review/verified post-landing run). Temporal opening replay exposed a substantive calibration error: calibrate-reference-progress.py still converted all progress0→7 during nominal video2→3 into18.3303m road traversal, even after initial100 had been proved reset-position scoring. That interval also contains a hold, not a full second of running. Native score remains unchanged; corrected ONLY authoring coordinates. Script now reads exact first100 PTS2.703, last0PTS2.669; assumes60Hz reset metric5 and startingphysical-2, estimates first active fraction.297s from moving progress2..3 using midpoint2.5. First moving anchor is~3.970m, with conditional quantization/release bracket bounds~3.340..4.904m. These remain estimates, not exact generator coordinates; animation/HUD latency and simulationFPS uncertainty remain. Subsequent legacy score knots retain native progress observations but subtract the contaminated initial overestimate (~14.36m). Cumulative final estimate5360.855→5346.495, source final score47240/progress2312 unchanged. Runtime authoring origin knot0 remains road origin0.

Removed obsolete first-turn177 override; first corner now153, second321, first trip117. Surface boundaries now stone0..1320/wood1320..2244/stone2244..4308/wood4308..4908/stone suffix. Independent rounding exposed a24m gap inside one three-piece narrow cluster; anchor each known adjacent narrow cluster once then use12m cell offsets. Existing continuity assertion failed before this fix and passes after it. Final source-authored narrow tail ends5361, eight-cell visibility extension5457. Exact original placements/generator still unproved.

Browser opening-time-alignment before: at estimated source9.4s, physical155.446,nextTurn177, right turn rejected; first natural trip source-time8.15313. After same controls: physical153.651,nextTurn153, right turn accepted,score1600 (source exact frame9.41 also1600), first trip7.66969. JSON before/after retained. Old diagnostics with literal physical distances (including prior42-turn height replay) are now historical evidence, NOT current full-route passes. No complete-route replay claimed after this revision.

New browser-opening-source-actions.js replays estimated visual jump/turn times, repeated slide with a preserved17.05..20.8 post-jump running window; no teleport, forced stumble, powers, score injection or speed changes. At source samples3/4/5/6/9/15/17 scores exactly140/360/600/860/1520/2660/3060;7/8/10/12 differ byone20-point step. Naturally passes both corners, remainsplaying at21.4 with0coins. Baseline misses second source stumble and at21 scores3940 vs3800. Tested actual queued left/right swipe hypotheses at19.75 (direct attemptTurn is only a validation helper and does not exercise failed-input effects). Both produce natural delayed stumble20.01956, close to visible20.021. Left collects6coins, right0. Under CURRENT fitted pickup layout left contradicts recorded0; this does NOT prove original swipe direction. Right at21 scores3880 vs3800, residual80 still unresolved. Source score confidence/sample-phase preserved in opening-source-alignment-comparison.json. Screenshot opening-calibrated-source-actions.png is candidate diagnostic canvas, not exact source frame.

Opening-pacing, route, reference-obstacles, terrain, terrain-heights, transition-caps, final-narrow, spawn-score and stone-junction checks pass; typecheck/build pass, existing warnings remain. Saved progress restored and menu verified. Production change improves source-coordinate/time consistency without tuning physics; overall source inputs, first-trip exact time, full route/score, gate/decor/lighting/pose and alternate opening remain incomplete.

### First straight tower position, native scale and handedness (2026-10-31)

Previous turn made progress (reset-score physical calibration and opening source-action replay). Investigated giant columns around runner in candidate21.4s screenshot. This is an explicitly authored tower, NOT an extra periodic duplicate: referenceScenery's old tile192/legacyedge198 placement was fitted before native metric migration. Source021/022 still approach the glyph columns;023 passes them. At calibrated source21 physical400.82264, old tower root414 was much too close. Moved first straight tower's legacy tile192→204, physicalroot414→438, leaving other source gate authoring unchanged. This is a multi-frame projection fit on native12m grid, not recovered generator coordinates. Third upcoming pit remains ahead, consistent with source023/024 order.

Independently recovered original templeStraightTowerHorz_prefab958067d7b5d41492992dab0f64f3d4ac, mesh eae89589a8fae4355b57cd6a7ca2ff9d/Object01-Pivot. audit-native-tower-scale.py applies all serialized TRS/root-translation exclusion and native.2 scale, compares normalized production tower OBJ under path orientation candidates. Existing half-turned OBJ matches reflected-X full prefab afterquarter-turn1, nearest-vertex RMS1.024e-6m/max2.045e-6m; pure quarter-turn RMS>=.088m. Corrected extractNativeGate tower from uniform.18 to(-.2,.2,.2) after existinghalfturn. Native height27.44452, boundsX[-6.71395,6.60149], no invented horizontal stretching. Original UV0/UV1 retained; nearest-vertex audit does not prove full face/normal fidelity or native generator variant selection. Gate tests assert authored height/handedness plus centre passage/pillar bases/UV1; route test verifies revised first gate and absence at old tile.

Atomic diagnostic captures at fixed calibrated source21/22/23 distances400.82264/420.41855/440.01447 stored straight-gate-source-NN.png + projection-state. Pose/input/time not source-replayed: fixture jumps to positions and uses normal7m follow camera. Source left glyph ROI021=[112,201,137,249] (48px high); multiscale NCC of old render matches84px high/y268, corrected48px high/y201. Source022 ROI=[48,229,81,314] (85px); corrected match88px/y231. NCC~.778→.832 on021 and.721 on022. Manual ROI/independent aspect search is only a landmark audit, never full-frame similarity. Remaining horizontal shifts and scenery differences are not hidden.

Tested existing KeyD tilt input (held1s, then released without further stepping before fixed-position capture): native side1.39619m. It moves021 glyph match x138→108 against source112;022 x87→35 against source48. Thus right tilt can explain much of the horizontal disparity; maximum tilt overshoots, and source tilt magnitude/time remain unproved. This was diagnostic user-input simulation, not production camera adjustment or original input recovery. Current fixture jumpTo chooses a synthetic upcoming junction, so distant fork/decor is not valid source evidence. No claim of full scene alignment. straight-gate-comparison.png shows source/before/corrected/corrected+diagnostic lean separately, inspected saved image.

Gate/route tests, typecheck/build pass with existing warnings. Original progress restored, playable menu verified, tab retained. Overall original score/input/full route, exact gate coordinates/lateral controls, lighting/pose and alternate opening remain incomplete.

### Native standalone tree family and opening placement audit (2026-10-31)

Found ambient decor-tree-a was Object57_Pivot/1c25557b112d64b0692afc7b1401d311, actually treeSlideCliffHorz_prefab, not a standalone scenery tree. New export-native-scenery-trees.py extracts all four treeAlone prefabs using full serialized TRS, original UV0/UV1 and native .2 world scale. Production decor-tree-native-1..4 OBJ/UV1 replace this wrong asset family; native roots remain Y0, with authored bases below water(-6.1), no minY normalization, extra .12 scaling or -2 sinking. Existing native tree material retained. buildSceneryTree shares construction across tile paths; tee world root rebased independently of wood height. Exact source variant selection is unverified.

Reviewed opening scenery contact against source5/6 and21/22. referenceAmbientTree suppresses unsupported periodic trees through third corner489 and fits right-side trees at84/444; variant1 is a provisional default. Outside reviewed prefix old periodic policy remains approximate. Saved native-opening-tree-comparison.png (source21 / previous cliff obstacle / native standalone plus fitted opening), visually inspected. Corrected tree now appears on observed right side; shape, projection, lighting, lateral camera and exact placement still differ. Fixed-position standing fixture is not source-input replay and excludes HTML HUD; no full-frame similarity claimed.

Static inspect-native-scenery-manager.py independently identifies native SceneryManager/SceneryElement: 19x19 pool (361), raw60/world12 cell, raw540/world108 radius, camera coordinates truncate toward zero to cells, jitter Random.Range(0,21)-10 raw (world +/-2), density .25 and visibility roll Random.Range(0,1000)/1000. RNG resolves UnityEngine.Random.Range(int,int). Initial -99999 coordinates are sentinels, NOT a random seed. Simulate retains cells/recycles elements and fills road-occupancy mask. Native source JSON/ASM retained. Full mask semantics, pool family distribution, shared RNG state/seed and scenery collision integration remain pending; fitted opening placements do not implement this generator.

Scenery-tree tests pass for four original families/TRS/bounds/UV1 and prefix policy. Lightmap validation passes44 OBJ, route/typecheck/build pass (existing asset/chunk warnings). Actual opening candidate replay after replacement remains playing,2turns,0coins,3880 at21 vs source3800,3980 at21.4; no gameplay regression or residual score fix claimed. Screenshot/replay evidence saved. Overall source controls, full route/final score, complete scenery generation, lighting/pose and alternate opening remain incomplete.

### Scenery road-occupancy mask semantics (2026-10-31)

Previous goal turn made progress: corrected standalone tree family and opening fits. Continued static analysis of SetMaskForPoint/MaskOccupied/FillMask. Mask coordinates are trunc(rawX/60)-trunc(minGridX/60), likewise Z/minGridY, within inclusive0..18. ARM64 reciprocal0x77777777 implements NEGATIVE signed division of minimum origin by60; audit-native-scenery-mask.py exhaustively checks200001 integer origins against that expression. Negative near-zero coordinates share cell0, not cell-1. SetMaskForPoint writes exactly one boolean cell, with no radius dilation; outside-grid writes ignored and reads false. This is cell occupancy, not a guessed tree-to-road distance threshold.

FillMask marks path transform position then traverses PathNorth(+50),East(+58),South(+68),West(+60). Incoming enum1/2/3/4 suppresses the corresponding immediate reverse edge, and recursive calls pass3/4/1/2 respectively. Root call from Simulate uses incoming0/root=true, traversing all links. PathElement metadata independently supplies matching field names/order. No visited-set inference: graph expected acyclic except parent backlinks. Saved native-scenery-mask-source.json preserves formulas, graph semantics and signed-boundary examples. Audit passes. Production scenery generator is unchanged; complete pool/RNG lifecycle, path graph integration and source placement recovery remain pending. No browser gameplay/storage mutation this turn.

### Scenery assignment retention and native lifecycle module (2026-10-31)

Previous turn made progress on occupancy-mask evidence. Read remaining Simulate12f6338..6548 and Activate/Deactivate: SceneryElement+2c assignment flag is distinct from GameObject active visibility. Density failure calls Deactivate but does NOT clear assignment. Thus hidden cells retain pool slots and must not reroll on each camera grid update. Eviction clears assignment only for cells outside inclusive camera +/-9-cell bounds or newly occupied roads. Traversal is X-major then Z; existing assigned cells skipped; allocate first unassigned pool slot, consume X jitter/Z jitter/density RNG in that order. Native entrance unsigned checks precisely exclude raw Z0..240 inclusive and raw X-60..60 inclusive (world cells z0..4,x-1..1). Reset forces Simulate but does not wholesale clear retained slots. No speculative seed introduced.

Added nativeSceneryGrid.ts as an independently executable lifecycle module, NOT yet imported into production renderer. It accepts caller RNG and road point occupancy, allowing native pool behavior to be validated before integrating mesh families/shared RNG/path graph. Uses native world axes; raw float32 coordinate boundary adapter remains to be verified before full integration. Tests cover361-cell pool minus entrance/road, hidden assignment retention, X-major initial allocation, three RNG calls per new cell, negative camera truncation, exactly19 newly allocated cells on a one-cell X move, and forced road eviction. temple:test:scenery-grid added; direct bundled test passes. Typecheck/build pass, pre-existing missing legacy bar PNG/chunk warnings remain. Current visual/reference layout unchanged. Source RNG state, complete native mesh-family pool selection and rendering integration remain pending; full goal incomplete.
