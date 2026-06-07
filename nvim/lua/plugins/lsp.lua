-- LSP setup via Neovim's native vim.lsp.config API (0.11+); mason installs the servers.
return {
  "neovim/nvim-lspconfig",
  -- Load after startup so ensure_installed can pull missing servers.
  event = "VeryLazy",
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp", -- advertises LSP completion capabilities
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Defaults for every server.
    vim.lsp.config("*", { capabilities = capabilities })

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } }, -- don't warn about the `vim` global
        },
      },
    })

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "gopls",    -- Go
        "pyright",  -- Python
        "ts_ls",    -- JavaScript / TypeScript
        "clangd",   -- C / C++
        "lua_ls",   -- Lua
        "marksman", -- Markdown
      },
    })

    -- Buffer-local keymaps, set on server attach.
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
