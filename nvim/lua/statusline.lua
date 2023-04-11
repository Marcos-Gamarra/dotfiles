local api = vim.api
local decoration_bg = vim.g.decoration_bg
local decoration_fg = vim.g.decoration_fg
local grey = "#858585"
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
    '<space>os',
    toggle_statusline,
    { silent = true }
)

api.nvim_set_hl(0, "StatusLineMode", { bg = decoration_bg, fg = decoration_fg, bold = true })
api.nvim_set_hl(0, "StatuslineFilename", { bg = grey, fg = "#ffffff" })
api.nvim_set_hl(0, "StatuslineInactive", { bg = grey, fg = "#ffffff", bold = true })
api.nvim_set_hl(0, "Separatordecoration", { bg = "NONE", fg = decoration_bg })
api.nvim_set_hl(0, "SeparatorGrey", { bg = "NONE", fg = grey })

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
        "%#Separatordecoration#",
        left_sep,
        "%#StatuslineMode#",
        mode(),
        "%#Separatordecoration#",
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
        "%#Separatordecoration#",
        left_sep,
        "%#StatuslineMode#",
        lineinfo(),
        "%#Separatordecoration#",
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
