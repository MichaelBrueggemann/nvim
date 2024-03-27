-- This file contains all changed keybindings for vim

-- set Leader key to "space"
vim.g.mapleader = ' '

-- Remove the default mapping of the space
vim.api.nvim_set_keymap('n', '<Space>', '<Nop>', {noremap = true, silent = true})

-- change "get to start and end of line"
vim.api.nvim_set_keymap('n', '<Leader>s', '0', {noremap = true, silent = true}) -- jump to start of line
vim.api.nvim_set_keymap('n','<Leader>e', '$', {noremap = true, silent = true}) -- jump to end of line

-- TERMINAL
vim.api.nvim_set_keymap('n', '<C-t>', ':vs +te<CR>', {noremap = true, silent = true}) -- open terminal with vertikal split
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true}) -- go to "normal" mode with "Esc" while in "Terminal" mode


-- JULIA
vim.api.nvim_set_keymap('n', '<Leader>jr', '[[:vsp | terminal julia --project=~/Repositories/gems<CR>]]', {noremap = true, silent = true}) -- open terminal with vertikal split
