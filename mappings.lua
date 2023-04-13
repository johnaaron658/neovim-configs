---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<leader>p"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<A-q>"] = { ":noh <CR>", "escpape", opts = { nowait = true } },
    ["q"] = { ":noh <CR>", "escape", opts = { nowait = true } },
    ["<A-a>"] = { "<C-w>h", "window left" },
    ["<A-d>"] = { "<C-w>l", "window right" },
    ["<A-s>"] = { "<C-w>j", "window down" },
    ["<A-w>"] = { "<C-w>k", "window up" },
    ["<leader>l"] = { "<cmd> vsplit <CR>", "vertical split" },
    ["<leader>["] = { "<cmd> Telescope find_files <CR>", "find files" },
    ["<C-_>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "toggle comment",
    },
  },
  v = {
    ["<C-_>"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "toggle comment",
    },
  }
}

-- more keybinds!

return M
