style = io.open ("/home/hi/.theme" , "r")
io.input(style)
local background = io.read()
if background == "dark" then
  vim.cmd('set background=dark')
	vim.cmd('colorscheme seoul256')
  --vim.cmd('hi CursorLineNr guibg=#3c3836 gui=bold')
	--vim.cmd('colorscheme tempus_tempest')
else
	--vim.cmd('colorscheme onehalflight')
  vim.cmd('set background=light')
	vim.cmd('colorscheme seoul256-light')
  --vim.cmd('hi CursorLine guibg=#dbcea2')
  --vim.cmd('hi LineNr guifg=#9c6f54')
end
io.close(style)

