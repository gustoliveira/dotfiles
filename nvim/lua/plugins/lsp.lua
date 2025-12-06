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
    local null_ls = require("null-ls")

    local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()
    local capabilities = require('blink.cmp').get_lsp_capabilities(cmp_capabilities)

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    vim.diagnostic.config({ virtual_text = true, signs = false })

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
      ensure_installed = { 'ts_ls', 'lua_ls', 'gopls' },
      handlers = {
        function(server_name)
          vim.lsp.enable(server_name, {
            capabilities = capabilities
          })
        end,
      },
    })


    vim.lsp.config.dartls = {
      cmd = { 'dartls' },
      filetypes = { "dart" },
      root_markers = { 'pubspec.yaml' },
      capabilities = capabilities,
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
      on_init = function(client, _)
        client.server_capabilities.semanticTokensProvider = nil
      end,
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
            command = "setlocal shiftwidth=2 tabstop=2",
          })
        end
      end,
    }
    vim.lsp.enable('dartls')

    vim.lsp.config.pyright = {
      cmd = { 'pyright-langserver', '--stdio' },
      filetypes = { 'python' },
      root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', 'pyrightconfig.json' },
      capabilities = capabilities,
      settings = {
        pyright = {
          autoImportCompletion = true,
        },
        python = {
          analysis = {
            autoSearchPaths = true,
            diagnosticMode = 'openFilesOnly',
            useLibraryCodeForTypes = true,
            typeCheckingMode = 'off'
          }
        }
      },
      on_attach = function(client, _)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("FileType", {
            pattern = { "*.js", "*.html", "*.jsx", "*.css", "*.scss" },
            command = "setlocal shiftwidth=2 tabstop=2"
          })
        end
      end,
    }
    vim.lsp.enable('pyright')


    vim.lsp.config.ts_ls = {
      cmd = { 'typescript-language-server', '--stdio' },
      filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
      root_markers = { 'tsconfig.json', 'package.json', 'jsconfig.json', '.git' },
      capabilities = capabilities,
      on_attach = function(client, _)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("FileType", {
            pattern = { "*.js", "*.html", "*.jsx", "*.css", "*.scss" },
            command = "setlocal shiftwidth=2 tabstop=2"
          })
        end
      end,
    }
    vim.lsp.enable('ts_ls')

    vim.lsp.config.gopls = {
      cmd = { "gopls" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      root_markers = { 'go.work', 'go.mod', '.git' },
      capabilities = capabilities,
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
          gofumpt = true,
        },
      },
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
    }
    vim.lsp.enable('gopls')
  end
}
