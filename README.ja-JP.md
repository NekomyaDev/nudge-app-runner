<p align="center">
  <img src="assets/logo.svg" width="160" height="160" alt="Nudge ロゴ">
</p>

<h1 align="center">Nudge App Runner</h1>

<p align="center">
  <strong>Nudge（<code>.ndg</code>）アプリケーションのためのワンクリックインストーラー、ランチャー、デスクトップ統合ツール。</strong><br>
  Nudge エージェントや GUI アプリを Linux デスクトップ環境へネイティブに統合します。
</p>

<p align="center">
  <img alt="Linux プラットフォーム" src="https://img.shields.io/badge/Linux-サポート中-success?logo=linux&logoColor=white">
  <img alt="Windows プラットフォーム" src="https://img.shields.io/badge/Windows-近日対応-inactive?logo=windows&logoColor=white">
  <img alt="macOS プラットフォーム" src="https://img.shields.io/badge/macOS-近日対応-inactive?logo=apple&logoColor=white">
  <img alt="ライセンス" src="https://img.shields.io/badge/ライセンス-Apache--2.0-blue">
  <a href="https://github.com/NekomyaDev/nudge"><img alt="Powered by Nudge" src="https://img.shields.io/badge/言語-Nudge-7057ff"></a>
</p>

---

<p align="center">
  <a href="README.md">English</a> •
  <a href="README.zh-CN.md">中文</a> •
  <strong>日本語</strong> •
  <a href="README.ko-KR.md">한국어</a> •
  <a href="README.ru-RU.md">Русский</a> •
  <a href="README.es-ES.md">Español</a> •
  <a href="README.tr-TR.md">Türkçe</a> •
  <a href="README.de-DE.md">Deutsch</a> •
  <a href="README.fr-FR.md">Français</a>
</p>

---

> **お知らせ：** 現在は **Linux** デスクトップ環境（KDE Plasma、GNOME、XFCE；Debian、Ubuntu、Fedora、Arch、openSUSE 等）に完全対応しています。**Windows** および **macOS** 向けデスクトップ統合は現在開発中であり、まもなく提供開始予定です。

## Nudge App Runner の特徴

AI エージェントの実行は、バックグラウンドに隠れた見えないスクリプトではなく、通常のネイティブアプリと同じように振る舞うべきです：

- **真のデスクトップ統合：** ファイルマネージャー（Dolphin、Nautilus、Thunar 等）で `.ndg` ファイルをダブルクリックするだけで、メタデータや権限を確認し、ワンクリックでインストール可能。
- **アプリケーションメニューからの起動：** インストールしたアプリは OS のアプリ一覧（KDE Kickoff、GNOME Dash 等）に登録され、アイコン検索やドックへのピン留めが可能です。
- **見えないバックグラウンドプロセスの排除：**
  - **GUI アプリ：** ネイティブな Wayland / X11 ウィンドウで直接起動。
  - **CLI / エージェントアプリ：** バックグラウンドで勝手に隠れて動くことはありません。インタラクティブなターミナル画面が開き、トークン消費や出力をリアルタイムに確認可能。終了後も結果を確認できるようウィンドウが維持されます。
- **透明性の高いパーミッション：** インストール前に Nudge エフェクト（`uses LLM`、`uses Tool`、`uses IO`、`uses Net`）を検証可能。

---

## プラットフォーム対応状況

| OS | 状況 | 配布パッケージ | 対応デスクトップ環境 |
| :--- | :---: | :--- | :--- |
| **Linux** | **利用可能** | `.deb`, `.run`, `.tar.gz`, `.zip` | KDE Plasma, GNOME, XFCE, Cinnamon, MATE, Cosmic |
| **Windows** | *近日対応* | `.msi`, `.exe` ラッパー | Windows 10 / 11 Shell |
| **macOS** | *近日対応* | `.dmg`, `.app` バンドル | macOS Finder / Launchpad |

---

## インストール方法 (Linux)

### 方法 1: Debian / Ubuntu / Linux Mint / Pop!_OS (`.deb`)

[Releases](https://github.com/NekomyaDev/nudge-app-runner/releases) ページから公式 `.deb` パッケージをダウンロードし、ダブルクリックするか以下のコマンドを実行します：

```bash
sudo apt install ./nudge-app-runner_1.2.1_all.deb
```

### 方法 2: 汎用 Linux 自己展開インストーラー (`.run`)

**Fedora、Arch Linux、openSUSE** など、あらゆるディストリビューションで利用可能です：

```bash
chmod +x nudge-app-runner-1.2.1-installer.run
./nudge-app-runner-1.2.1-installer.run
```

### 方法 3: ポータブルアーカイブ (`.tar.gz`)

1. `nudge-app-runner-1.2.1-linux.tar.gz` を展開。
2. `Install Nudge App Runner.desktop` をダブルクリック（または `./install.sh` を実行）。

---

## CLI の使い方

```bash
# GUI インストーラーを開く
nudge-app-installer app.ndg

# GUI なしで直接インストール
nudge-app-installer --install app.ndg

# インストール済みアプリ一覧を表示
nudge-app-installer --list

# アプリをアンインストール
nudge-app-installer --uninstall app-id

# 直接実行
nudge-runner app.ndg --exec
```

---

## ライセンス

[Apache License 2.0](LICENSE) に基づいて公開されています。[Nudge 言語エコシステム](https://github.com/NekomyaDev/nudge) の公式コンポーネントです。
