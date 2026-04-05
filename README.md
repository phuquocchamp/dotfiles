# dotfiles

Minimal, modern dotfiles for macOS/Linux — Neovim + Tmux with a consistent **Catppuccin Mocha** theme, managed via [GNU Stow](https://www.gnu.org/software/stow/).

---

## Requirements

| Tool | Version |
|------|---------|
| Neovim | >= 0.10 |
| Tmux | >= 3.1 |
| Git | any |
| Node.js | for TypeScript LSP |
| Python 3 | for Pyright LSP |
| [Nerd Font](https://www.nerdfonts.com/) | for icons |
| GNU Stow | for symlink management |

> **macOS**: iTerm2 with *Left Option Key = Esc+* is required for Tmux Option-key pane navigation.

---

## Installation

### Quick (automated)

```bash
git clone git@github.com:phuquocchamp/dotfiles.git ~/dotfiles
cd ~/dotfiles
bash install.sh
```

The script will:
1. Install all dependencies via Homebrew (macOS) or apt (Linux)
2. Symlink configs into `~/.config/` using GNU Stow
3. On first `nvim` launch, lazy.nvim auto-installs all plugins and LSP servers

### Manual

```bash
# Install dependencies (macOS example)
brew install neovim git ripgrep fd node stow tmux

# Clone repo
git clone git@github.com:phuquocchamp/dotfiles.git ~/dotfiles

# Stow packages
cd ~/dotfiles
stow --restow nvim
stow --restow tmux
```

### Verify symlinks

```bash
ls -la ~/.config/nvim
ls -la ~/.config/tmux
```

---

## Structure

```
dotfiles/
├── install.sh
├── nvim/
│   └── .config/nvim/
│       ├── init.lua
│       ├── lazy-lock.json
│       └── lua/
│           ├── config/
│           │   ├── keymaps.lua
│           │   └── options.lua
│           └── plugins/
│               ├── editor.lua
│               ├── lsp.lua
│               └── ui.lua
└── tmux/
    └── .config/tmux/
        └── tmux.conf
```

---

## Neovim

### Plugins

| Category | Plugin | Purpose |
|----------|--------|---------|
| UI | catppuccin/nvim | Colorscheme (Mocha) |
| UI | lualine.nvim | Statusline |
| Editor | telescope.nvim | Fuzzy finder |
| Editor | neo-tree.nvim | File explorer |
| Editor | gitsigns.nvim | Git diff in gutter |
| Editor | which-key.nvim | Keybinding hints |
| LSP | nvim-lspconfig | LSP client |
| LSP | mason.nvim | LSP server installer |
| LSP | nvim-cmp + LuaSnip | Autocompletion + snippets |

### LSP Servers (auto-installed)

- `ts_ls` — TypeScript / JavaScript
- `pyright` — Python
- `lua_ls` — Lua

### Keybindings

**Leader key**: `Space`

#### Navigation
| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Move between windows |
| `<C-d>` / `<C-u>` | Scroll half-page down/up (centered) |

#### File & Search
| Key | Action |
|-----|--------|
| `<Space>e` | Toggle file explorer (Neo-tree) |
| `<Space>ff` | Find files (Telescope) |
| `<Space>fg` | Live grep |
| `<Space>fb` | List buffers |

#### LSP
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Find references |
| `gi` | Go to implementation |
| `K` | Hover documentation |
| `<Space>rn` | Rename symbol |
| `<Space>ca` | Code action |
| `<Space>d` | Show diagnostics |
| `[d` / `]d` | Previous / next diagnostic |

#### Completion
| Key | Action |
|-----|--------|
| `<C-Space>` | Trigger completion |
| `<CR>` | Confirm selection |
| `<Tab>` / `<S-Tab>` | Next / previous item |
| `<C-e>` | Abort completion |

---

## Tmux

**Prefix**: `Ctrl+b`

### Pane Management
| Key | Action |
|-----|--------|
| `Prefix` + `\|` | Split vertically |
| `Prefix` + `-` | Split horizontally |
| `Option+Arrow` | Navigate panes (no prefix) |
| `Prefix` + `z` | Zoom / unzoom pane |

### Window & Session
| Key | Action |
|-----|--------|
| `Prefix` + `c` | New window |
| `Prefix` + `1–9` | Jump to window |
| `Prefix` + `n/p` | Next / previous window |
| `Prefix` + `d` | Detach session |
| `Prefix` + `s` | List sessions |
| `Prefix` + `r` | Reload config |

### Status Bar

```
[ SESSION | WINDOW LIST | HOSTNAME · TIME · DATE ]
```

Catppuccin Mocha themed: Mauve session name, Teal hostname, Blue time, Peach date.

---

## Theme

[Catppuccin Mocha](https://github.com/catppuccin/catppuccin) applied consistently across Neovim and Tmux.

| Element | Color |
|---------|-------|
| Background | `#1e1e2e` |
| Text | `#cdd6f4` |
| Accent (Mauve) | `#cba6f7` |
| Teal | `#94e2d5` |
| Blue | `#89b4fa` |
| Peach | `#fab387` |
