-- for repeating search
vim.keymap.set("", "b", "(v:searchforward ? 'n' : 'N')", { noremap = true, expr = true })
vim.keymap.set("", "B", "(v:searchforward ? 'N' : 'n')", { noremap = true, expr = true })

--scrolling
vim.keymap.set("n", "m", "<C-y>", { noremap = true })
vim.keymap.set("n", "f", "<C-e>", { noremap = true })
vim.keymap.set("v", "m", "<C-y>", { noremap = true })
vim.keymap.set("v", "f", "<C-e>", { noremap = true })

--move to the end of the line
vim.keymap.set("n", "=", "g_", { noremap = true })
vim.keymap.set("v", "=", "g_", { noremap = true })
vim.keymap.set("o", "=", "g_", { noremap = true })

vim.keymap.set("n", "*", "g_", { noremap = true })
vim.keymap.set("v", "*", "g_", { noremap = true })
vim.keymap.set("o", "*", "g_", { noremap = true })

--visual and block mode
vim.keymap.set("n", "<space>v", "<C-v>", { noremap = true })

--delete text
vim.keymap.set("n", "e", "d", { noremap = true })
vim.keymap.set("o", "e", "d", { noremap = true })
vim.keymap.set("v", "e", "d", { noremap = true })
vim.keymap.set("n", "e_", "dv^", { noremap = true })

--copy text
vim.keymap.set("v", "Ż", "y:call system('wl-copy', @\")<C-M>", { noremap = true })
vim.keymap.set("n", "j", "yv", { noremap = true })
vim.keymap.set("n", "jj", "yy", { noremap = true })
vim.keymap.set("v", "j", "yv", { noremap = true })
vim.keymap.set("o", "j", "yv", { noremap = true })

--save file
vim.keymap.set("n", "<space>sa", ":w<CR>", { noremap = true })


--paste text
vim.keymap.set("n", "ż", "y:call system('wl-paste')<C-M>p", { noremap = true })
vim.keymap.set("i", "ż", "<C-c>:let @\"=system('wl-paste -n')<C-M>pi", { noremap = true })

--folding
vim.keymap.set("n", "zn", "zj", { noremap = true })
vim.keymap.set("n", "zt", "zk", { noremap = true })

--copilot
vim.keymap.set("i", "ō", "copilot#Accept('<CR>')", { expr = true })
vim.g.copilot_no_tab_map = true

-- buffers
vim.keymap.set("n", "g<space>", "<C-6>", { noremap = true })

--splits
vim.keymap.set("n", "<C-s>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-r>", "<C-w>l", { noremap = true })
vim.keymap.set("n", "<C-v>", "<C-w>v", { noremap = true })

--redo
vim.keymap.set("n", "<C-u>", "<C-r>", { noremap = true })

--toggle options
vim.keymap.set("n", "<space>on", ":set nu!<CR>", { noremap = true })
vim.keymap.set("n", "<space>oh", ":set hlsearch!<CR>", { noremap = true })
