vim.cmd('syntax on')

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.hidden = true           -- Hides the current buffer when a new file is openned
vim.opt.number = true           -- Enable line numbers
vim.opt.relativenumber = true   -- Show relative line to your position

vim.opt.tabstop = 4             -- Show existing tab with 4 spaces width
vim.opt.softtabstop = 4         -- Show existing tab with 4 spaces width
vim.opt.shiftwidth = 4          -- When indenting with '>', use 4 spaces width
vim.opt.expandtab = true        -- On pressing tab, insert 4 spaces
vim.opt.smarttab = true         -- insert tabs on the start of a line according to shiftwidth
vim.opt.smartindent = true      -- Automatically inserts one extra level of indentation in some cases

vim.opt.incsearch = true        -- Incremental search
vim.opt.ignorecase = true       -- Ingore case in search
vim.opt.smartcase = true        -- Consider case if there is a upper case character

vim.opt.scrolloff = 8           -- Minimum number of lines to keep above and below the cursor

vim.opt.colorcolumn = '100'     -- Draws a line at the given line to keep aware of the line size
vim.opt.signcolumn = 'yes'      -- Add a column on the left. Useful for linting

vim.opt.cmdheight = 2           -- Give more space for displaying messages
vim.opt.updatetime = 50         -- Time in miliseconds to consider the changes
vim.opt.encoding = 'utf-8'      -- The encoding should be utf-8 to activate the font icons
vim.opt.backup = false          -- No backup files
-- vim.opt.nowritebackup = true   -- No backup files

vim.opt.splitright = true       -- Create the vertical splits to the right
vim.opt.splitbelow = true       -- Create the horizontal splits below

vim.opt.autoread = true         -- Update vim after file update from outside

vim.opt.mouse=a                 -- Enable mouse support

-- filetype on                  -- Detect and vim.opt.the filetype option and trigger the FileType Event
-- filetype plugin on           -- Load the plugin file for the file type, if any
-- filetype indent on           -- Load the indent file for the file type, if any

-- Enable persistent undo
vim.opt.undofile = true                                 -- Persistent undo
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"  -- File where store the persistent undo files

vim.opt.showmatch = true        -- Show matching brackets

vim.opt.termguicolors = true
