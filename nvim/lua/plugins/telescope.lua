local function normalize_path(path)
  return path:gsub("\\", "/")
end

local function normalize_cwd()
  return normalize_path(vim.loop.cwd()) .. "/"
end

local function is_subdirectory(cwd, path)
  return string.lower(path:sub(1, #cwd)) == string.lower(cwd)
end

local function split_filepath(path)
  local normalized_path = normalize_path(path)
  local normalized_cwd = normalize_cwd()
  local filename = normalized_path:match("[^/]+$")

  if is_subdirectory(normalized_cwd, normalized_path) then
    local stripped_path = normalized_path:sub(#normalized_cwd + 1, -(#filename + 1))
    return stripped_path, filename
  else
    local stripped_path = normalized_path:sub(1, -(#filename + 1))
    return stripped_path, filename
  end
end

local function path_display(_, path)
  local stripped_path, filename = split_filepath(path)
  if filename == stripped_path or stripped_path == "" then
    return filename
  end
  return string.format("%s -> %s", filename, stripped_path)
end

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim'
  },
  config = function()
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
    vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { noremap = true, silent = true, desc = '[F]ind [R]eferences' })

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
        },
      },
      defaults = {
        layout_strategy = "horizontal",
        path_display = path_display,
        layout_config = {
          horizontal = {
            width = { padding = 10 },
            height = { padding = 5 },
            preview_width = 0.4,
          },
        },
        vimgrep_arguments = {
          'rg',
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
          "--glob=!**/pubspec.lock",
        },
      },
    }

    require("telescope").load_extension("ui-select")
  end
}

