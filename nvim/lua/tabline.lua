local blue = '#458588'
local bg = "#1c1c1c"
local grey = "#666666"

vim.highlight.create('TablineBufferActive', { guibg = blue, guifg = bg, gui = 'bold' }, false)
vim.highlight.create('TablineBufferInactive', { guibg = grey, guifg = "#ffffff" }, false)

local active_buf_hi = '%#TablineBufferActive#'
local inactive_buf_hi = '%#TablineBufferInactive#'

--SeparatorBlue highlight defined in statusline.lua file
local blue_sep_hi = '%#SeparatorBlue#'
local grey_sep_hi = '%#SeparatorGrey#'

local targets = { 'e', 'u', 'o', 'a', 'p', 'j', 'k', 'q' }

local function Tabline()
  local tabline = '%#Normal# '
  local buf = vim.api.nvim_list_bufs()
  local buf_listed = {}

  for _, v in ipairs(buf) do
    if (vim.fn.buflisted(v) == 1) then
      table.insert(buf_listed, v)
    end
  end


  for k, v in ipairs(buf_listed) do
    local buf_name = ' '
    if (vim.fn.bufnr('%') == vim.fn.bufnr(v)) then
      buf_name = blue_sep_hi .. ''
      local name = vim.fn.fnamemodify(vim.fn.bufname(v), ":t")
      buf_name = buf_name .. active_buf_hi .. targets[k] .. ": " .. name
      buf_name = buf_name .. blue_sep_hi .. ' '
      buf_name = active_buf_hi .. buf_name .. inactive_buf_hi
    else
      buf_name = grey_sep_hi .. ''
      local name = vim.fn.fnamemodify(vim.fn.bufname(v), ":t")
      buf_name = buf_name .. inactive_buf_hi .. targets[k] .. ": " .. name
      buf_name = buf_name .. grey_sep_hi .. ' '
      buf_name = active_buf_hi .. buf_name .. inactive_buf_hi
    end
    tabline = tabline .. buf_name

    vim.keymap.set(
      { 'n' },
      'g' .. targets[k],
      ':b' .. v .. '<CR>',
      { silent = true }
    )
  end

  vim.api.nvim_set_option('tabline',
    --inactive_buf_hi
    tabline .. '%#Normal#')
end

local opts = {
  callback = function()
    Tabline()
  end
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufLeave", "WinEnter" }, opts)

