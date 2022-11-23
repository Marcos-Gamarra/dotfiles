local builtin = require('telescope.builtin')
vim.keymap.set('n', '<space>ff', builtin.find_files, {})
vim.keymap.set('n', '<space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<space>fb', builtin.buffers, {})
vim.keymap.set('n', '<space>fh', builtin.help_tags, {})

local decoration = '#875f5f'
vim.api.nvim_set_hl(0, 'TelescopeSelection', { fg = "#eeeeee", bg = decoration, bold = true })

