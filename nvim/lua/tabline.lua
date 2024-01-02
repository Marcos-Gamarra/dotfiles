local api = vim.api
local inactive_bg = '#737994'
local active_bg = "#7aa2f7"
local active_fg = 'white'
local text = "white"
local separator_left = ""
local separator_right = ""

api.nvim_set_hl(0, "TablineBufferActive", { bg = active_bg, fg = active_fg })
api.nvim_set_hl(0, "TablineBufferInactive", { bg = inactive_bg, fg = text })

local active_buf_hi = '%#TablineBufferActive#'
local inactive_buf_hi = '%#TablineBufferInactive#'

api.nvim_set_hl(0, "SeparatorActive", { bg = "NONE", fg = active_bg })
api.nvim_set_hl(0, "SeparatorInactive", { bg = "NONE", fg = inactive_bg })
local separator_active_hi = '%#SeparatorActive#'
local separator_inactive_hi = '%#SeparatorInactive#'

local labels = { 'e', 'a', 'i', 'h', 'o', 'u', 'y', 'k' }

local buffers = {}
local buffer_names = {}
local buffer_indexes = {}

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

local function buffer_name_with_parent_dir(bufnr)
    local bufname = vim.fn.bufname(bufnr)
    return vim.fn.fnamemodify(bufname, ":p:h:t") .. "/" .. vim.fn.fnamemodify(bufname, ":t")
end

local function createBufferDescriptor(bufNumber)
    local name = api.nvim_buf_get_name(bufNumber)
    name = vim.fn.fnamemodify(name, ":t")
    if buffer_names[name] == nil then
        buffer_names[name] = bufNumber
    else
        local existing_name = buffer_name_with_parent_dir(buffer_names[name])
        local existing_index = buffer_indexes[buffer_names[name]]
        buffers[existing_index].name = existing_name
        name = buffer_name_with_parent_dir(bufNumber)
    end
    return {
        name = name,
        number = bufNumber,
    }
end

local function generateBufferList(skip_bufnr)
    -- skip_bufnr is passed to remove a buffer from the list
    buffer_names = {}
    local aux_index = 1
    local buflist = vim.api.nvim_list_bufs()
    for _, bufNumber in pairs(buflist) do
        if vim.fn.buflisted(bufNumber) == 1 and bufNumber ~= skip_bufnr and vim.bo[bufNumber].buftype == "" then
            buffer_indexes[bufNumber] = aux_index
            local buffer = createBufferDescriptor(bufNumber)
            buffers[aux_index] = buffer
            aux_index = aux_index + 1
        end
    end
    setKeymaps()
end

local function removePreviousBufferFromList()
    local currentBuffer = vim.fn.bufnr('#')
    local currentBufferIndex = buffer_indexes[currentBuffer]
    table.remove(buffers, currentBufferIndex)
    generateBufferList(currentBuffer)
end

generateBufferList()

local function renderTabline()
    local current_buffer = vim.fn.bufnr('%')
    local tabline = { '%#Normal#' }

    for i, buffer in pairs(buffers) do
        if (vim.fn.buflisted(current_buffer) ~= 1) then
            return
        end
        local buf_name = ''
        if (current_buffer == buffer.number) then
            table.insert(tabline, separator_active_hi)
            table.insert(tabline, separator_left)
            table.insert(tabline, active_buf_hi)
            table.insert(tabline, labels[i])
            table.insert(tabline, ': ')
            table.insert(tabline, buffer.name)
            table.insert(tabline, " ")
            table.insert(tabline, separator_active_hi)
            table.insert(tabline, separator_right)
            table.insert(tabline, ' ')
            table.insert(tabline, active_buf_hi)
            table.insert(tabline, buf_name)
            table.insert(tabline, inactive_buf_hi)
        else
            table.insert(tabline, separator_inactive_hi)
            table.insert(tabline, separator_left)
            table.insert(tabline, inactive_buf_hi)
            table.insert(tabline, labels[i])
            table.insert(tabline, ': ')
            table.insert(tabline, buffer.name)
            table.insert(tabline, " ")
            table.insert(tabline, separator_inactive_hi)
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
        generateBufferList()
        renderTabline()
    end
}

local autocmd_update_buffer_list = {
    callback = function()
        generateBufferList()
    end
}

local autocmd_remove_current_buffer_from_list = {
    callback = function()
        removePreviousBufferFromList()
        renderTabline()
    end
}


vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, autocmd_render_tabline)
vim.api.nvim_create_autocmd({ "BufAdd" }, autocmd_update_buffer_list)
vim.api.nvim_create_autocmd({ "BufDelete" }, autocmd_remove_current_buffer_from_list)
