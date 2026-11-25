cask "better-kumo" do
  version "0.2.13"
  sha256 "4e028472d7ac43a18237f76f0617752a67ccf3f1d0f78d96a6369108f967ace3"

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
