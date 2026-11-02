# 追逐者球形占位修复

核查结论：26f9236已包含异步成功后调用mountChasers；用户给出的“then只存rig”属于更早版本。当前仍存在的路径是：加载失败→pursuitFallback→buildChaser→SphereGeometry身体与眼睛。正常加载时虽隐藏，但敌人与全套高清场景并发，弱网竞争会延长等待。

修复：彻底删除球形身体/眼睛回退；缺原版mesh的静态buildChaser只返回空组。所有设备开跑后300ms优先加载敌人，完成后才下载高清场景和角色升级；失败重试一次，持续失败则隐藏。rig到达当前局立即替换子组，保留追逐锚点位置/朝向/缩放，采用原版8只队形、当前跳跃高度和runElapsed动画相位，普通阶段只显示前3只。共享JSON/纹理解码，失败时释放已成功加载的纹理。reset/revive使用同一挂载逻辑与资源，均不创建球。

玩家：默认开局使用已加载的真实rig，升级失败保留当前rig；首次rig加载失败向启动界面报错，不再以胶囊冒充就绪。异常reset缺rig时隐藏，不生成几何占位。

验证：生产gzip服务，HTTP禁缓存，375×812、Slow4G(180000B/s,562.5ms)、6×CPU。三轮从实际start到8只原版猴子挂载为2313.8/2304.4/2316.4ms；每100ms取样，加载前children始终0，成功后8套rig挂载同一局、run动画有相位差。未等重开。以上为桌面Chrome仿真，非真机保证，也不保证断网时10秒内拿到资源。

通过实际Game测试接口在平直测试路段注入treeTrip碰撞，触发caught→结算；UI点击“宝石复活”恢复playing，8只猴子仍在，advance后动画时间前进；restart后8只开场可见且玩家rig ready。持续阻断rig-enemy两次请求：children=0，玩家rig仍ready（测试角色随后正常撞树根结束）。第一次请求失败、第二次解除阻断：重试成功后同局挂载8只。原始结果见本目录JSON。截图在docs/screenshots/startup/pursuit-native.png。

回归：真实mountPursuitRigs调用点单测验证保留锚点变换、跳跃高度、可见性、相位和反复替换；buildChaser缺资源时零Mesh。32组核心回归、类型检查、生产构建。入口版本路径、quick默认与window.__startupTiming保留。
