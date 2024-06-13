local theme = os.getenv("THEME")

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
            LeapLabelPrimary = { bg = "#539bf5" },
            NormalFloat = { link = 'Normal' },
            StatusLine = { bg = 'NONE' },
        }
    end
})

if theme == "dark" then
    vim.o.background = "dark"
    vim.cmd.colorscheme('catppuccin-mocha')
else
    vim.o.background = "light"
    vim.cmd.colorscheme('catppuccin-latte')
end
