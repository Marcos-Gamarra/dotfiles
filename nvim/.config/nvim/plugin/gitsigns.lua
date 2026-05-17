vim.pack.add({ 'https://github.com/lewis6991/gitsigns.nvim.git' })


vim.keymap.set("n", "gih", ":Gitsigns preview_hunk<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gir", ":Gitsigns reset_hunk<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gid", ":Gitsigns diffthis<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gin", ":Gitsigns next_hunk<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "git", ":Gitsigns prev_hunk<CR>", { noremap = true, silent = true })

require('gitsigns').setup({
    on_attach = function()
        vim.keymap.set('n', 'gib', function()
            for _, win in ipairs(vim.api.nvim_list_wins()) do
                local buf = vim.api.nvim_win_get_buf(win)
                if vim.bo[buf].filetype == "gitsigns-blame" then
                    vim.api.nvim_win_close(win, true)
                    return
                end
            end
            require("gitsigns").blame()
        end)
    end,
})
