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

            lookahead = true,

            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["as"] = "@class.outer",
                ["is"] = "@class.inner",
                ["ab"] = "@block.outer",
                ["ib"] = "@block.inner",
                ["al"] = "@loop.outer",
                ["il"] = "@loop.inner",
                --["ap"] = "@parameter.outer",
                --["ip"] = "@parameter.inner",
                ["an"] = "@conditional.outer",
                ["in"] = "@conditional.inner",
                ["ac"] = "@call.outer",
                ["ic"] = "@call.inner",
                ["a,"] = "@comment.outer",
                ["i,"] = "@comment.inner",
                ["am"] = "@assignment.outer",
                ["im"] = "@assignment.inner",
            },
            --include_surrounding_whitespace = true,
        },
    },
}
