vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.api.nvim_set_keymap('', ')', ":NvimTreeToggle<CR>", {})

local function on_attach(bufnr)
    local api = require('nvim-tree.api')
    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    vim.keymap.set('n', '<BS>', api.tree.change_root_to_parent, opts('Up'))
    vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', 'p', api.node.open.preview, opts('Open Preview'))
    vim.keymap.set('n', 'c', api.tree.collapse_all, opts('Collapse'))
    vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
    vim.keymap.set('n', 'd', api.tree.change_root_to_node, opts('CD'))
    vim.keymap.set('n', 'e', api.tree.expand_all, opts('Expand'))
    vim.keymap.set('n', 'r', api.fs.rename_sub, opts('Rename'))
    vim.keymap.set('n', 'H', api.tree.toggle_hidden_filter, opts('Toggle Hidden'))
    vim.keymap.set('n', '<space>x', api.fs.remove, opts('Delete'))
end

require("nvim-tree").setup({
    on_attach      = on_attach,
    sort_by        = "case_sensitive",
    actions        = {
        change_dir = {
            global = true,
        }
    },
    view           = {
        width = 50,
        side = 'right',
    },
    renderer       = {
        indent_markers = {
            enable = true,
        },
    },
    filters        = {
        dotfiles = true,
    },
})
