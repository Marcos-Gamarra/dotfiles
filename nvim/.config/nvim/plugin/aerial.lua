vim.pack.add({ 'https://github.com/stevearc/aerial.nvim' })

require('aerial').setup({})

-- You probably also want to set a keymap to toggle aerial
vim.keymap.set('n', '(', '<cmd>AerialToggle!<CR>')
