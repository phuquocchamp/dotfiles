# Neovim Configuration

A minimal, fast Neovim setup built with [lazy.nvim](https://github.com/folke/lazy.nvim). Focuses on a clean editor experience with LSP support, fuzzy finding, and a polished UI.

---

## Structure

```
~/.config/nvim/
├── init.lua               # Entry point: bootstraps lazy.nvim, loads config & plugins
└── lua/
    ├── config/
    │   ├── options.lua    # Editor options (indentation, UI, behavior)
    │   └── keymaps.lua    # Global keybindings
    └── plugins/
        ├── ui.lua         # Theme and statusline
        ├── editor.lua     # Telescope, Neo-tree, Git, Which-key
        └── lsp.lua        # LSP, Mason, and autocompletion
```

---

## Plugins

### UI
| Plugin | Purpose |
|--------|---------|
| [catppuccin](https://github.com/catppuccin/nvim) | Color scheme (Mocha variant) |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline |

### Editor
| Plugin | Purpose |
|--------|---------|
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy file/text/buffer finder |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | File explorer sidebar |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git diff signs in the gutter |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keybinding popup hints |

### LSP & Completion
| Plugin | Purpose |
|--------|---------|
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP/linter/formatter installer |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | Bridges Mason with nvim-lspconfig |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP client configurations |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Autocompletion engine |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine |

**Pre-installed language servers** (via Mason): `ts_ls` (TypeScript), `pyright` (Python), `lua_ls` (Lua)

---

## Keymaps

> **Leader key:** `<Space>`

### General

| Key | Mode | Action |
|-----|------|--------|
| `<C-d>` | Normal | Scroll down half-page and center cursor |
| `<C-u>` | Normal | Scroll up half-page and center cursor |
| `p` | Visual | Paste without overwriting the unnamed register |
| `<Esc>` | Terminal | Exit terminal mode |

### Window Navigation

| Key | Mode | Action |
|-----|------|--------|
| `<C-h>` | Normal | Move to left window |
| `<C-j>` | Normal | Move to bottom window |
| `<C-k>` | Normal | Move to top window |
| `<C-l>` | Normal | Move to right window |

### File Explorer (Neo-tree)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>e` | Normal | Toggle file explorer |

### Telescope (Fuzzy Finder)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>ff` | Normal | Find files |
| `<leader>fg` | Normal | Live grep (search text in project) |
| `<leader>fb` | Normal | List open buffers |

### LSP (active in buffers with a language server)

| Key | Mode | Action |
|-----|------|--------|
| `gd` | Normal | Go to definition |
| `gr` | Normal | Find references |
| `gi` | Normal | Go to implementation |
| `K` | Normal | Hover documentation |
| `<leader>rn` | Normal | Rename symbol |
| `<leader>ca` | Normal | Code action |
| `<leader>d` | Normal | Show diagnostics for current line |
| `[d` | Normal | Jump to previous diagnostic |
| `]d` | Normal | Jump to next diagnostic |

### Autocompletion (nvim-cmp)

| Key | Mode | Action |
|-----|------|--------|
| `<C-Space>` | Insert | Trigger completion menu |
| `<CR>` | Insert | Confirm selected item |
| `<Tab>` | Insert | Select next item |
| `<S-Tab>` | Insert | Select previous item |
| `<C-e>` | Insert | Abort / close completion |

---

## Options

| Option | Value | Description |
|--------|-------|-------------|
| `number` | `true` | Show absolute line numbers |
| `relativenumber` | `true` | Show relative line numbers |
| `signcolumn` | `"yes"` | Always show sign column (prevents layout shift) |
| `cursorline` | `true` | Highlight current line |
| `termguicolors` | `true` | Enable 24-bit RGB colors |
| `tabstop` / `shiftwidth` | `2` | 2-space indentation |
| `expandtab` | `true` | Use spaces instead of tabs |
| `smartindent` | `true` | Auto-indent on new lines |
| `ignorecase` + `smartcase` | `true` | Case-insensitive search unless uppercase used |
| `clipboard` | `"unnamedplus"` | Sync with system clipboard |
| `splitright` / `splitbelow` | `true` | Open splits to the right and below |
| `swapfile` | `false` | Disable swap files |
| `undofile` | `true` | Persistent undo across sessions |
| `wrap` | `false` | Disable line wrapping |

---

## Requirements

- **Neovim** >= 0.10
- **Git** (for lazy.nvim bootstrap and gitsigns)
- A **Nerd Font** (for icons in Neo-tree, lualine, and telescope)
- `node` / `npm` — required by `ts_ls`
- `python3` — required by `pyright`

---

## Installation

```bash
# Back up existing config (if any)
mv ~/.config/nvim ~/.config/nvim.bak

# Clone this config
git clone <your-repo-url> ~/.config/nvim

# Launch Neovim — lazy.nvim will auto-install on first start
nvim
```

Mason will automatically install the configured language servers on first launch.
