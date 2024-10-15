local trouble = require("trouble")

trouble.setup {
    defaults = {
        focus = true,
        auto_close = true
    }
}

vim.keymap.set("n", "<leader>tt", "[[:Trouble diagnostics toggle filter.buf=0<CR>]]<cr>",
    { desc = "Document Diagnostics (Trouble)", silent = true }
)

vim.keymap.set("n", "<leader>Tw", "[[:Trouble diagnostics toggle<CR>]]<cr>",
    { desc = "Workspace Diagnostics (Trouble)", silent = true }
)

vim.keymap.set("n", "<leader>Tf", "[[:Trouble qflist toggle<CR>]]<cr>",
    { desc = "Quickfix List (Trouble)", silent = true }
)

vim.keymap.set("n", "<leader>Tl", "[[:Trouble loclist toggle<CR>]]<cr>",
    { desc = "Quickfix List (Trouble)", silent = true }
)

