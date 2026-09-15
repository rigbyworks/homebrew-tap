# Rigby Works Homebrew tap

Install lazyxcode on an Apple Silicon Mac running macOS 15 or newer:

```sh
brew install rigbyworks/tap/lazyxcode
```

The formula builds from tagged source using Go. Full Xcode 16.3 or newer is required to use lazyxcode with a project.

Upgrade with `brew update && brew upgrade lazyxcode`. Remove the executable with `brew uninstall lazyxcode`; user preferences, history, and caches remain untouched.

Releases of [lazyxcode](https://github.com/rigbyworks/lazyxcode) open formula-update PRs here. Merge only after package checks pass. The first formula arrives with v0.1.0.
