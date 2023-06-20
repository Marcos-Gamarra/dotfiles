local decoration_bg = vim.g.decoration_bg
local decoration_fg = vim.g.decoration_fg
local grey = "#858585"
local api = vim.api
api.nvim_set_hl(0, "TablineBufferActive", { bg = decoration_bg, fg = decoration_fg, bold = true })
api.nvim_set_hl(0, "TablineBufferInactive", { bg = grey, fg = "#eeeeee" })

local active_buf_hi = '%#TablineBufferActive#'
local inactive_buf_hi = '%#TablineBufferInactive#'

--Separatordecoration highlight defined in statusline.lua file
local decoration_sep_hi = '%#Separatordecoration#'
local grey_sep_hi = '%#SeparatorGrey#'

local labels = { 'e', 'a', 'i', 'h', 'o', 'u', 'y', 'k' }
local positions = { 1, 2, 3, 4, 5, 6, 7, 8 }


--returns a table with the buffer numbers of the current listed buffers
local function get_listed_buffers()
    local listed_buffers = {}
    local buflist = vim.api.nvim_list_bufs()
    for _, v in pairs(buflist) do
        if vim.fn.buflisted(v) == 1 then
            table.insert(listed_buffers, v)
        end
    end
    return listed_buffers
end

local function buffer_name_with_parent_dir(bufnr)
    local bufname = vim.fn.bufname(bufnr)
    return vim.fn.fnamemodify(bufname, ":p:h:t") .. "/" .. vim.fn.fnamemodify(bufname, ":t")
end


local function get_buffer_names()
    local buffer_names = {}
    local ordered_buffer_names = {}
    local listed_buffers = get_listed_buffers()
    for i, v in ipairs(listed_buffers) do
        local name = vim.fn.bufname(v)
        name = vim.fn.fnamemodify(name, ":t")
        if buffer_names[name] == nil then
            buffer_names[name] = positions[i]
            ordered_buffer_names[positions[i]] = { bufnr = v, name = name }
        else
            local existing_buffer_number = ordered_buffer_names[buffer_names[name]].bufnr
            local new_name_existing_buffer = buffer_name_with_parent_dir(existing_buffer_number)
            buffer_names[new_name_existing_buffer] = buffer_names[name]
            ordered_buffer_names[buffer_names[name]].name = new_name_existing_buffer

            local name_for_new_buffer = buffer_name_with_parent_dir(v)
            buffer_names[name_for_new_buffer] = positions[i]
            ordered_buffer_names[positions[i]] = { bufnr = v, name = name_for_new_buffer }

            buffer_names[name] = nil
        end
    end
    return ordered_buffer_names
end


local function Tabline()
    local buffer_names = get_buffer_names()
    local tabline = '%#Normal#'
    local current_buffer = vim.fn.bufnr('%')

    for i, v in ipairs(buffer_names) do
        if (vim.fn.buflisted(current_buffer) ~= 1) then
            return
        end
        local buf_name = ''
        if (current_buffer == v.bufnr) then
            buf_name = decoration_sep_hi .. ''
            buf_name = buf_name .. active_buf_hi .. labels[i] .. ": " .. v.name .. " "
            buf_name = buf_name .. decoration_sep_hi .. ' '
            buf_name = active_buf_hi .. buf_name .. inactive_buf_hi
        else
            buf_name = grey_sep_hi .. ''
            buf_name = buf_name .. inactive_buf_hi .. labels[i] .. ": " .. v.name .. " "
            buf_name = buf_name .. grey_sep_hi .. ' '
            buf_name = active_buf_hi .. buf_name .. inactive_buf_hi
        end
        tabline = tabline .. buf_name
    end

    vim.api.nvim_set_option('tabline',
        tabline .. '%#Normal#')
end

local function set_keymaps()
    for i, v in ipairs(get_buffer_names()) do
        vim.keymap.set(
            { 'n' },
            'g' .. labels[i],
            ':b' .. v.bufnr .. '<CR>',
            { silent = true }
        )
    end
end

function SwitchBufferPosition(new_position)
    local buffer_names = get_buffer_names()
    local current_buffer_number = vim.fn.bufnr('%')
    for i, v in ipairs(buffer_names) do
        if v.bufnr == current_buffer_number then
            local tmp = positions[i]
            positions[i] = positions[new_position]
            positions[new_position] = tmp
            Tabline()
            set_keymaps()
            break
        end
    end
end

local autocmd_buf_enter = {
    callback = function()
        Tabline()
    end
}

local autocmd_set_keymaps = {
    callback = function()
        set_keymaps()
    end
}

vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, autocmd_buf_enter)
vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, autocmd_set_keymaps)
