#!/usr/bin/env bash
# package.sh — Builds official release packages for nudge-app-runner
# Outputs to dist/packages/

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DIST_DIR="$SCRIPT_DIR/dist"
PACKAGES_DIR="$DIST_DIR/packages"
VERSION="1.2.1"
PKG_NAME="nudge-app-runner"
FOLDER_NAME="${PKG_NAME}-${VERSION}-linux"
BUNDLE_DIR="$DIST_DIR/$FOLDER_NAME"
LOGO_FILE="$SCRIPT_DIR/assets/logo.svg"

echo "=========================================================="
echo "  Building Nudge App Runner Packages (v${VERSION})"
echo "=========================================================="

rm -rf "$BUNDLE_DIR"
mkdir -p "$PACKAGES_DIR"
mkdir -p "$BUNDLE_DIR/bin"
mkdir -p "$BUNDLE_DIR/share/applications"
mkdir -p "$BUNDLE_DIR/share/mime/packages"
mkdir -p "$BUNDLE_DIR/share/icons/hicolor/scalable/apps"
mkdir -p "$BUNDLE_DIR/share/icons/hicolor/scalable/mimetypes"

# 1. Copy payload files to portable bundle
echo "→ Assembling portable bundle..."
cp "$SCRIPT_DIR/bin/nudge-app-installer" "$BUNDLE_DIR/bin/"
cp "$SCRIPT_DIR/bin/nudge-runner" "$BUNDLE_DIR/bin/"
chmod +x "$BUNDLE_DIR/bin/"*

cp "$SCRIPT_DIR/share/mime/packages/application-x-nudge.xml" "$BUNDLE_DIR/share/mime/packages/"
cp "$SCRIPT_DIR/share/applications/nudge-app-installer.desktop" "$BUNDLE_DIR/share/applications/"
cp "$LOGO_FILE" "$BUNDLE_DIR/share/icons/hicolor/scalable/apps/nudge.svg"
cp "$LOGO_FILE" "$BUNDLE_DIR/share/icons/hicolor/scalable/mimetypes/application-x-nudge.svg"

cp "$SCRIPT_DIR/install.sh" "$BUNDLE_DIR/install.sh"
cp "$SCRIPT_DIR/uninstall.sh" "$BUNDLE_DIR/uninstall.sh"
chmod +x "$BUNDLE_DIR/install.sh" "$BUNDLE_DIR/uninstall.sh"

# Desktop shortcut inside bundle
cat << 'EOF' > "$BUNDLE_DIR/Install Nudge App Runner.desktop"
[Desktop Entry]
Version=1.0
Type=Application
Name=Install Nudge App Runner
Name[tr]=Nudge Uygulama Yükleyicisini Kur
Comment=Click to install Nudge .ndg application runner and installer
Comment[tr]=Nudge .ndg uygulama kurucusunu ve çalıştırıcısını kurmak için çift tıklayın
Exec=bash -c "DIR=\"\$(cd \"\$(dirname \"%k\")\" && pwd)\"; \"\$DIR/install.sh\"; read -p 'Press Enter to close / Kapatmak için Enter...'"
Icon=package-x-generic
Terminal=true
Categories=Utility;
EOF
chmod +x "$BUNDLE_DIR/Install Nudge App Runner.desktop"

# README in bundle
cat << EOF > "$BUNDLE_DIR/README.md"
# Nudge App Runner & Installer (v${VERSION})

Single-click installer, launcher, and desktop integrator for Nudge (.ndg) applications.

## Quick Installation

### GUI:
Double-click \`Install Nudge App Runner.desktop\`.

### Terminal:
\`\`\`bash
# For current user:
./install.sh

# For system-wide (root):
sudo ./install.sh
\`\`\`

## Uninstallation
\`\`\`bash
./uninstall.sh
\`\`\`
EOF

# 2. Build .tar.gz and .zip archive
echo "→ Compressing archives (.tar.gz and .zip)..."
cd "$DIST_DIR"
tar -czf "$PACKAGES_DIR/${FOLDER_NAME}.tar.gz" "$FOLDER_NAME"
if command -v zip &>/dev/null; then
    zip -q -r "$PACKAGES_DIR/${FOLDER_NAME}.zip" "$FOLDER_NAME"
fi

# 3. Build .deb package (Debian / Ubuntu / Mint / Pop!_OS)
echo "→ Building Debian/Ubuntu (.deb) package..."
DEB_BUILD_DIR="$(mktemp -d /tmp/nudge-deb-build-XXXXXX)"
mkdir -p "$DEB_BUILD_DIR/DEBIAN"
mkdir -p "$DEB_BUILD_DIR/usr/bin"
mkdir -p "$DEB_BUILD_DIR/usr/share/applications"
mkdir -p "$DEB_BUILD_DIR/usr/share/mime/packages"
mkdir -p "$DEB_BUILD_DIR/usr/share/icons/hicolor/scalable/apps"
mkdir -p "$DEB_BUILD_DIR/usr/share/icons/hicolor/scalable/mimetypes"

cat << EOF > "$DEB_BUILD_DIR/DEBIAN/control"
Package: ${PKG_NAME}
Version: ${VERSION}
Section: utils
Priority: optional
Architecture: all
Maintainer: NekomyaDev <https://github.com/NekomyaDev/nudge>
Depends: python3, shared-mime-info, hicolor-icon-theme
Recommends: python3-pyqt6 | python3-tk
Description: Nudge App Runner and Installer for .ndg applications
 Enables seamless single-click installation and execution of .ndg Nudge
 applications across all Linux desktop environments.
EOF

cat << 'EOF' > "$DEB_BUILD_DIR/DEBIAN/postinst"
#!/bin/sh
set -e
if command -v update-mime-database >/dev/null 2>&1; then
    update-mime-database /usr/share/mime >/dev/null 2>&1 || true
fi
if command -v update-desktop-database >/dev/null 2>&1; then
    update-desktop-database /usr/share/applications >/dev/null 2>&1 || true
fi
if command -v gtk-update-icon-cache >/dev/null 2>&1; then
    gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor >/dev/null 2>&1 || true
fi
if command -v xdg-mime >/dev/null 2>&1; then
    xdg-mime default nudge-app-installer.desktop application/x-nudge >/dev/null 2>&1 || true
fi
exit 0
EOF
chmod 755 "$DEB_BUILD_DIR/DEBIAN/postinst"

cat << 'EOF' > "$DEB_BUILD_DIR/DEBIAN/postrm"
#!/bin/sh
set -e
if command -v update-mime-database >/dev/null 2>&1; then
    update-mime-database /usr/share/mime >/dev/null 2>&1 || true
fi
if command -v update-desktop-database >/dev/null 2>&1; then
    update-desktop-database /usr/share/applications >/dev/null 2>&1 || true
fi
exit 0
EOF
chmod 755 "$DEB_BUILD_DIR/DEBIAN/postrm"

cp "$SCRIPT_DIR/bin/nudge-app-installer" "$DEB_BUILD_DIR/usr/bin/"
cp "$SCRIPT_DIR/bin/nudge-runner" "$DEB_BUILD_DIR/usr/bin/"
chmod 755 "$DEB_BUILD_DIR/usr/bin/"*

cp "$SCRIPT_DIR/share/applications/nudge-app-installer.desktop" "$DEB_BUILD_DIR/usr/share/applications/"
cp "$SCRIPT_DIR/share/mime/packages/application-x-nudge.xml" "$DEB_BUILD_DIR/usr/share/mime/packages/"
cp "$LOGO_FILE" "$DEB_BUILD_DIR/usr/share/icons/hicolor/scalable/apps/nudge.svg"
cp "$LOGO_FILE" "$DEB_BUILD_DIR/usr/share/icons/hicolor/scalable/mimetypes/application-x-nudge.svg"

DEB_OUTPUT="$PACKAGES_DIR/${PKG_NAME}_${VERSION}_all.deb"
dpkg-deb --build "$DEB_BUILD_DIR" "$DEB_OUTPUT"
rm -rf "$DEB_BUILD_DIR"

# 4. Build .run self-extracting installer
echo "→ Building Universal Self-Extracting (.run) installer..."
RUN_FILE="$PACKAGES_DIR/${PKG_NAME}-${VERSION}-installer.run"
TAR_PAYLOAD="$(mktemp /tmp/nudge-payload-XXXXXX.tar.gz)"
(cd "$BUNDLE_DIR" && tar -czf "$TAR_PAYLOAD" .)

cat << 'EOF' > "$RUN_FILE"
#!/usr/bin/env bash
# Nudge App Runner Self-Extracting Installer
# https://github.com/NekomyaDev/nudge

set -e

TMPDIR=$(mktemp -d /tmp/nudge-installer-XXXXXX)
cleanup() {
    rm -rf "$TMPDIR"
}
trap cleanup EXIT

echo "Preparing Nudge App Runner Installer..."
ARCHIVE_LINE=$(awk '/^__PAYLOAD_START__/ {print NR + 1; exit 0; }' "$0")
tail -n +"$ARCHIVE_LINE" "$0" | tar -xz -C "$TMPDIR"

"$TMPDIR/install.sh" "$@"
exit 0
__PAYLOAD_START__
EOF

cat "$TAR_PAYLOAD" >> "$RUN_FILE"
chmod +x "$RUN_FILE"
rm -f "$TAR_PAYLOAD"

# Checksums
echo "→ Calculating SHA-256 checksums..."
cd "$PACKAGES_DIR"
sha256sum *.* > checksums.txt

echo ""
echo "✓ All packages successfully generated in dist/packages/!"
ls -lh "$PACKAGES_DIR"
