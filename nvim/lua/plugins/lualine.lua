-- Status bar.
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    options = {
      theme = "dracula",
      globalstatus = true, -- single status line for all windows
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
