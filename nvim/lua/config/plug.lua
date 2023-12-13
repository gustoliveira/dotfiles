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

Plug 'preservim/nerdcommenter'

-- LSP Support - lsp-zero
Plug 'neovim/nvim-lspconfig'
-- Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug('VonHeikemen/lsp-zero.nvim', {branch = 'v3.x'})

-- LSP aditionals
Plug 'j-hui/fidget.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'

Plug 'mhinz/vim-signify'

Plug 'preservim/nerdtree'

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

vim.call('plug#end')

