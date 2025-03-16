require("dracula").setup({
    transparent_bg = false, -- Set to `true` for transparency
    italic_comment = true,  -- Enable italic comments
    overrides = {
        LineNr = { fg = "#6272a4" }, -- Change line number color
    }
})
vim.cmd("colorscheme dracula") -- Apply theme after setup