require('plugins')

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

-- folding
vim.o.foldlevelstart = 99
vim.o.foldenable = false
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
