local api = vim.api
local blue = '#6e9cb0'
local grey = "#444444"
local left_sep = ''
local right_sep = ''


local toggle_statusline = function()
  local option = vim.api.nvim_get_option('laststatus')
  if (option == 0) then
    vim.api.nvim_set_option('laststatus', 3)
    vim.api.nvim_set_option('cmdheight', 1)
  else
    vim.api.nvim_set_option('laststatus', 0)
    vim.api.nvim_set_option('cmdheight', 0)
  end
end

vim.keymap.set(
  { 'n' },
  'd',
  toggle_statusline,
  { silent = true }
)

api.nvim_set_hl(0, "StatusLineMode", {bg = blue, fg = "#1c1c1c", bold = true})
api.nvim_set_hl(0, "StatuslineFilename", {bg = grey, fg = "#ffffff"})
api.nvim_set_hl(0, "StatuslineInactive", {bg = grey, fg = "#ffffff", bold = true})
api.nvim_set_hl(0, "SeparatorBlue", {bg = "NONE", fg = blue})
api.nvim_set_hl(0, "SeparatorGrey", {bg = "NONE", fg = grey})

local modes = {
  ["n"] = "NORMAL",
  ["no"] = "NORMAL",
  ["v"] = "VISUAL",
  ["V"] = "VISUAL LINE",
  [""] = "VISUAL BLOCK",
  ["s"] = "SELECT",
  ["S"] = "SELECT LINE",
  [""] = "SELECT BLOCK",
  ["i"] = "INSERT",
  ["ic"] = "INSERT",
  ["R"] = "REPLACE",
  ["Rv"] = "VISUAL REPLACE",
  ["c"] = "COMMAND",
  ["cv"] = "VIM EX",
  ["ce"] = "EX",
  ["r"] = "PROMPT",
  ["rm"] = "MOAR",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
  ["t"] = "TERMINAL",
}

local function mode()
  local current_mode = vim.api.nvim_get_mode().mode
  return string.format(" %s ", modes[current_mode]):upper()
end

local function filepath()
  local fpath = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.:h")
  if fpath == "" or fpath == "." then
    return " "
  end

  return string.format(" %%<%s/", fpath)
end

local function filename()
  local fname = vim.fn.expand "%:t"
  if fname == "" then
    return ""
  end
  return fname .. " "
end

local function lineinfo()
  if vim.bo.filetype == "alpha" then
    return ""
  end
  return " %P %l:%c "
end

Statusline = {}

Statusline.active = function()
  return table.concat {
    ----Mode part
    "%#Normal#",
    " ",
    "%#SeparatorBlue#",
    left_sep,
    "%#StatuslineMode#",
    mode(),
    "%#SeparatorBlue#",
    right_sep,
    ----Filename part
    "%#Normal#",
    " ",
    "%#SeparatorGrey#",
    left_sep,
    "%#StatuslineFilename#",
    filepath(),
    filename(),
    ----
    "%=%#SeparatorGrey#",
    right_sep,
    "%#Normal#",
    " ",
    "%#SeparatorBlue#",
    left_sep,
    "%#StatuslineMode#",
    lineinfo(),
    "%#SeparatorBlue#",
    right_sep,
    "%#Normal#",
    " ",
  }
end

function Statusline.inactive()
  return table.concat {
    ----Mode part
    "%#Normal#",
    " ",
    "%#SeparatorGrey#",
    left_sep,
    "%#StatuslineInactive#",
    "INACTIVE",
    "%#SeparatorGrey#",
    right_sep,
    ----Filename part
    "%#Normal#",
    " ",
    "%#SeparatorGrey#",
    left_sep,
    "%#StatuslineFilename#",
    --filepath(),
    --filename(),
    " %f",
    "%=%#SeparatorGrey#",
    right_sep,
    "%#Normal#",
    " ",
  }
end

vim.api.nvim_exec([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  augroup END
]], false)
