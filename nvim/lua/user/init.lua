return {
  plugins = {
    {
      -- Community
      "AstroNvim/astrocommunity",
      { import = "astrocommunity.colorscheme.catppuccin" },
      { import = "astrocommunity.bars-and-lines.heirline-vscode-winbar" },
      { import = "astrocommunity.editing-support.todo-comments-nvim" },
      { import = "astrocommunity.pack.lua" },
      { import = "astrocommunity.pack.typescript" },
      { import = "astrocommunity.pack.rust" },
      { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
      {
        "m4xshen/smartcolumn.nvim",
        opts = {
          colorcolumn = "120",
        },
      },
      { import = "astrocommunity.markdown-and-latex.glow-nvim" },
    },

    -- Custom
    {
      "L3MON4D3/LuaSnip",
      config = function(plugin, opts)
        require "plugins.configs.luasnip" (plugin, opts)                                       -- include the default astronvim config that calls the setup call
        require("luasnip.loaders.from_vscode").lazy_load { paths = { "./lua/user/snippets" } } -- load snippets paths
      end,
    },
    { "andweeb/presence.nvim", lazy = false, opts = {} },
  },

  colorscheme = "catppuccin-mocha",

  mappings = {
    n = {
      ["L"] = { "<cmd>bnext<cr>", desc = "Next buffer" },
      ["H"] = { "<cmd>bprev<cr>", desc = "Prev buffer" },
      ["q:"] = { "<nop>" },
      ["<C-g>"] = { "<cmd>Glow<cr>", desc = "Open Glow markdown preview" },
    },
  },
}
