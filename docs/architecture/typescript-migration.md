# TypeScript 源码治理

基线 ee26be79：git ls-files 共107个 .js，全部是源码，没有受跟踪dist JS。逐项原路径、目标路径与分类见 javascript-inventory.json。dist/node_modules为忽略产物，不纳入源码检查；外部three/addons导入路径的.js是依赖包接口，不是仓库JS源码。

迁移分批：

1. 浏览器回归与诊断脚本、Vite配置、曲线/材质/法线纯模块。保留原脚本求值结果，通过 `npm run temple:browser:compile -- tools/test-temple-input-router.browser.ts /tmp/input.js` 生成临时浏览器可执行表达式。编译输出不提交。应用strict检查与全部tools的独立typecheck都必须通过。已验证25组核心、生产构建、15项实际浏览器输入回归。
2. 音频、骨骼、预览工具与剩余活动入口，再按相同门槛验证。

浏览器历史夹具的原始动态状态通过声明的调试窗口属性读取，独立tools配置暂不启用strict；并非关闭类型检查，也不使用ts-nocheck。生产游戏保留strict。对已有TS工具纳入检查时暴露的几何子类型、DOM焦点元素和历史字典类型已补充标注。

唯一计划豁免：target/temple-run/web/src/main.js，是legacy.html使用的历史2942行旧游戏对照入口；不由现行Vue/ECS应用导入。为保留可运行对照，不在本次重写旧引擎。迁移依赖后仅更新其模块后缀引用，最终豁免校验锁定文件哈希；若需改变行为，必须迁移或明确更新审计理由。
