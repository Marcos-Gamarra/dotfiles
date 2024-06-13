-- for repeating search
vim.keymap.set("", "N", "(v:searchforward ? 'n' : 'N')", { noremap = true, expr = true })
vim.keymap.set("", "T", "(v:searchforward ? 'N' : 'n')", { noremap = true, expr = true })

--scrolling
vim.keymap.set("n", ")", "3<C-y>", { noremap = true })
vim.keymap.set("n", "=", "3<C-e>", { noremap = true })
vim.keymap.set("v", ")", "3<C-y>", { noremap = true })
vim.keymap.set("v", "=", "3<C-e>", { noremap = true })

--move to the start/end of line
vim.keymap.set("", "s<return>", "^", { noremap = true })
vim.keymap.set("", "r<return>", "$", { noremap = true })

--delete text stuff
vim.keymap.set("", "e", "d", { noremap = true })
vim.keymap.set("", "h", "c", { noremap = true })


--save file
vim.keymap.set("n", "<tab><backspace>", ":wa!<CR>", { noremap = true })

-- buffers
vim.keymap.set("n", "g<space>", "<C-6>", { noremap = true })

--splits
vim.keymap.set("n", "kv", "<C-w>v", { noremap = true })
vim.keymap.set("n", "kh", "<C-w>s", { noremap = true })
vim.keymap.set("n", "kr", "<c-w>l", { noremap = true })
vim.keymap.set("n", "ks", "<c-w>h", { noremap = true })
vim.keymap.set("n", "kt", "<C-w>k", { noremap = true })
vim.keymap.set("n", "kn", "<C-w>j", { noremap = true })
vim.keymap.set("n", "kw", "<C-w>q", { noremap = true })
vim.keymap.set("n", "kq", "<C-w>>", { noremap = true })
vim.keymap.set("n", "kc", "<C-w><", { noremap = true })
vim.keymap.set("n", "k=", "<C-w>=", { noremap = true }) -- balance splits

--redo
vim.keymap.set("n", "<C-u>", "<C-r>", { noremap = true })

--toggle options
vim.keymap.set("n", "<space>on", ":set nu!<CR>", { noremap = true })
vim.keymap.set("n", "<space>oh", ":set hlsearch!<CR>", { noremap = true })
vim.keymap.set("n", "<space>ow", ":set wrap!<CR>", { noremap = true })

-- terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

-- indententation
vim.keymap.set("", "<space>a", "=", { noremap = true })
