<p align="center">
  <img src="assets/logo.svg" width="160" height="160" alt="Logotipo de Nudge">
</p>

<h1 align="center">Nudge App Runner</h1>

<p align="center">
  <strong>Instalador en un clic, lanzador e integrador de escritorio para aplicaciones Nudge (<code>.ndg</code>).</strong><br>
  Integra agentes y aplicaciones gráficas de Nudge de forma nativa en tu entorno Linux.
</p>

<p align="center">
  <img alt="Plataforma Linux" src="https://img.shields.io/badge/Linux-Soportado-success?logo=linux&logoColor=white">
  <img alt="Plataforma Windows" src="https://img.shields.io/badge/Windows-Pr%C3%B3ximamente-inactive?logo=windows&logoColor=white">
  <img alt="Plataforma macOS" src="https://img.shields.io/badge/macOS-Pr%C3%B3ximamente-inactive?logo=apple&logoColor=white">
  <img alt="Licencia" src="https://img.shields.io/badge/licencia-Apache--2.0-blue">
  <a href="https://github.com/NekomyaDev/nudge"><img alt="Powered by Nudge" src="https://img.shields.io/badge/lenguaje-Nudge-7057ff"></a>
</p>

---

<p align="center">
  <a href="README.md">English</a> •
  <a href="README.zh-CN.md">中文</a> •
  <a href="README.ja-JP.md">日本語</a> •
  <a href="README.ko-KR.md">한국어</a> •
  <a href="README.ru-RU.md">Русский</a> •
  <strong>Español</strong> •
  <a href="README.tr-TR.md">Türkçe</a> •
  <a href="README.de-DE.md">Deutsch</a> •
  <a href="README.fr-FR.md">Français</a>
</p>

---

> **Aviso:** Actualmente **Linux** cuenta con soporte completo (KDE Plasma, GNOME, XFCE; Debian, Ubuntu, Fedora, Arch, openSUSE, etc.). La integración para **Windows** y **macOS** está en desarrollo activo y llegará pronto.

## Características

- **Auténtica integración de escritorio:** Haz doble clic en cualquier archivo `.ndg` en tu gestor de archivos (Dolphin, Nautilus, Thunar) para revisar permisos e instalar en un clic.
- **Acceso desde el menú del sistema:** Las aplicaciones instaladas aparecen en el menú de inicio (KDE Kickoff, GNOME Dash) con icono propio y búsqueda indexada.
- **Sin procesos ocultos en segundo plano:**
  - **Aplicaciones GUI:** Se abren en su propia ventana nativa Wayland / X11.
  - **Agentes CLI:** Se ejecutan en una ventana interactiva de terminal mostrando los tokens y resultados en tiempo real, permaneciendo abierta al finalizar para que puedas revisar las salidas.

---

## Instalación (Linux)

### Método 1: Debian / Ubuntu / Mint (`.deb`)

Descarga el paquete `.deb` desde [Releases](https://github.com/NekomyaDev/nudge-app-runner/releases) y ejecuta:

```bash
sudo apt install ./nudge-app-runner_1.2.1_all.deb
```

### Método 2: Instalador Universal (`.run`)

Para **Fedora, Arch Linux, openSUSE** y otras distribuciones:

```bash
chmod +x nudge-app-runner-1.2.1-installer.run
./nudge-app-runner-1.2.1-installer.run
```

---

## Licencia

Distribuido bajo [Apache License 2.0](LICENSE). Forma parte del ecosistema oficial de [Nudge](https://github.com/NekomyaDev/nudge).
