local frappe = require("catppuccin.palettes").get_palette "frappe"

local api = vim.api
local active_bg = frappe.blue
local active_fg = frappe.base
local inactive_bg = frappe.overlay0
local text = frappe.text
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

api.nvim_set_hl(0, "StatusLineMode", { bg = active_bg, fg = active_fg, bold = true })
api.nvim_set_hl(0, "StatuslineFilename", { bg = inactive_bg, fg = text, bold = true })
api.nvim_set_hl(0, "StatuslineInactive", { bg = inactive_bg, fg = text, bold = true })
api.nvim_set_hl(0, "SeparatorActive", { bg = "NONE", fg = active_bg })
api.nvim_set_hl(0, "SeparatorInactive", { bg = "NONE", fg = inactive_bg })

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
        "%#SeparatorActive#",
        left_sep,
        "%#StatuslineMode#",
        mode(),
        "%#SeparatorActive#",
        right_sep,
        ----Filename part
        "%#Normal#",
        " ",
        "%#SeparatorInactive#",
        left_sep,
        "%#StatuslineFilename#",
        filepath(),
        filename(),
        ----
        "%=%#SeparatorInactive#",
        right_sep,
        "%#Normal#",
        " ",
        "%#SeparatorActive#",
        left_sep,
        "%#StatuslineMode#",
        lineinfo(),
        "%#SeparatorActive#",
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
        "%#SeparatorInactive#",
        left_sep,
        "%#StatuslineInactive#",
        "INACTIVE",
        "%#SeparatorInactive#",
        right_sep,
        ----Filename part
        "%#Normal#",
        " ",
        "%#SeparatorInactive#",
        left_sep,
        "%#StatuslineFilename#",
        --filepath(),
        --filename(),
        " %f",
        "%=%#SeparatorInactive#",
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
