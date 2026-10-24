# temple-run.xapk

Unity 原版 Temple Run 1.39 的安装包，用于逆向/提取原版资源（角色、路面、UI、音频等）。

GitHub 单文件上限 100 MB，因此这里按 75 MB 分片提交（2 个主体 + 1 个尾片）。
重组方法：

```bash
cat apk/temple-run.xapk.part-* > temple-run.xapk
shasum -a 256 temple-run.xapk   # 见下方校验值
```

SHA-256: `e7e74504284c016d2e122f25f6db060aa102c39352af3142bc17285380bfff29`

