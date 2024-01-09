local left_sep = ''
local right_sep = ''

local inactive_bg = '#737994'
local active_bg = "#7aa2f7"
local active_fg = 'white'
local text = "white"

local api = vim.api


api.nvim_set_hl(0, "StatusLineMode", { bg = active_bg, fg = active_fg, bold = true })
api.nvim_set_hl(0, "StatuslineFilename", { bg = inactive_bg, fg = text, bold = true })
api.nvim_set_hl(0, "StatuslineInactive", { bg = inactive_bg, fg = text, bold = true })
api.nvim_set_hl(0, "StatusLineSeparatorActive", { bg = "NONE", fg = active_bg })
api.nvim_set_hl(0, "StatusLineSeparatorInactive", { bg = "NONE", fg = inactive_bg })


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
    '<space>os',
    toggle_statusline,
    { silent = true }
)

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
        "%#StatusLineSeparatorActive#",
        left_sep,
        "%#StatuslineMode#",
        mode(),
        "%#StatusLineSeparatorActive#",
        right_sep,
        ----Filename part
        "%#Normal#",
        " ",
        "%#StatusLineSeparatorInactive#",
        left_sep,
        "%#StatuslineFilename#",
        filepath(),
        filename(),
        ----
        "%=%#StatusLineSeparatorInactive#",
        right_sep,
        "%#Normal#",
        " ",
        "%#StatusLineSeparatorActive#",
        left_sep,
        "%#StatuslineMode#",
        lineinfo(),
        "%#StatusLineSeparatorActive#",
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
        "%#StatusLineSeparatorInactive#",
        left_sep,
        "%#StatuslineInactive#",
        "INACTIVE",
        "%#StatusLineSeparatorInactive#",
        right_sep,
        ----Filename part
        "%#Normal#",
        " ",
        "%#StatusLineSeparatorInactive#",
        left_sep,
        "%#StatuslineFilename#",
        --filepath(),
        --filename(),
        " %f",
        "%=%#StatusLineSeparatorInactive#",
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
