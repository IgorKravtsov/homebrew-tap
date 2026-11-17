# Homebrew tap for Better Kumo

```sh
brew tap igorkravtsov/tap
brew trust igorkravtsov/tap        # newer Homebrew asks you to trust third-party taps once
brew install --cask better-kumo
```

Better Kumo is not notarized by Apple: the first time, open it from Applications, then allow it in System Settings →
Privacy & Security → **Open Anyway**.

[Better Kumo](https://github.com/IgorKravtsov/better-kumo-app) is a menu bar app that lets your phone see and
control your Kumospace desktop and sends you the office's notifications. The cask is updated automatically on
every release.

Update with `brew upgrade --cask better-kumo`; remove with `brew uninstall --cask better-kumo`
(add `--zap` to also delete its settings).
