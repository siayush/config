-- Tree-sitter: builds a real syntax tree of each buffer, powering accurate
-- highlighting, indentation, and folding.
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter").install({
      "lua", "vim", "vimdoc", "query",
      "go", "gomod", "gosum",
      "python",
      "javascript", "typescript", "tsx",
      "c", "cpp",
      "markdown", "markdown_inline",
      "json", "yaml", "toml",
      "bash", "make", "dockerfile", "gitignore",
    })
    
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local ok = pcall(vim.treesitter.start, args.buf)
        if ok then
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
