vim.pack.add({ 'https://git.disroot.org/andyg/leap.nvim' })

vim.keymap.set('', 'n', "<plug>(leap-forward)", {})
vim.keymap.set('', 't', "<plug>(leap-backward)", {})
vim.keymap.set('', 'w', "<plug>(leap-from-window)", {})

require('leap').setup {
    case_sensitive = false,
    safe_labels = { "b", "j", "y", "x", "p", "z", "k", "m", "f", ")", "=", "(", "/", "E", "A", "I", "H" },
    labels = { "b", "j", "v", "y", "x", "p", "z", "k", "e", "h", "a", "i", "o", "t", "n", "s", "r", "m", "f", "l", "v", "g",
    "c", "q", "w", "d", "u", "E", "A", "I", "H", "J", "B", "X", "O", "V", "Y", "K", "Z", "T", "N", "S", "R", "M",
    "F", "L", "P", "G", "C", "Q", "W", "D", "U" },

    special_keys = {
        prev_target = '<backspace>',
        next_target = '<enter>',
        next_group  = '<right>',
        prev_group  = '<left>',
        eol         = '<space>',
    },
}



-- clever f/t
local function ft(key_specific_args)
    require('leap').leap(
        vim.tbl_deep_extend('keep', key_specific_args, {
            inputlen = 2,
            inclusive = false,
            pattern = (function (pat) return '\\%.l'..pat end) or nil, -- restrict to current line
            opts = {
                -- Force autojump.
                labels = '',
                -- Match the modes where you don't need labels (`:h mode()`).
                safe_labels = vim.fn.mode(1):match('o') and '' or nil,
            },
        })
    )
end

-- A helper function making it easier to set "clever-f" behavior
-- (using f/F or t/T instead of ;/, - see the plugin clever-f.vim).
local clever = require('leap.user').with_traversal_keys
local clever_f = clever('r', 's')
local clever_f_backward = clever('s', 'r')

vim.keymap.set({ 'n', 'x', 'o' }, 'r', function()
    ft { opts = clever_f }
end)
vim.keymap.set({ 'n', 'x', 'o' }, 's', function()
    ft { backward = true, opts = clever_f_backward }
end)
