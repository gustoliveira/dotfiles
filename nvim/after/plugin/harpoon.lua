local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)

-- vim.keymap.set("n", "<C-H>", function() harpoon:list():removeAt(1) end)
-- vim.keymap.set("n", "<C-J>", function() harpoon:list():removeAt(2) end)
-- vim.keymap.set("n", "<C-K>", function() harpoon:list():removeAt(3) end)
-- vim.keymap.set("n", "<C-S>", function() harpoon:list():removeAt(4) end)


