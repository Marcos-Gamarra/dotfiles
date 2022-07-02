-- for repeating search
vim.api.nvim_set_keymap("", "b", "(v:searchforward ? 'n' : 'N')", {noremap=true, expr=true})
vim.api.nvim_set_keymap("", "B", "(v:searchforward ? 'N' : 'n')", {noremap=true, expr=true})

--scrolling
vim.api.nvim_set_keymap("n", "v", "<C-e>", {noremap=true})
vim.api.nvim_set_keymap("n", "w", "<C-y>", {noremap=true})
vim.api.nvim_set_keymap("v", "v", "<C-e>", {noremap=true})
vim.api.nvim_set_keymap("v", "w", "<C-y>", {noremap=true})

--move to the end of the line 
vim.api.nvim_set_keymap("n", "=", "g_", {noremap=true})
vim.api.nvim_set_keymap("v", "=", "g_", {noremap=true})
vim.api.nvim_set_keymap("o", "=", "g_", {noremap=true})

--visual and block mode
vim.api.nvim_set_keymap("n", "k", "v", {noremap=true})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-v>", {noremap=true})

--delete text
vim.api.nvim_set_keymap("n", "e", "d", {noremap=true})
vim.api.nvim_set_keymap("o", "e", "d", {noremap=true})
vim.api.nvim_set_keymap("v", "e", "dv", {noremap=true})
vim.api.nvim_set_keymap("n", "e_", "dv^", {noremap=true})

--copy text
vim.api.nvim_set_keymap("v", "Ż", "y:call system('wl-copy', @\")<C-M>", {noremap=true})
vim.api.nvim_set_keymap("n", "j", "yv", {noremap=true})
vim.api.nvim_set_keymap("n", "jj", "yy", {noremap=true})
vim.api.nvim_set_keymap("v", "j", "yv", {noremap=true})
vim.api.nvim_set_keymap("o", "j", "yv", {noremap=true})

--save file
vim.api.nvim_set_keymap("n", "<space>w", ":w<CR>", {noremap=true})


--paste text
vim.api.nvim_set_keymap("n", "ż", "y:call system('wl-paste')<C-M>p", {noremap=true})
vim.api.nvim_set_keymap("i", "ż", "<C-c>:let @\"=system('wl-paste -n')<C-M>pi", {noremap=true})

--folding
vim.api.nvim_set_keymap("n", "za", "zA", {noremap=true})
vim.api.nvim_set_keymap("n", "zr", "zR", {noremap=true})
vim.api.nvim_set_keymap("n", "zm", "zM", {noremap=true})


vim.api.nvim_set_keymap("n", "h", "a", {noremap=true})



--buffd
--vim.api.nvim_set_keymap("n", "a", ":Buffd<CR>", {noremap=true})
