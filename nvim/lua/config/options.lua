-- Editor settings and globals.

-- True color is required for the theme to render correctly in the terminal.
vim.opt.termguicolors = true

-- Leader must be set before plugins/mappings are loaded.
vim.g.mapleader = " "

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

-- Tree-sitter code folding (0.10+).
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevelstart = 99 -- start with all folds open

-- Vertical I-beam cursor in every mode.
vim.opt.guicursor = "a:ver25"

vim.g.netrw_banner = 0 -- hide the netrw banner
