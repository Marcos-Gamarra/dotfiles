local theme = ""
for line in io.lines("/home/hi/.theme") do
    theme = line
end

if theme == "dark" then
    vim.o.background = "dark"
else
    vim.o.background = "light"
end

function SwitchTheme()
    local theme2 = ""
    for line in io.lines("/home/hi/.theme") do
        theme2 = line
    end

    if theme2 == "dark" then
        vim.o.background = "light"
    else
        vim.o.background = "dark"
    end


    vim.cmd("suspend")
    os.execute("switch-theme")
    dofile("/home/hi/.config/nvim/lua/tabline.lua")
    dofile("/home/hi/.config/nvim/lua/statusline.lua")
end
