local Hydra = require('hydra')
--local decoration = '#D8DEE9'

vim.keymap.set('', '<space>s', "<C-w>", {})
vim.keymap.set('', '<space>s<space>', "<C-w><C-p>", {})

Hydra({
    name = 'Window mode',
    hint = [[    Split     ]],
    --hint =[[ Window ]],
    config = {
        --on_enter = function()
        --    vim.cmd("hi clear HydraHint")
        --    vim.cmd("hi clear HydraTeal")
        --    vim.cmd("hi HydraHint guibg='NONE' guifg='NONE' gui=bold")
        --    vim.api.nvim_set_hl(0, 'HydraHint', { fg = "#eeeeee", bg = decoration, bold = true })
        --end,
        hint = {
            position = "middle",
            border = 'rounded',
        },
        color = "amaranth",
    },
    mode = 'n',
    body = '<space>s',
    heads = {
        { 's',       '<C-w>l', { desc = false } },
        { "h",       '<C-w>h', { desc = false } },
        { "t",       '<C-w>k', { desc = false } },
        { "n",       '<C-w>j', { desc = false } },
        { 'v',       '<C-w>v', { desc = false } },
        { 'z',       '<C-w>s', { desc = false } },
        { '<Up>',    '<C-w>-', { desc = false } },
        { '<Down>',  '<C-w>+', { desc = false } },
        { '<Right>', '<C-w>>', { desc = false } },
        { '<Left>',  '<C-w><', { desc = false } },
        { 'q',       '<C-w>q', { desc = false } },
    },
})
