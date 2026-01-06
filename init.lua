-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

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
    { "github/copilot.vim" },
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

vim.api.nvim_create_user_command("Fe", function()
    -- Open NERDTree
    vim.cmd("NERDTreeToggle")
end, {})

-- Auto-format on save for C/C++/Python/TypeScript/Go
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.c", "*.cpp", "*.h", "*.py", "*.ts", "*.js", "*.go", "*.v" },
    callback = function()
        vim.lsp.buf.format({ async = true })
    end,
})
