local borders = {
    "┏", "━", "┓", "┃", "┛", "━", "┗", "┃",
}

local is_buflist_open = false
local buf_id = vim.api.nvim_create_buf(false, true)
local win_id = 0

local labels = { 'e', 'a', 'i', 'h', 'j', 'x', 'o', 'y', 'v', 'k', 'z' }

local blue = '#7aa2f7'
vim.api.nvim_set_hl(0, "BufferActive", { bg = 'NONE', fg = blue, bold = true })

local buffer_list = {}
local n_of_buffers = 0

local width = math.floor(vim.o.columns * 0.25)
local col = vim.o.columns
local row = 1

local function float_opts(height)
    if height == 0 then
        height = 1
    end
    return {
        relative = 'editor',
        anchor = 'NE',
        col = col,
        width = width,
        height = height,
        row = row,
        style = 'minimal',
        border = borders,
        title = { { " Buffers ", "FloatBorder" } },
        title_pos = 'center',
    }
end

local function init_buffer_list()
    local buffers = vim.api.nvim_list_bufs()
    for _, buf in ipairs(buffers) do
        local name = vim.api.nvim_buf_get_name(buf)
        if name ~= '' and vim.bo[buf].buflisted and buffer_list[buf] == nil then
            -- get buffer name + parent and grandparent directory
            name = string.match(name, ".*/(.*/.*)")
            buffer_list[buf] = { name = name, label = labels[n_of_buffers + 1], idx = n_of_buffers + 1 }
            n_of_buffers = n_of_buffers + 1
        end
    end
end

local function render_buffers()
    local unsorted_bufs = {}

    if n_of_buffers == 0 then
        vim.api.nvim_buf_set_lines(buf_id, 0, -1, false, { " No buffers " })
        return
    end

    for key, buffer in pairs(buffer_list) do
        local line = " " .. buffer.label .. " " .. buffer.name
        table.insert(unsorted_bufs, { line = line, idx = buffer.idx })

        vim.keymap.set(
            { 'n' },
            'g' .. buffer.label,
            ':b' .. key .. '<CR>',
            { silent = true }
        )
    end

    table.sort(unsorted_bufs, function(a, b)
        return a.idx < b.idx
    end)

    local lines = {}
    for _, buffer in ipairs(unsorted_bufs) do
        table.insert(lines, buffer.line)
    end

    local buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_set_lines(buf_id, 0, -1, false, lines)

    if buffer_list[buf] ~= nil then
        vim.api.nvim_buf_add_highlight(buf_id, -1, "BufferActive", buffer_list[buf].idx - 1, 0, -1)
    end
end

local function on_buf_delete()
    local buf = vim.api.nvim_get_current_buf()
    if vim.bo[buf].buflisted and buffer_list[buf] ~= nil then
        local idx = buffer_list[buf].idx
        buffer_list[buf] = nil
        n_of_buffers = n_of_buffers - 1

        for _, buffer in pairs(buffer_list) do
            if buffer.idx > idx then
                buffer.idx = buffer.idx - 1
                buffer.label = labels[buffer.idx]
            end
        end
    end
end

local function on_buf_enter()
    local buf = vim.api.nvim_get_current_buf()
    local name = vim.api.nvim_buf_get_name(buf)
    if vim.bo[buf].buflisted then
        if name ~= '' and buffer_list[buf] == nil then
            name = string.match(name, ".*/(.*/.*)")
            buffer_list[buf] = { name = name, label = labels[n_of_buffers + 1], idx = n_of_buffers + 1 }
            n_of_buffers = n_of_buffers + 1
        end

        if is_buflist_open then
            render_buffers()
            vim.api.nvim_win_close(win_id, true)
            win_id = vim.api.nvim_open_win(buf_id, false, float_opts(n_of_buffers))
        end
    end
end



local function toggle_list()
    if is_buflist_open then
        vim.api.nvim_win_close(win_id, true)
        is_buflist_open = false
    else
        render_buffers()
        win_id = vim.api.nvim_open_win(buf_id, false, float_opts(n_of_buffers))
        is_buflist_open = true
    end
end

local autocmd_on_enter = {
    callback = function()
        on_buf_enter()
    end
}

local autocmd_on_delete = {
    callback = function()
        on_buf_delete()
    end
}

vim.api.nvim_create_autocmd({ "BufEnter" }, autocmd_on_enter)
vim.api.nvim_create_autocmd({ "BufDelete" }, autocmd_on_delete)

vim.keymap.set('', 'b', toggle_list, { noremap = true, silent = true })

init_buffer_list()
-- toggle_list()
