-- for repeating search
vim.keymap.set("", "N", "(v:searchforward ? 'n' : 'N')", { noremap = true, expr = true })
vim.keymap.set("", "T", "(v:searchforward ? 'N' : 'n')", { noremap = true, expr = true })

--scrolling
vim.keymap.set("n", "m", "3<C-y>", { noremap = true })
vim.keymap.set("n", "f", "3<C-e>", { noremap = true })
vim.keymap.set("v", "m", "3<C-y>", { noremap = true })
vim.keymap.set("v", "f", "3<C-e>", { noremap = true })

--move to the start/end of line
vim.keymap.set("", "s<return>", "^", { noremap = true })
vim.keymap.set("", "r<return>", "$", { noremap = true })


--delete text stuff
vim.keymap.set("", "e", "d", { noremap = true })
vim.keymap.set("", "h", "v", { noremap = true })


--save file
vim.keymap.set("n", "<tab><backspace>", ":wa!<CR>", { noremap = true })

-- delete word and go to insert mode
vim.keymap.set("n", "<tab><tab>", "ciw", { noremap = true })

-- buffers
vim.keymap.set("n", "g<space>", "<C-6>", { noremap = true })

--splits
vim.keymap.set("n", "<space>sv", "<C-w>v", { noremap = true })
vim.keymap.set("n", "<space>sh", "<C-w>s", { noremap = true })
vim.keymap.set("n", "<space>rr", "<C-w>l", { noremap = true })
vim.keymap.set("n", "<space>ss", "<C-w>h", { noremap = true })
--vim.keymap.set("n", "<C-m>", "<C-w>>", { noremap = true })
--vim.keymap.set("n", "<C-f>", "<C-w><", { noremap = true })

--redo
vim.keymap.set("n", "<C-u>", "<C-r>", { noremap = true })

--toggle options
vim.keymap.set("n", "<space>on", ":set nu!<CR>", { noremap = true })
vim.keymap.set("n", "<space>oh", ":set hlsearch!<CR>", { noremap = true })
vim.keymap.set("n", "<space>ow", ":set wrap!<CR>", { noremap = true })

--visual mode
vim.keymap.set("", "<space>h", "V", { noremap = true })

-- folding
vim.keymap.set("", "j", "z", { noremap = true })
vim.keymap.set("", "jt", "za", { noremap = true })
vim.keymap.set("", "j<space>t", "zA", { noremap = true })
