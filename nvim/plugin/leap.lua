vim.keymap.set('', 'n', "<Plug>(leap-forward)", {})
vim.keymap.set('', 't', "<Plug>(leap-backward)", {})

local custom_leap = function()
  require('leap').leap { backward = true, offset = 1 }
end

local leap_bidirectional = function()
  require('leap').leap { target_windows = { vim.fn.win_getid() }, inclusive_op = true }
end

vim.keymap.set('', 'N', leap_bidirectional, {})
vim.keymap.set('', 'T', custom_leap, {})

local decoration = '#875f5f'
vim.api.nvim_set_hl(0, 'LeapLabelPrimary', { fg = "#eeeeee", bg = decoration, bold = true })

require('leap').setup {
  case_sensitive = false,
  safe_labels = { "t", "n", "h", "s", "u", "w", "j", "m", "k", "v", "q", "c", "r", "l", "z" },
  labels = { "t", "n", "h", "s", "e", "o", "u", "a", "w", "j", "m", "k", "v", "q", "c", "r", "l", "z" },

  special_keys = {
    repeat_search = '<enter>',
    next_match    = '<enter>',
    prev_match    = '<tab>',
    next_group    = '<space>',
    prev_group    = '<tab>',
    eol           = '<space>',
  },
}
