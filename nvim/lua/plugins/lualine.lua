-- Status bar.
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    options = {
      theme = "dracula",
      globalstatus = true, -- one status line for the whole window (LazyVim style)
      component_separators = "",
      section_separators = "",
    },
    -- Show only the git branch.
    sections = {
      lualine_a = {},
      lualine_b = { "branch" },
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
  },
}
