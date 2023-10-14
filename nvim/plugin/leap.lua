vim.keymap.set('', 'n', "<plug>(leap-forward)", {})
vim.keymap.set('', 't', "<plug>(leap-backward)", {})
vim.keymap.set('', '<space>n', "<plug>(leap-from-window)", {})

--local bg = '#D8DEE9'
--local fg = '#2E3440'
--vim.api.nvim_set_hl(0, 'LeapLabelPrimary', { fg = fg, bg = bg, bold = true })

require('leap').setup {
    case_sensitive = false,
    safe_labels = { "t", "n", "s", "r", "h", "l", "m", "k", "v", "c", "p", "y", "z" },
    labels = { "t", "n", "h", "s", "e", "o", "u", "a", "w", "j", "m", "k", "v", "q", "c", "r", "l", "z" },

    special_keys = {
        repeat_search = '<enter>',
        next_target   = 'N',
        prev_target   = 'T',
        next_group    = 'R',
        prev_group    = 'S',
        eol           = '<space>',
    },
}
