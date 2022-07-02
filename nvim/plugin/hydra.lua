local Hydra = require('hydra')

Hydra({
    name = 'Window mode',
    hint =[[Window]],
    config = {
        on_enter = function()
            vim.cmd("hi clear HydraHint")
            vim.cmd("hi clear HydraTeal")
            vim.cmd("hi HydraHint guibg='NONE' guifg=#5f87af gui=bold")
            --vim.cmd("hi NormalFloat guibg=#5f87af")
        end,
        hint = {
            position = "middle-left",
            border = 'rounded',
        },
        color = "amaranth",
    },
    mode = 'n',
    body = '<C-w>',
    heads = {
        { 's', '<C-w>l', { desc = false } },
        { "h", '<C-w>h', { desc = false } },
        { "t", '<C-w>k', { desc = false } },
        { "n", '<C-w>j', { desc = false } },
        { 'v', '<C-w>v', { desc = false } },
        { 'z', '<C-w>s', { desc = false } },
        { '<Up>', '<C-w>-', { desc = false } },
        { '<Down>', '<C-w>+', { desc = false } },
        { '<Right>', '<C-w>>', { desc = false } },
        { '<Left>', '<C-w><', { desc = false } },
        { 'q', '<C-w>q', { desc = false } },
        { '<Esc>', '<Esc>', { desc = false } },
    },
})


