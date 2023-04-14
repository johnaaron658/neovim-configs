---@type NvPluginSpec[]
local plugins = {
  {
    "natecraddock/sessions.nvim",
    cmd = { "SessionsSave", "SessionsLoad", "SessionsStop", },
    config = function()
      require("sessions").setup({
        events = { "VimLeavePre", "WinEnter", "BufEnter" },
        session_filepath = vim.fn.stdpath("data") .. "/sessions",
        absolute = true,
      })
    end,
    lazy = false,
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeOpen", },
    lazy = false,
  },
  {
    "natecraddock/workspaces.nvim",
    config = function()
      require("workspaces").setup({
          hooks = {
          open = { 
              "NvimTreeOpen", 
              "Telescope find_files", 
          },
        }
      })
    end,
    lazy = false,
  },
  {
    'nvim-lua/plenary.nvim',
  },
  {
    'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = function()
      require("flutter-tools").setup {
        ui = {
          border = "rounded",
          notification_style = "native",
        },
        decorations = {
          statusline = {
            app_version = false,
            device = true,
          },
        },
        widget_guides = {
          enabled = true,
        },
        closing_tags = {
          highlight = "ErrorMsg",
          prefix = "//",
          enabled = true,
        },
        lsp = {
          color = {
            enabled = false,
            background = false,
            foreground = false,
            virtual_text = true,
            virtual_text_str = "■",
          },
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            enableSnippets = true,
          },
        },
        debugger = {
          enabled = true,
          run_via_dap = false,
        },
        -- dev_log = {
        --   enabled = true,
        --   open_cmd = "tabedit", -- command to use to open the log buffer
        -- },
      }
    end,
  },
  {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup()
    end
  },
}

return plugins
