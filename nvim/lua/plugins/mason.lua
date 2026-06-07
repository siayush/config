-- Mason: installer/manager for LSP servers, formatters, linters.
-- Standalone spec so its :Mason* commands are always available, even before
-- the LSP stack loads on opening a file.
return {
  "mason-org/mason.nvim",
  cmd = {
    "Mason",
    "MasonInstall",
    "MasonUpdate",
    "MasonUninstall",
    "MasonUninstallAll",
    "MasonLog",
  },
  opts = {},
}
