return {
  'numToStr/Navigator.nvim',
  opts = {
    auto_save = false,
    disable_on_zoom = true
  },
  config = function(_, opts)
    require('Navigator').setup(opts)
    local map = vim.api.nvim_set_keymap
    local configs = { noremap = true, silent = true }

    map('n', "<C-h>", "<CMD>lua require('Navigator').left()<CR>", configs)
    map('n', "<C-k>", "<CMD>lua require('Navigator').up()<CR>", configs)
    map('n', "<C-l>", "<CMD>lua require('Navigator').right()<CR>", configs)
    map('n', "<C-j>", "<CMD>lua require('Navigator').down()<CR>", configs)
    map('n', "<C-p>", "<CMD>lua require('Navigator').previous()<CR>", configs)
  end
}

