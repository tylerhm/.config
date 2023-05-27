return {
  plugins = {
    {
      "AstroNvim/astrocommunity",
      { import = "astrocommunity.colorscheme.catppuccin" },
      { import = "astrocommunity.bars-and-lines.heirline-vscode-winbar" },
      { import = "astrocommunity.editing-support.todo-comments-nvim" },
      { import = "astrocommunity.pack.lua" },
      { import = "astrocommunity.pack.typescript" },
      { import = "astrocommunity.pack.rust" },
      { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
    },
    { "andweeb/presence.nvim", lazy = false, opts = {} },
  },

  colorscheme = "catppuccin-mocha",

  mappings = {
    n = {
      ["L"] = { "<cmd>bnext<cr>", desc = "Next buffer" },
      ["H"] = { "<cmd>bprev<cr>", desc = "Prev buffer" },
      ["q:"] = { "<nop>" },
    },
  },
}
