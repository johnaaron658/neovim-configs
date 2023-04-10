local plugins = {
  {
    "dart-lang/dart-vim-plugin",
    ft = "dart",
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
      require("flutter-tools").setup {}
    end,
    ft = "dart",
  },
  {
    "natecraddock/workspaces.nvim",
    cmd = { "WorkspacesList", "WorkspacesAdd", "WorkspacesOpen", "WorkspacesRemove" },
    config = function()
    require("workspaces").setup {
      hooks = {
        open = "Telescope find_files",
      },
    }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
    end,  
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "dartls",
      },
    },
  }
}

return plugins
