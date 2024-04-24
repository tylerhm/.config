local is_available = require "astronvim.utils".is_available

local map = function(mode, lhs, rhs, opt)
  vim.keymap.set(mode, lhs, rhs, opt)
end

-- Normal --

-- Standard Operations
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = "Move cursor down" })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = "Move cursor up" })
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
map("n", "<leader>q", "<cmd>confirm q<cr>", { desc = "Quit" })
map("n", "<leader>Q", "<cmd>confirm qall<cr>", { desc = "Quit all" })
map("n", "<leader>n", "<cmd>enew<cr>", { desc = "New File" })
map("n", "<C-s>", "<cmd>w!<cr>", { desc = "Force write" })
map("n", "<C-q>", "<cmd>qa!<cr>", { desc = "Force quit" })
map("n", "|", "<cmd>vsplit<cr>", { desc = "Vertical Split" })
map("n", "\\", "<cmd>split<cr>", { desc = "Horizontal Split" })

-- Window Mangement
map("n", "<C-k>", "<C-w>k", { desc = "Throw focus up" })
map("n", "<C-h>", "<C-w>h", { desc = "Throw focus left" })
map("n", "<C-j>", "<C-w>j", { desc = "Throw focus down" })
map("n", "<C-l>", "<C-w>l", { desc = "Throw focus right" })

-- Meta Maps
if is_available "meta.nvim" and is_available "telescope.nvim" then
  map("n", "<leader>ff", "<cmd>Telescope myles<cr>", { desc = "Search files with Myles" })
  map("n", "<leader>fw", "<cmd>Telescope biggrep r<cr>", { desc = "Search strings with regex Biggrep" })
end

-- NeoTree
if is_available "neo-tree.nvim" then
  map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle explorer" })
  map("n", "<leader>o", function()
      if vim.bo.filetype == "neo-tree" then
        vim.cmd.wincmd "p"
      else
        vim.cmd.Neotree "focus"
      end
    end,
    { desc = "Toggle explorer focus" })
end
