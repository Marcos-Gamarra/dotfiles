local borders = {
    { "┏", "FloatBorder" }, { "━", "FloatBorder" }, { "┓", "FloatBorder" },
    { "┃", "FloatBorder" }, { "┛", "FloatBorder" }, { "━", "FloatBorder" },
    { "┗", "FloatBorder" }, { "┃", "FloatBorder" },
}

-- Diagnostic keymaps
vim.keymap.set('n', 'ly', vim.diagnostic.open_float, { noremap = true, silent = true })
vim.keymap.set('n', 'lt', function() vim.diagnostic.jump({ count = -1 }) end, { noremap = true, silent = true })
vim.keymap.set('n', 'ln', function() vim.diagnostic.jump({ count = 1 }) end, { noremap = true, silent = true })
vim.keymap.set('n', 'lq', vim.diagnostic.setloclist, { noremap = true, silent = true })

-- diagnostic config
vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    float = {
        border = borders,
    },
})

-- LspAttach Autocmd
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),

    callback = function(ev)
        local opts = { noremap = true, silent = true, buffer = ev.buf }
        vim.keymap.set('n', 'lD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'le', require('telescope.builtin').lsp_definitions, opts)
        vim.keymap.set('n', 'lli', require('telescope.builtin').lsp_implementations, opts)
        vim.keymap.set('n', 'lh', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'lrn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', 'lc', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'la', vim.lsp.buf.format, opts)
        vim.keymap.set('n', 'lre', require('telescope.builtin').lsp_references, opts)
        vim.keymap.set('n', 'li', require('telescope.builtin').lsp_incoming_calls, opts)
        vim.keymap.set('n', 'lo', require('telescope.builtin').lsp_outgoing_calls, opts)
        vim.keymap.set('n', 'ld', require('telescope.builtin').diagnostics, opts)
        vim.keymap.set('n', 'llh', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, opts)
    end,
})

-- ==========================================
-- Native vim.lsp.config Setup
-- ==========================================

local capabilities = require('blink.cmp').get_lsp_capabilities()

-- Global defaults
vim.lsp.config('*', {
    capabilities = capabilities,
})

vim.lsp.config('rust_analyzer', {
    cmd = { 'rust-analyzer' },
    filetypes = { 'rust' },
    root_markers = { 'Cargo.toml', 'Cargo.lock', '.git' },
    settings = {
        ["rust-analyzer"] = {
            cargo = { buildScripts = { enable = true } }
        }
    }
})

vim.lsp.config('pylsp', {
    cmd = { 'pylsp' },
    filetypes = { 'python' },
    root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', '.git' },
    settings = {
        pylsp = {
            plugins = { pycodestyle = { ignore = { 'E501' } } }
        }
    }
})

vim.lsp.config('lua_ls', {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false },
        },
    },
})

vim.lsp.config('ts_ls', {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
    settings = {
        javascript = { format = { indentSize = 2 } },
    }
})

vim.lsp.config('html', {
    cmd = { 'vscode-html-language-server', '--stdio' },
    filetypes = { 'html', 'svelte' },
    root_markers = { 'package.json', '.git' },
})

vim.lsp.config('cssls', {
    cmd = { 'vscode-css-language-server', '--stdio' },
    filetypes = { 'css', 'scss', 'less', 'svelte' },
    root_markers = { 'package.json', '.git' },
})

vim.lsp.config('tailwindcss', {
    cmd = { 'tailwindcss-language-server', '--stdio' },
    filetypes = { 'html', 'css', 'scss', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' },
    root_markers = { 'tailwind.config.js', 'tailwind.config.ts', 'package.json', '.git' },
})

vim.lsp.config('svelte', {
    cmd = { 'svelteserver', '--stdio' },
    filetypes = { 'svelte' },
    root_markers = { 'svelte.config.js', 'svelte.config.ts', 'package.json', '.git' },
})


-- disable automatic server setup
-- vim.lsp.enable({
--     'rust_analyzer',
--     'pylsp',
--     'lua_ls',
--     'ts_ls',
--     'html',
--     'cssls',
--     'tailwindcss',
--     'svelte',
-- })
