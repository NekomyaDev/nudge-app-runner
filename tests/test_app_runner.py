#!/usr/bin/env python3
"""
Test suite for Nudge App Runner & Installer
"""

import os
import sys
import subprocess
from pathlib import Path
from importlib.machinery import SourceFileLoader

SCRIPT_DIR = Path(__file__).resolve().parent
REPO_ROOT = SCRIPT_DIR.parent
BIN_INSTALLER = REPO_ROOT / "bin" / "nudge-app-installer"
FIXTURES_DIR = SCRIPT_DIR / "fixtures"

installer_module = SourceFileLoader("nudge_app_installer", str(BIN_INSTALLER)).load_module()

NdgAppInfo = installer_module.NdgAppInfo
NudgeAppManager = installer_module.NudgeAppManager

def test_metadata_parsing():
    gui_file = FIXTURES_DIR / "sample_gui.ndg"
    assert gui_file.exists(), f"{gui_file} does not exist"
    app_gui = NdgAppInfo(gui_file)
    assert app_gui.is_gui is True, "sample_gui.ndg must be recognized as GUI"
    assert "UI" in app_gui.effects, "UI effect must be present"
    assert "Counter" in app_gui.title, f"Title should contain Counter: {app_gui.title}"
    assert app_gui.version == "1.2.0"

    cli_file = FIXTURES_DIR / "sample_cli.ndg"
    assert cli_file.exists(), f"{cli_file} does not exist"
    app_cli = NdgAppInfo(cli_file)
    assert app_cli.is_gui is False, "sample_cli.ndg must be recognized as CLI"
    assert "LLM" in app_cli.effects, "LLM effect must be present"
    assert "IO" in app_cli.effects, "IO effect must be present"
    assert app_cli.title == "Financial Triage Agent"
    assert app_cli.version == "2.1.0"

    print("✓ test_metadata_parsing passed!")

def test_install_and_uninstall_lifecycle():
    test_file = FIXTURES_DIR / "sample_gui.ndg"
    assert test_file.exists()

    app = NdgAppInfo(test_file)
    # Ensure fresh state
    if app.is_installed:
        NudgeAppManager.uninstall(app)

    assert not app.is_installed, "Should not be installed initially"

    # Install
    ok = NudgeAppManager.install(app)
    assert ok is True, "Install should succeed"
    assert app.is_installed is True, "App should report as installed"
    assert app.desktop_file_path.exists(), f"Desktop file {app.desktop_file_path} must exist"
    assert app.installed_executable_path.exists(), f"Binary {app.installed_executable_path} must exist"
    assert os.access(app.installed_executable_path, os.X_OK), "Executable wrapper must be executable (+x)"

    # Check desktop file content
    content = app.desktop_file_path.read_text()
    assert "Type=Application" in content
    assert "MimeType=application/x-nudge;" in content
    assert "Terminal=false" in content

    # Test CLI fixture install has Terminal=true
    cli_app = NdgAppInfo(FIXTURES_DIR / "sample_cli.ndg")
    NudgeAppManager.install(cli_app)
    cli_content = cli_app.desktop_file_path.read_text()
    assert "Terminal=true" in cli_content
    NudgeAppManager.uninstall(cli_app)

    # Uninstall
    ok = NudgeAppManager.uninstall(app)
    assert ok is True, "Uninstall should succeed"
    assert not app.desktop_file_path.exists(), "Desktop file must be deleted"
    assert not app.installed_executable_path.exists(), "Binary wrapper must be deleted"

    print("✓ test_install_and_uninstall_lifecycle passed!")

def test_mime_type_association():
    sample_ndg = FIXTURES_DIR / "sample_gui.ndg"
    res = subprocess.run(["xdg-mime", "query", "filetype", str(sample_ndg)], capture_output=True, text=True)
    assert "application/x-nudge" in res.stdout, f"Unexpected MIME type: {res.stdout}"

    handler = subprocess.run(["xdg-mime", "query", "default", "application/x-nudge"], capture_output=True, text=True)
    assert "nudge-app-installer.desktop" in handler.stdout, f"Unexpected default handler: {handler.stdout}"

    print("✓ test_mime_type_association passed!")

if __name__ == "__main__":
    print("Testing Nudge App Runner...")
    test_metadata_parsing()
    test_install_and_uninstall_lifecycle()
    test_mime_type_association()
    print("All tests completed successfully!")
