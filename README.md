# dotfiles

macOS dotfiles managed with [chezmoi](https://www.chezmoi.io/), [Mackup](https://github.com/lra/mackup), and [Homebrew](https://brew.sh/).

## Setup

Run this single command on a new Mac:

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply keimlink
```

During setup you will be asked to choose a machine profile (`personal` or `work`). This choice drives which software gets installed and which configuration is applied.

## What's Included

| Component | Tool | Description |
|-----------|------|-------------|
| Dotfile orchestration | chezmoi | Templates, scripts, secrets |
| App config management | Mackup | Sublime Text, Ghostty, Dash, zsh, git, ssh |
| Software installation | Homebrew + Brewfile | CLI tools, desktop apps, App Store apps |
| Zsh plugin management | Zinit | Oh My Zsh snippets + third-party plugins |
| Prompt | Starship | Fast, minimal prompt |
| Firefox extensions | Enterprise policies | uBlock Origin, Bitwarden, Dark Reader |
| macOS preferences | `macos-defaults.sh` | Finder, Dock, keyboard, screenshots |

### Shared (both profiles)

**CLI tools:** git, gh, mas, mackup, zsh, jq, ripgrep, fzf, tree, wget, chezmoi, podman, starship

**Desktop apps:** Firefox, Sublime Text, Podman Desktop, Rectangle, Copilot CLI

### Personal profile only

- 1Password + 1Password CLI
- VLC, Steam
- Amphetamine, Magnet (App Store)
- 1Password SSH agent integration

### Work profile only

- Microsoft Outlook, Teams, To Do, Edge, Keeper Password Manager (App Store)

## Profile System

chezmoi prompts for the machine profile on first run and stores the choice in `~/.config/chezmoi/chezmoi.toml`. The profile controls:

- Git email address
- Which Brewfile entries are installed
- 1Password integration (personal only)
- SSH config (1Password agent on personal)

## Updating

```sh
# Update Homebrew packages (includes GitHub Copilot CLI via cask)
brew update && brew upgrade

# Pull and apply the latest dotfile changes
chezmoi update
```

GitHub Copilot CLI is installed as a Homebrew cask (`copilot-cli`) and is therefore updated alongside all other Homebrew packages with `brew upgrade`.

## App Configs (Mackup)

Mackup manages config files for: Sublime Text, Ghostty, Dash, zsh, git, ssh.

After setting up a new Mac, `mackup restore` is run automatically by the chezmoi bootstrap script.

To add a new app:

1. Add the app name to `~/.mackup.cfg` (managed via `dot_mackup.cfg.tmpl`)
2. Run `mackup backup`
3. Commit the new config files
