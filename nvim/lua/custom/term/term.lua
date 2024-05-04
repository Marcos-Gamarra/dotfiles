local borders = {
    "┏", "━", "┓", "┃", "┛", "━", "┗", "┃",
}
local width = math.floor(vim.o.columns * 0.9)
local height = math.floor(vim.o.lines * 0.8)
local col = (vim.o.columns - width) / 2
local row = (vim.o.lines - height) / 2 - 1

local opts = {
    relative = 'editor',
    width = width,
    height = height,
    col = col,
    row = row,
    style = 'minimal',
    border = borders,
    title = { { "Terminal", "FloatBorder" } },
    title_pos = 'center',
}

local source_fish_setup_file = "source ~/.config/nvim/lua/custom/term/fish_setup.fish\n"

local is_term_open = false
local buf_id = nil
local win_id = nil
local channel_id = nil


local function toggle_floating_terminal()
    if is_term_open then
        vim.api.nvim_win_close(win_id, true)
        is_term_open = false
        return
    end

    if channel_id ~= nil then
        win_id = vim.api.nvim_open_win(buf_id, true, opts)
    else
        buf_id = vim.api.nvim_create_buf(false, true)
        win_id = vim.api.nvim_open_win(buf_id, true, opts)
        channel_id = vim.fn.termopen('fish', {
            on_exit = function()
                vim.api.nvim_win_close(win_id, true)
                is_term_open = false
                channel_id = nil
            end
        })
        vim.api.nvim_chan_send(channel_id, source_fish_setup_file)
    end
    vim.api.nvim_feedkeys("i", "n", true)
    is_term_open = true
end

-- oparation can be "ttn" for opening file, "ttd" for opening dir, "ttg" for opening file wiht rg
local function open_fzf_in_term(operation)
    toggle_floating_terminal()
    vim.api.nvim_chan_send(channel_id, operation .. "\n")
end


vim.keymap.set('', '<A-e>', toggle_floating_terminal, { noremap = true, silent = true })
vim.keymap.set('t', '<A-e>', toggle_floating_terminal, { noremap = true, silent = true })
-- vim.keymap.set('n', '<space>tn', function() open_fzf_in_term("ttn") end, { noremap = true, silent = true })
-- vim.keymap.set('n', '<space>td', function() open_fzf_in_term("ttd") end, { noremap = true, silent = true })
-- vim.keymap.set('n', '<space>tg', function() open_fzf_in_term("ttg") end, { noremap = true, silent = true })
-- vim.keymap.set('n', '<space>tr', function() open_fzf_in_term("ttr") end, { noremap = true, silent = true })
