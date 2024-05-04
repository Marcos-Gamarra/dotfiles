require('catppuccin').setup({
    background = {
        light = "latte",
        dark = "frappe",
    },

    no_italic = true,
    no_underline = true,


    integrations = {
        cmp = true,
        aerial = true,
        treesitter = true,
        leap = true,
        telescope = {
            enabled = true,
        }
    },

    custom_highlights = function(colors)
        return {
            VertSplit = { fg = colors.blue },
            CursorLine = { bg = colors.crust },
            LeapBackdrop = { link = 'Comment' },
            NormalFloat = { link = 'Normal' },
            StatusLine = { bg = 'NONE' },
        }
    end
})

vim.cmd.colorscheme('catppuccin')
