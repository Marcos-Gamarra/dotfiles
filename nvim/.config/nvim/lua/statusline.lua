local M = {}

-- Config
local sep = { left = '', right = '' }
local colors = {
    black    = '#303446',
    white    = '#e9e9ed',
    inactive = '#51576d',
    active   = '#539bf5',
    none     = 'NONE',
}

local modes = {
    n = 'NORMAL',
    no = 'NORMAL',
    v = 'VISUAL',
    V = 'VISUAL LINE',
    ['\22'] = 'VISUAL BLOCK',
    s = 'SELECT',
    S = 'SELECT LINE',
    ['\19'] = 'SELECT BLOCK',
    i = 'INSERT',
    ic = 'INSERT',
    R = 'REPLACE',
    Rv = 'VISUAL REPLACE',
    c = 'COMMAND',
    cv = 'VIM EX',
    ce = 'EX',
    r = 'PROMPT',
    rm = 'MOAR',
    ['r?'] = 'CONFIRM',
    ['!'] = 'SHELL',
    t = 'TERMINAL',
}

-- Highlight helpers
local hl = {
    active           = '%#StatusLineMode#',
    lsp              = '%#StatusLineMode#',
    filename         = '%#StatuslineFilename#',
    inactive         = '%#StatuslineInactive#',
    sep_active       = '%#StatusLineSeparatorActive#',
    sep_inactive     = '%#StatusLineSeparatorInactive#',
    normal           = '%#Normal#',
    sep_inactive_rev = '%#StatusLineSeparatorInactiveRev#',
}

local function setup_highlights()
    local hls = {
        StatusLineMode                 = { bg = colors.active, fg = colors.black, bold = true },
        StatuslineFilename             = { bg = colors.inactive, fg = colors.white, bold = true },
        StatuslineInactive             = { bg = colors.inactive, fg = colors.white, bold = true },
        StatusLineSeparatorActive      = { bg = 'NONE', fg = colors.active },
        StatusLineSeparatorInactive    = { bg = 'NONE', fg = colors.inactive },
        StatusLineSeparatorInactiveRev = { bg = colors.active, fg = colors.inactive },
    }
    for name, opts in pairs(hls) do
        vim.api.nvim_set_hl(0, name, opts)
    end
end

local function get_mode()
    local m = modes[vim.api.nvim_get_mode().mode] or 'UNKNOWN'
    return (' %s '):format(m)
end

local function get_filepath()
    local fpath = vim.fn.fnamemodify(vim.fn.expand '%', ':~:.:h')
    local fname = vim.fn.expand '%:t'

    -- If it's an empty/unnamed buffer
    if fname == '' then
        return ' [No Name] '
    end

    -- If file is in the current directory, just show the name
    if fpath == '' or fpath == '.' then
        return (' %s '):format(fname)
    end

    -- Otherwise show path/name
    return (' %%<%s/%s '):format(fpath, fname)
end

local function get_lineinfo()
    if vim.bo.filetype == 'alpha' then return '' end
    return ' %P %l:%c '
end

local function get_git()
    local head = vim.g.gitsigns_head or ''
    if not head or head == "" then return "" end

    return table.concat {
        hl.sep_inactive, sep.left,
        hl.inactive, '  ', head, ' ',
        hl.sep_inactive, sep.right,
        hl.normal, ' ',
    }
end

local function get_diagnostics()
    local diagnostics = vim.diagnostic.get(0)
    if #diagnostics == 0 then return '' end

    local severity = vim.diagnostic.severity

    local counts = {
        [severity.ERROR] = 0,
        [severity.WARN] = 0,
        [severity.INFO] = 0,
        [severity.HINT] = 0
    }

    for _, diag in ipairs(diagnostics) do
        counts[diag.severity] = counts[diag.severity] + 1
    end

    local parts = {}
    if counts[severity.ERROR] > 0 then table.insert(parts, (' %d '):format(counts[severity.ERROR])) end
    if counts[severity.WARN] > 0 then table.insert(parts, (' %d '):format(counts[severity.WARN])) end
    if counts[severity.INFO] > 0 then table.insert(parts, (' %d '):format(counts[severity.INFO])) end
    if counts[severity.HINT] > 0 then table.insert(parts, (' %d '):format(counts[severity.HINT])) end

    return table.concat {
        hl.sep_inactive, sep.left,
        hl.inactive, ' ', table.concat(parts), ' ',
        hl.sep_inactive, sep.right,
        hl.normal, ' ',
    }
end

local lsp_icons = {
    ['copilot'] = '',
    ['rust_analyzer'] = '',
    ['ts_ls'] = '',
    ['html'] = '',
    ['cssls'] = '',
    ['tailwindcss'] = '󱏿',
    ['svelte'] = '',
    ['lua_ls'] = '',
}

local function get_lsp_icons()
    local clients = vim.lsp.get_clients { bufnr = 0 }
    if #clients == 0 then return '' end

    local names = {}
    for _, client in ipairs(clients) do
        local name = lsp_icons[client.name] or client.name
        table.insert(names, name)
    end

    -- Return just the icons with a clean leading separator space, 
    -- retaining the filename bar background color
    return ('%s '):format(table.concat(names, ' '))
end

-- Statusline
-- Statusline
function M.statusline()
    return table.concat {
        -- mode section
        hl.normal, ' ',
        hl.sep_active, sep.left,
        hl.active, get_mode(),
        hl.sep_active, sep.right,
        hl.normal, ' ',

        -- git section
        get_git(),

        -- filename & lsp integrated section (Expanding)
        hl.sep_inactive, sep.left,
        hl.filename, get_filepath(),
        '%=',
        hl.filename, get_lsp_icons(),
        hl.sep_inactive, sep.right,
        hl.normal, ' ',

        -- diagnostics section
        get_diagnostics(),

        -- line info section
        hl.sep_active, sep.left,
        hl.active, get_lineinfo(),
        hl.sep_active, sep.right,
        hl.normal, ' ',
    }
end

-- Toggle
local function toggle()
    vim.o.laststatus = vim.o.laststatus == 0 and 3 or 0
end

-- Setup
local function setup()
    setup_highlights()

    vim.keymap.set('n', '<space>os', toggle, { silent = true })

    local group = vim.api.nvim_create_augroup('Statusline', { clear = true })
    local function au(events, callback)
        vim.api.nvim_create_autocmd(events, { group = group, callback = callback })
    end

    au({ 'WinEnter', 'BufEnter' }, function()
        vim.wo.statusline = '%!v:lua.require("statusline").statusline()'
    end)
end

setup_highlights()
setup()

return M
