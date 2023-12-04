vim.keymap.set('', 'n', "<plug>(leap-forward)", {})
vim.keymap.set('', 't', "<plug>(leap-backward)", {})
vim.keymap.set('', 'w', "<plug>(leap-from-window)", {})

--local bg = '#D8DEE9'
--local fg = '#2E3440'
--vim.api.nvim_set_hl(0, 'LeapLabelPrimary', { fg = fg, bg = bg, bold = true })

require('leap').setup {
    case_sensitive = false,
    --safe_labels = { "t", "n", "s", "r", "m", "f", "l", "p", "g", "c", "q", "w"},
    safe_labels = {},
    --labels = { "t", "n", "h", "s", "e", "o", "u", "a", "w", "j", "m", "k", "v", "q", "c", "r", "l", "z", "T", "N", "H",
    --    "S", "E", "O", "U", "A", "W", "J", "M", "K", "V", "Q", "C", "R", "L", "Z" },
    labels = { "e", "a", "i", "h", "j", "b", "x", "o", "v", "y", "k", "z", "t", "n", "s", "r", "m", "f", "l", "p", "g",
        "c", "q", "w", "d", "u", "E", "A", "I", "H", "J", "B", "X", "O", "V", "Y", "K", "Z", "T", "N", "S", "R", "M",
        "F", "L", "P", "G", "C", "Q", "W", "D", "U" },

    special_keys = {
        -- repeat_search = '<enter>',
        next_target   = 'N',
        prev_target   = 'T',
        next_group    = 'R',
        prev_group    = 'S',
        eol           = '<space>',
    },
}
