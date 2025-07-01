
require("nvim-autopairs").setup({
  disable_filetype = { "TelescopePrompt", "vim" }, -- disable nvim-autopairs in specific contexts
  check_ts = true, -- Enable Treesitter integration
})
