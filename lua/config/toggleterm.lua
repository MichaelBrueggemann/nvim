require("toggleterm").setup{
  direction = "vertical",
  size = 80, -- adjust as needed
}

-- KEYMAPS
vim.api.nvim_set_keymap('n', '<C-t>', '<cmd>ToggleTerm<CR>', {noremap = true, silent = true})
-- duplicate for terminal mode
vim.api.nvim_set_keymap('t', '<C-t>', '<cmd>ToggleTerm<CR>', {noremap = true, silent = true})
