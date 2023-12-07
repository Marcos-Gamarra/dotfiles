--require('theme')
require('mappings')
--require('statusline')
require('tabline')
--require('win_hl_on_change')
require('term')


vim.opt.laststatus = 3
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.virtualedit = "block"
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.termguicolors = true
vim.opt.showtabline = 2

vim.api.nvim_create_autocmd({ "BufReadPost", "FileReadPost" }, {
    pattern = { "*.norg" },
    command = "setlocal conceallevel=2"
})
