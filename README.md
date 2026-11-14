# Uzair's Homebrew tap

Homebrew packages for my projects. A single tap can contain multiple apps and tools.

## Limitwen

[Limitwen](https://github.com/uzair166/limitwen-app) shows Claude Code and Codex subscription limits in your Mac menu bar.

```sh
brew install --cask uzair166/tap/limitwen
```

Open **Limitwen** from **Applications** afterwards. No terminal launcher, Swift compiler or Xcode is required. The universal app supports Apple silicon and Intel Macs on macOS 14+, is signed with Developer ID, and carries an Apple notarization ticket.

For short-name installation on Homebrew versions that require tap trust:

```sh
brew tap uzair166/tap
brew trust --cask uzair166/tap/limitwen
brew install --cask limitwen
```

If you installed the earlier source formula, first run `brew uninstall --formula limitwen`, then install the cask. Existing app preferences are preserved. If you manually copied an app into Applications, move that copy aside before installing; the cask will not overwrite an unrelated existing app.

## Update and uninstall

Quit Limitwen from its menu-bar menu before updating:

```sh
brew upgrade --cask uzair166/tap/limitwen
```

To remove the app:

```sh
brew uninstall --cask uzair166/tap/limitwen
```

Normal uninstall preserves app preferences. Limitwen runs in the menu bar and has no Dock icon. There is no built-in automatic updater.

## About this tap

This is an independent tap, not Homebrew's central collection. Formulae and casks for future projects can live alongside Limitwen. The tap uses [0BSD](LICENSE), with no attribution requirement.
