return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "vimdoc", "lua", "vim", "json", "yaml", "jsdoc", "typescript", "html", "css", "scss", "tsx", "python", "rust", "go", "bash", "dockerfile", "jsonc", "graphql", "ruby", "yaml", "dart" },
      ignore_install = { "javascript" },
      sync_install = false,
      auto_install = true,
      indent = { enable = true },
      highlight = {
        enable = true,
        disable = function(_, buf)
          local max_filesize = 300 * 1024 -- 300 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            vim.notify(
              "File larger than 100KB treesitter disabled for performance",
              vim.log.levels.WARN,
              {title = "Treesitter"}
            )
            return true
          end
        end,

        additional_vim_regex_highlighting = { "markdown" },
      },
    })
  end
}
