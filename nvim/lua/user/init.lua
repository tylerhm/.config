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
    },
  },

  colorscheme = "catppuccin-mocha",

  mappings = {
    n = {
      ["L"] = { "<cmd>bnext<cr>", desc = "Next buffer" },
      ["H"] = { "<cmd>bprev<cr>", desc = "Prev buffer" },
      ["q:"] = { "<nop>" },
    },
  },

  lsp = {
    config = {
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = true,
            check = {
              command = "clippy",
            },
          },
        },
      },
    },
  },
}
