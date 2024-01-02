require 'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },

    indent = {
        enable = true,
    },

    autotag = {
        enable = true,
    },

    textobjects = {
        select = {
            enable = true,
        },

    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<backspace><backspace>",
            node_incremental = "<backspace><tab>",
            node_decremental = "<backspace><cr>",
        },
    }
}
