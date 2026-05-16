vim.pack.add({ 'https://github.com/mikavilpas/yazi.nvim' })

vim.keymap.set("n", "<space>y", function()
    require("yazi").yazi()
end, { desc = "Open Yazi" })

local borders = {
    "┏", "━", "┓", "┃", "┛", "━", "┗", "┃",
}

require("yazi").setup({
    open_for_directories = true,
    yazi_floating_window_border = borders,
})
