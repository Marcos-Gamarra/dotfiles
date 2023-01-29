local builtin = require('telescope.builtin')
vim.keymap.set('n', '<space>tt', builtin.find_files, {})
vim.keymap.set('n', '<space>tg', builtin.live_grep, {})
vim.keymap.set('n', '<space>tb', builtin.buffers, {})
vim.keymap.set('n', '<space>th', builtin.help_tags, {})

local decoration = '#875f5f'
vim.api.nvim_set_hl(0, 'TelescopeSelection', { fg = "#eeeeee", bg = decoration, bold = true })

