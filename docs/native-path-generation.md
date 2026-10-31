# 道路生成：原版候选池审计

本页补充[整体设计](game-design.md)的规则来源。目标是恢复玩法机制，不是让某个种子按视频时间表跑同一条路。审计对象为当前已有APK的静态il2cpp二进制；没有执行原生库，也没有把网页适配规则写成原版事实。

## 可复跑证据

```
python3 tools/inspect-native-path-candidates.py /tmp/com.imangi.templerun.apk /tmp/temple-libil2cpp.so
```

输入路径是当前本地取证文件，可换成同版本文件。输出为[候选池记录](../target/temple-run/analysis/native-generation/path-candidates.json)。记录包含binary/metadata/method SHA256、39个PathType枚举、38条指令校验、方法名和字段偏移；只要被检查的指令改变，脚本会失败，不会沿用旧证据。二进制SHA256为`0c14a3403b5e3d449995b386f48885e79397db8d2d1f84e25c9995741f82c48d`，方法位于`0x12e3e48..0x12e4bf4`，与此前记录的方法哈希一致。

已做负向检查：临时副本中修改`0x12e44e8`候选抽取指令，审计按预期在写输出之前失败。原文件未改。

## 这次确认的控制流

| 内容 | 原版证据 | 对设计的含义 |
|---|---|---|
| 候选遍历范围 | `0x12e4238`从-16开始，type=计数+17；`0x12e4408..4410`递增至21结束 | 通用循环逐个考察PathType 1–37；不是先随机抽一条固定长度道路 |
| 几何匹配 | 每个类型先调用`DoesPieceTypeFitOnSide`，`0x12e425c` | 路口方向和邻居占位会影响资格；该辅助方法的完整语义尚未恢复 |
| 转弯资格 | `0x12e4278..4284`在转弯标志不成立时排除类型3–10 | 包含四个转角及四个T口，不是独立恒定的T口概率 |
| 侧路开关 | `sAllowSidePaths`偏移0xf；父类型1时排除7/8，父类型2时排除9/10 | 方向相关的侧路资格与全局分支权重不同 |
| 通用池排除 | `0x12e43f4..4404`掩码`0x3e0001b000` | 12/13/15/16长坑帽、33–36高差过渡帽、37神庙不作为这轮独立候选；不表示游戏没有这些元素 |
| 额外随机门槛 | 在允许障碍的控制分支中，类型11/14/31/32经过`Range(0,2)`，结果0时跳过；`0x12e4364..437c` | 短坑与高火塔还受额外门槛和其他资格影响；不能说它们各自全局出现率50% |
| 候选抽取 | `0x12e44d8..4504`在count>0时调用`Range(0,count)`并取数组槽位 | 对本次已构建的候选表等概率抽取；完整最终结果还可能经后处理替换/组装 |
| 元素命名 | metadata中31/32是`kPathStraightFlameTowerHighHorz/Vert` | 不能拿这两个枚举证明网页独立低火墙是原版机制 |

这里的“排除类型”和“额外门槛”仅针对该控制流所在阶段，不等于整个生成器的穷尽规则。

## 与当前网页生成器的关系

原版[难度间距审计](../target/temple-run/analysis/native-path-pacing.json)已确认12m格点和随进度变化的最小转向、障碍、布币间距；最小间距不是完整路段长度分布。原版当前候选数受到状态、方向、邻居和配置共同影响，不能把“等概率选候选”换成一张恒定全局概率表。

网页CourseDirector仍使用已标明的练习优先权重、冷却和恢复节奏；CoursePlan将动作组织为完整片段，并为反应、成对坑帽、窄路和分支预留空间。它们是可玩性设计：本次没有把原版的局部均匀抽样生硬替换网页节奏，也没有把当前120m分组下限、132m风险分路或25%T口选择声明为原版真实分布。

后续迁移应保留三层边界：

1. 原版适配层输出格点、类型/主题可用性、状态资格和明确间距门槛。
2. 节奏导演决定练习、恢复与组合意图；网页权重显式带来源。
3. 几何组装与预检确认动作、支撑和转弯窗口，拒绝后安全回退。

还需要恢复`DoesPieceTypeFitOnSide(0x12e3780)`、原名为`ACertainTypeCheck(0x12e3df4)`的辅助方法、空候选回退、选择后组装、全部配置覆写与完整路段长度分布。不能用辅助方法的猜测命名冒充已恢复语义；也不能用有限种子统计替代这些规则证据。

## 道路开放方向与匹配契约（Round105）

[连接审计](../target/temple-run/analysis/native-generation/path-connections.json)和[辅助方法反汇编](../target/temple-run/analysis/native-generation/PathElement.SideConnection.asm)补充了`DoesPieceTypeFitOnSide`与`CanPathExtendOnSide`的结构。可复跑命令：

```
python3 tools/inspect-native-path-connections.py /tmp/com.imangi.templerun.apk /tmp/temple-libil2cpp.so
```

方向号1/2/3/4分别对应PathNorth/PathEast/PathSouth/PathWest；由实例字段偏移0x50/0x58/0x68/0x60和四项跳转表共同确认，不按名字猜坐标。

| PathType | 开放方向 |
|---|---|
| 竖直类（IsStraightVert位掩码） | 北、南 |
| 水平类（IsStraightHorz位掩码） | 东、西 |
| 3 TurnA | 南、西 |
| 4 TurnB | 东、南 |
| 5 TurnC | 北、西 |
| 6 TurnD | 北、东 |
| 7 TLeft | 北、南、西 |
| 8 TRight | 北、东、南 |
| 9 TUp | 北、东、西 |
| 10 TDown | 东、南、西 |

完整37种有效类型的方向集合在JSON中，包括各种坑帽、窄路、高差帽和神庙。0/38在CanPathExtend的默认分支不开放任何方向；这不等于所有原生辅助方法对非法入参都统一处理。

`DoesPieceTypeFitOnSide`先检查指定方向是否已有非空Unity对象；有则返回false，再检查当前路块是否能向该方向延伸。第三个参数要求核对候选时，才继续调用`WillPieceTypeConnectOnSide`。对象比较方法通过UnityEngine.CoreModule方法token确认是`op_Inequality`，不能把它误读成相等比较而反转占用语义。原生Unity对象空值语义也不直接等同于JS对象真假值。

此轮校验48条指令、两个位掩码、两个跳转表、字段偏移和五个实际方法名；四转角均两出口、四T口均三出口且90度旋转闭合。改动临时副本的转角跳转表会被拒绝。

### 进入网页架构的边界

这些是**路块拓扑开放方向**，不是玩家在任意位置可以执行的输入。普通跑道Left/Right仍由InputRouter解释为换道，只有已进入路口动作窗口才申请转弯；不能因为当前路块开放西侧就把普通Left变成转弯/撞墙。网页TrackGraph使用相对前/左/右，适配原始基数方向前须带当前朝向并取候选的相反连接口。

剩余的`WillPieceTypeConnectOnSide`包含成对坑帽、窄路等兼容约束，不能以“两个方向口相对”替代全部原生匹配。当前未把这张表用于替换正常生成器，也未由端口数反推T口概率或分支长度。

## 候选兼容矩阵（Round106）

`WillPieceTypeConnectOnSide(0x12e3994..0x12e3c50)`已恢复为[原始兼容矩阵](../target/temple-run/analysis/native-generation/path-compatibility.json)：39种父枚举（含0/38）×4方向共156行，每行列出可接受的候选类型。原始helper和叠加父端口检查的表分别保存，不能混淆。

```
python3 tools/inspect-native-path-compatibility.py /tmp/com.imangi.templerun.apk /tmp/temple-libil2cpp.so
```

此方法由四方向分派、各方向的父类型跳转表、专用比较分支和四张默认数组组成。默认数组通过IL2CPP FieldRef定位到metadata中的PrivateImplementationDetails原始int32数据，数据SHA256与原字段名一致；没有用资源名称猜兼容关系。方法全部字节与60字节分派表分别固定SHA256，表字节改变的临时副本会被拒绝。

可用于设计核对的例子：

- 父类型12沿北接候选时，只接受1或13；父类型13沿南时，只接受1或12。
- 父类型15沿东只接受2或16；父类型16沿西只接受2或15。
- 父类型19沿北只接受19或21；父类型21沿南只接受19或20。这是长窄路本体/桥帽的专用规则，不是所有竖直窄路任意互拼。
- 对普通父类型，南北默认候选表各15种，东西各14种，且方向不同，名单也不同。它们还会被外层资格和生成状态继续筛选。

**构建规则具有方向性。** 即使叠加父端口检查，在有限有效枚举空间中仍有130个“向一侧允许，反向构建不允许”的组合。例如父TurnC(5)向北接受窄路17，而父17向南不接受TurnC(5)。这不是本轮发现的网页bug，也不应擅自修成对称表：原版构建顺序、候选组装与后处理仍可能施加其他条件。矩阵记录原规则，不把图拓扑的无向直觉强加给原版。

网页目前的成对坑帽预检与侧路分支仍运行原有已验证适配。接入这份矩阵前，需要先确定网页prefab别名、世界朝向、组装顺序与原PathType的映射；仅把左右/南北翻转后照搬，可能误删合法内容。完整道路生成仍待补状态过滤、后处理、空候选回退和配置覆写，不因一个辅助方法恢复就声明全生成器已复现。
