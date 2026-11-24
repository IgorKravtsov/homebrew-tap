cask "better-kumo" do
  version "0.2.6"
  sha256 "2bff01d1c0d9b30e853a82238639cce242517944a76fb4dbf75853823a9a2934"

  url "https://github.com/IgorKravtsov/better-kumo-app/releases/download/v#{version}/Better-Kumo-macOS-#{version}.zip"
  name "Better Kumo"
  desc "Control your Kumospace desktop from your phone"
  homepage "https://github.com/IgorKravtsov/better-kumo-app"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

  app "Better Kumo.app"
  binary "#{appdir}/Better Kumo.app/Contents/MacOS/kumo-mcp"

  uninstall quit: "com.kravtsov.kumowatch.desktop"

  zap trash: [
    "~/.config/kumowatch/relay.toml",
    "~/.local/share/kumowatch-relay",
    "~/.local/share/kumowatch-mcp",
    "~/Library/Logs/kumowatch",
  ]

  caveats <<~EOS
    Better Kumo is not notarized by Apple. The first time, open it from Applications, then allow it in
    System Settings → Privacy & Security → Open Anyway (or right-click it → Open).
    Then turn on "Start at login" in its menu bar menu.
  EOS
end
