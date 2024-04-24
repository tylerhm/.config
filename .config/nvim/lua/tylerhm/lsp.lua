-- Meta LSP
local meta = require "meta.nvim"

for _, lsp in ipairs {
  "rust-analyzer@meta",
  "pyls@meta",
  "pyre@meta",
  "thriftlsp@meta",
  "cppls@meta",
} do
  require "lspconfig"[lsp].setup {
    on_attach = on_attach,
  }
end

require "null-ls".setup({
  on_attach = on_attach,
  sources = {
    meta.null_ls.diagnostics.arclint,
    meta.null_ls.formatting.arclint,
  }
})
