# dotfiles

My macOS development environment managed by [chezmoi](https://www.chezmoi.io/).

## What's included

| Category | Files | Description |
|----------|-------|-------------|
| Zsh | `~/.zshrc` | Powerlevel10k, aliases, PATH |
| Claude Code | `~/.claude/` | Settings, rules, skills, plugins config |
| Ghostty | `~/Library/Preferences/com.mitchellh.ghostty.plist` | Terminal emulator preferences |

## Quick start (new Mac)

### 1. Prerequisites

```bash
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install essentials
brew install chezmoi ghostty node
npm install -g @anthropic-ai/claude-code
```

### 2. Apply dotfiles

```bash
chezmoi init --apply git@github.com:tomatosliu/dotfiles.git
```

This deploys all config files to their correct locations.

### 3. Install Claude Code plugins

Plugins are not synced (they contain large cached binaries). Reinstall them:

```bash
claude /plugin marketplace add affaan-m/everything-claude-code
claude /plugin install everything-claude-code
claude /plugin marketplace add jarrodwatts/claude-hud
claude /plugin install claude-hud
```

### 4. Reload shell

```bash
source ~/.zshrc
```

## Day-to-day usage

### After editing any config file

```bash
# Update chezmoi's copy from the live file
chezmoi re-add

# Review and push
cd ~/.local/share/chezmoi
git add -A && git commit -m "update configs" && git push
```

### Pull latest on another machine

```bash
chezmoi update
```

### Preview what would change before applying

```bash
chezmoi diff
```

### Add a new config file

```bash
chezmoi add ~/.config/some-app/config.yaml
```

## Notes

- `settings.local.json` contains machine-specific permission rules. You may want to adjust after applying on a new machine.
- Claude Code plugins need to be reinstalled per machine (step 3).
- Ghostty config is stored as a plist; edit via Ghostty's UI, then `chezmoi re-add` to capture changes.
