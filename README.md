<p align="center">
  <img src="assets/logo.svg" width="160" height="160" alt="Nudge Logo">
</p>

<h1 align="center">Nudge App Runner</h1>

<p align="center">
  <strong>Single-click installer, launcher, and desktop integrator for Nudge (<code>.ndg</code>) applications.</strong><br>
  Integrates Nudge agents and GUI apps natively into your Linux desktop environment.
</p>

<p align="center">
  <img alt="Platform Linux" src="https://img.shields.io/badge/Linux-Supported-success?logo=linux&logoColor=white">
  <img alt="Platform Windows" src="https://img.shields.io/badge/Windows-Coming%20Soon-inactive?logo=windows&logoColor=white">
  <img alt="Platform macOS" src="https://img.shields.io/badge/macOS-Coming%20Soon-inactive?logo=apple&logoColor=white">
  <img alt="License" src="https://img.shields.io/badge/license-Apache--2.0-blue">
  <a href="https://github.com/NekomyaDev/nudge"><img alt="Powered by Nudge" src="https://img.shields.io/badge/language-Nudge-7057ff"></a>
</p>

---

<p align="center">
  <strong>English</strong> •
  <a href="README.tr-TR.md">Türkçe</a>
</p>

---

> **Notice:** Currently, **Linux** is fully supported (Debian, Ubuntu, Fedora, Arch, openSUSE, etc. on KDE, GNOME, XFCE). **Windows** and **macOS** integrations are actively in development and coming soon.

## Why Nudge App Runner?

Running AI agents should feel like launching real applications—not running detached background scripts or opening a terminal and hunting down process IDs:

- **True Desktop Integration:** Double-click any `.ndg` file in your file manager (Dolphin, Nautilus, Thunar, etc.) to view metadata, inspect security permissions, and install it with one click.
- **Application Menu Access:** Installed `.ndg` apps appear directly in your Linux Application Menu (KDE Kickoff, GNOME Dash, Rofi, etc.) with custom icons and search indexing.
- **No Hidden Background Zombies:** 
  - **GUI Apps:** Open directly in their native Wayland / X11 window.
  - **CLI / Agent Apps:** Never run silently in the background! They launch inside an interactive terminal window showing live token streams and progress, remaining open upon completion so you can inspect outputs.
- **Permission Transparency:** View declared Nudge effects (`uses LLM`, `uses Tool`, `uses IO`, `uses Net`) before installing.

---

## Supported Platforms

| Operating System | Status | Formats | Desktop Environments |
| :--- | :---: | :--- | :--- |
| **Linux** | **Available** | `.deb`, `.run`, `.tar.gz`, `.zip` | KDE Plasma, GNOME, XFCE, Cinnamon, MATE, Cosmic |
| **Windows** | *Coming Soon* | `.msi`, `.exe` wrapper | Windows 10 / 11 Shell |
| **macOS** | *Coming Soon* | `.dmg`, `.app` bundle | macOS Finder / Launchpad |

---

## Installation (Linux)

### Method 1: Debian / Ubuntu / Linux Mint / Pop!_OS (`.deb`)

Download the official `.deb` package from the [Releases](https://github.com/NekomyaDev/nudge-app-runner/releases) section, then double-click it or run:

```bash
sudo apt install ./nudge-app-runner_1.2.1_all.deb
```

### Method 2: Universal Linux Installer (`.run`)

Works on **Fedora, Arch Linux, openSUSE, Gentoo, Void**, and any other distribution:

```bash
chmod +x nudge-app-runner-1.2.1-installer.run
./nudge-app-runner-1.2.1-installer.run
```

### Method 3: Portable Archive (`.tar.gz`)

1. Extract `nudge-app-runner-1.2.1-linux.tar.gz`.
2. Double-click `Install Nudge App Runner.desktop` (or run `./install.sh`).

---

## How It Works

```
                     Double-click .ndg File
                                │
                                ▼
                    ┌────────────────────────┐
                    │   nudge-app-installer  │  (GUI Dialog)
                    │  Inspect Title & Perms │
                    └───────────┬────────────┘
                                │
               ┌────────────────┴────────────────┐
               ▼                                 ▼
      [ Install to System ]               [ Run Directly ]
               │                                 │
     Registers .desktop,                         │
     Icons & App Directory                       ▼
               │                          nudge-runner
               ▼                                 │
    Available in KDE / GNOME                     ├─► GUI App  ──► Native X11/Wayland Window
    Application Launchers                        └─► CLI App  ──► Interactive Terminal
```

### 1. File Association & Inspection
When an `.ndg` file is opened, `nudge-app-installer` displays a modern dark-themed window showcasing:
- App Name, Version, Description, and Icon
- Application Category: GUI Application vs. CLI Agent
- Declared Effect Badges (LLM, IO, Tool, Network, UI)
- Installation status

### 2. Single-Click Installation
Clicking **Install to System**:
- Deploys the application bundle to `~/.local/share/nudge/apps/<app-id>/`
- Creates an executable launcher in `~/.local/bin/<app-id>`
- Generates a desktop entry in `~/.local/share/applications/<app-id>.desktop`
- Updates the FreeDesktop database so it appears instantly in your application menu.

### 3. Clean Removal
Opening an already-installed `.ndg` file gives you an **Uninstall** button, cleanly removing all desktop entries, wrappers, and cached bundles without leaving residual files.

---

## CLI Usage

For power users and scripting:

```bash
# Launch GUI installer for an app
nudge-app-installer my-app.ndg

# Non-interactive CLI installation
nudge-app-installer --install my-app.ndg

# List all installed Nudge apps
nudge-app-installer --list

# Uninstall an application
nudge-app-installer --uninstall my-app

# Run directly via smart runner
nudge-runner my-app.ndg --exec
```

---

## Building from Source

```bash
git clone https://github.com/NekomyaDev/nudge-app-runner.git
cd nudge-app-runner

# Install locally for development:
./install.sh

# Build all distribution packages (.deb, .run, .tar.gz):
./package.sh
```

---

## License

Licensed under the [Apache License, Version 2.0](LICENSE). Part of the [Nudge Language Ecosystem](https://github.com/NekomyaDev/nudge).
