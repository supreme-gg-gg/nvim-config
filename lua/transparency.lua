local M = {}

function M.toggle_transparency()
    local hl_normal = vim.api.nvim_get_hl(0, { name = "Normal" })
    if hl_normal.bg then
        -- Remove background for transparency
        vim.api.nvim_set_hl(0, "Normal", { bg = nil })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = nil })
        print("Transparency Enabled")
    end
end

return M
