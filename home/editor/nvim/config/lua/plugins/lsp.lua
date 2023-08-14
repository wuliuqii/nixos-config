return {
  -- LSP config
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = require("lsp.lspconfig"),
    dependencies = {
      {
        "glepnir/lspsaga.nvim",
        config = require("lsp.lspsaga"),
        event = "LspAttach",
        dependencies = {
          { "nvim-tree/nvim-web-devicons" },
          { "nvim-treesitter/nvim-treesitter" },
        },
      },
      -- Navbuddy
      {
        "SmiteshP/nvim-navbuddy",
        config = require("lsp.navbuddy"),
        dependencies = {
          "SmiteshP/nvim-navic",
        },
      },
    },
  },

  -- Neodev
  {
    "folke/neodev.nvim",
    config = require("lsp.neodev"),
  },

  -- Mason
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>om", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {
      },
    },
  },
}
