# 原版路径生成规则取证：普通进度阶段

更新：2026-10-31。范围是当前APK原版代码的静态证据，不代表当前网页生成器已完整移植。

## 可复现取证

运行 `python3 tools/inspect-native-path-pacing.py BASE.apk libil2cpp.so`。脚本只读IL2CPP metadata、ELF relocation和指令，不执行原版库。结果保存于 `target/temple-run/analysis/native-path-pacing.json`，含二进制哈希、字段名、指令校验及解码后的float32常量。

依据：`GameController.HandlePacing`126eb5c..126eed0，`PathElement.GetRandomPathElementForSide`12e3f4c..12e4504。完整反汇编已保存在既有native-methods/native-generation目录。

## 普通连续跑动的阶段表

单位：距离列是GameController.DistanceTraveled本局进度；间距列是原版Spaces计数。原版基本资源格12网页世界米，但计数门槛本身不是精确路段长度分布。

|进度范围|转角最小格数|障碍最小格数|金币串最小格数|近距追加障碍概率|
|---|---:|---:|---:|---:|
|0–250|12|6|12|0|
|250–500|10|5|10|0|
|500–1000|8|4|9|0.05|
|1000–1500|6|4（继承）|8|0.05（继承）|
|1500–2000|5|3|7|0.10|
|2000–3250|4|3（继承）|6|0.15|
|3250–4500|3|3（继承）|6|0.175|

边界由float比较跳转决定。1500/3250/4500常量从6975f8/697580/697584直接读取，不能按观感猜成1500/3000/4000。0.05、0.1、0.15、0.175从MOVZ/MOVK组合出的64位字段写入值解码，JSON保留实际float32精度。

表按正常单调增加的进度串联，部分字段继承之前阶段的写入。不能将各行当作任意传送后都立即成立的独立配置。4500以上分支跳过本表写入；快速转弯段、远端覆盖和其他路径级别分支尚未完整审计，不能直接假定无限沿用最后一行。

## 资格门槛

- metadata验证PathElement.SpacesSinceLastTurn=0x78、SpacesSinceLastObstacle=0x7c、BackToBackObstacleCount=0x80。
- 允许转角的全局开关启用且`SpacesSinceLastTurn >= sMinSpaceBetweenTurns`，才通过转角间距门槛（12e3f74..12e3f7c）。通过不等于必定转弯。
- 障碍先要求`SpacesSinceLastTurn != 1`和`BackToBackObstacleCount < sMaxBackToBackObstacles`；构造默认后者为2（12e3fac..12e3fc4）。后续还有类型/道路几何过滤。
- 如果`SpacesSinceLastObstacle >= sMinSpaceBetweenObstacles`则通过这个间距门槛；不足时取整数Range(0,1000)，只有roll严格小于`doublePercent*1000`才保留障碍资格（12e3fdc..12e4034）。不是“距离满足后仍按概率删掉所有障碍”。
- 候选列表先按类型、关卡、道路方向、空间与开关等条件过滤，12e44e8调用`Range(0,eligibleCount)`取列表索引。这里没有恢复出一张可直接替换网页所有weight字段的全局权重表，重复条目/特殊分支仍可能影响最终概率。

## 当前网页实现的对应边界

- 当前CoursePlan144/168/192分组长度、覆盖袋、每4组切主题、T路口25%、分路长度36仍明确是网页可玩性假设。
- 之前仅取构造默认“转角间距6格”不够：正常开局HandlePacing会将其改为12格。不能把构造默认与实际运行期阶段混为一谈。
- 目前网页已有原版速度成长，但没有把本表的路径生成阶段完整接入。一次预生成6000米的CoursePlan，不能把物理位置直接当成本局进度套表；后续需要随实际进度逐步生成并保留既有路段、再重测组装和反应时间。
- 现有石桥/木桥、路口/分路、长坑/窄路的可玩性证据继续有效。本报告不以规则取证替代实际游玩，也不改变已通过的地图参数。
