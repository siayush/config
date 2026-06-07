-- Dracula color scheme.
return {
  "Mofiqul/dracula.nvim",
  lazy = false,    -- load during startup
  priority = 1000, -- load before other plugins so it sets the colors
  config = function()
    require("dracula").setup({
      italic_comment = true,
    })
    vim.cmd.colorscheme("dracula")
  end,
}
