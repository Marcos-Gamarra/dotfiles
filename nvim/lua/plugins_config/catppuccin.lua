require('catppuccin').setup({
    background = {
        light = "latte",
        dark = "frappe",
    },

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
        }
    end
})

vim.cmd.colorscheme('catppuccin')
