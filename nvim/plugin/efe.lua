local efe = require 'efe'

vim.keymap.set(
    { 'n', 'v', 'o' },
    's',
    efe.forward,
    { silent = true }
)
vim.keymap.set(
    { 'n', 'v', 'o' },
    'h',
    efe.backward,
    { silent = true }
)
vim.keymap.set(
    { 'n', 'v', 'o' },
    'S',
    efe.repeat_forward,
    { silent = true }
)
vim.keymap.set(
    { 'n', 'v', 'o' },
    'H',
    efe.repeat_backward,
    { silent = true }
)
