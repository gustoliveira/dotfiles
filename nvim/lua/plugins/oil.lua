vim.keymap.set({"n", "v"}, "<leader>ee", [[:Oil<CR>]], { desc = "Open oil - explorer"} )

return {
  'stjvearc/oil.nvim',
  opts = {},
  dependencies = { { "echasnovski/mini.icons" } },
  lazy = false,
}
