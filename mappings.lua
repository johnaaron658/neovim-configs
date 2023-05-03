-- ---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<leader>p"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<A-q>"] = { "<CMD> noh <CR>", "escape", opts = { nowait = true } },
    ["<A-q>q"] = { "<CMD> qa <CR>", "escape", opts = { nowait = true } },
    ["q"] = { ":noh <CR>", "escape", opts = { nowait = true } },
    ["<A-a>"] = { "<C-w>h", "window left" },
    ["<A-d>"] = { "<C-w>l", "window right" },
    ["<A-s>"] = { "<C-w>j", "window down" },
    ["<A-w>"] = { "<C-w>k", "window up" },
    ["<C-s>"] = { "<cmd> w! <CR> <cmd> SessionsSave <CR>", "save file" },
    ["<A-e>"] = { function()
                    require("telescope").extensions.flutter.commands()
                  end,
                  "flutter run",
                },
    ["<A-j>"] = { "<cmd> split <CR>", "horizontal split" },
    ["<A-l>"] = { "<cmd> vsplit <CR>", "vertical split" },
    ["<A-k>"] = { "<C-w>q", "close horizontal split" },
    ["<A-h>"] = { "<C-w>q", "close vertical split" },
    ["<leader>ww"] = { "<cmd> WorkspacesOpen <CR>", "open workspace" },
    ["<leader>ws"] = { "<cmd> SessionsLoad <CR>", "open last session" },
    ["<leader>["] = { "<cmd> Telescope find_files <CR>", "find files" },
    ["<C-_>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "toggle comment",
    },
    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "lsp declaration",
    },

    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "lsp definition",
    },

    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "lsp hover",
    },

    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "lsp implementation",
    },

    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "lsp signature_help",
    },

    ["<leader>D"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "lsp definition type",
    },

    ["<F2>"] = {
      function()
        require("nvchad_ui.renamer").open()
      end,
      "lsp rename",
    },

    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "lsp code_action",
    },

    ["gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "lsp references",
    },

    ["<leader>f"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "floating diagnostic",
    },

    ["[d"] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      "goto prev",
    },

    ["]d"] = {
      function()
        vim.diagnostic.goto_next()
      end,
      "goto_next",
    },

    ["<leader>q"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "diagnostic setloclist",
    },

    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "lsp formatting",
    },

    ["<leader>wa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "add workspace folder",
    },

    ["<leader>wr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "remove workspace folder",
    },

    ["<leader>wl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "list workspace folders",
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
