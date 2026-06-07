# Neovim Config Reference

Overview of every plugin, setting, and keybinding in this config.

> `<leader>` is the **Space** key (`vim.g.mapleader = " "`).

---

## Structure

```
init.lua                     -- entry point
lua/config/options.lua       -- editor settings + folding
lua/config/lazy.lua          -- bootstraps the lazy.nvim plugin manager
lua/plugins/                 -- one file per plugin
  ├─ colorscheme.lua         -- dracula theme
  ├─ treesitter.lua          -- syntax tree (highlight/indent/folding)
  ├─ lsp.lua                 -- language servers
  ├─ mason.lua               -- LSP/tool installer
  ├─ completion.lua          -- autocomplete popup
  ├─ telescope.lua           -- fuzzy finder
  ├─ lualine.lua             -- status bar
  └─ alpha.lua               -- startup dashboard
```

---

## Plugins

| Plugin | File | Purpose |
|--------|------|---------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | `config/lazy.lua` | Plugin manager (auto-bootstraps on first launch) |
| [dracula.nvim](https://github.com/Mofiqul/dracula.nvim) | `colorscheme.lua` | Color theme (italic comments) |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | `treesitter.lua` | Syntax-aware highlight, indent, folding (`main` branch — required for Neovim 0.12+) |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | `lsp.lua` | Language server integration |
| [mason.nvim](https://github.com/mason-org/mason.nvim) | `mason.lua` | Installs LSP servers / tools |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) + [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | `completion.lua` | Autocompletion + snippets |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | `telescope.lua` | Fuzzy finder (files, grep, buffers) + `fzf-native` sorter |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | `lualine.lua` | Status bar (shows git branch) |
| [alpha-nvim](https://github.com/goolord/alpha-nvim) | `alpha.lua` | Startup dashboard |

**Installed LSP servers** (via Mason): `gopls` (Go), `pyright` (Python), `ts_ls` (JS/TS), `clangd` (C/C++), `lua_ls` (Lua), `marksman` (Markdown).

---

## Editor settings (`options.lua`)

| Setting | Value |
|---------|-------|
| Line numbers | relative + absolute |
| Sign column | always on |
| Mouse | enabled (all modes) |
| Clipboard | system (`unnamedplus`) |
| Search | case-insensitive, smart-case |
| Indent | 2 spaces, expandtab |
| Scrolloff | 8 lines |
| Cursor | vertical I-beam in all modes |
| Folding | Tree-sitter, all open on load |

---

## Keybindings

### General
| Key | Action |
|-----|--------|
| `<Space>` | Leader key |

### LSP — active when a language server attaches
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | References |
| `gi` | Go to implementation |
| `K` | Hover docs |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |

### Telescope — fuzzy finder
| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (search across files) |
| `<leader>fb` | Open buffers |
| `<leader>fh` | Help tags |
| `<leader>fr` | Recent files |
| `<leader>fd` | Diagnostics |
| `<leader>/` | Fuzzy search in current buffer |

Inside a picker: `<C-n>`/`<C-p>` (or arrows) to move, `<CR>` to open, `<C-x>`/`<C-v>`/`<C-t>` to open in split/vsplit/tab, `<Esc>` to close.

### Completion — insert mode, when the popup is open
| Key | Action |
|-----|--------|
| `<C-Space>` | Open completion menu |
| `<Tab>` / `<S-Tab>` | Next / previous item |
| `<CR>` | Confirm selection |
| `<C-e>` | Close menu |
| `<C-d>` / `<C-u>` | Scroll docs down / up |

### Folding
| Key | Action |
|-----|--------|
| `za` | Toggle fold under cursor |
| `zo` / `zc` | Open / close fold |
| `zR` | Open all folds |
| `zM` | Close all folds |
| `zj` / `zk` | Jump to next / previous fold |

### Dashboard (alpha) — on the startup screen
| Key | Action |
|-----|--------|
| `n` | New file |
| `e` | File explorer (netrw) |
| `r` | Recent files |
| `c` | Edit config |
| `l` | Open Lazy |
| `m` | Open Mason |
| `q` | Quit |

---

## Useful commands

| Command | Action |
|---------|--------|
| `:Lazy` | Plugin manager UI |
| `:Lazy sync` | Install / update / clean plugins |
| `:Mason` | LSP / tool installer UI |
| `:LspInfo` | Show LSP servers attached to the buffer |
| `:InspectTree` | View the Tree-sitter syntax tree |
| `:TSInstall <lang>` | Install a Tree-sitter parser |
| `:TSUpdate` | Update / recompile parsers |
| `:checkhealth` | Diagnose config / plugin issues |
