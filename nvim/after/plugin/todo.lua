local todo = require("todo-comments")

todo.setup {
    keywords = {
        FIX  = { icon = "", color = "#ED4337", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
        TODO = { icon = "", color = "#90D5FF" },
        HACK = { icon = "", color = "warning" },
        WARN = { icon = "", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = "", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = "", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    },
    highlight = {
        before = "",
        keyword = "wide_bg",
        after = "fg",
    },
}

-- TODO:
-- FIX:
-- HACK:
-- NOTE:
-- WARNING:
-- PERF:

vim.keymap.set("n", "<leader>tl", "[[:TodoTelescope<CR>]]<cr>",
    { desc = "Todo with telescope whole workspace", silent = true }
)

vim.keymap.set("n", "<leader>td", "[[:Trouble todo filter.buf=0<CR>]]<cr>",
    { desc = "Todo with trouble only in document", silent = true }
)
