return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {"plenary.nvim"},
  },
  config = function()
    require("telescope").setup()
    require("plenary.filetype").add_file("meta")
    require("telescope").load_extension("myles")
    require("telescope").load_extension("biggrep")
  end,
}
