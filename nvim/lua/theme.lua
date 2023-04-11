vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_italic = false
vim.g.nord_bold = false
vim.cmd('colorscheme nord')

if vim.o.background == 'light' then
    vim.g.decoration_bg = "#D9DEE9"
    vim.g.decoration_fg = "#4C566A"
else -- dark
    vim.g.decoration_bg = "#D9DEE9"
    vim.g.decoration_fg = "#4C566A"
end

function SwichBg()
    if vim.o.background == "dark" then
        vim.o.background = "light"
        vim.g.decoration_bg = "#4C566A"
        vim.g.decoration_fg = "#D8DEE9"
    else
        vim.o.background = "dark"
        vim.g.decoration_bg = "#D9DEE9"
        vim.g.decoration_fg = "#4C566A"
    end
    os.execute("switch_theme")
    dofile('/home/hi/.config/nvim/lua/tabline.lua')
    dofile('/home/hi/.config/nvim/lua/statusline.lua')
end
