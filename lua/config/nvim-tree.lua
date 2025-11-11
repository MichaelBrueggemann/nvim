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


-- HOTKEYS
    -- a (add) allows the creation of files or folders, creating a folder is done by following the name with the slash /. E.g. /nvchad/nvimtree.md will create the related markdown file while /nvchad/nvimtree/ will create the nvimtree folder. The creation will occur by default at the location where the cursor is in the file explorer at that time, so the selection of the folder where to create the file will have to be done previously or alternatively you can write the full path in the statusline, in writing the path you can make use of the auto-complete function
    -- r (rename) to rename the selected file from the original name
    -- Ctrl + r to rename the file regardless of its original name
    -- d (delete) to delete the selected file or in case of a folder delete the folder with all its contents
    -- x (cut) to cut and copy the selection to the clipboard, can be files or folders with all its contents, with this command associated with the paste command you make the file moves within the tree
    -- c (copy) like the previous command this copies the file to the clipboard but keeps the original file in its location
    -- p (paste) to paste the contents of the clipboard to the current location
    -- y to copy only the file name to the clipboard, there are also two variants which are Y to copy the relative path and g + y to copy the absolute path
