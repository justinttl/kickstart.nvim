return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        theme = 'auto',
        component_separators = '',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { { 'mode', separator = { left = '' } } },
        lualine_b = { 'filename', 'branch' },
        lualine_c = {
          '%=',
          {
            function()
              local reg = vim.fn.reg_recording()
              if reg == '' then
                return ''
              end -- not recording
              return 'recording to ' .. reg
            end,
          },
        },
        lualine_x = {},
        lualine_y = { 'filetype', 'progress' },
        lualine_z = { { 'location', separator = { right = '' } } },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      tabline = {},
      extensions = {},
    }
  end,
}
