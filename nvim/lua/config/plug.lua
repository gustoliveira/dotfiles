local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'sainnhe/sonokai'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-fugitive'

Plug 'dart-lang/dart-vim-plugin'			-- Dart Syntax Highlighting and autocomplete

Plug 'sheerun/vim-polyglot'

Plug 'ryanoasis/vim-devicons'

Plug('mg979/vim-visual-multi', { branch = 'master' })

Plug 'jiangmiao/auto-pairs'

Plug 'ThePrimeagen/vim-be-good'

Plug('ThePrimeagen/harpoon', { branch = 'harpoon2' })

Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-telescope/telescope.nvim'

vim.call('plug#end')

