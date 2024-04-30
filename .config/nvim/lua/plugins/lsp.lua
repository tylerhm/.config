return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      for _, lsp in ipairs {
        "cppls@meta",
        "buckls@meta",
        "lua_ls"
      } do
        require "lspconfig"[lsp].setup {
          on_attach = function()
          end,
        }
      end
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "meta.nvim" },
    config = function()
      local meta = require "meta"
      require "null-ls".setup({
        on_attach = function()
        end,
        sources = {
          meta.null_ls.diagnostics.arclint,
          meta.null_ls.formatting.arclint,
        }
      })
    end
  },
}
