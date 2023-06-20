local opts = { noremap = true, silent = true}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, win_opts, ...)
    win_opts = win_opts or {}
    win_opts.border = "rounded"
    return orig_util_open_floating_preview(contents, syntax, win_opts, ...)
end

vim.api.nvim_set_keymap('n', 'le', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', 'lt', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', 'ln', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', 'lq', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer



local on_attach = function(_, bufnr)
    local opts_on_attach = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', '=', require("nvim-navbuddy").open, opts_on_attach)
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

require 'lspconfig'.sumneko_lua.setup {
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


require 'lspconfig'.zls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}
