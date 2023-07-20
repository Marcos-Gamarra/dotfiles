require('mini.indentscope').setup({
    symbol = '┃',
    mappings = {
        object_scope = '',
        object_scope_with_border = '',
        goto_top = '',
        goto_bottom = '',
    },
})

vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbol', { fg = '#ababab', bg = 'NONE', bold = true })
