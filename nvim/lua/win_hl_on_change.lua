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

