for _, source in ipairs {
  "tylerhm.bootstrap",
	"tylerhm.options",
	"tylerhm.lazy",
	"tylerhm.nvim-treesitter",
	"tylerhm.meta",
	"tylerhm.lsp",
	"tylerhm.mappings",
	"tylerhm.colors",
} do
  local status_ok, fault = pcall(require, source)
  if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
end
