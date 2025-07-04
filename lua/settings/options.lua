-- Hint: use `:h <option>` to figure out the meaning if needed

-- Clipboard
vim.opt.clipboard = 'unnamedplus' -- use system clipboard

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- Tab
vim.o.list = true -- Enable list mode to show special characters
vim.opt.tabstop = 4 -- number of visual spaces per TAB
vim.opt.softtabstop = 4 -- number of spacesin tab when editing
vim.opt.shiftwidth = 4 -- insert 4 spaces on a tab
vim.opt.expandtab = true -- tabs are spaces, mainly because of python
vim.opt.swapfile = false -- do not create swap files
vim.o.listchars = "tab:▸\\ ,space:·" -- Set listchars to show spaces as dots and tabs as arrows

-- UI config
vim.opt.number = true          -- show absolute number
vim.opt.relativenumber = false -- add numbers to each line on the left side
vim.opt.cursorline = false     -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true      -- open new vertical split bottom
vim.opt.splitright = true      -- open new horizontal splits right
vim.opt.termguicolors = true        -- enable 24-bit RGB color in the TUI
vim.opt.showmode = true        -- we are experienced, wo don't need the "-- INSERT --" mode hint

-- Searching
vim.opt.incsearch = true  -- search as characters are entered
vim.opt.hlsearch = false  -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true  -- but make it case sensitive if an uppercase is entered

-- Line Folding
vim.wo.foldminlines = 30 -- only fold blocks that are longer than the stated number
