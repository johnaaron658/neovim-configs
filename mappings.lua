local M = {}

M.custom = {
  i = {
    ["<A-q>"] = {"<ESC>", "escape insert mode", opts = { nowait = true } }
  },

  n = {
    ["<A-q>"] = {"<ESC>", "escape insert mode", opts = { nowait = true } }
  }
}

return M
