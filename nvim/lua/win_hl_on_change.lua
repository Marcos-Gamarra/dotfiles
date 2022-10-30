--When using multiple windows, this segment of code will highlight the current line
--in the window that has focus.  
-----------------------------------------------------------
local cursor_hl = vim.api.nvim_get_hl_by_name("CursorLine", true)
local cursor_line_bg = string.format("#%06x", cursor_hl.background)
vim.api.nvim_set_hl(0, 'CursorLineInactive', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'CursorLineActive', { bg = cursor_line_bg })
vim.api.nvim_create_autocmd({ "WinEnter" }, {
  callback = function()
    vim.api.nvim_win_set_option(0, 'winhl', 'CursorLine:CursorLineActive')
  end
})

vim.api.nvim_create_autocmd({ "WinLeave" }, {
  callback = function()
    vim.api.nvim_win_set_option(0, 'winhl', 'CursorLine:CursorLineInactive,CursorLineNr:Normal')
  end
})
-------------------------------------------------------------
-------------------------------------------------------------


local red = '#875f5f'
--Highlight for border color of floating window
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = red, bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, 'NormalFloat', { fg = "NONE", bg = "NONE" })

--Highlight for window separator
vim.api.nvim_set_hl(0, 'VertSplit', { fg = red, bg = "NONE", bold = true })
