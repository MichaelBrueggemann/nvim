
-- BOOTSTRAP: Install lazy.nvim automatically if not present
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Helper function to check if a command exists
local function is_command_available(cmd)
  return vim.fn.executable(cmd) == 1
end

-- Plugin specification
require("lazy").setup({
    -- LAZY MANAGER ITSELF (not strictly necessary, but harmless)
    { "folke/lazy.nvim" },

    -- AUTOCOMPLETION
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },

    -- OPEN/CLOSE BRACKETS
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true, -- Enables default setup
    },

    -- COMMENTS
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        }
    },

    -- ATOM ONE DARK COLORSCHEME
    {
        "olimorris/onedarkpro.nvim",
        priority = 1000,
        opts = {
          options = {  }
        },
        config = function(_, opts)
          require("onedarkpro").setup(opts)
          vim.cmd.colorscheme("onedark")
        end,
    },

    -- MASON + LSP
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },

    -- SUPPORT FOR DEBUG ADAPTER PROTOCOL
    { "mfussenegger/nvim-dap" },

    -- SNIPPET ENGINE
    { "L3MON4D3/LuaSnip" },
    { "saadparwaiz1/cmp_luasnip" },

    -- TELESCOPE
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- HARPOON
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    
    {
      "nvim-tree/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
    },
    -- TREESITTER
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },

    -- LAZYGIT (only if available)
    (is_command_available("lazygit") and {
        "kdheepak/lazygit.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        }) or nil,
    })

-- Optionally, you can print a message if lazygit is not installed
if not is_command_available("lazygit") then
  vim.schedule(function()
    vim.notify("'lazygit' isn't installed. Please install 'lazygit' for lazygit.nvim support.", vim.log.levels.WARN)
  end)
end
