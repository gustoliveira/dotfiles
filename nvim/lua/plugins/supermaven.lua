-- return {
--   "zbirenbaum/copilot.lua",
--   cmd = "Copilot",
--   event = "InsertEnter",
--   config = function()
--     -- require("copilot").setup({
--     --   suggestion = {
--     --     enabled = true,
--     --     auto_trigger = true,
--     --     hide_during_completion = false,
--     --     debounce = 25,
--     --     keymap = {
--     --       -- accept_line = "<Tab>",
--     --       accept = "<C-y>",
--     --       dismiss = "<C-n>",
--     --     },
--     --   },
--     -- })
--   end,
-- }

return {
  "supermaven-inc/supermaven-nvim",
  config = function()
    require("supermaven-nvim").setup({})
  end,
}
