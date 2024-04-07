-- This file contains all changed keybindings for vim

-- set Leader key to "space"
vim.g.mapleader = ' '

-- Remove the default mapping of the space
vim.api.nvim_set_keymap('n', '<Space>', '<Nop>', { noremap = true, silent = true })

-- change "get to start and end of line"
vim.api.nvim_set_keymap('n', '<Leader>s', '0', { noremap = true, silent = true }) -- jump to start of line
vim.api.nvim_set_keymap('n', '<Leader>e', '$', { noremap = true, silent = true }) -- jump to end of line

-- change binding of "delete" key
vim.keymap.set('n', 'm', '<delete>', {})

-- TERMINAL
vim.api.nvim_set_keymap('n', '<C-t>', ':vs +te<CR>', { noremap = true, silent = true }) -- open terminal with vertikal split
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true })                -- go to "normal" mode with "Esc" while in "Terminal" mode

-- JULIA
function startJuliaREPL()
    -- Get current cursor position
    local original_cursor = vim.api.nvim_win_get_cursor(0)

    -- start a terminal instance
    vim.cmd(":vsp | :terminal julia --project")

    -- Go to the previous split
    vim.cmd(":wincmd p")

    vim.cmd(":SlimeConfig")

    -- Restore cursor position
    vim.api.nvim_win_set_cursor(0, original_cursor)
end

vim.api.nvim_set_keymap('n', '<Leader>jr',
    ':lua startJuliaREPL()<CR>',
    { noremap = true, silent = true }) -- open terminal with vertikal split
