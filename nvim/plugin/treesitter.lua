require 'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },

    indent = {
        enable = true,
        disable = { 'org' },
    },

    autotag = {
        enable = true,
    },

    textobjects = {
        select = {
            enable = true,
        },
    },
}
