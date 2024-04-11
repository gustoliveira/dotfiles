local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'sainnhe/sonokai'

Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'

Plug 'tpope/vim-fugitive'
Plug 'rhysd/git-messenger.vim'

Plug 'dart-lang/dart-vim-plugin'			-- Dart Syntax Highlighting and autocomplete

Plug 'sheerun/vim-polyglot'

Plug 'ryanoasis/vim-devicons'

Plug('mg979/vim-visual-multi', { branch = 'master' })

Plug 'jiangmiao/auto-pairs'

Plug 'ThePrimeagen/vim-be-good'

Plug('ThePrimeagen/harpoon', { branch = 'harpoon2' })

Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-telescope/telescope.nvim'

Plug 'numToStr/Comment.nvim'

-- LSP Support - lsp-zero
Plug 'neovim/nvim-lspconfig'

-- Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug('VonHeikemen/lsp-zero.nvim', {branch = 'v3.x'})
Plug "rafamadriz/friendly-snippets"
Plug "saadparwaiz1/cmp_luasnip"

-- LSP aditionals
Plug 'j-hui/fidget.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'

Plug 'mhinz/vim-signify'

Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/eslint.nvim'

Plug('prettier/vim-prettier', {
  ['do'] = 'yarn install --frozen-lockfile --production',
  ['for'] = {'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'html', 'javascriptreact'
}})

Plug 'ggandor/leap.nvim'
Plug 'tpope/vim-repeat'

Plug 'github/copilot.vim'

Plug 'stevearc/oil.nvim'

vim.call('plug#end')
