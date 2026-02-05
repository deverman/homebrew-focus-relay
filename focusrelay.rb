# Homebrew Formula for FocusRelayMCP
# This formula installs both the MCP server binary and the OmniFocus plugin

class Focusrelay < Formula
  desc "MCP server for OmniFocus - query tasks via AI assistants"
  homepage "https://github.com/deverman/FocusRelayMCP"
  url "https://github.com/deverman/FocusRelayMCP/releases/download/v0.9.2-beta/focusrelay-0.9.2-beta.tar.gz"
  sha256 "df1931a28752430fed526495dbd5a61bc9bd5cb3cb14c8492c3b8dd1e2685d05"
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
           ~/Library/Containers/com.omnigroup.OmniFocus4/Data/Library/Application\ Support/Plug-Ins/

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
