vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter' })

require('nvim-treesitter').setup {}

-- Start treesitter for all installed parsers
local parsersInstalled = require("nvim-treesitter.config").get_installed('parsers')
for _, parser in pairs(parsersInstalled) do
    local filetypes = vim.treesitter.language.get_filetypes(parser)
    vim.api.nvim_create_autocmd({ "FileType" }, {
        pattern = filetypes,
        callback = function()
            vim.treesitter.start()
        end,
    })
end
