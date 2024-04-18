local lsp_zero = require('lsp-zero')
local lsp_config = require('lspconfig')
local cmp = require('cmp')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lsp_zero.preset('recommended')

lsp_zero.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set({"n", "v"}, "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
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

-- Dart LSP Config
lsp_config["dartls"].setup({
    on_attach = on_attach,
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
    }
})

-- Ruby LSP Config
lsp_config["ruby_lsp"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- JavaScrip and TypeScript LSP Config
lsp_config["tsserver"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- HTML LSP Config
lsp_config["html"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- Python LSP Config
lsp_config["pyright"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

lsp_zero.setup()

require("fidget").setup({})
