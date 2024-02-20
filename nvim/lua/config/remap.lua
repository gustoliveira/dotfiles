vim.g.mapleader = " "				            	-- Set <leader> key to <space>

vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)		-- Got to explore files

vim.keymap.set("n", "ty", vim.cmd.bn)               -- Go to next buffer
vim.keymap.set("n", "tr", vim.cmd.bp)               -- Go to previous buffer
vim.keymap.set("n", "td", vim.cmd.bd)               -- Delete buffer

vim.keymap.set("n", "tc", vim.cmd.noh)              -- Clean searchs

vim.keymap.set("x", "<leader>p", [["_dP]])          -- Paste something without yank the selected words

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])    -- Paste the selected words to outside
vim.keymap.set("n", "<leader>Y", [["+Y]])           -- Paste the selected line to outside

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])    -- Delete without adding to yank

vim.keymap.set({"n", "v"}, "<leader>cp", [[:let @+=expand('%')<CR>]])
vim.keymap.set({"n", "v"}, "<leader>cP", [[:let @+=expand('%:p')<CR>]])
vim.keymap.set({"n", "v"}, "<leader>cf", [[:let @+=expand('%:t')<CR>]])

