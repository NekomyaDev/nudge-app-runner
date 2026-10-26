<p align="center">
  <img src="assets/logo.svg" width="160" height="160" alt="Логотип Nudge">
</p>

<h1 align="center">Nudge App Runner</h1>

<p align="center">
  <strong>Установщик в один клик, средство запуска и интегратор приложений Nudge (<code>.ndg</code>) для рабочего стола.</strong><br>
  Обеспечивает нативную интеграцию агентов и GUI-приложений Nudge в окружение Linux.
</p>

<p align="center">
  <img alt="Платформа Linux" src="https://img.shields.io/badge/Linux-Поддерживается-success?logo=linux&logoColor=white">
  <img alt="Платформа Windows" src="https://img.shields.io/badge/Windows-Скоро-inactive?logo=windows&logoColor=white">
  <img alt="Платформа macOS" src="https://img.shields.io/badge/macOS-Скоро-inactive?logo=apple&logoColor=white">
  <img alt="Лицензия" src="https://img.shields.io/badge/лицензия-Apache--2.0-blue">
  <a href="https://github.com/NekomyaDev/nudge"><img alt="Powered by Nudge" src="https://img.shields.io/badge/язык-Nudge-7057ff"></a>
</p>

---

<p align="center">
  <a href="README.md">English</a> •
  <a href="README.zh-CN.md">中文</a> •
  <a href="README.ja-JP.md">日本語</a> •
  <a href="README.ko-KR.md">한국어</a> •
  <strong>Русский</strong> •
  <a href="README.es-ES.md">Español</a> •
  <a href="README.tr-TR.md">Türkçe</a> •
  <a href="README.de-DE.md">Deutsch</a> •
  <a href="README.fr-FR.md">Français</a>
</p>

---

> **Примечание:** В настоящее время полностью поддерживается **Linux** (KDE Plasma, GNOME, XFCE; дистрибутивы Debian, Ubuntu, Fedora, Arch, openSUSE и др.). Интеграция с рабочими столами **Windows** и **macOS** находится в активной разработке.

## Возможности

- **Интеграция с рабочим столом:** Двойной клик по любому файлу `.ndg` в файловом менеджере (Dolphin, Nautilus и др.) открывает окно установки с просмотром разрешений.
- **Интеграция с меню приложений:** Установленные приложения появляются в меню «Пуск» (KDE Kickoff, GNOME Dash и др.), доступны для поиска и закрепления на панели задач.
- **Никаких невидимых фоновых процессов:**
  - **Графические приложения (GUI):** Открываются в собственном нативном окне Wayland / X11.
  - **Консольные агенты (CLI):** Запускаются в интерактивном окне терминала, транслируя логи и расход токенов в реальном времени, и остаются открытыми после завершения.

---

## Установка (Linux)

### Вариант 1: Debian / Ubuntu / Linux Mint (`.deb`)

Скачайте официальный пакет `.deb` со страницы [Releases](https://github.com/NekomyaDev/nudge-app-runner/releases) и выполните:

```bash
sudo apt install ./nudge-app-runner_1.2.1_all.deb
```

### Вариант 2: Универсальный установщик (`.run`)

Для **Fedora, Arch Linux, openSUSE** и других систем:

```bash
chmod +x nudge-app-runner-1.2.1-installer.run
./nudge-app-runner-1.2.1-installer.run
```

---

## Лицензия

Распространяется под лицензией [Apache License 2.0](LICENSE). Является частью [экосистемы Nudge](https://github.com/NekomyaDev/nudge).
