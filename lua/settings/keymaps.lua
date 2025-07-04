-- This file contains all changed keybindings for vim

-- set Leader key to "space"
vim.g.mapleader = ' '

local keymap_opts = { noremap = true, silent = true }

-- Remove the default mapping of the space
vim.api.nvim_set_keymap('n', '<Space>', '<Nop>', keymap_opts )

-- change "get to start and end of line"
vim.api.nvim_set_keymap('n', '<Leader>s', '0', keymap_opts) -- jump to start of line
vim.api.nvim_set_keymap('n', '<Leader>e', '$', keymap_opts) -- jump to end of line

-- change binding of "delete" key
vim.keymap.set('n', 'x', '<delete>', keymap_opts)

-- change bindings to move to first [c]urly brackets, [r]ound brackets and [s]quare brackets in the current line.
vim.keymap.set('n', '<leader>b', '%', keymap_opts) -- change "matchpairs"
vim.keymap.set('n', 'mc', 'f{', keymap_opts) -- jump forward
vim.keymap.set('n', 'mC', 'F{', keymap_opts) -- jump backwards
vim.keymap.set('n', 'mr', 'f(', keymap_opts) -- jump forward
vim.keymap.set('n', 'mR', 'F(', keymap_opts) -- jump backwards
vim.keymap.set('n', 'ms', 'f[', keymap_opts) -- jump forward
vim.keymap.set('n', 'mS', 'F[', keymap_opts) -- jump backwards


-- TERMINAL
-- vim.api.nvim_set_keymap('n', '<C-t>', ':vs +te<CR>', keymap_opts) -- open terminal with vertikal split
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', keymap_opts)                -- go to "normal" mode with "Esc" while in "Terminal" mode

