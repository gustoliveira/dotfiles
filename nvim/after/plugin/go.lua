local null_ls = require("null-ls")
local lsp_zero = require('lsp-zero')
local lsp_config = require('lspconfig')
local cmp = require('cmp')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

lsp_zero.preset('recommended')

-- Go LSP Config
lsp_config["gopls"].setup({
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

lsp_zero.setup()
