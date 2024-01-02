local custom_catppuccin = require 'lualine.themes.catppuccin'
custom_catppuccin.normal.a.bg = '#7aa2f7'

require('lualine').setup {
    options = {
        theme = custom_catppuccin,
        component_separators = { left = '┃', right = '┃' },
        section_separators = { left = '', right = '' },

    },

    sections = {
        lualine_a = {
            {
                'mode',
                separator = { left = '', right = '' },
                right_padding = 2,
            },

        },


        lualine_x = { 'aerial' },

        lualine_z = {
            { 'location', separator = { left = '', right = '' }, left_padding = 2 },
        },

    },
}
