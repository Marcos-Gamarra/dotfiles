require('aerial').setup({
    -- optionally use on_attach to set keymaps when aerial has attached to a buffer
    layout = {
        max_width = 0.50,
        width = 0.30,
    },

    on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        --vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
        --vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
    end,
    backends = { "lsp", "treesitter" },

})
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set('n', '(', '<cmd>AerialToggle!<CR>')
