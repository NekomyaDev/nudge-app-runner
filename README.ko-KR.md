<p align="center">
  <img src="assets/logo.svg" width="160" height="160" alt="Nudge 로고">
</p>

<h1 align="center">Nudge App Runner</h1>

<p align="center">
  <strong>Nudge(<code>.ndg</code>) 애플리케이션을 위한 원클릭 설치기, 실행기 및 데스크톱 통합 도구.</strong><br>
  Nudge 에이전트 및 GUI 앱을 Linux 데스크톱 환경에 네이티브로 완벽 통합합니다.
</p>

<p align="center">
  <img alt="플랫폼 Linux" src="https://img.shields.io/badge/Linux-지원됨-success?logo=linux&logoColor=white">
  <img alt="플랫폼 Windows" src="https://img.shields.io/badge/Windows-출시%20예정-inactive?logo=windows&logoColor=white">
  <img alt="플랫폼 macOS" src="https://img.shields.io/badge/macOS-출시%20예정-inactive?logo=apple&logoColor=white">
  <img alt="라이선스" src="https://img.shields.io/badge/라이선스-Apache--2.0-blue">
  <a href="https://github.com/NekomyaDev/nudge"><img alt="Powered by Nudge" src="https://img.shields.io/badge/언어-Nudge-7057ff"></a>
</p>

---

<p align="center">
  <a href="README.md">English</a> •
  <a href="README.zh-CN.md">中文</a> •
  <a href="README.ja-JP.md">日本語</a> •
  <strong>한국어</strong> •
  <a href="README.ru-RU.md">Русский</a> •
  <a href="README.es-ES.md">Español</a> •
  <a href="README.tr-TR.md">Türkçe</a> •
  <a href="README.de-DE.md">Deutsch</a> •
  <a href="README.fr-FR.md">Français</a>
</p>

---

> **알림:** 현재 **Linux** 데스크톱(KDE Plasma, GNOME, XFCE 및 Debian, Ubuntu, Fedora, Arch, openSUSE 등)을 완벽히 지원합니다. **Windows** 및 **macOS** 데스크톱 연동은 현재 개발 중이며 곧 제공될 예정입니다.

## Nudge App Runner를 사용하는 이유

AI 에이전트를 실행하는 경험은 백그라운드에서 조용히 사라지는 스크립트가 아니라, 일반 네이티브 데스크톱 애플리케이션과 같아야 합니다:

- **완벽한 데스크톱 통합:** 파일 관리자(Dolphin, Nautilus 등)에서 `.ndg` 파일을 더블 클릭하면 앱 정보와 권한을 확인하고 원클릭으로 설치할 수 있습니다.
- **애플리케이션 메뉴 등록:** 설치된 앱은 시작 메뉴(KDE Kickoff, GNOME Dash 등)에 아이콘과 함께 등록되어 검색 및 작업 표시줄 고정이 가능합니다.
- **보이지 않는 백그라운드 프로세스 방지:**
  - **GUI 앱:** 네이티브 Wayland / X11 창으로 바로 실행됩니다.
  - **CLI / 에이전트 앱:** 백그라운드에 숨겨져 실행되지 않으며 대화형 터미널 창에서 실시간 토큰 및 로그를 표시합니다. 실행 완료 후 결과를 확인할 수 있도록 창이 유지됩니다.
- **투명한 권한 관리:** 설치 전에 Nudge 효과(`uses LLM`, `uses Tool`, `uses IO`, `uses Net`)를 확인할 수 있습니다.

---

## 설치 방법 (Linux)

### 방법 1: Debian / Ubuntu / Linux Mint (`.deb`)

[Releases](https://github.com/NekomyaDev/nudge-app-runner/releases)에서 `.deb` 파일을 다운로드 후 더블 클릭하거나 실행합니다:

```bash
sudo apt install ./nudge-app-runner_1.2.1_all.deb
```

### 방법 2: 범용 Linux 설치기 (`.run`)

**Fedora, Arch Linux, openSUSE** 등 모든 배포판에서 작동합니다:

```bash
chmod +x nudge-app-runner-1.2.1-installer.run
./nudge-app-runner-1.2.1-installer.run
```

---

## 라이선스

[Apache License 2.0](LICENSE)에 따라 배포됩니다. [Nudge 언어 생태계](https://github.com/NekomyaDev/nudge)의 일부입니다.
