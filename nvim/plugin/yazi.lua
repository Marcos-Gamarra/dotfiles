vim.pack.add({ 'https://github.com/mikavilpas/yazi.nvim' })

vim.keymap.set("n", "<space>y", function()
    require("yazi").yazi()
end, { desc = "Open Yazi" })

require("yazi").setup({
    open_for_directories = true
})
