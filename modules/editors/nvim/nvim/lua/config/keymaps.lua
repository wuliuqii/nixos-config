-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("i", "jk", "<Esc>", { desc = "Better esc" } )
map("n", ";", ":", { desc = "Better command mod" } )
map("n", "<C-x>", ":bd<cr>", { desc = "Close buffer" })
map("n", "<C-q>", ":qa<cr>", { desc = "Close all" })

-- better move
map("i", "<C-b>", "<Ecs>^i", { desc = "Better left" } )
map("i", "<C-e>", "<End>", { desc = "Better left" } )
map("i", "<C-h>", "<Left>", { desc = "Better left" } )
map("i", "<C-l>", "<Right>", { desc = "Better right" } )
map("i", "<C-j>", "<Down>", { desc = "Better down" } )
map("i", "<C-k>", "<Up>", { desc = "Better up" } )

