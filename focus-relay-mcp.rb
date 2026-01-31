# Homebrew Formula for FocusRelayMCP
# This formula installs both the MCP server binary and the OmniFocus plugin

class FocusRelayMcp < Formula
  desc "MCP server for OmniFocus - query tasks via AI assistants"
  homepage "https://github.com/deverman/FocusRelayMCP"
  url "https://github.com/deverman/FocusRelayMCP/releases/download/v0.9.0-beta/focus-relay-mcp-0.9.0-beta.tar.gz"
  sha256 "f78b155c59f5a73c0c12961a78ac24d629cc90ed83fc902c8d86464de76c235d"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "focus-relay-mcp"
    (pkgshare/"Plugin").install "FocusRelayBridge.omnijs"
  end

  def caveats
    <<~EOS
      ✅ FocusRelayMCP has been installed!

      📍 Binary location: #{opt_bin}/focus-relay-mcp
      🔌 Plugin location: #{pkgshare}/Plugin/FocusRelayBridge.omnijs

      🔄 NEXT STEPS:

      1. INSTALL the OmniFocus plugin:
         cp -r #{pkgshare}/Plugin/FocusRelayBridge.omnijs \
           ~/Library/Containers/com.omnigroup.OmniFocus4/Data/Library/Application\\ Support/Plug-Ins/

      2. RESTART OmniFocus completely (Cmd+Q, then reopen)

      3. CONFIGURE your MCP client:
         Add to your config: #{opt_bin}/focus-relay-mcp

      ⚠️  FIRST TIME SETUP:
      When you run your first query, click "Run Script" in the security dialog.

      📖 Full documentation: https://github.com/deverman/FocusRelayMCP
    EOS
  end

  test do
    system bin/"focus-relay-mcp", "--help"
  end
end
