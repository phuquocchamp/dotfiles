# Tmux Configuration

Minimal tmux setup optimized for macOS + iTerm2 with Neovim true color support.

## Requirements

- tmux >= 3.1
- iTerm2: set **Left Option Key** to `Esc+` (Preferences → Profiles → Keys)

## Installation

```bash
mkdir -p ~/.config/tmux
# Place tmux.conf in this directory, then start tmux
tmux
```

---

## Keymaps

> Prefix key is the default: `Ctrl+b`

### Pane Management

| Shortcut | Action |
|----------|--------|
| `Ctrl+b` `\|` | Split pane vertically (side by side) |
| `Ctrl+b` `-` | Split pane horizontally (top / bottom) |
| `Ctrl+b` `x` | Kill current pane |
| `Ctrl+b` `z` | Zoom / unzoom current pane (fullscreen toggle) |
| `Ctrl+b` `q` | Show pane numbers |
| `Ctrl+b` `Space` | Cycle pane layouts |

### Pane Navigation (no prefix)

> On Mac, this is the **Option (⌥)** key — NOT Command (⌘) or Win key.
> iTerm2 must have **Left Option Key = `Esc+`** set for this to work.

| Shortcut | Action |
|----------|--------|
| `Option+←` | Move to left pane |
| `Option+→` | Move to right pane |
| `Option+↑` | Move to pane above |
| `Option+↓` | Move to pane below |

### Window Management

| Shortcut | Action |
|----------|--------|
| `Ctrl+b` `c` | Create new window |
| `Ctrl+b` `1`–`9` | Switch to window by number |
| `Ctrl+b` `n` | Next window |
| `Ctrl+b` `p` | Previous window |
| `Ctrl+b` `,` | Rename current window |
| `Ctrl+b` `&` | Kill current window |

### Session Management

| Shortcut | Action |
|----------|--------|
| `Ctrl+b` `d` | Detach from session |
| `Ctrl+b` `s` | List and switch sessions |
| `Ctrl+b` `$` | Rename current session |

### Misc

| Shortcut | Action |
|----------|--------|
| `Ctrl+b` `r` | Reload config |
| `Ctrl+b` `[` | Enter scroll/copy mode (exit with `q`) |
| `Ctrl+b` `?` | Show all keybindings |
| `Ctrl+b` `:` | Open command prompt |

---

## Config Overview

| Setting | Value | Description |
|---------|-------|-------------|
| Mouse | on | Click to select panes, scroll with wheel |
| Base index | 1 | Windows and panes start at 1 |
| Terminal | tmux-256color | True color for Neovim themes |
| Status position | bottom | Status bar at the bottom |
| Status left | session name | Session name in a Mauve block (Catppuccin `#cba6f7`) |
| Status center | window list | Inactive windows on Surface0 bg; active window on Mauve bg |
| Status right | hostname · time · date | Hostname (Teal on Surface1) · HH:MM (dark on Blue) · Day DD Mon (dark on Peach) |

---

## Common Workflow

```bash
# Start a new session
tmux

# Create a side-by-side layout
Ctrl+b |      # split left/right
Ctrl+b -      # split top/bottom

# Navigate panes
Alt+Arrow

# Zoom into a pane
Ctrl+b z      # fullscreen
Ctrl+b z      # back to normal

# Detach (session keeps running in background)
Ctrl+b d

# Reattach later
tmux attach
```
