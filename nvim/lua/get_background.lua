style = io.open ("/home/hi/.style" , "r")
io.input(style)
local background = io.read()
vim.cmd('let gruvbox_material_background="soft"')
if background == "dark" then
  vim.cmd('set background=dark')
	vim.cmd('colorscheme gruvbox-material')
  vim.cmd('hi CursorLineNr guibg=#3c3836 gui=bold')
	--vim.cmd('colorscheme tempus_tempest')
else
	--vim.cmd('colorscheme onehalflight')
  vim.cmd('set background=light')
	vim.cmd('colorscheme gruvbox-material')
  vim.cmd('hi CursorLine guibg=#dbcea2')
  vim.cmd('hi LineNr guifg=#9c6f54')
end
io.close(style)

