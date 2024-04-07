vim.g.slime_target = "neovim" -- all "vim-slime" commands will be send to neovims integrated terminal

vim.keymap.set('x', '<leader>s', '<Plug>SlimeRegionSend<CR>', {})

