cask "limitwen" do
  version "0.1.2"
  sha256 "ea06062c32a04e7a0cc22e4bf813c6db2ec56a20f147dbf5167e5548fe8340fc"

  url "https://github.com/uzair166/limitwen-app/releases/download/v#{version}/Limitwen-#{version}-universal-notarized.zip"
  name "Limitwen"
  desc "Claude Code and Codex usage limits in your menu bar"
  homepage "https://github.com/uzair166/limitwen-app"

  depends_on macos: :sonoma

  app "Limitwen.app"

  uninstall quit: "app.limitwen.mac"

  zap trash: [
    "~/Library/Application Support/Limitwen",
    "~/Library/Preferences/app.limitwen.mac.plist",
  ]
end
