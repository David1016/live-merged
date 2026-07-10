# live-merged

自动合并 [`mursor1985/LIVE`](https://github.com/mursor1985/LIVE) 的 4 个直播源
（B站直播 / 斗鱼 / 虎牙 / YY 轮播）为**单个 m3u**，由 GitHub Actions 每 2 小时自动更新。

## 订阅链接（填进 APTV / TiviMate 等）

```
https://raw.githubusercontent.com/David1016/live-merged/main/LIVE-merged.m3u
```

CDN 加速备用（国内有时更快，但缓存约 12h，更新更慢）：

```
https://cdn.jsdelivr.net/gh/David1016/live-merged@main/LIVE-merged.m3u
```

## 说明

- 上游源仅供个人测试学习，直播间会下播/变动，链接失效属正常。
- 手动更新：仓库 **Actions → merge-live → Run workflow**。
- 本仓库不托管任何视频流，只是把上游公开的 m3u 文本合并转发。
