<p align="center">
  <img src="assets/logo.svg" width="160" height="160" alt="Nudge Logo">
</p>

<h1 align="center">Nudge App Runner</h1>

<p align="center">
  <strong>Ein-Klick-Installer, Launcher und Desktop-Integrator für Nudge (<code>.ndg</code>) Anwendungen.</strong><br>
  Integriert Nudge-Agenten und GUI-Anwendungen nativ in Ihre Linux-Desktopumgebung.
</p>

<p align="center">
  <img alt="Plattform Linux" src="https://img.shields.io/badge/Linux-Unterst%C3%BCtzt-success?logo=linux&logoColor=white">
  <img alt="Plattform Windows" src="https://img.shields.io/badge/Windows-Demn%C3%A4chst-inactive?logo=windows&logoColor=white">
  <img alt="Plattform macOS" src="https://img.shields.io/badge/macOS-Demn%C3%A4chst-inactive?logo=apple&logoColor=white">
  <img alt="Lizenz" src="https://img.shields.io/badge/Lizenz-Apache--2.0-blue">
  <a href="https://github.com/NekomyaDev/nudge"><img alt="Powered by Nudge" src="https://img.shields.io/badge/Sprache-Nudge-7057ff"></a>
</p>

---

<p align="center">
  <a href="README.md">English</a> •
  <a href="README.zh-CN.md">中文</a> •
  <a href="README.ja-JP.md">日本語</a> •
  <a href="README.ko-KR.md">한국어</a> •
  <a href="README.ru-RU.md">Русский</a> •
  <a href="README.es-ES.md">Español</a> •
  <a href="README.tr-TR.md">Türkçe</a> •
  <strong>Deutsch</strong> •
  <a href="README.fr-FR.md">Français</a>
</p>

---

> **Hinweis:** Zurzeit wird **Linux** vollständig unterstützt (KDE Plasma, GNOME, XFCE; Debian, Ubuntu, Fedora, Arch, openSUSE etc.). Die Desktop-Integration für **Windows** und **macOS** befindet sich in aktiver Entwicklung.

## Funktionen

- **Echte Desktop-Integration:** Doppelklick auf eine beliebige `.ndg`-Datei im Dateimanager (Dolphin, Nautilus, Thunar) öffnet das Installationsfenster zur Rechteprüfung und Installation.
- **Anwendungsmenü:** Installierte Programme erscheinen im Startmenü (KDE Kickoff, GNOME Dash) mit Icon und Suchfunktion.
- **Keine versteckten Hintergrundprozesse:**
  - **GUI-Apps:** Öffnen sich direkt in einem nativen Wayland / X11 Fenster.
  - **CLI-Agenten:** Werden in einem interaktiven Terminalfenster mit sichtbarem Token-Verbrauch gestartet und bleiben nach Abschluss zur Ansicht geöffnet.

---

## Installation (Linux)

### Methode 1: Debian / Ubuntu / Mint (`.deb`)

Laden Sie das offizielle `.deb`-Paket von der [Releases](https://github.com/NekomyaDev/nudge-app-runner/releases)-Seite herunter und führen Sie Folgendes aus:

```bash
sudo apt install ./nudge-app-runner_1.2.1_all.deb
```

### Methode 2: Universal-Installer (`.run`)

Für **Fedora, Arch Linux, openSUSE** und alle anderen Distributionen:

```bash
chmod +x nudge-app-runner-1.2.1-installer.run
./nudge-app-runner-1.2.1-installer.run
```

---

## Lizenz

Lizenziert unter [Apache License 2.0](LICENSE). Teil des offiziellen [Nudge-Ökosystems](https://github.com/NekomyaDev/nudge).
