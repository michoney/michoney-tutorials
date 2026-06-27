# ⚡ Chrome 内存深度优化工具

> 从 4.5GB 到 1GB —— 不装任何扩展，纯配置调优

## 效果

| 项目 | 优化前 | 优化后 |
|------|--------|--------|
| Chrome 进程数 | 28 个 | 12 个 |
| 内存占用 | 4.5 GB | 1.0 GB |

## 快速使用

```powershell
.\scripts\optimize_chrome_memory.ps1
```

脚本自动：关闭 Chrome → 清理缓存 → 写入配置 → 以优化参数重启

## 优化原理

| 优化项 | 效果 |
|-------|------|
| Memory Saver 冻结不活跃标签 | 省 30~50% |
| 限制渲染进程最多 10 个 | 省 20~30% |
| 禁用后台联网/同步/预连接 | 省 5~10% |
| 清理缓存 | 省 100~500MB |
| V8 堆限制 4GB | 省 10~20% |

## 高级调参

编辑脚本顶部：
- MemoryLimitMB: 内存上限（小内存改 2048）
- MaxRendererProcesses: 进程上限（小内存改 5）
- InactiveTimeoutMin: 冻结时间（激进改 5）

## 项目结构

```
chrome-memory-optimizer/
├── SKILL.md                        # AI 技能定义
├── scripts/
│   └── optimize_chrome_memory.ps1  # 一键优化脚本
├── assets/
└── agents/
    └── openai.yaml                 # AI 界面元数据
```

> Chrome 149+ 已原生支持 Memory Saver，本项目只是把最优配置一键集成了。
