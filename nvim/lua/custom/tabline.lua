local function create_term_window(openOnRight)
    local borders = {
        "┏", "━", "┓", "┃", "┛", "━", "┗", "┃",
    }
    local width = math.floor(vim.o.columns * 0.5)
    local height = math.floor(vim.o.lines - 5)
    local col = 0
    local row = (vim.o.lines - height) / 2 - 1

    if openOnRight then
        col = vim.o.columns - width
    end

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

    local buf_id = vim.api.nvim_create_buf(false, true)
    local win_id = vim.api.nvim_open_win(buf_id, true, opts)
end

function InitWorkspaces()
    local api = vim.api
    local inactive_bg = '#737994'
    local active_bg = "#7aa2f7"
    local active_fg = 'white'
    local text = "white"
    local separator_left = ""
    local separator_right = ""


    local labels = { 'i', 'e', 'a' }

    api.nvim_set_hl(0, "TablineBufferActive", { bg = active_bg, fg = active_fg })
    api.nvim_set_hl(0, "TablineBufferInactive", { bg = inactive_bg, fg = text })

    local active_tab_hi = '%#TablineBufferActive#'
    local inactive_tab_hi = '%#TablineBufferInactive#'

    api.nvim_set_hl(0, "SeparatorActive", { bg = "NONE", fg = active_bg })
    api.nvim_set_hl(0, "SeparatorInactive", { bg = "NONE", fg = inactive_bg })
    local separator_active_hi = '%#SeparatorActive#'
    local separator_inactive_hi = '%#SeparatorInactive#'

    local tab_names = { 'File Explorer', 'Source Files', 'Terminal' }

    local function render_tabline()
        local current_tab = api.nvim_get_current_tabpage()
        local tab_list = api.nvim_list_tabpages()
        local tabline = { '%#Normal#' }

        for _, tab in ipairs(tab_list) do
            if tab == current_tab then
                table.insert(tabline, separator_active_hi)
                table.insert(tabline, separator_left)
                table.insert(tabline, active_tab_hi)
                table.insert(tabline, ' ' .. labels[tab] .. ': ')
                table.insert(tabline, tab_names[tab] .. ' ')
                table.insert(tabline, separator_active_hi)
                table.insert(tabline, separator_right .. ' ')
            else
                table.insert(tabline, separator_inactive_hi)
                table.insert(tabline, separator_left)
                table.insert(tabline, inactive_tab_hi)
                table.insert(tabline, ' ' .. labels[tab] .. ': ')
                table.insert(tabline, tab_names[tab] .. ' ')
                table.insert(tabline, separator_inactive_hi)
                table.insert(tabline, separator_right .. ' ')
            end
        end

        table.insert(tabline, '%#Normal#')

        local tabline_str = table.concat(tabline)
        api.nvim_set_option('tabline', tabline_str)
    end




    for i, key in ipairs({ "(", ")", "=" }) do
        vim.keymap.set('n', key, function() api.nvim_set_current_tabpage(i) end,
            { noremap = true, silent = true })
    end

    local render_tabline_autocmd = {
        callback = function()
            render_tabline()
        end
    }

    local setup_terminal_buffer = {
        callback = function()
            vim.cmd("setlocal nonumber")
        end
    }


    api.nvim_create_autocmd({ 'TabEnter' }, render_tabline_autocmd)
    api.nvim_create_autocmd({ 'TermOpen' }, setup_terminal_buffer)

    vim.cmd("Oil")
    vim.cmd("tabnew")
    vim.cmd("tabnew")

    create_term_window(false)
    vim.cmd("term")
    create_term_window(true)
    vim.cmd("term")
    api.nvim_set_current_tabpage(2)
end

vim.api.nvim_create_user_command('InitWorkspaces', 'lua InitWorkspaces()', { nargs = 0 })
