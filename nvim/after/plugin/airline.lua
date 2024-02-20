--vim.g.airline_powerline_fonts = 1
--vim.g.airline_theme = 'wombat'
--vim.g.airline.extensions.tabline.enabled = 1

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = { left = '', right = ''},
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
    lualine_a = {'mode'},
    lualine_b = {'filename'},
    lualine_c = {'diff', 'diagnostics', 'searchcount', 'selectioncount'},
    lualine_x = {'filetype'},
    lualine_y = {'location'},
    lualine_z = {'branch'}
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

