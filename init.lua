-- Set runtime path for lazy.nvim
vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")

-- Plugin setup
require("lazy").setup({
    -- LSP & Autocomplete
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "L3MON4D3/LuaSnip" },
    { "saadparwaiz1/cmp_luasnip" },

    -- Syntax highlighting & UI
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "Mofiqul/dracula.nvim" },

    -- Utility
    { "preservim/nerdtree" },
    { "windwp/nvim-autopairs" },
    { "nvim-lualine/lualine.nvim" },  -- Status bar
    { "nvim-tree/nvim-web-devicons" }, -- Icons for a better look
    { "github/copilot.vim" }
})

-- Load configurations
require("lsp")
require("cmp_setup")
require("autopairs")
require("statusline")  -- Load statusline config
require("dracula_theme")    -- Load theme config

-- UI Improvements
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Open NERDTree automatically if no files are provided
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if vim.fn.argc() == 0 then
            vim.cmd("NERDTree")
        end
    end
})

-- Auto-format on save for C/C++/Python/TypeScript/Go
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.c", "*.cpp", "*.h", "*.py", "*.ts", "*.go" },
    callback = function()
        vim.lsp.buf.format({ async = true })
    end,
})
