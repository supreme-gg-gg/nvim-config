-- ~/.config/nvim/lua/file_explorer.lua
local neotree = require("neo-tree")

neotree.setup({
  sources = { "filesystem", "buffers", "git_status" },
  filesystem = {
    bind_to_cwd = false,
    follow_current_file = { enabled = true },
    use_libuv_file_watcher = true,
  },
  window = {
    mappings = {
      ["l"] = "open",
      ["h"] = "close_node",
      ["<space>"] = "none",
      ["Y"] = {
        function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          vim.fn.setreg("+", path, "c")
        end,
        desc = "Copy Path to Clipboard",
      },
      ["O"] = {
        function(state)
          require("lazy.util").open(state.tree:get_node().path, { system = true })
        end,
        desc = "Open with System Application",
      },
      ["P"] = { "toggle_preview", config = { use_float = false } },
    },
  },
})

-- ~/.config/nvim/lua/file_explorer.lua
vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("NeoTreeStartDirectory", { clear = true }),
  desc = "Start NeoTree with the directory",
  once = true,
  callback = function()
    if vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
      require("neo-tree.command").execute({ toggle = true, dir = vim.fn.argv(0) })
    end
  end,
})
