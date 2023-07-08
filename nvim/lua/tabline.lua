local grey = "#858585"
local api = vim.api
local separator_left = ""
local separator_right = ""
api.nvim_set_hl(0, "TablineBufferActive", { bg = decoration_bg, fg = decoration_fg, bold = true })
api.nvim_set_hl(0, "TablineBufferInactive", { bg = grey, fg = "#eeeeee" })

local active_buf_hi = '%#TablineBufferActive#'
local inactive_buf_hi = '%#TablineBufferInactive#'

--Separatordecoration highlight defined in statusline.lua file
local decoration_sep_hi = '%#Separatordecoration#'
local grey_sep_hi = '%#SeparatorGrey#'

local labels = { 'e', 'a', 'i', 'h', 'o', 'u', 'y', 'k' }

local buffers = {}

local function createBuffer(bufNumber)
    local name = api.nvim_buf_get_name(bufNumber)
    name = vim.fn.fnamemodify(name, ":t")
    return {
        name = name,
        number = bufNumber,
    }
end

local function updateBuffersList()
    local aux_index = 1
    local buflist = vim.api.nvim_list_bufs()
    for _, bufNumber in pairs(buflist) do
        if vim.fn.buflisted(bufNumber) == 1 then
            local buffer = createBuffer(bufNumber)
            buffers[aux_index] = buffer
            aux_index = aux_index + 1
        end
    end
end

local function removeCurrentBufferFromList()
    local currentBuffer = vim.fn.bufnr('%')
    for i, buffer in ipairs(buffers) do
        if buffer.number == currentBuffer then
            table.remove(buffers, i)
            break
        end
    end
end

updateBuffersList()


--local function buffer_name_with_parent_dir(bufnr)
--    local bufname = vim.fn.bufname(bufnr)
--    return vim.fn.fnamemodify(bufname, ":p:h:t") .. "/" .. vim.fn.fnamemodify(bufname, ":t")
--end
--
--
--local function get_buffer_names()
--    local buffer_names = {}
--    local ordered_buffer_names = {}
--    local listed_buffers = get_listed_buffers()
--    for i, v in ipairs(listed_buffers) do
--        local name = vim.fn.bufname(v)
--        name = vim.fn.fnamemodify(name, ":t")
--        if buffer_names[name] == nil then
--            buffer_names[name] = positions[i]
--            ordered_buffer_names[positions[i]] = { bufnr = v, name = name }
--        else
--            local existing_buffer_number = ordered_buffer_names[buffer_names[name]].bufnr
--            local new_name_existing_buffer = buffer_name_with_parent_dir(existing_buffer_number)
--            buffer_names[new_name_existing_buffer] = buffer_names[name]
--            ordered_buffer_names[buffer_names[name]].name = new_name_existing_buffer
--
--            local name_for_new_buffer = buffer_name_with_parent_dir(v)
--            buffer_names[name_for_new_buffer] = positions[i]
--            ordered_buffer_names[positions[i]] = { bufnr = v, name = name_for_new_buffer }
--
--            buffer_names[name] = nil
--        end
--    end
--    return ordered_buffer_names
--end

local function renderTabline()
    local current_buffer = vim.fn.bufnr('%')
    local tabline = { '%#Normal#' }

    for i, buffer in pairs(buffers) do
        if (vim.fn.buflisted(current_buffer) ~= 1) then
            return
        end
        local buf_name = ''
        if (current_buffer == buffer.number) then
            current_buf_index = i
            table.insert(tabline, decoration_sep_hi)
            table.insert(tabline, separator_left)
            table.insert(tabline, active_buf_hi)
            table.insert(tabline, labels[i])
            table.insert(tabline, ': ')
            table.insert(tabline, buffer.name)
            table.insert(tabline, " ")
            table.insert(tabline, decoration_sep_hi)
            table.insert(tabline, separator_right)
            table.insert(tabline, ' ')
            table.insert(tabline, active_buf_hi)
            table.insert(tabline, buf_name)
            table.insert(tabline, inactive_buf_hi)
        else
            table.insert(tabline, grey_sep_hi)
            table.insert(tabline, separator_left)
            table.insert(tabline, inactive_buf_hi)
            table.insert(tabline, labels[i])
            table.insert(tabline, ': ')
            table.insert(tabline, buffer.name)
            table.insert(tabline, " ")
            table.insert(tabline, grey_sep_hi)
            table.insert(tabline, separator_right)
            table.insert(tabline, ' ')
            table.insert(tabline, active_buf_hi)
            table.insert(tabline, buf_name)
            table.insert(tabline, inactive_buf_hi)
        end
    end

    table.insert(tabline, "%#Normal#")
    local tabline_str = table.concat(tabline)
    vim.api.nvim_set_option('tabline', tabline_str)
end

local function setKeymaps()
    for i, buffer in ipairs(buffers) do
        vim.keymap.set(
            { 'n' },
            'g' .. labels[i],
            ':b' .. buffer.number .. '<CR>',
            { silent = true }
        )
    end
end

function SwitchBufferPosition()
    local label = vim.fn.getchar()
    label = string.char(label)
    if label == '' then
        return
    end
    local current_buffer_pos = nil
    local target_buffer_pos = nil
    for i, buffer in ipairs(buffers) do
        if (vim.fn.bufnr('%') == buffer.number) then
            current_buffer_pos = i
        end
        if (label == labels[i]) then
            target_buffer_pos = i
        end
    end
    if (current_buffer_pos == nil or target_buffer_pos == nil) then
        return
    end
    local temp = buffers[current_buffer_pos]
    buffers[current_buffer_pos] = buffers[target_buffer_pos]
    buffers[target_buffer_pos] = temp
    renderTabline()
    setKeymaps()
end

vim.keymap.set(
    { 'n' },
    'gs',
    ':lua SwitchBufferPosition()<CR>',
    { silent = true }
)

local autocmd_render_tabline = {
    callback = function()
        renderTabline()
    end
}

local autocmd_update_buffer_list = {
    callback = function()
        updateBuffersList()
        setKeymaps()
    end
}

local autocmd_remove_current_buffer_from_list = {
    callback = function()
        removeCurrentBufferFromList()
        setKeymaps()
    end
}


vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, autocmd_render_tabline)
vim.api.nvim_create_autocmd({ "BufAdd" }, autocmd_update_buffer_list)
vim.api.nvim_create_autocmd({ "BufDelete" }, autocmd_remove_current_buffer_from_list)
