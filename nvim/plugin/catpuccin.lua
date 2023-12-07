require('catppuccin').setup({
    flavour = "macchiato",
    integrations = {
        aerial = true,
        leap = true,
        nvimtree = false,
    },
    custom_highlights = function(colors)
        return {
            VertSplit = { fg = colors.blue },
        }
    end
})

vim.cmd.colorscheme('catppuccin')
