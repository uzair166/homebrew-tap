cask "limitwen" do
  version "0.1.1"
  sha256 "6b2aa6dd6aa965c1cac9dd20c04309aa5882e9e560c71e5b0b1bcbde785d7709"

  url "https://github.com/uzair166/limitwen-app/releases/download/v#{version}/Limitwen-#{version}-universal-notarized.zip"
  name "Limitwen"
  desc "Claude Code and Codex usage limits in your menu bar"
  homepage "https://github.com/uzair166/limitwen-app"

  depends_on macos: :sonoma

  app "Limitwen.app"

  uninstall quit: "app.limitwen.mac"
end
