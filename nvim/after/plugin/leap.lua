local leap = require('leap')

vim.keymap.set({'n', 'v'}, "<leader>s", '<Plug>(leap-forward)')
vim.keymap.set({'n', 'v'}, "<leader>S", '<Plug>(leap-backward)')
vim.keymap.set({'n', 'v'}, "<leader>gs", '<Plug>(leap-from-window)')

