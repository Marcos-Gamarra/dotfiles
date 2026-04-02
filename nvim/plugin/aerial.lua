vim.pack.add({'https://github.com/stevearc/aerial.nvim'})
require('aerial').setup({
    layout = {
        max_width = 0.50,
        width = 0.30,
    },

    backends = { "lsp", "treesitter" },

})
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set('n', '(', '<cmd>AerialToggle!<CR>')

