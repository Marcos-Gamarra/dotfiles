require("catppuccin").setup({
    background = {      -- :h background
        light = "latte",
        dark = "frappe",
    },

    highlight_overrides = {
        all = function(colors)
            return {
                FloatBorder = { bg = colors.mantle },
                TelescopeNormal = { bg = colors.mantle },
            }
        end,
    },

    integrations = {
        cmp = true,
        nvimtree = true,
        treesitter = true,
        leap = true,
        telescope = {
            enabled = true,
        },

        native_lsp = {
            enabled = true,
        },

        indent_blankline = {
            enabled = true,
            colored_indent_levels = true,
        },

    },
})

vim.cmd.colorscheme "catppuccin"
