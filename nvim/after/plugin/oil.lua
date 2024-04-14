require("oil").setup()

vim.keymap.set({"n", "v"}, "<leader>ee", [[:Oil<CR>]],
  { desc = "Open oil - explorer"}
)
