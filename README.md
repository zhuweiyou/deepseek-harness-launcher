# deepseek-harness-launcher

DeepSeek Harness Web 界面一键启动脚本（Windows）。

## 功能

- 双击 `DeepSeek Harness.bat` 即可隐藏窗口后台启动 DeepSeek Harness Web UI
- 启动时执行 `kill-port 3080`，直接清理 `3080` 端口上的旧进程，端口未被占用也不影响
- 执行 `dsh web` 启动服务（浏览器会自动打开 `http://127.0.0.1:3080`）

## 使用方法

双击 `DeepSeek Harness.bat` 即可，浏览器会自动打开 `http://127.0.0.1:3080`。

## 前置要求

- Windows 10/11

使用前需全局安装以下两个工具：

```bash
npm i -g kill-port
npm i -g @deepseek-ai/dsh
```

## 文件说明

| 文件 | 说明 |
| ---- | ---- |
| `DeepSeek Harness.bat` | 一键启动脚本（推荐复制到桌面使用） |
