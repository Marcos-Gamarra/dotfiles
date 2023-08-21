local opts = { noremap = true, silent = true }

vim.diagnostic.config {
    float = { border = "rounded" },
}

vim.api.nvim_set_keymap('n', 'le', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', 'lt', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', 'ln', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', 'lq', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer


local on_attach = function(client, bufnr)
    local opts_on_attach = { noremap = true, silent = true, buffer = bufnr }
    client.server_capabilities.semanticTokensProvider = nil
    vim.keymap.set('n', 'lD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts_on_attach)
    vim.keymap.set('n', 'ld', '<cmd>lua vim.lsp.buf.definition()<CR>', opts_on_attach)
    vim.keymap.set('n', 'lh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts_on_attach)
    vim.keymap.set('n', 'lrn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts_on_attach)
    vim.keymap.set('n', 'lc', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts_on_attach)
    vim.keymap.set('v', 'lc', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts_on_attach)
    vim.keymap.set('n', 'lre', '<cmd>lua vim.lsp.buf.references()<CR>', opts_on_attach)
    vim.keymap.set('n', 'la', '<cmd>lua vim.lsp.buf.format()<CR>', opts_on_attach)
end


local capabilities = require('cmp_nvim_lsp').default_capabilities()

require 'lspconfig'.html.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

require 'lspconfig'.rust_analyzer.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                buildScripts = {
                    enable = true,
                }
            },
        }
    }
}

require 'lspconfig'.clangd.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}


require 'lspconfig'.tsserver.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

require 'lspconfig'.svelte.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

require 'lspconfig'.pylsp.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

require 'lspconfig'.lua_ls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
