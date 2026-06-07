-- Telescope: fuzzy finder over files, buffers, grep results, LSP symbols, etc.
-- A picker UI with live filtering and a preview pane.
return {
  "nvim-telescope/telescope.nvim",
  branch = "master",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
  },
  -- Load on first use of the command or a keymap below.
  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>",  desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>",   desc = "Live grep (search in files)" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>",     desc = "Open buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>",   desc = "Help tags" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>",    desc = "Recent files" },
    { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
    { "<leader>/",  "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Search in current buffer" },
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        -- Esc closes the picker straight from insert mode (no normal-mode hop).
        mappings = {
          i = { ["<esc>"] = require("telescope.actions").close },
        },
      },
    })
    -- Enable the native sorter if it built successfully.
    pcall(telescope.load_extension, "fzf")

    -- Show line numbers in the preview pane. Telescope fires this User event
    -- once each preview buffer is loaded; we turn numbers on for that window.
    vim.api.nvim_create_autocmd("User", {
      pattern = "TelescopePreviewerLoaded",
      callback = function()
        vim.wo.number = true
      end,
    })
  end,
}
