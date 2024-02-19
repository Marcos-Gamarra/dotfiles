local efe = require 'efe'

vim.keymap.set(
    { 'n', 'v', 'o' },
    'r',
    efe.forward,
    { silent = true }
)

vim.keymap.set(
    { 'n', 'v', 'o' },
    's',
    efe.backward,
    { silent = true }
)

vim.keymap.set(
    { 'n', 'v', 'o' },
    'R',
    efe.repeat_forward,
    { silent = true }
)

vim.keymap.set(
    { 'n', 'v', 'o' },
    'S',
    efe.repeat_backward,
    { silent = true }
)
