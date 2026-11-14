cask "limitwen" do
  version "0.1.0"
  sha256 "b6b55c0766451a251213fdfbc52fc8cdab3a897fd3d231a7cae56b4715e3c0ff"

  url "https://github.com/uzair166/limitwen-app/releases/download/v#{version}/Limitwen-#{version}-universal-notarized.zip"
  name "Limitwen"
  desc "Claude Code and Codex usage limits in your menu bar"
  homepage "https://github.com/uzair166/limitwen-app"

  depends_on macos: :sonoma

  app "Limitwen.app"

  uninstall quit: "app.limitwen.mac"
end
