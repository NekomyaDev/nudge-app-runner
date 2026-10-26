<p align="center">
  <img src="assets/logo.svg" width="160" height="160" alt="Nudge 徽标">
</p>

<h1 align="center">Nudge App Runner</h1>

<p align="center">
  <strong>面向 Nudge（<code>.ndg</code>）应用程序的一键式安装、启动与桌面集成工具。</strong><br>
  将 Nudge 智能体与图形应用程序原生集成至 Linux 桌面环境。
</p>

<p align="center">
  <img alt="平台 Linux" src="https://img.shields.io/badge/Linux-已支持-success?logo=linux&logoColor=white">
  <img alt="平台 Windows" src="https://img.shields.io/badge/Windows-即将推出-inactive?logo=windows&logoColor=white">
  <img alt="平台 macOS" src="https://img.shields.io/badge/macOS-即将推出-inactive?logo=apple&logoColor=white">
  <img alt="开源许可" src="https://img.shields.io/badge/许可-Apache--2.0-blue">
  <a href="https://github.com/NekomyaDev/nudge"><img alt="Powered by Nudge" src="https://img.shields.io/badge/语言-Nudge-7057ff"></a>
</p>

---

<p align="center">
  <a href="README.md">English</a> •
  <strong>中文</strong> •
  <a href="README.ja-JP.md">日本語</a> •
  <a href="README.ko-KR.md">한국어</a> •
  <a href="README.ru-RU.md">Русский</a> •
  <a href="README.es-ES.md">Español</a> •
  <a href="README.tr-TR.md">Türkçe</a> •
  <a href="README.de-DE.md">Deutsch</a> •
  <a href="README.fr-FR.md">Français</a>
</p>

---

> **注意：** 目前已全面支持 **Linux** 桌面系统（KDE Plasma、GNOME、XFCE 以及 Debian、Ubuntu、Fedora、Arch、openSUSE 等发行版）。**Windows** 和 **macOS** 桌面集成正在积极开发中，敬请期待。

## 为什么需要 Nudge App Runner？

运行 AI 智能体应该像启动原生桌面软件一样简单自然，而不是隐藏在后台的无名脚本或难以追踪的进程：

- **真正的桌面集成：** 在文件管理器（Dolphin、Nautilus、Thunar 等）中双击任何 `.ndg` 文件，即可预览元数据、审核安全权限并一键安装。
- **系统应用菜单启动：** 已安装的应用将直接出现在操作系统的“开始菜单”（KDE Kickoff、GNOME Dash、Rofi 等）中，支持应用搜索并可固定至任务栏/Dock。
- **杜绝静默后台进程：**
  - **GUI 界面应用：** 直接以原生 Wayland / X11 窗口启动。
  - **CLI / 智能体应用：** 绝不在后台隐蔽运行！会自动开启一个交互式终端窗口，实时展示 Token 消耗与处理结果，且执行完成后保持打开以供检查。
- **清晰透明的权限管理：** 在安装前即可核验声明的 Nudge 语言副作用（`uses LLM`、`uses Tool`、`uses IO`、`uses Net`）。

---

## 支持平台

| 操作系统 | 状态 | 安装格式 | 支持的桌面环境 |
| :--- | :---: | :--- | :--- |
| **Linux** | **已支持** | `.deb`, `.run`, `.tar.gz`, `.zip` | KDE Plasma, GNOME, XFCE, Cinnamon, MATE, Cosmic |
| **Windows** | *即将推出* | `.msi`, `.exe` 封装器 | Windows 10 / 11 Shell |
| **macOS** | *即将推出* | `.dmg`, `.app` 应用程序包 | macOS Finder / Launchpad |

---

## 安装方法 (Linux)

### 方法 1：Debian / Ubuntu / Linux Mint / Pop!_OS (`.deb`)

从 [Releases](https://github.com/NekomyaDev/nudge-app-runner/releases) 页面下载官方 `.deb` 安装包，双击安装或在终端运行：

```bash
sudo apt install ./nudge-app-runner_1.2.1_all.deb
```

### 方法 2：通用 Linux 一键安装包 (`.run`)

适用于 **Fedora、Arch Linux、openSUSE、Gentoo、Void** 等所有主流 Linux 发行版：

```bash
chmod +x nudge-app-runner-1.2.1-installer.run
./nudge-app-runner-1.2.1-installer.run
```

### 方法 3：便携式绿色压缩包 (`.tar.gz`)

1. 解压 `nudge-app-runner-1.2.1-linux.tar.gz`。
2. 双击运行 `Install Nudge App Runner.desktop`（或在终端执行 `./install.sh`）。

---

## 运作原理

```
                      双击 .ndg 应用程序文件
                                │
                                ▼
                    ┌────────────────────────┐
                    │   nudge-app-installer  │  (图形界面)
                    │   检查应用标题与声明权限 │
                    └───────────┬────────────┘
                                │
               ┌────────────────┴────────────────┐
               ▼                                 ▼
         [ 安装到系统 ]                     [ 直接运行 ]
               │                                 │
     自动注册 .desktop、                          │
     应用图标与运行环境                           ▼
               │                          nudge-runner
               ▼                                 │
    已列入 KDE / GNOME 应用程序菜单               ├─► GUI 应用 ──► 原生 X11/Wayland 窗口
    支持系统搜索与固定                            └─► CLI 智能体 ──► 交互式活动终端窗口
```

---

## 命令行 (CLI) 工具用法

```bash
# 打开指定应用的图形安装界面
nudge-app-installer app.ndg

# 无需界面直接安装应用
nudge-app-installer --install app.ndg

# 查看系统中已安装的 Nudge 应用列表
nudge-app-installer --list

# 卸载已安装的应用
nudge-app-installer --uninstall app-id

# 快速运行应用
nudge-runner app.ndg --exec
```

---

## 源码构建

```bash
git clone https://github.com/NekomyaDev/nudge-app-runner.git
cd nudge-app-runner

# 本地安装：
./install.sh

# 生成全套发布安装包 (.deb, .run, .tar.gz)：
./package.sh
```

---

## 开源许可

遵循 [Apache License 2.0](LICENSE) 开源许可协议。属于 [Nudge 语言生态](https://github.com/NekomyaDev/nudge) 项目。
