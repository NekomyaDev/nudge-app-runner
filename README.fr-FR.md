<p align="center">
  <img src="assets/logo.svg" width="160" height="160" alt="Logo Nudge">
</p>

<h1 align="center">Nudge App Runner</h1>

<p align="center">
  <strong>Installateur en un clic, lanceur et intégrateur de bureau pour les applications Nudge (<code>.ndg</code>).</strong><br>
  Intègre nativement les agents et applications graphiques Nudge dans votre environnement Linux.
</p>

<p align="center">
  <img alt="Plateforme Linux" src="https://img.shields.io/badge/Linux-Pris%20en%20charge-success?logo=linux&logoColor=white">
  <img alt="Plateforme Windows" src="https://img.shields.io/badge/Windows-Bient%C3%B4t%20disponible-inactive?logo=windows&logoColor=white">
  <img alt="Plateforme macOS" src="https://img.shields.io/badge/macOS-Bient%C3%B4t%20disponible-inactive?logo=apple&logoColor=white">
  <img alt="Licence" src="https://img.shields.io/badge/licence-Apache--2.0-blue">
  <a href="https://github.com/NekomyaDev/nudge"><img alt="Powered by Nudge" src="https://img.shields.io/badge/langage-Nudge-7057ff"></a>
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
  <a href="README.de-DE.md">Deutsch</a> •
  <strong>Français</strong>
</p>

---

> **Remarque :** Actuellement, **Linux** est entièrement pris en charge (KDE Plasma, GNOME, XFCE ; Debian, Ubuntu, Fedora, Arch, openSUSE, etc.). L'intégration pour **Windows** et **macOS** est en cours de développement.

## Fonctionnalités

- **Intégration transparente :** Double-cliquez sur n'importe quel fichier `.ndg` dans votre gestionnaire de fichiers (Dolphin, Nautilus, Thunar) pour inspecter les autorisations et l'installer en un clic.
- **Menu d'applications :** Les applications installées apparaissent directement dans votre lanceur d'applications (KDE Kickoff, GNOME Dash) avec icône et recherche indexée.
- **Aucun processus fantôme en arrière-plan :**
  - **Applications GUI :** S'ouvrent dans leur fenêtre native Wayland / X11.
  - **Agents CLI :** S'exécutent dans un terminal interactif avec suivi des tokens et restent ouverts à la fin pour permettre la consultation des résultats.

---

## Installation (Linux)

### Méthode 1 : Debian / Ubuntu / Mint (`.deb`)

Téléchargez le paquet officiel `.deb` depuis la page [Releases](https://github.com/NekomyaDev/nudge-app-runner/releases) et exécutez :

```bash
sudo apt install ./nudge-app-runner_1.2.1_all.deb
```

### Méthode 2 : Installateur universel (`.run`)

Pour **Fedora, Arch Linux, openSUSE** et toutes les distributions Linux :

```bash
chmod +x nudge-app-runner-1.2.1-installer.run
./nudge-app-runner-1.2.1-installer.run
```

---

## Licence

Sous licence [Apache License 2.0](LICENSE). Fait partie de l'écosystème officiel [Nudge](https://github.com/NekomyaDev/nudge).
