vim.opt.number = true
vim.opt.cursorline = true
vim.opt.virtualedit = "block"
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.termguicolors = true
vim.opt.showtabline = 1
vim.opt.laststatus = 3

vim.o.winborder = '┏,━,┓,┃,┛,━,┗,┃'

require('vim._core.ui2').enable()

require('mappings')
require('statusline')
require('incremental_selection')
