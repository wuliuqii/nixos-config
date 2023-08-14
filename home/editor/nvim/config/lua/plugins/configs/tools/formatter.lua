return function()
  require("formatter").setup({
    -- Enable or disable logging
    logging = true,
    -- Set the log level
    log_level = vim.log.levels.INFO,
    -- All formatter configurations are opt-in
    filetype = {
      lua = {
        require("formatter.filetypes.lua").stylua,
      },
      rust = {
        require("formatter.filetypes.rust").rustfmt,
      },
      go = {
        require("formatter.filetypes.go").gofmt,
      },
      nix = {
        require("formatter.filetypes.nix").nixpkgs_fmt,
      },
      markdown = {
        require("formatter.filetypes.markdown").prettier,
      },
    },
  })

  vim.keymap.set("n", "<leader>lf", "<Cmd>FormatWrite<CR>", { desc = "Format file" })
  vim.keymap.set("v", "<leader>lf", "<Cmd>FormatWrite<CR>", { desc = "Format visual selection" })
end
