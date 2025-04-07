return {
  "neovim/nvim-lspconfig",
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'nvimtools/none-ls.nvim',
  },
  config = function()
    local lsp_config = require("lspconfig")
    local null_ls = require("null-ls")

    local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()
    local capabilities = require('blink.cmp').get_lsp_capabilities(cmp_capabilities)

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    vim.diagnostic.config({ virtual_text = true, signs = false })

    local lspconfig_defaults = lsp_config.util.default_config
    lspconfig_defaults.capabilities = vim.tbl_deep_extend(
      'force',
      lspconfig_defaults.capabilities,
      require('cmp_nvim_lsp').default_capabilities()
    )

    vim.api.nvim_create_autocmd('LspAttach', {
      desc = 'LSP actions',
      callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "<leader><C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set('n', '<leader>pr', function() vim.lsp.buf.format { async = true } end, opts)

        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)

        vim.keymap.set("n", "<leader>i", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "<leader>dl", function() vim.diagnostic.setqflist() end, opts)
      end,
    })

    require("mason").setup({
      ui = {
        keymaps = { apply_language_filter = "<C-a>" }
      },
    })

    require("mason-lspconfig").setup({
      ensure_installed = { 'ts_ls', 'lua_ls', 'gopls', 'ruby_lsp' },
      handlers = {
        function(server_name)
          lsp_config[server_name].setup {
            capabilities = capabilities
          }
        end,
      },
    })


    lsp_config.dartls.setup({
      capabilities = capabilities,
      filetypes = { "dart" },
      init_options = {
        onlyAnalyzeProjectsWithOpenFiles = false,
        suggestFromUnimportedLibraries = true,
        closingLabels = true,
        outline = false,
        flutterOutline = false,
      },
      settings = {
        dart = {
          analysisExcludedFolders = {
            vim.fn.expand("$HOME/AppData/Local/Pub/Cacha"),
            vim.fn.expand("$HOME/.pub-cache"),
            vim.fn.expand("$HOME/tools/flutter"),
            vim.fn.expand("opt/homebrew/"),
          },
          updateImportsOnRename = true,
          completeFunctionCalls = true,
          showTodos = true,
        }
      },
      on_attach = function(client, bufnr)
        vim.g.dart_format_on_save = 1

        client.server_capabilities.semanticTokensProvider = nil

        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({
            group = augroup,
            buffer = bufnr,
          })
          vim.api.nvim_create_autocmd("FileType", {
            group = augroup,
            pattern = "dart",
            command = "setlocal shiftwidth=2 tabstop=2",
          })
        end
      end,
    })

    lsp_config.ts_ls.setup({
      capabilities = capabilities,
      on_attach = function(client, _)
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
  end
}
