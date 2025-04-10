require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "julia", "java", "typst" },
    auto_install = true,
    highlight = { enable = true},
})


