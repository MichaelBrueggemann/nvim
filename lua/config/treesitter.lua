require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "typst" },
    auto_install = true,
    highlight = { enable = true},
})

-- enable treesitter based expression folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
