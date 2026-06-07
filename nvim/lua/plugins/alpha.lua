-- alpha-nvim: startup dashboard shown when Neovim opens with no file.
return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
    }

    dashboard.section.buttons.val = {
      dashboard.button("n", "  New file", "<cmd>ene <BAR> startinsert<cr>"),
      dashboard.button("e", "  File explorer", "<cmd>Explore<cr>"),
      dashboard.button("r", "  Recent files", "<cmd>browse oldfiles<cr>"),
      dashboard.button("c", "  Config", "<cmd>edit ~/.config/nvim/init.lua<cr>"),
      dashboard.button("l", "  Lazy (plugins)", "<cmd>Lazy<cr>"),
      dashboard.button("m", "  Mason (LSP)", "<cmd>Mason<cr>"),
      dashboard.button("q", "  Quit", "<cmd>qa<cr>"),
    }

    alpha.setup(dashboard.opts)
  end,
}
