require('catppuccin').setup({
    flavour = "latte",
    integrations = {
        aerial = true,
        leap = true,
    },
    custom_highlights = function(colors)
        return {
            VertSplit = { fg = colors.blue },
            CursorLine = { bg = colors.crust},
        }
    end
})

vim.cmd.colorscheme('catppuccin')
