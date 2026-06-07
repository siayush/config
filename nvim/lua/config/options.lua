-- Editor settings and globals.

-- True color is required for the theme to render correctly in the terminal.
vim.opt.termguicolors = true

-- Leader must be set before plugins/mappings are loaded.
vim.g.mapleader = " "

-- A few sensible defaults.
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.scrolloff = 8

-- Tree-sitter-based code folding (uses Neovim's built-in foldexpr, 0.10+).
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- Start with all folds open so files don't load collapsed.
vim.opt.foldlevelstart = 99

-- Use a vertical I-beam cursor in every mode.
vim.opt.guicursor = "a:ver25"

-- Hide the netrw banner (the comment header at the top of the listing).
vim.g.netrw_banner = 0
