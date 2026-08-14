# deepseek-harness-launcher

DeepSeek Harness Web 界面一键启动脚本（Windows）。

## 功能

- 双击 `DeepSeek Harness.bat` 即可后台启动 DeepSeek Harness Web UI
- 启动前自动探测 `3080` 端口，若已被占用则先强制结束旧进程，再重新启动
- 优先使用本机 `dsh` 命令；未安装时自动回退到 `npx -y @deepseek-ai/dsh web`（自动确认，无需手动输入 y）
- 服务在隐藏控制台中后台常驻运行，不会长期占用窗口（双击 `.bat` 时命令窗口会短暂闪现，属正常现象）
- 服务就绪后自动用默认浏览器打开 `http://127.0.0.1:3080`

## 使用方法

1. 双击 `DeepSeek Harness.bat`
2. 等待几秒钟，浏览器自动打开 `http://127.0.0.1:3080` 即启动成功

## 前置要求

- Windows 10/11
- Node.js（含 npx）；若已全局安装 `@deepseek-ai/dsh` 则不是必须

## 文件说明

| 文件 | 说明 |
| ---- | ---- |
| `DeepSeek Harness.bat` | 一键启动脚本（推荐复制到桌面使用） |
