vim.g.mapleader = " "				            	-- Set <leader> key to <space>

vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)		-- Got to explore files

vim.keymap.set("n", "ty", vim.cmd.bn)               -- Go to next buffer
vim.keymap.set("n", "tr", vim.cmd.bp)               -- Go to previous buffer
vim.keymap.set("n", "td", vim.cmd.bd)               -- Delete buffer

vim.keymap.set("n", "tc", vim.cmd.noh)              -- Clean searchs

-- nmap te :tabe<CR>   " Create new tab

