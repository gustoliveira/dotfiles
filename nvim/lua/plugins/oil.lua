vim.keymap.set({"n", "v"}, "<leader>ee", [[:Oil<CR>]], { desc = "Open oil - explorer"} )

return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { "echasnovski/mini.icons" },
  lazy = false,
}
