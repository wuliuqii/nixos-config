COLORSCHEME = "nord"

require("lazy").setup({
  require("plugins.editor"),
  require("plugins.themes"),
  require("plugins.tools"),
  require("plugins.ui"),
  require("plugins.coding"),
  require("plugins.treesitter"),
  require("plugins.lsp"),
}, {
  lockfile = "~/src/nixos-config/home/editor/nvim/config/" .. "/lazy-lock.json",
})

vim.cmd.colorscheme(COLORSCHEME)
