local decoration = '#875f5f'
local grey = "#858585"
local api = vim.api
local white_fg = "#eeeeee"

api.nvim_set_hl(0, "TablineBufferActive", { bg = decoration, fg = white_fg, bold = true })
api.nvim_set_hl(0, "TablineBufferInactive", { bg = grey, fg = "#333333" })

local active_buf_hi = '%#TablineBufferActive#'
local inactive_buf_hi = '%#TablineBufferInactive#'

--Separatordecoration highlight defined in statusline.lua file
local decoration_sep_hi = '%#Separatordecoration#'
local grey_sep_hi = '%#SeparatorGrey#'

local targets = { 'e', 'u', 'o', 'a', 'p', 'j', 'k', 'q' }

local function Tabline()
    local tabline = '%#Normal#'
    local buf = vim.api.nvim_list_bufs()
    local buf_listed = {}

    for _, v in ipairs(buf) do
        if (vim.fn.buflisted(v) == 1) then
            table.insert(buf_listed, v)
        end
    end

    for k, v in ipairs(buf_listed) do
        local buf_name = ''
        local current_buf = vim.fn.bufnr('%')
        if (vim.fn.buflisted(current_buf) ~= 1) then
            return
        end
        if (vim.fn.bufnr('%') == vim.fn.bufnr(v)) then
            buf_name = decoration_sep_hi .. ''
            local name = vim.fn.fnamemodify(vim.fn.bufname(v), ":t")
            buf_name = buf_name .. active_buf_hi .. targets[k] .. ": " .. name
            buf_name = buf_name .. decoration_sep_hi .. ' '
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

    -- hide tabline if only one buffer is open
    if (#buf_listed == 1) then
        vim.opt.showtabline = 0
        vim.api.nvim_set_option('tabline',
            '')
        return
    end

    vim.opt.showtabline = 2
    vim.api.nvim_set_option('tabline',
        tabline .. '%#Normal#')
end

local opts = {
    callback = function()
        Tabline()
    end
}

vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, opts)
