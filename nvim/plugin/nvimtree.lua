vim.api.nvim_set_keymap("n", "<C-o>", ":NvimTreeToggle<CR>", {noremap=true})

local list = {
  { key = {"o", "m" }, action = "edit", mode = "n"},
}

require 'nvim-tree'.setup{}
