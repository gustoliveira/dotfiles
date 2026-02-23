local colors = {
  blue   = '#0000FF',
  green  = '#00CD00',
  purple = '#660066',
  cyan   = '#006666',
  red1   = '#CD0000',
  red2   = '#FF0000',
  yellow = '#C4A000',
  fg     = '#FFFFFF',
  bg     = '#282C34',
  gray1  = '#828997',
  gray2  = '#2C323C',
  gray3  = '#3E4452',
}

USGCTheme = {
  normal = {
    a = { fg = colors.bg, bg = colors.green },
    b = { fg = colors.fg, bg = colors.gray3 },
    c = { fg = colors.fg, bg = colors.gray2 },
  },
  command = {
    a = { fg = colors.bg, bg = colors.yellow }
  },
  insert = {
    a = { fg = colors.fg, bg = colors.blue, gui = 'bold' }
  },
  visual = {
    a = { fg = colors.fg, bg = colors.purple }
  },
  terminal = {
    a = { fg = colors.fg, bg = colors.cyan }
  },
  replace = {
    a = { fg = colors.fg, bg = colors.red1 }
  },
  inactive = {
    a = { fg = colors.gray1, bg = colors.bg },
    b = { fg = colors.gray1, bg = colors.bg },
    c = { fg = colors.gray1, bg = colors.gray2 },
  },
}

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function(_, _)
    require("lualine").setup {
      options = {
        icons_enabled = true,
        -- theme = 'onedark',
        theme = USGCTheme,
        component_separators = { left = '', right = '' },
        section_separators = {},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'filename' },
        lualine_c = { 'diff', 'diagnostics', 'searchcount', 'selectioncount' },
        lualine_x = { 'filetype' },
        lualine_y = { 'location' },
        lualine_z = { 'branch' }
      },
      inactive_sections = {},
      tabline = {},
      winbar = {
        lualine_x = {
          {
            'filename',
            file_status = true,
            newfile_status = false,
            path = 1,
            shorting_target = 40,
            symbols = {
              modified = '[+]',
              readonly = '[-]',
              unnamed = '[No Name]',
              newfile = '[New]',
            }
          }
        },
      },
      inactive_winbar = {
        lualine_x = {
          {
            'filename',
            file_status = true,
            newfile_status = false,
            path = 1,
            shorting_target = 40,
            symbols = {
              modified = '[+]',
              readonly = '[-]',
              unnamed = '[No Name]',
              newfile = '[New]',
            }
          }
        },
      },
      extensions = {}
    }
  end
}


