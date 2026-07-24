# Homebrew Formula for FocusRelayMCP
# This formula installs both the MCP server binary and the OmniFocus plugin

class Focusrelay < Formula
  desc "Read and write OmniFocus tasks and projects via AI assistants"
  homepage "https://github.com/deverman/FocusRelayMCP"
  url "https://github.com/deverman/FocusRelayMCP/releases/download/v0.11.0-beta/focusrelay-0.11.0-beta.tar.gz"
  sha256 "ebb5a70fd10a52c6ac0e493577799e813b43046e1d3c669ece78ecc2a3973c51"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "focusrelay"
    (pkgshare/"Plugin").install "FocusRelayBridge.omnijs"
  end

  def caveats
    <<~EOS
      ✅ FocusRelayMCP has been installed!

      📍 Binary location: #{opt_bin}/focusrelay
      🔌 Plugin location: #{pkgshare}/Plugin/FocusRelayBridge.omnijs

      🔄 NEXT STEPS:

      1. INSTALL the OmniFocus plugin:
         cp -r #{pkgshare}/Plugin/FocusRelayBridge.omnijs \
           "$HOME/Library/Containers/com.omnigroup.OmniFocus4/Data/Library/Application Support/Plug-Ins/"

      2. RESTART OmniFocus completely (Cmd+Q, then reopen)

      3. CONFIGURE your MCP client:
         Add to your config: #{opt_bin}/focusrelay serve

      ⚠️  FIRST TIME SETUP:
      When you run your first query, click "Run Script" in the security dialog.

      🔄 UPGRADE NOTES:
      When upgrading, you MUST reinstall the plugin (Step 1 above) to get the latest
      JavaScript changes. The plugin and binary must stay in sync.

      📖 Full documentation: https://github.com/deverman/FocusRelayMCP
    EOS
  end

  test do
    system bin/"focusrelay", "--help"
  end
end
