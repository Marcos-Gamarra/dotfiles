vim.keymap.set('', 'n', "<plug>(leap-forward)", {})
vim.keymap.set('', 't', "<plug>(leap-backward)", {})
vim.keymap.set('', 'w', "<plug>(leap-from-window)", {})
vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })

require('leap').setup {
    case_sensitive = false,
    --safe_labels = { "t", "n", "s", "r", "m", "f", "l", "p", "g", "c", "q", "w"},
    safe_labels = {},
    labels = { "e", "a", "i", "h", "j", "b", "x", "o", "v", "y", "k", "z", "t", "n", "s", "r", "m", "f", "l", "p", "g",
        "c", "q", "w", "d", "u", "E", "A", "I", "H", "J", "B", "X", "O", "V", "Y", "K", "Z", "T", "N", "S", "R", "M",
        "F", "L", "P", "G", "C", "Q", "W", "D", "U" },

    special_keys = {
        prev_target   = '<backspace>',
        next_target   = '<enter>',
        next_group    = '<left>',
        prev_group    = '<right>',
        eol           = '<space>',
    },
}
