-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  sort_by = "case_sensitive",
  remove_keymaps = true,

  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "<Left>", action = "dir_up" },
        { key = "<Right>", action = "edit_no_picker" },
        { key = "<CR>", action = "edit" },
        { key = "p", action = "preview" },
        { key = "c", action = "collapse_all" },
        { key = "a", action = "create" },
      },
    },
  },
  renderer = {
    indent_markers = {
      enable = true,
    },
  },
  filters = {
    dotfiles = true,
  },
})


vim.api.nvim_set_keymap('', '<space>ot', ":NvimTreeToggle<CR>", {})
