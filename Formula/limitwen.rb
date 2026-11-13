class Limitwen < Formula
  desc "Claude Code and Codex usage limits in your Mac menu bar"
  homepage "https://github.com/uzair166/limitwen-app"
  url "https://github.com/uzair166/limitwen-app/releases/download/v0.1.0/limitwen-source-0.1.0.tar.gz"
  sha256 "be55baf367709978afaab4d2b8d56073fefdd6093da0bffcec534d7aeb4af3ff"
  license "0BSD"

  depends_on macos: :sonoma

  def install
    swift_version = Utils.safe_popen_read("/usr/bin/xcrun", "swift", "--version")
    unless swift_version.match?(/Swift version (?:[6-9]|\d{2,})\./)
      odie "Limitwen requires Apple developer tools with Swift 6 or newer."
    end

    # Homebrew already sandboxes this build; macOS rejects a nested SwiftPM sandbox.
    inreplace "scripts/build.sh", "xcrun swift build", "xcrun swift build --disable-sandbox"
    system "./scripts/build.sh", "release"
    libexec.install "build/Limitwen.app"
    (bin/"limitwen").write <<~SH
      #!/bin/sh
      if [ "${1:-}" = "--version" ]; then
        echo "#{version}"
        exit 0
      fi
      exec /usr/bin/open "#{libexec}/Limitwen.app" --args "$@"
    SH
  end

  def caveats
    <<~EOS
      Run `limitwen` to open the menu-bar app.
      This app is compiled and signed locally, not a notarized binary download.
      Quit Limitwen before upgrading it.
    EOS
  end

  test do
    assert_path_exists libexec/"Limitwen.app/Contents/MacOS/Limitwen"
    assert_equal version.to_s, shell_output("#{bin}/limitwen --version").strip
    system "/usr/bin/codesign", "--verify", "--strict", libexec/"Limitwen.app"
  end
end
