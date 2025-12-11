return {
  -- Dark Theme
  {
    "tiagovla/tokyodark.nvim",
    opts = {
      transparent_background = false,
      gamma = 1.00,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        identifiers = { italic = true },
        functions = {},
        variables = {},
      },
      custom_highlights = function(_, _)
        return {}
      end,
      custom_palette = {} or function(_) return {} end,
      terminal_colors = true,
    },
    config = function(_, opts)
      require("tokyodark").setup(opts)
      vim.cmd [[colorscheme tokyodark]]
    end,
  },
  -- Ligh Theme
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false,
    priority = 1000,
    config = function()
      require('github-theme').setup({})
      vim.cmd('colorscheme github_light')
    end,
  }
}
