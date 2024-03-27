local mason = require('mason')
local mason_lsp = require('mason-lspconfig')

-- setup mason itself
mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})


-- Customized on_attach function
-- See `:help vim.diagnostic.*` for documentation on any of the below functions

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>rf', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>f', function()
        print("formatting...")
        vim.lsp.buf.format { async = true }
        print("Formatting done!")
    end, opts)


    print("Language server started: " .. client.name)
end

local lspconfig = require('lspconfig')
local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()

-- define autocompletion capabilitites
local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities(lsp_capabilities)

-- list all lsp servers, that should be installed
local lsp_servers = {
    'lua_ls',
    'julials',
    'jdtls',
}

-- install lsps
mason_lsp.setup({
    ensure_installed = lsp_servers,
    automatic_installation = true,
})


-- LSPs with custom configs
lspconfig.jdtls.setup({
    on_attach = on_attach,
    capabilities = cmp_capabilities,
    root_dir = lspconfig.util.root_pattern("pom.xml", "gradle.build", ".git"),
})




lspconfig.julials.setup({
    on_attach = on_attach,
    capabilities = cmp_capabilities,
    cmd = {"julia", "--startup-file=no", "--history-file=no", "--project", "-e", "using Pkg; Pkg.instantiate()"}
})

-- overwrite Lua LSP setup
lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {
                    'vim',
                    'require'
                },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
    on_attach = on_attach,
    capabilities = cmp_capabilities,
}
