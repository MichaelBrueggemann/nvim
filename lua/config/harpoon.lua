local harpoon = require('harpoon')

local settings = {
    save_on_toggle = true,
    sync_on_ui_close = true,
}

-- REQUIRED
harpoon:setup({
    settings = settings
})
-- REQUIRED

-- KEYMAPS
vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end) -- add a buffer to the "harpoon list" (it will be findable by <C-e>)!
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end) -- opens harpoon ui

-- bindings to open the n-ths buffer attached to the "harpoon list" 
vim.keymap.set("n", "<leader>h", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>j", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>k", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>l", function() harpoon:list():select(4) end)
