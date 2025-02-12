local rayso = require('rayso')

rayso.setup {
  open_cmd = 'google-chrome',
  options = {
    logging_path = '/home/gustavo/Documents/rayso.log/',
    logging_file = 'rayso',
    logging_enabled = true,
    theme = 'breeze',
    padding = 16,
    background = false,
    dark_mode = true,
  },
}

vim.keymap.set('v', '<leader>rs', require('lib.create').create_snippet)
