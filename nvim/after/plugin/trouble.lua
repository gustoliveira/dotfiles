local trouble = require("trouble")

vim.keymap.set("n", "<leader>tt", function() trouble.toggle() end)
vim.keymap.set("n", "<leader>tw", function() trouble.toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>td", function() trouble.toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>tf", function() trouble.toggle("quickfix") end)
