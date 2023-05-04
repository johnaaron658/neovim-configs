local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
  {
    "neovim/nvim-lspconfig",
     dependencies = {
       "jose-elias-alvarez/null-ls.nvim",
       config = function()
         require "custom.configs.null-ls"
       end,
     },
     config = function()
        require "plugins.configs.lspconfig"
        require "custom.configs.lspconfig"
     end,
  },
  {
    "natecraddock/sessions.nvim",
    cmd = { "SessionsSave", "SessionsLoad", "SessionsStop", },
    config = function()
      require("sessions").setup({
        events = { "VimLeavePre", "WinEnter", "BufEnter" },
        session_filepath = ".nvim/session",
      })
    end,
    lazy = false,
  },
  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  {
    "natecraddock/workspaces.nvim",
    config = function()
      require("workspaces").setup({
          hooks = {
          open = {
              "NvimTreeOpen",
              "Telescope find_files",
              "SessionsLoad",
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
      require('neoscroll').setup({
        easing_function = "cubic",
      })
    end
  },
  {
   'github/copilot.vim',
    config = function ()
      require('copilot').setup {}
    end,
    cmd = {"Copilot"}
  },
  {
    'f-person/git-blame.nvim',
    cmd = {'GitBlameToggle', 'GitBlameEnable', 'GitBlameDisable',}
  }
}

return plugins
