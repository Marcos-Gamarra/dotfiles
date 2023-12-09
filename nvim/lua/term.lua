local width = math.floor(vim.o.columns * 0.9)
local height = math.floor(vim.o.lines * 0.7)
local col = (vim.o.columns - width) / 2
local row = (vim.o.lines - height) / 2

local opts = {
    relative = 'editor',
    width = width,
    height = height,
    col = col,
    row = row,
    style = 'minimal',
    border = 'single',
}

local is_float_win_open = false
local win_id = nil
local buf_id = nil
local channel_id = -1
local opened_file_buffer_id = nil

-- this keeps the terminal's pwd in sync with nvim's pwd
local update_pwd_on_cd = function(servername)
    local update_pwd = "nvim --server " ..
        servername .. " --remote-send \"<C-\\><C-N>:cd $PWD<CR>\""
    local switch_to_insert = "nvim --server " ..
        servername .. " --remote-send \"<C-\\><C-N>:startinsert<CR>\""
    return string.format('function e\n z $argv[1]\n %s\n %s\nend', update_pwd, switch_to_insert)
end

-- this defines the aliases to open files in the terminal and change the pwd
local function on_creation()
    local servername = vim.v.servername
    local remote_send = "nvim --server " ..
        servername .. " --remote-send \'<C-\\><C-N>:lua WasOpenedFromFloatTerm=true<CR>\'"
    local remote = "nvim --server " .. servername .. " --remote"
    local edit_alias = string.format('alias n="%s; %s"', remote_send, remote)
    local update_pwd_alias = update_pwd_on_cd(servername)
    vim.api.nvim_chan_send(channel_id, edit_alias .. "&&" .. update_pwd_alias .. "&&" .. "alias ..='e ..'")
    local scaped_insert = vim.api.nvim_replace_termcodes("i<CR>", true, false, true)
    vim.api.nvim_feedkeys(scaped_insert, "n", true)
end

local function toggle_floating_terminal()
    if is_float_win_open then
        vim.api.nvim_win_close(win_id, true)
        is_float_win_open = false
        return
    end

    is_float_win_open = true

    if channel_id > 0 then
        win_id = vim.api.nvim_open_win(buf_id, true, opts)
        vim.api.nvim_feedkeys("i", "n", true)
        return
    end

    buf_id = vim.api.nvim_create_buf(false, false)
    win_id = vim.api.nvim_open_win(buf_id, true, opts)
    channel_id = vim.fn.termopen('fish', {
        on_exit = function()
            is_float_win_open = false
            channel_id = -1
        end
    })
    on_creation()
end

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    callback = function()
        if WasOpenedFromFloatTerm then
            opened_file_buffer_id = vim.fn.bufnr()
            toggle_floating_terminal()
            vim.api.nvim_win_set_buf(0, opened_file_buffer_id)
            vim.opt.number = true
            WasOpenedFromFloatTerm = false
        end
    end
})


vim.keymap.set('', '<A-e>', toggle_floating_terminal, { noremap = true, silent = true })
vim.keymap.set('t', '<A-e>', toggle_floating_terminal, { noremap = true, silent = true })
