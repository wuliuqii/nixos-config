return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- nix
        "rnix-lsp",

        -- go
        "gopls",
        "golangci-lint",
        "golangci-lint-langserver",
        "goimports-reviser",
        "golines",

        -- rust
        "rust-analyzer",
        "taplo",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rnix = {},
        gopls = {},
        golangci_lint_ls = {},
        rust_analyzer = {},
        taplo = {},
      },
    },
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls").builtins
      return {
        sources = {
          -- lua
          nls.formatting.stylua,

          -- nix
          nls.formatting.nixpkgs_fmt,

          -- go
          nls.formatting.gofmt,
          nls.formatting.golines,
          nls.formatting.goimports_reviser,
          nls.diagnostics.golangci_lint,

          -- rust
          nls.formatting.rustfmt,
          nls.formatting.taplo,
        },
      }
    end,
  },
}
