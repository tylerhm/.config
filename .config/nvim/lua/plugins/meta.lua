return {
  dir = "~/.config/nvim/meta",
  name = "meta.nvim",
  config = function()
    require "meta.hg".setup()
    require "meta.cmds"
  end
}
