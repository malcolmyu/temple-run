# 原版T、侧路与合流：证据结论

**结论：原版T路口与侧路径确实存在，且有真实几何；四向引用支持一般图连接。当前“平行分路→定距合流”是网页设计，未取得原版同构生成规则证据。** 不再把prefab名称、几何存在、连接能力、实际生成概率混作一个结论。

## 可审计来源

- `analysis/native-generation/theme-prefabs.json`：`Walls/templeTLeft/TRight/TUp/TDown`，plank/cliff同族，PathLevel1/2/3与类型映射。
- `analysis/t-junction-source.json`：石T prefab `c1df7bc3747f548ecb4c857036f0a606`，外部mesh `e0da770a4490e4d96b8cbd58627fd412`，Object85-Pivot，1566展开顶点；prefab SHA256 `752519f663b0c6c8c3e6acc84d8980740024f28577d910707c4d6a9e778e1779`，mesh SHA256 `8f98bbd0430e30d6271c9970fae4004010fbc06ee9cf46a63600f434649cb3fa`；含8点Region2D、完整Transform链。
- `analysis/plank-t-junction-source.json`：木T的真实mesh/完整TRS/UV1导出证据。
- `analysis/native-cliff-t-junctions/source.json`及四方向OBJ/UV1：断崖T真实几何，例如Down prefab `bb71a556d435c4cdcbf018e6947dd9ea`，mesh `a946434b16fa34f469b1244ebdc8bf8a`；四方向已导出，运行时用Down规范朝向。
- `analysis/native-generation/path-connections.json`：二进制SHA与元数据SHA、north/east/south/west编号、片段连接表。`PathElement`四向引用是图的邻接能力。
- `PathElement.AddRandomPath.asm` `0x12e7584..0x12e7890`：四个方向依次检查；`0x12e75dc`调用CanPathExtendOnSide(0x12e387c)，随后检查既有方向引用，或调用GetRandomPathElementForSide(0x12e3e48)并连接；`0x12e7674`递归。方法字节SHA256 `2382115e465b3c6439b581d4321aa5848e5e6c540fe4bfc6aff3a5d0cd9869e5`。

既有引用可继续扩展不等于已证明“随机生成器一定把两条独立路重新接在同一格”；四向字段也不证明任何指定概率。尚未恢复完整碰撞占格、重连条件、并行臂形状与合流分布，因此不称原版合流复刻。

## 网页设计决定

保留原生T路口与左右出口。网页分路是同一4m石路中间断开，两侧安全通道维持在原有围墙内；选择车道不改变路径中心/突然偏移，不额外铺出围墙外的两块平面。两端各6m完整连接面、合流后至少96m转角预算保留。原中心缺口/金币/风险臂机制仍可玩，明确不叫原版网格生成器。
