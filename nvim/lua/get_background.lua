style = io.open ("/home/hi/.style" , "r")
io.input(style)
local background = io.read()
if background == "dark" then
	vim.cmd('colorscheme hybrid')
	--vim.cmd('colorscheme tempus_tempest')
else
	vim.cmd('colorscheme onehalflight')
end
io.close(style)

