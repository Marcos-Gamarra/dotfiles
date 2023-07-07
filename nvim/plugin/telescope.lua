local builtin = require('telescope.builtin')
vim.keymap.set('n', '<space>tt', builtin.find_files, {})
vim.keymap.set('n', '<space>tg', builtin.live_grep, {})
vim.keymap.set('n', '<space>tb', builtin.buffers, {})
--vim.keymap.set('n', '<space>th', builtin.help_tags, {})

require('telescope').setup {
    defaults = {
        layout_strategy = 'vertical',
        file_ignore_patterns = {'.git', 'node_modules', 'vendor', 'target'},
    }
}
