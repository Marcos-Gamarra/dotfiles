local theme = os.getenv("THEME")

if theme == "dark" then
    vim.o.background = "dark"
else
    vim.o.background = "light"
end
