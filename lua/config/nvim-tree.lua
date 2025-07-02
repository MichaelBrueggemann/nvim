-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

local nvim_tree = require("nvim-tree")
local nvim_tree_view = require('nvim-tree.view')
nvim_tree.setup()

-- KEYMAPS
-- open/close the file tree
-- find the currently opened file in the file tree
vim.keymap.set('n', '<leader>t', function()
  if require('nvim-tree.view').is_visible() then
    vim.cmd('NvimTreeToggle')
  else
    vim.cmd('NvimTreeFocus')
  end
end, { desc = 'Toggle or focus NvimTree' })
vim.keymap.set('n', '<leader>tff', ':NvimTreeFindFile<CR>')
-- collapse the file tree recursively
vim.keymap.set('n', '<leader>tc', ':NvimTreeCollapse<CR>')
