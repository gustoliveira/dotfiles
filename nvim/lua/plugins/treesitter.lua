return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master", -- <-- VOLTE PARA A MASTER AQUI
  build = ":TSUpdate",
  config = function()
    local alias_map = {
      ex = "elixir",
      pl = "perl",
      sh = "bash",
      ts = "typescript",
      uxn = "uxntal",
    }

    pcall(vim.treesitter.query.add_directive, "set-lang-from-info-string!", function(match, _, bufnr, pred, metadata)
      local capture_id = pred[2]
      local node = match[capture_id]
      if type(node) == "table" then
        node = node[1]
      end
      if not node or type(node.range) ~= "function" then
        return
      end

      local ok, info_string = pcall(vim.treesitter.get_node_text, node, bufnr)
      if not ok or type(info_string) ~= "string" or info_string == "" then
        return
      end

      local injection_alias = string.lower(info_string)
      local detected = vim.filetype.match({ filename = "a." .. injection_alias })
      metadata["injection.language"] = detected or alias_map[injection_alias] or injection_alias
    end, { force = true, all = false })

    require("nvim-treesitter.configs").setup({
      ensure_installed = { "vimdoc", "lua", "vim", "json", "yaml", "jsdoc", "typescript", "html", "css", "scss", "tsx", "python", "rust", "go", "bash", "graphql", "ruby", "dart" },
      ignore_install = { "javascript" },
      sync_install = false,
      auto_install = true,
      indent = { enable = true },
      highlight = {
        enable = true,
        disable = function(lang, buf)
          local max_filesize = 300 * 1024 -- 300 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            vim.notify(
              "Arquivo maior que 300KB. Treesitter desativado para performance.",
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
