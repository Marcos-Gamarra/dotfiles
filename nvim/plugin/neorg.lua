require('neorg').setup {
    load = {
        ["core.esupports.indent"] = {},
        ["core.keybinds"] = {
            config = {
                default_keybinds = false,
                hook = function(keybinds)
                    keybinds.map('norg', 'n', 'la', "gg=G''")
                end
            }
        },
        ["core.concealer"] = {}
    }
}


local parent_dir = vim.fs.dirname(vim.fs.find({ 'notes.norg' }, { upward = true })[1])
local notes_file = nil

if parent_dir then
    notes_file = vim.fs.dirname(vim.fs.find({ 'notes.norg' }, { upward = true })[1]) .. '/notes.norg'
end

local function close_notes()
    vim.cmd('silent! bd ' .. notes_file)
    vim.g.are_notes_open = false
end

local function toggle_notes_buffer()
    if vim.g.are_notes_open then
        close_notes()
    else
        vim.cmd('silent! edit ' .. notes_file)
        vim.g.are_notes_open = true
    end
end

local function toggle_notes_vsplit()
    if vim.g.are_notes_open then
        close_notes()
    else
        vim.cmd('silent! bo vs ' .. notes_file)
        vim.g.are_notes_open = true
    end
end

if notes_file then
    vim.keymap.set('n', 'jb', toggle_notes_buffer, { noremap = true })
    vim.keymap.set('n', '(', toggle_notes_vsplit, { noremap = true })
end
