require("copilot").setup({
    panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
        },
        layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4
        },
    },
    suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
            accept = "<C-a>",
            accept_word = false,
            accept_line = false,
            next = "<C-b>",
            prev = "<C-j>",
            dismiss = "<C-z>",
        },
    },

})

vim.api.nvim_set_keymap("n", "<space>co", ":Copilot panel<CR>", { noremap = true })
vim.g.copilot_no_tab_map = true
