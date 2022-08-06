lua require('mappings')
lua require('get_background')
lua require('statusline')
lua require('tabline')
lua require('buffers')
lua require('win_hl_on_change')

set cursorline
set title
set showtabline=2
set titlestring=%t
set number 
set virtualedit=block
set autoindent tabstop=4 shiftwidth=4 expandtab
set ignorecase
set termguicolors



autocmd FileType cpp :set tabstop=2 | set shiftwidth=2 
autocmd FileType lua :set tabstop=2 | set shiftwidth=2 
autocmd FileType dart :set tabstop=2 | set shiftwidth=2 
