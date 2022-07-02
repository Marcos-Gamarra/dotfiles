vim.api.nvim_set_keymap('', 'n', "<Plug>(leap-forward)", {})
vim.api.nvim_set_keymap('', 't', "<Plug>(leap-backward)", {})

local blue = '#5f87af'
vim.api.nvim_set_hl(0, 'LeapLabelPrimary', { fg = "#ffffff", bg = blue, bold = true })

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

--vim.api.nvim_create_autocmd('User', {
--    pattern = 'LeapEnter',
--    command = 'hi CursorLineNr guibg=#373b41 guifg=#373b41 | hi LineNr guibg=#373b41',
--
--})
--vim.api.nvim_create_autocmd('User', {
--    pattern = 'LeapLeave',
--    command = 'hi LineNr guibg=NONE | hi CursorLineNR guibg=NONE guifg=#5f87af',
--})
