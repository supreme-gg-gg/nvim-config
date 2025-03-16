require("lualine").setup({
    options = {
        theme = "auto",  -- Change to "onedark", "tokyonight", etc.
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        icons_enabled = true,
    },
    sections = {
        lualine_a = { "mode" },  -- Shows Vim mode (NORMAL, INSERT, etc.)
        lualine_b = { "branch", "diff", "diagnostics" },  -- Git branch & LSP diagnostics
        lualine_c = { { "filename", path = 1 } },  -- Current file path
        lualine_x = { "encoding", "fileformat", "filetype" },  -- File encoding & type
        lualine_y = { "progress" },  -- Shows progress in file
        lualine_z = { "location" },  -- Shows cursor position
    },
})