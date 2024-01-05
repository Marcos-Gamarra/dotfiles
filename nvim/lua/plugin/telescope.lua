local builtin = require('telescope.builtin')
local function find_files_include_hidden()
    builtin.find_files {
        hidden = true,
    }
end

local function find_files_in_root()
    local root_dir = require('lspconfig.util').root_pattern('.git', 'Cargo.toml', 'package.json', 'node_modules')(vim.fn.expand('%:p:h'))
    builtin.find_files {
        cwd = root_dir,
    }
end

vim.keymap.set('n', '<space>tt', builtin.find_files, {})
vim.keymap.set('n', '<space>tg', builtin.live_grep, {})
vim.keymap.set('n', '<space>tb', builtin.buffers, {})
vim.keymap.set('n', '<space>th', find_files_include_hidden, {})
vim.keymap.set('n', '<space>tr', find_files_in_root, {})

require('telescope').setup {
    defaults = {
        layout_strategy = 'vertical',
        layout_config = {
            width = 0.9,
            height = 0.9,
            preview_cutoff = 0,
        },
        file_ignore_patterns = { '.git', 'node_modules', 'vendor', 'target' },
    }
}
