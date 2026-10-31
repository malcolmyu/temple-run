# 玩法完备与可玩性验收表

更新：2026-11-01，正常生成规则beats-v7。验收目标是玩法与完整闭环，不是录像逐帧/分数/投影一致。设计和规则见[game-design](game-design.md)，逐轮过程见[implementation-log](implementation-log.md)。

“有”表示已有功能与相应证据，不代表原版每个参数已证实；“有，待复核”表示证据来自旧版本或未覆盖真机。“不准/假设”单列原版忠实度，避免把网页可玩实现误写成逆向结论。当前证据只对记录覆盖的范围有效。Round110窄路金币/输入专项为beats-v7，Round107长窄路专项为beats-v6；此前六万米/三主题长跑等记录保留原版本来源，不能当作v6已完成所有长跑验收。

## 核心操作与道路

| 要求 | 有/缺/不准 | 证据与边界 |
|---|---|---|
| 普通左右换道，不虚构撞墙 | 有；当前回归通过 | [缓冲接入后15项输入](../target/temple-run/analysis/gameplay-turn-intent127-summary.json)：左右、边缘限幅、空中/滑铲横移、指针滑动；实际树根仍碰撞、漏转仍失败 |
| 近路口提前预备方向 | 有；turn-intent-v1 | 原版默认径向查询/1秒意图年龄接入，既有6m确认与中心提交为网页适配；[36项自然路线专项](../target/temple-run/analysis/gameplay-turn-intent127-cases.json)含左右/T两臂、跳滑、暂停冻结、错误方向、远处、取消与重开。原生左/右13m单次输入均成功；诊断障碍死亡/实际宝石复活清理意图。没有恢复普通滑动撞墙/绊倒 |
| 路口转弯、左右转角、T口两方向 | 有；当前回归通过 | 同上两转角/T两臂；[六万米正常路线](../target/temple-run/analysis/gameplay-path-compaction-long-run.json)验证当前路径压缩后通行。不是仅依赖诊断seek |
| 石桥、木桥、悬崖主题及高差连接 | 有；当前长跑覆盖，接缝专项为历史证据 | 六万米course.surfaces、features及正常通行；[历史连接段](../target/temple-run/analysis/gameplay-transition-pairs-natural.json)。主题长度/切换保留原代码约束与网页分组假设，非视频时间表 |
| 断桥、短坑 | 有 | [当前自然道路失败30项](../target/temple-run/analysis/gameplay-current-road-failures.json)含未跳短坑；当前15项输入有跳坑/真实失败 |
| 长坑与成对桥帽 | 有；当前自然生成/通行与错误动作专项 | 当前六万米course中的longGap与速度预算回退；当前道路失败30项记录自然达到pitLongB/A后不跳会失败。静态encounter-safety验证实际腾空跨度；不把低速替换的短坑算成长坑通过 |
| 半边窄路、长窄墙 | 有；当前短/长窄路错误侧专项，长路支持三档长度 | [v6三档长窄路24项](../target/temple-run/analysis/gameplay-long-narrow-variants.json)验证36/48/60m安全侧通过、错误侧失败、结算重开；100种子887个长窄路覆盖左右六变体。本体重复有原兼容表依据，三档等概率为网页设计。[当前提示修复](../target/temple-run/analysis/gameplay-narrow-cue-after.json)不再将窄路提示为跳跃，保留靠侧提示；真实短坑仍提示跳跃。当前course.narrows；此前道路失败30项记录narrowSmall与narrowLong错误侧均失败；[当前诊断激活边界14项](../target/temple-run/analysis/gameplay-current-support-handover-diagnostic.json)含窄路到期安全交接；[自然拾取后3次解除](../target/temple-run/analysis/gameplay-current-support-handover-natural.json)全部接地、supported且playing |
| 左右分路与合流 | 有；风险规则是网页假设 | [实际左右风险/安全臂](../target/temple-run/analysis/gameplay-branch-risk-manual.json)：安全5币、风险9币或宝石；[当前压缩后分路死亡复活合流](../target/temple-run/analysis/gameplay-path-compaction-regression.json) |

## 障碍、收集与道具

| 要求 | 有/缺/不准 | 证据与边界 |
|---|---|---|
| 树根跳跃、低树根绊倒 | 有；跳跃与追逐专项当前回归 | 当前输入与长跑；[当前自然追逐专项](../target/temple-run/analysis/gameplay-current-chase.json)验证首次绊倒、自然成对低树根第二次失误被捕、安全驾驶恢复窗口及间距拉开；无生成临时根 |
| 拱门/树洞滑铲 | 有；当前正常长跑通行 | treeSlide动作与碰撞定义；历史角色全动作/输入脚本也覆盖滑铲。并非所有视觉变体都在本轮手工逐个按键 |
| 火塔 | 有 | 原资源/代码碰撞，保留滑铲与高金币跳跃选择；当前正常长跑通行。原版独立参数证据见既有native测试 |
| 低火墙 | 有；原版独立身份/规则未证实 | [真实Up通过/Down死亡](../target/temple-run/analysis/gameplay-fire-wall-manual.json)，当前风险分支也真实通过；使用原火焰贴图，尺寸/生成门槛是明确网页假设 |
| 石墩 | 有；部分解法为网页设计 | 当前course生成和长跑；独立横移/混合横移跳滑预算测试。不是把皮肤上的石头当碰撞实现 |
| 磁铁、加速、护盾、金币奖励 | 有；v7首档四类自然收集/失效重测 | [四种子首档34项验收](../target/temple-run/analysis/gameplay-first-unlock122-summary.json)：实际UI花1000金币解锁四个Lv1，各正常跑到5500世界米；磁铁/护盾15秒、奖励50、加速250进度。无spawn/seek/强制power；观察自然磁铁/护盾失效与3次加速解除，均仍playing且有支撑。初始1000金币为隔离测试资金，不证明新玩家从零赚取全过程；不是真人或所有随机种子的通行总证明。金币奖励即时发放，不伪装持续倍率。原[历史四种子验收](../target/temple-run/analysis/gameplay-current-power-coverage.json)保留版本边界 |
| 金币、高值币、宝石 | 有；价值/形态部分原规则，宝石经济是网页扩展 | [v7窄路金币20项](../target/temple-run/analysis/gameplay-narrow-coins-summary.json)覆盖12/36/48/60m安全侧实际收集及失败重开，100种子10340枚币均经贴地碰撞支撑验证；当前位置适配为网页设计。当前分路实际5币/9币/宝石增量；[历史特殊布币](../target/temple-run/analysis/gameplay-tree-coins-natural.json)、[升级效果](../target/temple-run/analysis/gameplay-upgrade-native-levels.json)。完整原版所有布币模式尚未确证 |
| 追逐者 | 有；当前自然追逐/被捕/复活，视觉逐主题仍待复核 | 上述追逐专项，不声称已对每种主题逐帧验证脚步/接触姿态 |

## 本局、成长和运行入口

| 要求 | 有/缺/不准 | 证据与边界 |
|---|---|---|
| 死亡→结算→重开 | 有；当前多次实际验证 | 输入15项、六万米、四道具24项均到ended再回playing；[当前结算死因](../target/temple-run/analysis/gameplay-result-death-reason-missed.json)正常漏转显示“错过路口”，[正常分路踩空](../target/temple-run/analysis/gameplay-result-death-reason-water.json)显示“掉进了水里”，均实际点击重开，不再被统一俏皮话覆盖；[五类障碍具体死因](../target/temple-run/analysis/gameplay-obstacle-feedback-summary.json)正常遇到→致命碰撞→DOM文案→实际点击重开通过，石墩单独确认仍为非致命绊倒；[当前死因选图](../target/temple-run/analysis/gameplay-native-death-art-summary.json)验证五类原图加载/实际重开清空cause、火墙宝石复活后漏转改用落水图，避免烧灼图串局 |
| 宝石复活 | 有；网页经济扩展 | 当前分路死亡后实际点复活、同runId后合流；[保护反馈](../target/temple-run/analysis/gameplay-revive-feedback.json)验证倒计时/暂停/清理 |
| 天使翼/永久翼、起跑 | 有；购买使用及双翼/起跑当前验证 | [结算收益购买翼并新局自动复活](../target/temple-run/analysis/gameplay-result-store-after.json)；[当前双翼/起跑41项含输入](../target/temple-run/analysis/gameplay-current-utilities-summary.json)：实际HUD激活、正常生成、两起跑安全退出、永久翼45秒仍有效、普通翼/永久翼真实失败自动复活及下一次失败结算重开；预备库存、25ms推进，不等于真人或真机验收 |
| 结算入账与商店 | 有；当前真实UI闭环 | 本局713币→结算商店713→买500币翼余额213→新局使用；重复打开无重复入账。结果页明确“结算并去商店”，结算前仍可复活 |
| 升级 | 有；六类升级当前UI购买与自然效果 | [当前24次实际购买](../target/temple-run/analysis/gameplay-current-upgrade-purchases.json)与[刷新后自然效果](../target/temple-run/analysis/gameplay-current-upgrade-effects.json)，覆盖四类道具0→6。[金币价值同路线收入对照](../target/temple-run/analysis/gameplay-current-coin-value.json)、[高值币各档首次观察](../target/temple-run/analysis/gameplay-current-high-coins.json)及[八档扣款](../target/temple-run/analysis/gameplay-current-coin-upgrade-ledger.json)覆盖另两类。高值币门槛原默认，金币价值为网页扩展；真机与所有组合效果仍未泛化验收 |
| 角色购买/装备/开跑 | 有；网页9角色，原版完整收藏未确证 | [9角色闭环](../target/temple-run/analysis/gameplay-store-closure.json)；[角色素材故障恢复7项](../target/temple-run/analysis/gameplay-skin-retry125.json)实际购买Selene→阻断模型失败→重复重试不扣款→预览/跑者分别恢复→正常左右与死亡重开。菜单/商店保留错误状态与免费重试，旧异步结果仍受token保护。网页价格明示，不声称完整原版14角色价格 |
| 分数/倍率/目标 | 有；原55项目标目录已接入 | [无道具高分](../target/temple-run/analysis/gameplay-power-free-score.json)、native目标/升级/生涯单测。没有以录像某秒分数为验收 |
| 暂停/后台/横屏 | 有；桌面浏览器验证，真机待验 | [焦点暂停](../target/temple-run/analysis/gameplay-focus-pause.json)、[小屏/横屏](../target/temple-run/analysis/gameplay-mobile-hud.json)；归位不自动恢复 |
| UI弹层不偷偷开跑/恢复 | 有；原生焦点穿透已修复 | [六面板焦点验收](../target/temple-run/analysis/gameplay-modal-focus121.json)记录修前STORE/ShiftTab/Enter后台开跑，修后原操作不启动；36项DOM焦点回归、原生双向Tab/Esc、暂停设置与15项输入通过。Input阻断与面板焦点边界共同生效，设置summary仍可用Space展开 |
| 启动失败恢复 | 有；当前实际资源阻断验证 | [失败→重试→恢复→开始→失败重开](../target/temple-run/analysis/gameplay-startup-retry.json)，不清存档；不承诺无法支持WebGL设备可以靠重试修复 |
| 资源与性能 | 部分完成 | 六万米渲染池趋稳、旧fork回收、当前path3..5段；[课程历史回收](../target/temple-run/analysis/gameplay-course-compaction-long-run.json)后正常课程片段6..7，保留前驱和绝对编号；仅证明采样范围内资源稳定。20/40/60Hz是模拟步长测试，不是设备渲染FPS或堆内存上限证明；另有[桌面开局15秒真实RAF](../target/temple-run/analysis/gameplay-live-frame-controlled.json)，DPR2/750×1624约59.8FPS，仅该环境与开局范围；[桌面三分钟自然三主题](../target/temple-run/analysis/gameplay-live-three-themes-summary.json)约59.9FPS，最大83.4ms，仍不是手机或所有设备性能证明；[v7三分钟实时长跑](../target/temple-run/analysis/gameplay-live-v7-summary.json)自然三主题、约59.9FPS/p95 18.2ms/max66.8ms，12/36/60m窄路贴地通过并收币，181个资源采样；48m未遇到，保留专项。实际继续后漏转结算并点击重开，非手机/无限稳定证明 |
| 手机触摸/倾斜 | 有接入，缺真机验收 | [浏览器原生触摸15项](../target/temple-run/analysis/gameplay-native-touch.json)已通过，派发到canvas的22个事件均isTrusted=true、pointerType=touch，另有权限分支模拟；这是桌面Chrome触摸模拟，不能替代iOS/Android传感器、真实权限和触摸延迟 |
| 持久输入回放 | 记录层已接入，播放仍缺 | 现有seed加相同配置/进度/调用序列可复现生成；[种子契约](adr/seed-and-retry.md)已验证不同进度会分歧。[记录格式](adr/run-trace-format.md)已可显式保存/刷新读取，尚无播放器或重演结果校验，不能称完整回放 |

## 后续推进顺序

1. 将历史专项中仍影响完整可玩的部分迁移到当前正常生成版本，优先错误动作失败、保护交接和成长效果；不把旧绿灯当新版本总验收。
2. 课程历史回收已完成当前长跑与完整历史对照；继续验证真实设备堆占用和渲染帧时，不以有界记录数替代性能实测。
3. 真机输入/传感器/渲染性能验收，明确实际设备与环境。
4. 逐元素反馈与原版证据继续补充，拿不到的保留假设标签；持久操作回放是可选诊断工程，不能挤占用户要求的可玩性。

这份表是验收证据索引，不是整体完成声明，也不把“有实现”替换成“已在所有设备正确运行”。

## 原版生成规则来源补充

[候选池审计](native-path-generation.md)新增类型遍历、方向/侧路资格、通用池排除、额外随机门槛和最终候选槽位抽取的静态证据。已验证当前二进制与旧方法哈希一致，并用修改指令的临时副本确认校验失败。没有改网页生成概率，也没有新一轮真人/真机玩法验收；完整原版路段长度和所有候选过滤仍未解码。

## 课程职责拆分证据

[草稿发布对照](../target/temple-run/analysis/gameplay-course-draft-summary.json)：障碍/支撑草稿预检后发布，100种子×正常/参考两模式×10阶段的30km序列与改前JSON输出哈希一致，含主题/急转/金币；当前道路30项、窄路金币20项、输入15项浏览器回归通过。不提升为所有种子/真机总证明，规则版本仍为行为相同的beats-v7。

## 角色结算呈现

[四组原生角色映射](../target/temple-run/analysis/native-death-profile-source.json)来自ImageData、场景prefab次序和ActiveCharacterId选图指令；[九角色14次实际死亡/重开](../target/temple-run/analysis/gameplay-character-death-summary.json)核对专用图与默认回退，另24选项/21PNG来源哈希校验通过。角色由诊断接口装备，不替代已有商店购买专项；选择代表图为网页策略，未恢复原版完整随机选图/文案。

## 触摸操作与转向反馈（Round128）

[37项触摸与反馈检查](../target/temple-run/analysis/gameplay-native-touch-buffer128.json)覆盖左右换道、跳滑换道、取消、左右角/T两臂、暂停继续、死亡结算与触摸重开。目标输入为Chrome可信触摸模拟，自然接近由诊断控制器完成；尚非实体手机验收。[修后截图](../target/temple-run/analysis/gameplay-native-touch-buffer128-after.png)确认自然500m里程牌与右转预备提示不重叠。类型检查/构建通过；网页提示布局调整未改原生规则来源边界。

## 从零赚币到升级生效（Round129）

[零资金成长闭环9项](../target/temple-run/analysis/gameplay-earned-unlock129.json)：空新档正常生成赚302币→正常失败→实际菜单提交302→实际购买250磁铁首级，余额52→实际下一局自然磁铁15秒→自然失效仍playing→正常失败→实际重开入账第二局144，余额196→刷新保留196与首级。未注入资金、障碍或道具，正常跑动为25ms控制器，菜单/教学/购买/重开为实际UI；不能推广为真人新手难度/耗时证明。[自然拾取截图](../target/temple-run/analysis/gameplay-earned-unlock129.png)。四类道具分别解锁的原测试资金边界仍保留，不把该磁铁单项扩为四类从零赚币验收。

## 滑动即时响应（Round131）

[25项可信触摸与自然转角回归](../target/temple-run/analysis/gameplay-gesture-move131.json)先复现移动160px仍未换道、松手才执行，再修为pointermove越18px立即执行。左右/上下4方向均在松手前响应，左右角/T两臂在按住中预备并完成，release不重复；取消前未识别会丢弃，已执行动作不撤回。原15输入与43模态、23组核心/类型/构建通过。18 CSS px、单次手势与tap跳为网页策略；原TouchMoved触发阶段有静态来源。Round128取消回归属于旧release阶段，当前语义以本轮为准。[未松手的预备提示截图](../target/temple-run/analysis/gameplay-gesture-move131.png)。仍不是实体手机手感证明。

## 窄路保护网已有覆盖（Round133）

[11项运行检查](../target/temple-run/analysis/gameplay-narrow-net133.json)推翻Round132静态缺口推断：窄路本体/帽实际发布为gap障碍，原网面循环已覆盖。自然seed1左12m/右36m、诊断shield激活后缺失侧通过，效果自然到期仍playing并隐藏网；仅magnet无网且错侧死亡，实际重开隐藏网并清道具。[现有网面截图](../target/temple-run/analysis/gameplay-narrow-net133-before.png)。不是新修复，不是自然道具拾取/真机证明，也不扩为本轮48/60m覆盖。safety-net专项通过。
