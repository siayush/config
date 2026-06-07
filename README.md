# config

My personal dotfiles — editor, terminal, and shell configuration.

## Structure

| Folder | What it is | Lives at (on macOS) |
|--------|-----------|---------------------|
| [`nvim/`](nvim/) | Neovim config (lazy.nvim, LSP, completion, Dracula) | `~/.config/nvim/` |
| [`ghostty/`](ghostty/) | Ghostty terminal config | `~/.config/ghostty/config` |
| [`vscode/`](vscode/) | VS Code `settings.json` + `keybindings.json` | `~/Library/Application Support/Code/User/` |
| [`zsh/`](zsh/) | `.zshrc` + Powerlevel10k theme | `~/.zshrc`, `~/.p10k.zsh` |
| [`tmux/`](tmux/) | tmux config | `~/.tmux.conf` |

## Neovim

Modular lazy.nvim setup:

```
nvim/
├── init.lua                 # entry point
└── lua/
    ├── config/
    │   ├── options.lua      # editor settings
    │   └── lazy.lua         # plugin-manager bootstrap
    └── plugins/
        ├── colorscheme.lua  # Dracula
        ├── lualine.lua      # status bar
        ├── mason.lua        # LSP server installer
        ├── lsp.lua          # gopls, pyright, ts_ls, clangd, lua_ls
        └── completion.lua   # nvim-cmp + LuaSnip
```

## Install

Symlink each config to its expected location, e.g.:

```sh
ln -s "$PWD/nvim"             ~/.config/nvim
ln -s "$PWD/ghostty/config"   ~/.config/ghostty/config
ln -s "$PWD/zsh/zshrc"        ~/.zshrc
ln -s "$PWD/zsh/p10k.zsh"     ~/.p10k.zsh
ln -s "$PWD/tmux/tmux.conf"   ~/.tmux.conf
ln -s "$PWD/vscode/settings.json"    "$HOME/Library/Application Support/Code/User/settings.json"
ln -s "$PWD/vscode/keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json"
```

### Prerequisites
- [Neovim](https://neovim.io/) 0.11+
- [Ghostty](https://ghostty.org/) with a Nerd Font (this config uses **MesloLGS NF**)
- [oh-my-zsh](https://ohmyz.sh/) + [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
