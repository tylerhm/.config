local is_available = require "astronvim.utils".is_available

local map = function(mode, lhs, rhs, opt)
  vim.keymap.set(mode, lhs, rhs, opt)
end

local cwd_is_meta_repo = function()
  local path = vim.fn.getcwd()
  return (
    string.find(path, "fbsource") or  -- in FBSource dir/subdir
    string.find(path, "fbobjc")       -- in FBObjc dir/subdir
  )
end

local cwd_contains_eden = function()
  local path = vim.fn.getcwd()
  local _, depth = string.gsub(path, "/", "")
  return (
    cwd_is_meta_repo() or -- Eden repo
    depth <= 2            -- in a shallow directory, w/ Eden repo enclosed
  )
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

-- Meta file finding
if is_available "telescope.nvim" and is_available "meta.nvim" then
  map("n", "<leader>ff", function()
    if cwd_contains_eden() then
      if cwd_is_meta_repo() then
        vim.cmd "Telescope myles"
      else
        print("Cannot Myles file search from non-eden path. Cannot local search due to nested Eden repo.")
      end
    else
      require "telescope.builtin".find_files()
    end
  end,
  { desc = "Search files with Myles" })

  map("n", "<leader>fw", function()
    if cwd_contains_eden() then
      if cwd_is_meta_repo() then
        vim.cmd "Telescope biggrep r"
      else
        print("Cannot Biggrep from non-eden path. Cannot local grep due to nested Eden repo.")
      end
    else
      require "telescope.builtin".live_grep()
    end
  end,
  { desc = "Search strings with regex Biggrep" })
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


-- Linting
map("n", "<leader>l", function()
  vim.lsp.buf.format( { async = true } )
  end,
  { desc = "Format current buffer" })
