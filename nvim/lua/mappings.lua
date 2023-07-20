-- for repeating search
vim.keymap.set("", "b", "(v:searchforward ? 'n' : 'N')", { noremap = true, expr = true })
vim.keymap.set("", "B", "(v:searchforward ? 'N' : 'n')", { noremap = true, expr = true })

--scrolling
vim.keymap.set("n", "m", "<C-y>", { noremap = true })
vim.keymap.set("n", "f", "<C-e>", { noremap = true })
vim.keymap.set("v", "m", "<C-y>", { noremap = true })
vim.keymap.set("v", "f", "<C-e>", { noremap = true })

--move to the start/end of line
vim.api.nvim_set_keymap("", "s<return>", "^", { noremap = true })
vim.api.nvim_set_keymap("", "r<return>", "$", { noremap = true })

--visual and block mode
vim.api.nvim_set_keymap("n", "<space>v", "<C-v>", { noremap = true })
vim.api.nvim_set_keymap("n", "lv", "V", { noremap = true })


--delete text
vim.api.nvim_set_keymap("", "e", "d", { noremap = true })
vim.api.nvim_set_keymap("", "<space>e", "dv", { noremap = true })
vim.api.nvim_set_keymap("", "h", "c", { noremap = false })

--folds
vim.api.nvim_set_keymap("n", "zl", "zo", { noremap = true })

--save file
vim.keymap.set("n", "<CR>", ":wa!<CR>", { noremap = true })

--copilot
vim.api.nvim_set_keymap("i", "<C-a>", "copilot#Accept('CR')", { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<C-j>", "<Plug>(copilot-next)", {})
vim.api.nvim_set_keymap("n", "<space>co", ":Copilot panel<CR>", { noremap = true })
vim.g.copilot_no_tab_map = true


-- buffers
vim.keymap.set("n", "g<space>", "<C-6>", { noremap = true })

--splits
vim.keymap.set("n", "<C-s>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-r>", "<C-w>l", { noremap = true })
vim.keymap.set("n", "<C-v>", "<C-w>v", { noremap = true })
vim.keymap.set("n", "<C-m>", "<C-w>>", { noremap = true })
vim.keymap.set("n", "<C-f>", "<C-w><", { noremap = true })

--redo
vim.keymap.set("n", "<C-u>", "<C-r>", { noremap = true })

--toggle options
vim.keymap.set("n", "<space>on", ":set nu!<CR>", { noremap = true })
vim.keymap.set("n", "<space>oh", ":set hlsearch!<CR>", { noremap = true })
