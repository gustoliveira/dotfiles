local lsp_zero = require('lsp-zero')
local mason = require('mason')
local mason_lsp = require('mason-lspconfig')
local lsp_config = require('lspconfig')
local null_ls = require("null-ls")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

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

mason.setup({
  ui = {
    keymaps = {
      apply_language_filter = "<C-a>",
    }
  },
})

mason_lsp.setup({
	ensure_installed = {'tsserver', 'cssls', 'html', 'gopls'},
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,
	},
})

lsp_config.dartls.setup({
  capabilities = capabilities,
  settings = {
    dart = {
      analysisExcludedFolders = {
        vim.fn.expand("$HOME/AppData/Local/Pub/Cacha"),
        vim.fn.expand("$HOME/.pub-cache"),
        vim.fn.expand("$HOME/tools/flutter"),
        vim.fn.expand("opt/homebrew/"),
      }
    }
  },
  on_attach = function(client, bufnr)
    vim.g.dart_format_on_save = 1
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("FileType", {
        group = augroup,
        pattern = "dart",
        command = "setlocal shiftwidth=2 tabstop=2"
      })
    end
  end,
})

lsp_config.tsserver.setup({
  capabilities = capabilities,
  settings = {
    dart = {
      analysisExcludedFolders = {
        vim.fn.expand("$HOME/AppData/Local/Pub/Cacha"),
        vim.fn.expand("$HOME/.pub-cache"),
        vim.fn.expand("$HOME/tools/flutter"),
        vim.fn.expand("opt/homebrew/"),
      }
    }
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "*.js", "*.html", "*.jsx", "*.css", "*.scss" },
        command = "setlocal shiftwidth=2 tabstop=2"
      })
    end
  end,
})

lsp_config.gopls.setup({
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
  capabilities = capabilities,
  sources = {
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.goimports_reviser,
    null_ls.builtins.formatting.golines,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
  cmd = { "gopls" },
  fyletypes = { "go", "gomod", "gowork", "gotmpl" },
})

