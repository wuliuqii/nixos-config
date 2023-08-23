return {
	-- Catppuccin
	{
		"catppuccin/nvim",
		lazy = true,
	},
	-- Material
	{
		"marko-cerovac/material.nvim",
		lazy = true,
		config = function()
			require("material").setup({
				plugins = { -- Uncomment the plugins that you use to highlight them
					-- Available plugins:
					"dap",
					"dashboard",
					"gitsigns",
					"hop",
					"indent-blankline",
					"lspsaga",
					"mini",
					"neogit",
					"neorg",
					"nvim-cmp",
					"nvim-navic",
					"nvim-tree",
					"nvim-web-devicons",
					"sneak",
					"telescope",
					"trouble",
					"which-key",
				},
			})

			vim.api.nvim_create_user_command("MaterialSelect", require("material.functions").find_style, {})
		end,
	},
	-- One Dark
	{
		"olimorris/onedarkpro.nvim",
		lazy = true,
	},
	-- Monokai Pro
	{
		"loctvl842/monokai-pro.nvim",
		lazy = true,
	},
	-- Dracula
	{
		"Mofiqul/dracula.nvim",
		lazy = true,
	},
	-- Adwaita
	{
		"Mofiqul/adwaita.nvim",
		lazy = true,
	},
	-- Kanagawa
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
	},
	-- Gruvbox Material
	{
		"ellisonleao/gruvbox.nvim",
		lazy = true,
	},
	-- VSCode (Dark+ and Light+)
	{
		"Mofiqul/vscode.nvim",
		lazy = true,
	},
	-- Melange
	{
		"savq/melange-nvim",
		lazy = true,
	},
	-- Nord
	{
		"shaunsingh/nord.nvim",
		lazy = true,
	},
	-- Nightfly
	{
		"bluz71/vim-nightfly-colors",
		lazy = true,
	},
	-- Moonfly
	{
		"bluz71/vim-moonfly-colors",
		lazy = true,
	},
	-- Tokyonight
	{
		"folke/tokyonight.nvim",
		lazy = true,
	},
	-- Oxacarbon
	{
		"nyoom-engineering/oxocarbon.nvim",
		lazy = true,
	},
	-- GitHub Nvim Theme
	{
		"projekt0n/github-nvim-theme",
		lazy = true,
	},
	-- Nightfox
	{
		"EdenEast/nightfox.nvim",
		lazy = true,
	},
	-- Rosé Pine
	{
		"rose-pine/neovim",
		lazy = true,
	},
	-- Bluloco
	{
		"uloco/bluloco.nvim",
		lazy = true,
		dependencies = { "rktjmp/lush.nvim" },
	},
	-- Solarized
	{
		"maxmx03/solarized.nvim",
		lazy = true,
	},
}
