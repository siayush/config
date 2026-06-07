-- LSP: mason installs the servers, lspconfig ships their default configs,
-- and Neovim's native vim.lsp.config/enable API wires them up (Neovim 0.11+).
return {
  "neovim/nvim-lspconfig",
  -- Load shortly after startup (not waiting for a file) so `ensure_installed`
  -- runs and missing servers download on their own.
  event = "VeryLazy",
  dependencies = {
    "mason-org/mason.nvim", -- configured in mason.lua
    "mason-org/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp", -- so completion advertises LSP capabilities
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Defaults applied to every server.
    vim.lsp.config("*", { capabilities = capabilities })

    -- Per-server overrides.
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } }, -- don't warn about the `vim` global
        },
      },
    })

    -- Install the servers; mason-lspconfig auto-enables each one.
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "gopls",   -- Go
        "pyright", -- Python
        "ts_ls",   -- JavaScript / TypeScript
        "clangd",  -- C / C++
        "lua_ls",  -- Lua (for editing this config)
      },
    })

    -- Buffer-local keymaps, set when a server attaches.
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local map = function(keys, fn, desc)
          vim.keymap.set("n", keys, fn, { buffer = args.buf, desc = "LSP: " .. desc })
        end
        map("gd", vim.lsp.buf.definition, "Go to definition")
        map("gr", vim.lsp.buf.references, "References")
        map("gi", vim.lsp.buf.implementation, "Go to implementation")
        map("K", vim.lsp.buf.hover, "Hover docs")
        map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
        map("<leader>ca", vim.lsp.buf.code_action, "Code action")
        map("[d", vim.diagnostic.goto_prev, "Previous diagnostic")
        map("]d", vim.diagnostic.goto_next, "Next diagnostic")
      end,
    })
  end,
}
