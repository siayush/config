-- Mason: installer for LSP servers, formatters, linters.
-- Standalone spec so :Mason* commands work before the LSP stack loads.
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
