-- vim.cmd('colorscheme sonokai')

-- vim.cmd('highlight Normal guibg=NONE ctermbg=NONE')
-- vim.cmd('highlight EndOfBuffer guibg=NONE ctermbg=NONE')

-- vim.g.sonokai_style = 'a𝐭𝐥𝐚𝐧𝐭𝐢𝐬'
-- vim.g.sonokai_enable_italic = 0
-- vim.g.sonokai_disable_italic_comment = 1
-- vim.g.sonokai_diagnostic_line_highlight = 1
-- vim.g.sonokai_current_word = 'bold'

-- vim.cmd('colorscheme visual_studio_code')
--
-- require("visual_studio_code").setup({
--     -- `dark` or `light`
--     mode = "dark",
--     -- Whether to load all color schemes
--     preset = true,
--     -- Whether to enable background transparency
--     transparent = false,
--     -- Whether to apply the adapted plugin
--     expands = {
--         -- hop = true,
--         -- dbui = true,
--         -- lazy = true,
--         -- aerial = true,
--         null_ls = true,
--         nvim_cmp = true,
--         gitsigns = true,
--         -- which_key = true,
--         nvim_tree = true,
--         lspconfig = true,
--         -- telescope = false,
--         -- bufferline = true,
--         -- nvim_navic = true,
--         -- nvim_notify = true,
--         -- vim_illuminate = true,
--         nvim_treesitter = true,
--         -- nvim_ts_rainbow = true,
--         -- nvim_scrollview = true,
--         -- nvim_ts_rainbow2 = true,
--         -- indent_blankline = true,
--         -- vim_visual_multi = true,
--     },
-- })
--

vim.cmd('colorscheme tokyodark')
require("tokyodark").setup({
    transparent_background = false, -- set background to transparent
    gamma = 1.00, -- adjust the brightness of the theme
    styles = {
        comments = { italic = true }, -- style for comments
        keywords = { italic = true }, -- style for keywords
        identifiers = { italic = true }, -- style for identifiers
        functions = {}, -- style for functions
        variables = {}, -- style for variables
    },
    custom_highlights = {} or function(highlights, palette) return {} end, -- extend highlights
    custom_palette = {} or function(palette) return {} end, -- extend palette
    terminal_colors = true, -- enable terminal colors
})
