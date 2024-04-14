local borders_telescope = {
    "━", "┃", "━", "┃", "┏", "┓", "┛", "┗",
}

local borders = {
    "┏", "━", "┓", "┃", "┛", "━", "┗", "┃",
}

local Layout = require "telescope.pickers.layout"

local create_layout = function(picker)
    local function create_window(enter, width, height, row, col, title)
        local bufnr = vim.api.nvim_create_buf(false, true)
        local winid = vim.api.nvim_open_win(bufnr, enter, {
            style = "minimal",
            relative = "editor",
            width = width,
            height = height,
            row = row,
            col = col,
            border = borders,
            title = title,
            title_pos = "center",
        })

        return Layout.Window {
            bufnr = bufnr,
            winid = winid,
        }
    end

    local function destory_window(window)
        if window then
            if vim.api.nvim_win_is_valid(window.winid) then
                vim.api.nvim_win_close(window.winid, true)
            end
            if vim.api.nvim_buf_is_valid(window.bufnr) then
                vim.api.nvim_buf_delete(window.bufnr, { force = true })
            end
        end
    end

    local preview_height = math.floor(vim.o.lines * 0.6) + 1
    local results_height = math.floor(vim.o.lines * 0.1)
    local results_row_start = preview_height + 3
    local prompt_row_start = results_row_start + results_height + 2
    local width = math.floor(vim.o.columns * 0.9)
    local start_col = (math.floor(vim.o.columns) - width) / 2

    local layout = Layout {
        picker = picker,
        mount = function(self)
            self.preview = create_window(false, width, preview_height, 1, start_col, " Preview ")
            self.prompt = create_window(true, width, 1, prompt_row_start, start_col, " Promp ")
            self.results = create_window(false, width, results_height, results_row_start, start_col, " Results ")
        end,
        unmount = function(self)
            destory_window(self.results)
            destory_window(self.preview)
            destory_window(self.prompt)
        end,
        update = function(self) end,
    }

    return layout
end

require('telescope').setup {
    defaults = {
        mappings = {
            n = {
                ['m'] = "preview_scrolling_up",
                ['f'] = "preview_scrolling_down",
            },
        },
        layout_strategy = 'vertical',
        layout_config = {
            width = 0.9,
            height = 0.99,
            preview_cutoff = 0,
            scroll_speed = 2,
        },
        file_ignore_patterns = { '.git', 'node_modules', 'vendor', 'target' },
        borderchars = borders_telescope,
    },

    pickers = {
        lsp_definitions = {
            jump_type = 'never',
            initial_mode = 'normal',
            scroll_speed = 1,
            create_layout = create_layout,
        }
    },
}

local builtin = require('telescope.builtin')
local function find_files_include_hidden()
    builtin.find_files {
        hidden = true,
    }
end

local function find_files_in_root()
    local root_dir = require('lspconfig.util').root_pattern('.git', 'Cargo.toml', 'package.json', 'node_modules')(vim.fn
        .expand('%:p:h'))
    builtin.find_files {
        cwd = root_dir,
    }
end

local function grep_in_root()
    local root_dir = require('lspconfig.util').root_pattern('.git', 'Cargo.toml', 'package.json', 'node_modules')(vim.fn
        .expand('%:p:h'))
    builtin.live_grep {
        cwd = root_dir,
    }
end

local function find_notes()
    local dirman = require('neorg').modules.get_module("core.dirman")
    local path_to_workspace = dirman.get_current_workspace()[2]
    builtin.find_files {
        cwd = path_to_workspace,
    }
end

vim.keymap.set('n', '<space>tn', builtin.find_files, {})
vim.keymap.set('n', '<space>tg', builtin.live_grep, {})
vim.keymap.set('n', '<space>tig', grep_in_root, {})
vim.keymap.set('n', '<space>tb', builtin.buffers, {})
vim.keymap.set('n', '<space>th', find_files_include_hidden, {})
vim.keymap.set('n', '<space>te', find_files_in_root, {})
vim.keymap.set('n', '<space>to', find_notes, {})
vim.keymap.set('n', '<space>ty', require('telescope').extensions.neoclip.default, {})
