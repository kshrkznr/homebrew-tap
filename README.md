# CTK Homebrew Tap

This Tap distributes the exact macOS CLI archives published by
[`kshrkznr/code-toolkit`](https://github.com/kshrkznr/code-toolkit/releases).
It does not install or own CTK Workspace state.

## Install

```bash
brew install kshrkznr/tap/ctk
```

Then confirm that the installed executable and its packaged documentation are
available without a CTK Workspace:

```bash
ctk version
ctk docs status
```

See the [CTK README](https://github.com/kshrkznr/code-toolkit#readme) for
Getting Started guidance.

## Upgrade and remove

```bash
brew update
brew upgrade ctk
brew uninstall ctk
```

Uninstalling the Formula removes the Homebrew-managed CLI only. Cookbook
Source, Dist, Archive, `.vsix`, and other independently located CTK Workspace
state remain user-owned.

Rollback instructions will be documented only after a retained-version route
has been exercised on a target Mac. Until then, use a verified archive from the
corresponding CTK GitHub Release when an older executable is required.

## Scope

- Supported package targets: macOS arm64 and amd64.
- Linux is not supported because CTK does not currently publish a Linux Release
  artifact.
- Formula updates consume published CTK archives and SHA-256 values; they do
  not rebuild CTK.
