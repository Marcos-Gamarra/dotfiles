vim.api.nvim_set_keymap('', 'n', "<Plug>(leap-forward)", {})
vim.api.nvim_set_keymap('', 't', "<Plug>(leap-backward)", {})

local blue = '#458588'
vim.api.nvim_set_hl(0, 'LeapLabelPrimary', { fg = "#eeeeee", bg = blue, bold = true })

require('leap').setup {
    highlight_ahead_of_time = true,
    highlight_unlabeled = false,
    case_sensitive = false,
    safe_labels = { "t", "n", "h", "s", "u", "w", "j", "m", "k", "v", "q", "c", "r", "l", "z" },
    labels = { "t", "n", "h", "s", "e", "o", "h", "u", "a", "w", "j", "m", "k", "v", "q", "c", "r", "l", "z" },
    -- These keys are captured directly by the plugin at runtime.
    special_keys = {
        repeat_search = '<enter>',
        next_match    = '<enter>',
        prev_match    = '<tab>',
        next_group    = '<space>',
        prev_group    = '<tab>',
        eol           = '<space>',
    },
}

