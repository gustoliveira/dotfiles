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

-- Copy path to clipboard
vim.keymap.set({"n", "v"}, "<leader>cp", [[:let @+=expand('%')<CR>]])
-- Copy absolut path to clipboard
vim.keymap.set({"n", "v"}, "<leader>cP", [[:let @+=expand('%:p')<CR>]])
-- Copy file name to clipboard
vim.keymap.set({"n", "v"}, "<leader>cf", [[:let @+=expand('%:t')<CR>]])

vim.keymap.set({"n", "v"}, "<leader>ee", [[:30 Lexplore %:p:h<CR>]]) -- Open the file explorer

vim.keymap.set({"n", "v"}, "<leader>f", [[zf<CR>]])

vim.keymap.set({"n", "v"}, "<leader>w", vim.cmd.w) -- Save the file with leader + w
vim.keymap.set({"n", "v"}, "<leader>q", vim.cmd.q) -- Close the buffer/split with leader + q

vim.keymap.set("n", "<leader>gg", [[:Git<CR>]]) -- Open git status

vim.keymap.set({"n", "v"}, "<leader>ee", [[:Oil<CR>]]) -- Open oil - explorer


vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("hihlight_yank", { clear = true }),
    callback = function()
      vim.highlight.on_yank()
    end
  })

