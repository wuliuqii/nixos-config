return {
  {
    "nvim-neorg/neorg",
    cmd = { "Neorg" },
    keys = {
      { "<leader>oo", "<cmd>Neorg workspace notes<cr>", desc = "Neorg workspace" },
    },
    run = ":Neorg sync-parsers",
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.completion"] = {
          config = { engine = "nvim-cmp" },
        },
        ["core.integrations.nvim-cmp"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/orgs",
            },
          },
        },
      },
    },
  },

  -- Neogit
  {
    "NeogitOrg/neogit",
    cmd = { "Neogit" },
    config = true,
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
    },
  },

  -- Neoformat
  {
    "mhartington/formatter.nvim",
    cmd = { "FormatWrite" },
    config = require("tools.formatter"),
    event = "VeryLazy",
  },

  -- Toggleterm
  {
    "akinsho/toggleterm.nvim",
    config = require("tools.toggleterm"),
  },

  -- Peek
  {
    "toppair/peek.nvim",
    config = require("tools.peek"),
    build = "deno task --quiet build:fast",
  },

  -- Diffview
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    config = true,
    keys = {
      { "<leader>gdo", "<cmd>DiffviewOpen<cr>", desc = "DiffView Open" },
      { "<leader>gdc", "<cmd>DiffviewClose<cr>", desc = "DiffView Close" },
      { "<leader>gdf", "<cmd>DiffviewClose<cr>", desc = "DiffView Toggle Files" },
    },
  },

  -- Which Key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
      defaults = {
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader>b"] = { name = "+buffer" },
        ["<leader>f"] = { name = "+file" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>h"] = { name = "+help" },
        ["<leader>l"] = { name = "+lsp" },
        ["<leader>n"] = { name = "+noice" },
        ["<leader>o"] = { name = "+open" },
        ["<leader>p"] = { name = "+project" },
        ["<leader>s"] = { name = "+search/select/session" },
        ["<leader>t"] = { name = "+tab" },
        ["<leader>w"] = { name = "+window" },
        ["<leader>x"] = { name = "+diagnostics" },
        ["<leader><TAB>"] = { name = "+tab" },
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts, _)
      wk.register(opts.defaults)
    end,
  },

  -- Measure startup time
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },

  -- Session management. This saves your session in the background,
  -- keeping track of open buffers, window arrangement, and more.
  -- You can restore sessions when returning through the dashboard.
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" } },
    -- stylua: ignore
    keys = {
      { "<leader>ss", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>sl", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>sd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
  },

  -- Library used by other plugins
  { "nvim-lua/plenary.nvim", lazy = true },
}
