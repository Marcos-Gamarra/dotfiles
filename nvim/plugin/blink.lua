vim.pack.add({'https://github.com/saghen/blink.cmp'})
require('blink.cmp').setup({
    completion = {
        menu = {
            border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
            winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder"
        },
        documentation = {
            window = {
                border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
                winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder"
            },
        }
    },
    keymap = {
        preset = 'super-tab',
    },
    fuzzy = {
        prebuilt_binaries = {
            download = true,
            force_version = "v1.5.1"
        }
    },
    cmdline = {
        keymap = { preset = 'inherit' },
        completion = { menu = { auto_show = true } },
    },
})
