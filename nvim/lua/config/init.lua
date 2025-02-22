require("config.set")

require("config.remap")

require("config.lazy")

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("hihlight_yank", { clear = true }),
    callback = function()
      vim.highlight.on_yank({ timeout = 100 })
    end
})
