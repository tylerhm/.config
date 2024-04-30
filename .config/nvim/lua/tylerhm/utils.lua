local M = {}

M.map = function(mode, lhs, rhs, opt)
  vim.keymap.set(mode, lhs, rhs, opt)
end

return M
