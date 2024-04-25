-- Meta LSP
local meta = require "meta"

for _, lsp in ipairs {
  "cppls@meta",
  "buckls@meta",
  "lua_ls"
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
