local opts = { noremap = true, silent = true }

local blue = '#5f87af'
local red = "#cc6666"
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = blue, bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, 'NormalFloat', { fg = "NONE", bg = "NONE"})
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = red, bg = "NONE"})

vim.diagnostic.config({
    virtual_text = true,
    signs = false,
    float = {
        border = "rounded",
    },
})
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
--vim.api.nvim_set_keymap('n', 'wn', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
--vim.api.nvim_set_keymap('n', 'wt', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>d', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>c', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'v', '<space>c', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'i', 'C-e', '<cmd>lua vim.lsp.buf.completion()<CR>', opts)
    vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

require 'lspconfig'.dartls.setup {
    on_attach = on_attach,
    flags = {
        -- This will be the default in neovim 0.7+
        debounce_text_changes = 150,
    }
}
require 'lspconfig'.html.setup {
    on_attach = on_attach,
}

require 'lspconfig'.clangd.setup {
    on_attach = on_attach,
}

require 'lspconfig'.quick_lint_js.setup {
    on_attach = on_attach,
}

require 'lspconfig'.svelte.setup {
    on_attach = on_attach,
}
require 'lspconfig'.rust_analyzer.setup {
    on_attach = on_attach,
}

require 'lspconfig'.zls.setup {
    on_attach = on_attach,
}

require 'lspconfig'.sumneko_lua.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}
