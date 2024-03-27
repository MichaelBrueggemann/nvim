-- Install Packer automatically if it's not installed(Bootstraping)
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()


-- Reload configurations if we modify plugins.lua
-- Hint
--     <afile> - replaced with the filename of the buffer being manipulated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])


return require('packer').startup(function(use)
    -- PACKER
    use 'wbthomason/packer.nvim'

    -- AUTOCOMPLETION
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline' }

    -- ATOM ONE DARK COLORSCHEME
    use "olimorris/onedarkpro.nvim"
    


    -- MASON
    use
    {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
    }

    -- SNIPPET ENGINE
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- TELESCOPE
    use
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6', -- or, branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- HARPOON
    use
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } }
    }

    -- VIM SLIME (for interaction with REPLs)
    use 'jpalardy/vim-slime'

    -- TREESITTER
    use
    {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- LAZYGIT
    -- IMPORTANT: YOU NEED TO HAVE "lazygit" INSTALLED ON THE SYSTEM!
    if is_command_available("lazygit") then
        use
        {
            "kdheepak/lazygit.nvim",
            -- optional for floating window border decoration
            requires =
            {
                "nvim-lua/plenary.nvim",
            },
        }
    else
        print("'lazygit' isn't installed. Please install 'lazygit'")
    end

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end
)
