local api = vim.api
vim.g.buf_list_is_open = false
local blue = '#7aa2f7'
api.nvim_set_hl(0, "BufferListActive", { bg = 'NONE', fg = blue, bold = true })

local function list_buffers()
    local buffers = vim.api.nvim_list_bufs()
    local buf_listed = {}
    local number_of_buffers = 0

    local current_buf = nil
    for _, v in ipairs(buffers) do
        if (vim.fn.buflisted(v) == 1) then
            number_of_buffers = number_of_buffers + 1
            if (vim.fn.bufnr(v) == vim.fn.bufnr('%')) then
                current_buf = number_of_buffers
            end
            table.insert(buf_listed, vim.fn.bufname(v))
        end
    end
    return { current_buf, buf_listed, number_of_buffers }
end


local window_id = nil
local current_window = api.nvim_get_current_win()

local toggle_list_of_buffers = function()
    local width = vim.api.nvim_get_option("columns")

    local buf = api.nvim_create_buf(false, true)
    if vim.g.buf_list_is_open == true then
        api.nvim_win_close(window_id, true)
        vim.g.buf_list_is_open = false
    else
        local buf_info = list_buffers()
        window_id = api.nvim_open_win(buf,
            true,
            {
                relative = 'editor',
                width = 30,
                height = buf_info[3],
                row = 0,
                col = width - 30,
                border = 'rounded',
                style = 'minimal',
            }
        )
        vim.g.buf_list_is_open = true
        api.nvim_buf_set_lines(buf, 0, 1, false, buf_info[2])
        vim.fn.matchaddpos("BufferListActive", { buf_info[1] })
        api.nvim_set_current_win(current_window)
    end
end

vim.keymap.set(
    { 'n' },
    '<Tab>',
    toggle_list_of_buffers,
    { silent = false }
)
