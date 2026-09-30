# Rigby Works Homebrew tap

Install [lazyxcode](https://github.com/rigbyworks/lazyxcode), a terminal UI for building, running, and testing Xcode projects:

```sh
brew install rigbyworks/tap/lazyxcode
```

The formula builds lazyxcode from its tagged source on an Apple Silicon Mac running macOS 15 or newer. Building needs Xcode 27 or newer. The projects you use lazyxcode with need full Xcode 16.3 or newer.

Upgrade with `brew update && brew upgrade lazyxcode`. `brew uninstall lazyxcode` removes the executable and leaves your preferences, history, and caches in place.

Each lazyxcode release opens a formula update PR here. Merge it only after the package checks pass.
