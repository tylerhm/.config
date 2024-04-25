require"nvim-treesitter.configs".setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "objc", "swift" },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}
