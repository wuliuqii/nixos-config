return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
    },
  },

  -- {
  --   "nvim-lualine/lualine.nvim",
  --   event = "VeryLazy",
  --   opts = function(_, opts)
  --     table.insert(opts.options, {
  --       theme = "catppuccin",
  --       globalstatus = true,
  --       disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
  --   })
  --   end,
  -- },
}
