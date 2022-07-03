local blue = '#5f87af'
local bg = "#1c1c1c"
local grey = "#444444"
local left_sep = ''
local right_sep = ''

vim.highlight.create('StatuslineMode', {guibg=blue, guifg=bg, gui='bold'}, false)
vim.highlight.create('StatuslineFilename', {guibg=grey, guifg="#ffffff"}, false)
vim.highlight.create("StatuslineInactive", {guibg=grey, guifg="#ffffff", gui='bold'}, false)
vim.highlight.create('SeparatorBlue', {guibg="NONE", guifg=blue, gui='bold'}, false)
vim.highlight.create('SeparatorGrey', {guibg="NONE", guifg=grey, gui='bold'}, false)

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

local function filetype()
  return string.format(" %s ", vim.bo.filetype):upper()
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
