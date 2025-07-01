require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "typst" },
    auto_install = true,
    highlight = { enable = true},
})
