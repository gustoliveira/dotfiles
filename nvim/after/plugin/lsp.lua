local lsp_zero = require('lsp-zero')
local mason = require('mason')
local mason_lsp = require('mason-lspconfig')
local lsp_config = require('lspconfig')

lsp_zero.preset('recommended')

lsp_zero.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set({"n", "v"}, "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "<leader><C-h>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set('n', '<space>pr', function() vim.lsp.buf.format { async = true } end, bufopts)

  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "<leader>dl", function() vim.diagnostic.setqflist() end, opts)
end)

vim.diagnostic.config({
    virtual_text = true,
    signs = false,
})

-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
mason.setup({
  ui = {
    keymaps = {
      apply_language_filter = "<C-a>",
    }
  },
})
mason_lsp.setup({
	ensure_installed = {'tsserver', 'cssls', 'html', 'gopls', 'kotlin_language_server'},
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,
	},
})

-- Dart LSP Config
lsp_config.dartls.setup({
    -- capabilities = capabilities,
    settings = {
        dart = {
            analysisExcludedFolders = {
                vim.fn.expand("$HOME/AppData/Local/Pub/Cacha"),
                vim.fn.expand("$HOME/.pub-cache"),
                vim.fn.expand("$HOME/tools/flutter"),
                vim.fn.expand("opt/homebrew/"),
            }
        }
    }
})

