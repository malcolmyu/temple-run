# RunTrace schema 1：诊断记录，不是播放器

状态：记录层已接入，播放仍未实现。2026-11-01。

仅显式启用时记录，默认关闭。控制台`__templeGame.traceNextRun()`安排记录下一局；正常开始后，`traceGet()`返回防御性副本，`traceStop()`停止并返回记录，`traceSave()`停止并存入专用`temple.v2.trace`，`traceLoad()`读取并校验，不执行任何命令。保存成功返回true，缺记录或存储失败返回false；无效文件读取会报错，启动游戏不会自动读取它。

记录不会替玩家操作，真实游玩仍按原规则扣库存和结算；未来播放器必须另行隔离副作用。

## 字段

- header：种子、规则版本、reference标志、难度/角色、本局升级快照、分数倍率、初始world时钟、道具库存和银行币/宝石。startVia说明是外部UI开局还是输入消费中开局。
- frame：物理dt和真实frameDt，不能互换。
- tick：模拟dt与该步连续横移axis；death是死亡过程步长。
- input：逐条记录被消费的动作与frame/tick阶段，包含被规则忽略的尝试。
- command：UI/方法命令和参数；via=input表示它由已记录输入间接调用，不应再次当独立UI命令播放。pause对应Game.togglePause，resume对应Game.resume。道具调用也记录尝试，不保证它成功。
- finalState：停止前状态；menu-before-reset/new-run是在销毁旧世界前保存。它不是完成重演后的校验结果。
- truncated：事件数量或字符额度达到上限、或输入不能记录时置true。不能把截断记录当成完整复现。

事件最多100000，默认50000，另有限制约200万事件JSON字符。停止幂等；header、事件、读取副本均隔离，避免外部修改记录。JSON导入校验schema与事件种类/参数/时间范围，不对代码求值。

## 尚未具备的保证

尚无播放器、版本/资源兼容性验收、重演状态校验或收益隔离执行模式。Header是待消费的数据，当前读取不会应用到全局进度。诊断spawn/power/jumpTo等外部改世界调用不在记录范围，不能以这类记录承诺完整重演。长按/倾斜axis的结构已支持，本轮未完成真实长按或物理传感器记录验收。

下一步必须遵守[种子契约](seed-and-retry.md)，重演应验证输入消费阶段、步长与直接UI命令，不可只按种子重建后称为回放成功。
