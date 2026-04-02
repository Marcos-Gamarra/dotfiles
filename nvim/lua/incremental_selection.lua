-- Incremental selection
_G.selected_nodes = {}

local function get_node_at_cursor()
    local node = vim.treesitter.get_node()
    if not node then return nil end
    return node
end

local function select_node(node)
    if not node then return end
    local start_row, start_col, end_row, end_col = node:range()
    vim.fn.setpos("'<", { 0, start_row + 1, start_col + 1, 0 })
    vim.fn.setpos("'>", { 0, end_row + 1, end_col, 0 })
    vim.cmd('normal! gv')
end

vim.keymap.set({ "n" }, "<backspace><backspace>", function()
    _G.selected_nodes = {}

    local current_node = get_node_at_cursor()
    if not current_node then return end

    table.insert(_G.selected_nodes, current_node)
    select_node(current_node)
end, { desc = "Select treesitter node" })


vim.keymap.set("x", "<backspace>", function()
    if #_G.selected_nodes == 0 then
        return
    end

    local current_node = _G.selected_nodes[#_G.selected_nodes]

    if not current_node then return end

    local parent = current_node:parent()
    if parent then
        table.insert(_G.selected_nodes, parent)
        select_node(parent)
    end
end, { desc = "Increment selection" })

vim.keymap.set("x", "<tab>", function()
    table.remove(_G.selected_nodes)
    local current_node = _G.selected_nodes[#_G.selected_nodes]
    if current_node then
        select_node(current_node)
    end
end, { desc = "Decrement selection" })
