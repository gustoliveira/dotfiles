local telescope = require('telescope')
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

vim.keymap.set({ 'n', 'v' }, '<leader>fw', builtin.grep_string,
    { desc = 'Searches for the string under your cursor or selection in your current working directory' }
)

vim.keymap.set('n', '<leader><leader>', builtin.buffers, {})
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', '<leader>fof', builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })

vim.keymap.set('n', '<leader>/',
    function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
            winblend = 0,
            previewer = false,
            layout_config = { height = 0.8, width = 0.4 },
        })
    end,
    { desc = '[/] Fuzzily search in current buffer' }
)


telescope.setup {
    pickers = {
        buffers = {
            show_all_buffers = true,
            sort_mru = true,
            ignore_current_buffer = true,
        }
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
        }
    },
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',
            -- Exclude some patterns from search
            "--glob=!**/.git/*",
            "--glob=!**/.idea/*",
            "--glob=!**/.vscode/*",
            "--glob=!**/build/*",
            "--glob=!**/dist/*",
            "--glob=!**/yarn.lock",
            "--glob=!**/package-lock.json",
        },
    },
}

require("telescope").load_extension("ui-select")
