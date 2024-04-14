require("copilot").setup({
    panel = {
        enabled = true,
        auto_refresh = true,
        keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<C-|>", -- Mod5 + Mod 3 + p in keyboard layout
        },

        layout = {
            position = "right", -- | top | left | right
            ratio = 0.5
        },
    },

    suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
            accept = "<C-a>",
            accept_line = "<C-l>",
            next = "<C-b>",
            prev = "<C-j>",
            dismiss = "<C-x>",
        },
    },

})

vim.g.copilot_no_tab_map = true
