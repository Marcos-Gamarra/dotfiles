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
            init_selection = "<backspace><backspace>", -- set to `false` to disable one of the mappings
            node_incremental = "<backspace><tab>",
            scope_incremental = "<backspace><delete>",
            node_decremental = "<backspace><cr>"

        },
    },
}
