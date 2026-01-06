local lspconfig = require('lspconfig')

-- LSP servers
lspconfig.clangd.setup {}
lspconfig.pyright.setup {}
lspconfig.ts_ls.setup {}       -- TypeScript/JavaScript LSP
lspconfig.gopls.setup {}      -- Go LSP
lspconfig.rust_analyzer.setup {} -- Rust LSP
lspconfig.verible.setup {
  cmd = {'verible-verilog-ls', '--rules_config_search'},
}

-- Keybindings for LSP features
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    end
})
