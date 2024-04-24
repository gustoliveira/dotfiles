local navigator = require('Navigator')
navigator.setup({
    auto_save = 'current',
    disable_on_zoom = true
})

-- vim.keymap.set({'n', 'v'}, '<C-w>h', '<CMD>NavigatorLeft<CR>')
-- vim.keymap.set({'n', 'v'}, '<C-w>l', '<CMD>NavigatorRight<CR>')
-- vim.keymap.set({'n', 'v'}, '<C-w>k', '<CMD>NavigatorUp<CR>')
-- vim.keymap.set({'n', 'v'}, '<C-w>j', '<CMD>NavigatorDown<CR>')
-- vim.keymap.set({'n', 'v'}, '<C-w>p', '<CMD>NavigatorPrevious<CR>')

-- Keybindings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', "<C-h>", "<CMD>lua require('Navigator').left()<CR>", opts)
map('n', "<C-k>", "<CMD>lua require('Navigator').up()<CR>", opts)
map('n', "<C-l>", "<CMD>lua require('Navigator').right()<CR>", opts)
map('n', "<C-j>", "<CMD>lua require('Navigator').down()<CR>", opts)
map('n', "<C-p>", "<CMD>lua require('Navigator').previous()<CR>", opts)

