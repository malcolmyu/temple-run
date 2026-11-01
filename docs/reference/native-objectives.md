# 原版成就目录与当前接入范围

2026-10-31，第25轮。

## 来源

- `python3 tools/inspect-native-objective-catalog.py /tmp/com.imangi.templerun.apk /tmp/temple-libil2cpp.so`：只读解码RecordManager.SetupAchievements1289770..128af58向AddAchievement128cb48传入的四个字符串参数。恢复55个唯一ID与名称/描述本地化键，保存调用地址、库哈希和完整反汇编。
- `/tmp/unityenv/bin/python tools/export-native-objective-localization.py /tmp/com.imangi.templerun.apk`：UnityPy只读Shared Data与英文、简中原版bundle，以本地化ID关联键；输出`analysis/native-objectives/localized.json`，保留资源SHA256。
- Distance1000额外检查UpdateAchievementRecords1273c14..2c：当前GameController.DistanceTraveled0x124除1000乘100算完成百分比；2862818的字符串确认为distance1000。其他三项本轮采用原版目录及资源描述的距离条件，完整条件分支尚未逐条审计。

## 实际接入

|原版ID|原版简中名|本轮网页判断|
|---|---|---|
|distance1000|短跑运动员|已结算单局最高里程>=1000|
|distance2500|运动员|>=2500|
|distance5000|5000米奔跑者|>=5000|
|distance10000|万米长跑者|>=10000|

新增目标不附加未经证明的金币/宝石奖励，只采用已取证的基础10+已完成成就数规则。完成计数发生在确认之前，确认只持久标记状态，不再增加一次倍率。当前仍在结算后更新最高里程、下局固定倍率；原版运行期完成记录的完整时机尚未移植。

旧4个网页目标保留兼容数据和奖励。没有再新增distance500以避免和旧first-500重复计数；旧marathon1500/collector3等也不冒称原版ID。当前8项目标不是原版55项的完整替换。

## 仍待接入

55项目录还包括分数、单局金币、无金币距离、无绊倒距离、复活、起跑、升级、角色数量、累计局数/金币/里程及单局道具次数。名称、资源描述不是每项代码条件和奖励经济的完整证明；需要恢复对应计数、存档迁移与自然玩法验证。尚未将未知项伪装为0进度已支持目标。

## 验证

真实正常操作自动驾驶跑到14000物理米（本局度量12121），随后失败结算至12208，再重开；四个原版距离目标自然完成，下局倍率17。四项逐一确认后货币293/9不变、倍率不变；领取旧三项奖励后只增加550金币/1宝石，倍率仍17。刷新后已确认/已领取保持，无重复领取按钮。证据`gameplay-native-distance-objectives.json`及`gameplay-native-objectives-reload.json`。

## 第26轮：单局分数与金币目标

`tools/inspect-native-session-objectives.py`按UpdateAchievementRecords中GetProgress分支关联成就ID，解码16项实际分母，校验metadata：CharacterPlayer.Score=0x138，CoinCountTotal=0x148。各分支读取当前角色统计后除阈值乘100；解码值与原版ID数字一致，保存完整条件反汇编及每项加载地址到`session-rules.json`。

- 9个分数目标：25000、50000、100000、250000、500000、1000000、2500000、5000000、10000000。
- 7个单局金币目标：100、250、500、750、1000、2500、5000。
- 不包含score1000000nopowers等复合条件；不能用简单最高分替代“不使用道具”。
- 网页新增bestRunCoins，结算时取本局最大值，复活继续同局累计。旧存档没有该字段时为0，不拿累计金币或余额猜测历史单局纪录。目标奖励、商店扣款不会改写它。
- 名称来自原版简中资源，确认仅作持久标记，不额外编造货币；倍率采用已完成数。网页仍在结算更新，原版运行期更新时机未完整移植。
- 目前总计24个可用目标（20个本轮/上轮原版ID+4个旧兼容网页目标），新增分类：距离、分数、金币、其他。原版55项仍有35个ID没有完整接入。

两条自然9000物理米跑动后，结算纪录bestRunCoins188/lifetimeCoins303/余额303/最高分162280；单局250金币保持188/250，三个分数目标和coins100自然完成。确认目标和领取旧奖励后余额453，但单局188/累计303不变，倍率20不重复增长；刷新保持。另以受控拾取验证复活前81、复活后163、最终189金币作为同局结算一次，重开不会重复入账。

## 第27轮：开局无金币与无绊倒条件

`inspect-native-run-challenges.py`验证四项ID、字段与分支：

- ComputeDistanceTraveled126e474..490在MaxDistanceWithoutCoins为0且CoinCountTotal>=1时，记当前DistanceTraveled；之后不再更新。HandleEndGame1272260..226c在本局零金币时取完整里程。故它是开局到第一枚金币的前缀，不是最长中途空窗。
- distance500NoCoins / distance1000NoCoins用该前缀除500/1000。
- CharacterPlayer.Stumble1297a54在致命检查前也设置DidStumble；GameController.Update126c770转成控制器的粘性标记。notrip2500 / notrip5000两分支都因DidStumble而跳过，阈值文字常量697654/69763c为2500/5000。
- 网页将首次拾币和实际绊倒记录放到同局状态，普通左右换道不标记，复活不清掉，仅新局重置。存档分别保存bestCoinFreeStart与bestCleanRunDistance，旧bestDistance不能推断动作条件。
- 当前仍在最终结算保存条件纪录；无绊倒结算要求该局始终没有绊倒，不用“绊倒前曾跑过的距离”替代。原版曾经在中途保存完成状态时的交互/提示时序仍未完整移植，不承诺每一种晚期绊倒情形与其逐帧一致。

自然seed1跑至5293度量米（6453物理米）时无绊倒，首次拾币2321米，后来已收20金币；故开局无金币仍成立。主动错过下个路口结算5306米，四项自然完成。受控树根负例中实际左右键安全且不标记、真实绊倒才标记；宝石复活后标记和49米拾币前缀保持，最终clean纪录0，重开清临时状态。证据gameplay-clean-run.json / gameplay-clean-run-failures.json。

目前28个可用目标：24个原版ID、4个兼容网页目标；原版55项目录还有31个ID未完整接入。

## 第28轮：实际拾取道具次数

`inspect-native-power-objectives.py`核验12个分支：magnets / boosts / invisibilityBonuses / coinBonuses各5、10、20。字段来自GameController metadata，分别NumMagnetBonusesPickedUp174、NumBoostsPickedUp178、NumInvisibilityBonusesPickedUp17c、NumMegaCoinsPickedUp180。每项加载地址、分母FMOV指令以及HandleBonusItemPickup的load/add1/store均校验，证据`power-pickups.json`。

网页只在实体Pickup从未taken变taken时计数。重复拾取同种道具虽只刷新效果，仍是一件拾取；普通金币、宝石、直接激活、超级起跑、复活加速及非实体充能奖励不计入。复活继续本局，重开清零；结算取每种道具的历史单局最大值，不跨局累加。旧数据缺失为0，不能从升级或效果状态推断拾取。

自然30000物理米中实际收集磁铁7、加速11、护盾11、金币道具10，共39件，与生成记录collected逐项一致。所有5次目标自然完成、三种10次完成，磁铁10及所有20次的自然达成尚未证明。独立受控80实体拾取场景验证四类精确20、每件只计一次、暂停/帧更新不重计、复活不重计/不清零、结算与重开；它不是自然20次可达证据。

目前40个可用目标：36个原版ID、4个兼容网页目标。原版55项目录还有19个ID未完整接入。运行期成就完成保存时机仍采用网页最终结算适配。
