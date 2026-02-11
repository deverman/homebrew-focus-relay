# Homebrew Formula for FocusRelayMCP
# This formula installs both the MCP server binary and the OmniFocus plugin

class Focusrelay < Formula
  desc "MCP server for OmniFocus - query tasks via AI assistants"
  homepage "https://github.com/deverman/FocusRelayMCP"
  url "https://github.com/deverman/FocusRelayMCP/releases/download/v0.9.1-beta/focusrelay-0.9.1-beta.tar.gz"
  sha256 "aea8b3345d00bbd067bc9473c1aa6166216248384bdd4b5603dfc3252435dc3c"
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
           ~/Library/Containers/com.omnigroup.OmniFocus4/Data/Library/Application\\ Support/Plug-Ins/

      2. RESTART OmniFocus completely (Cmd+Q, then reopen)

      3. CONFIGURE your MCP client:
         Add to your config: #{opt_bin}/focusrelay

      ⚠️  FIRST TIME SETUP:
      When you run your first query, click "Run Script" in the security dialog.

      📖 Full documentation: https://github.com/deverman/FocusRelayMCP
    EOS
  end

  test do
    system bin/"focusrelay", "--help"
  end
end
