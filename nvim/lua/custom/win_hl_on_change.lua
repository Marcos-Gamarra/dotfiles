--When using multiple windows, this segment of code will highlight the current line
--in the window that has focus.  
-----------------------------------------------------------
local cursor_line_bg = "#3b3f52"

vim.api.nvim_set_hl(0, 'CursorLineActive', { bg = cursor_line_bg })
vim.api.nvim_set_hl(0, 'CursorLineInactive', { bg = 'NONE' })
vim.api.nvim_create_autocmd({ "WinEnter" }, {
  callback = function()
    vim.api.nvim_win_set_option(0, 'winhl', 'CursorLine:CursorLineActive')
  end
})

vim.api.nvim_create_autocmd({ "WinLeave" }, {
  callback = function()
    vim.api.nvim_win_set_option(0, 'winhl', 'CursorLine:CursorLineInactive')
  end
})
-------------------------------------------------------------


