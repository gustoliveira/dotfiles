local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'sainnhe/sonokai'

Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'

Plug 'tpope/vim-fugitive'
Plug 'rhysd/git-messenger.vim'

Plug 'sheerun/vim-polyglot'

Plug 'ryanoasis/vim-devicons'

Plug 'jiangmiao/auto-pairs'

Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-telescope/telescope.nvim'

Plug 'numToStr/Comment.nvim'

Plug 'github/copilot.vim'

Plug 'stevearc/oil.nvim'

Plug 'folke/trouble.nvim'
Plug 'folke/todo-comments.nvim'

Plug 'mbbill/undotree'

Plug 'numToStr/Navigator.nvim'

Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

-- LSP aditionals
Plug 'j-hui/fidget.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug('VonHeikemen/lsp-zero.nvim', {branch = 'v3.x'})

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'

Plug('L3MON4D3/LuaSnip', {['do'] = 'make install_jsregexp'})

Plug 'mhinz/vim-signify'

Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/eslint.nvim'

Plug('prettier/vim-prettier', {
  ['do'] = 'yarn install --frozen-lockfile --production',
  ['for'] = {'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'html', 'javascriptreact'
}})

Plug 'Mofiqul/vscode.nvim'

Plug 'askfiy/visual_studio_code'

Plug 'tiagovla/tokyodark.nvim'

-- TODO: Add remap to toggle hot-reload. It stop the server when I running in web
Plug 'reisub0/hot-reload.vim'     -- Flutter hot relaod
Plug 'dart-lang/dart-vim-plugin'  -- Autoformat on save

Plug 'TobinPalmer/rayso.nvim'

vim.call('plug#end')
