require('lualine').setup {
  sections = {
    lualine_c = {},
    lualine_x = {
      { 'filetype', colored = true, icon_only = true }
    }
  },

  tabline = {
    lualine_a = { 
      {
        'filename', path = 1
      }
    },

    lualine_z = {
      'tabs'
    }
  }
}

-- vim.g.airline_theme='one'
-- vim.g.airline_powerline_fonts = 1

-- local gset = vim.api.nvim_set_var
-- Enable the list of buffers
-- gset("airline#extensions#tabline#enabled", 1)
-- Show just the filename
-- gset("airline#extensions#tabline#fnamemod", ":t")
