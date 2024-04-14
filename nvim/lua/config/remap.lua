vim.g.mapleader = " "				            	-- Set <leader> key to <space>

vim.keymap.set("n", "<Esc>", vim.cmd.noh, { desc = "Clean searchs" } )

vim.keymap.set("x", "<leader>p", [["_dP]],
    { desc = "Paste something without yank the selected words" }
)

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Paste the selected line to outside" } )
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Paste the selected line to outside" } )

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]],
    { desc = "Delete without adding to yank" }
)

vim.keymap.set({"n", "v"}, "<leader>cp", [[:let @+=expand('%')<CR>]],
    { desc = "Copy path to clipboard" }
)
vim.keymap.set({"n", "v"}, "<leader>cP", [[:let @+=expand('%:p')<CR>]],
    { desc = "Copy absolut path to clipboard" }
)
vim.keymap.set({"n", "v"}, "<leader>cf", [[:let @+=expand('%:t')<CR>]],
    { desc = "Copy file name to clipboard" }
)

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("hihlight_yank", { clear = true }),
    callback = function()
      vim.highlight.on_yank({ timeout = 100 })
    end
})

vim.api.nvim_create_autocmd("BufWritePost", {
    desc = "Reload config file on save",
    group = vim.api.nvim_create_augroup("bufcheck", { clear = true }),
    command = "silent source %"
})
