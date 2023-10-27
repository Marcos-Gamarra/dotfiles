require('orgmode').setup_ts_grammar()

require('orgmode').setup({
    org_agenda_files = { '~/projects/org/*' },
    org_default_notes_file = '~/projects/org/notes.org',
    org_hide_emphasis_markers = true,
    org_hide_leading_stars = true,
    mappings = {
        global = {
            org_agenda = 'ja',
            org_capture = 'jc'
        }
    }
})

local notes_file = vim.fs.dirname(vim.fs.find({ 'notes.org' }, { upward = true })[1])

local function close_notes()
    vim.cmd('silent! bd ' .. notes_file .. '/notes.org')
    vim.g.are_notes_open = false
end

local function toggle_notes_buffer()
    if vim.g.are_notes_open then
        close_notes()
    else
        vim.cmd('silent! edit ' .. notes_file .. '/notes.org')
        vim.g.are_notes_open = true
    end
end

local function toggle_notes_vsplit()
    if vim.g.are_notes_open then
        close_notes()
    else
        vim.cmd('silent! bo vs ' .. notes_file .. '/notes.org')
        vim.g.are_notes_open = true
    end
end

local function remap_indent()
    vim.keymap.set('n', 'la', "gg=G''", { noremap = true })
end

if notes_file then
    vim.keymap.set('n', 'jb', toggle_notes_buffer, { noremap = true })
    vim.keymap.set('n', '(', toggle_notes_vsplit, { noremap = true })
    vim.api.nvim_create_autocmd({ 'BufEnter' }, { pattern = { '*.org' }, callback = remap_indent })
end
