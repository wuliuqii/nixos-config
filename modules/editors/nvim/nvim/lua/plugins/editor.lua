return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<C-n>", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
      { "<leader>e", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
    },
    opts = {
      window = {
        width = 30,
        auto_expand_width = true,
      },
    },
  },
}
