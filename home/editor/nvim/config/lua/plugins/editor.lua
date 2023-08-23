return {
	-- Neo-tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		cmd = "Neotree",
		keys = {
			{ "<leader>oe", "<cmd>Neotree toggle<cr>", desc = "Explorer NeoTree" },
		},
		opts = {
			window = {
				width = 30,
				auto_expand_width = true,
			},
		},
	},

	-- Search/Replace
	{
		"nvim-pack/nvim-spectre",
		cmd = "Spectre",
		opts = { open_cmd = "noswapfile vnew" },
		keys = {
			{
				"<leader>sr",
				function()
					require("spectre").open()
				end,
				desc = "Replace in files (Spectre)",
			},
		},
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-telescope/telescope-symbols.nvim",
			"nvim-telescope/telescope-project.nvim",
		},
		config = function()
			require("telescope").setup({
				pickers = {
					current_buffer_fuzzy_find = {
						winblend = 10,
						preview_title = false,
						results_title = false,
						theme = "ivy",
						layout_config = {
							height = 15,
						},
					},
					commands = {
						theme = "dropdown",
						layout_config = {
							anchor = "N",
						},
					},
					colorscheme = {
						enable_preview = true,
						theme = "dropdown",
						layout_config = {
							anchor = "N",
						},
					},
				},
				extensions = {
					["file_browser"] = {
						dir_icon = "",
						-- disables netrw and use telescope-file-browser in its place
						hijack_netrw = true,
						mappings = {
							["i"] = {
								["<M-CR>"] = require("telescope").extensions.file_browser.actions.create_from_prompt, -- Change to <S-CR> when appropriate terminal emulator is installed
							},
						},
					},
					["ui-select"] = {
						theme = "dropdown",
					},
					project = {
						base_dirs = {
							"~/src",
						},
					},
				},
			})

			-- load extensions
			require("telescope").load_extension("file_browser")
			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("notify")
			require("telescope").load_extension("project")

			-- keymaps
			local builtin = require("telescope.builtin")
			local extensions = require("telescope").extensions
			local plenary_job = require("plenary.job")

			-- Built-in keymaps
			local function fuzzy_find_under_cursor()
				local word_under_cursor = vim.fn.expand("<cword>")
				builtin.current_buffer_fuzzy_find({ default_text = word_under_cursor })
			end

			vim.keymap.set("n", "<leader>.", function()
				local git_toplevel =
					plenary_job:new({ command = "git", args = { "rev-parse", "--show-toplevel" } }):sync()[1]
				builtin.find_files({ cwd = git_toplevel })
			end, { desc = "Find files" })
			vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Git files" })
			vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
			vim.keymap.set("n", "<leader>/", function()
				local git_toplevel =
					plenary_job:new({ command = "git", args = { "rev-parse", "--show-toplevel" } }):sync()[1]
				builtin.live_grep({ cwd = git_toplevel })
			end, { desc = "Live grep in project" })
			vim.keymap.set("n", "<leader>,", builtin.buffers, { desc = "Open buffers" })
			vim.keymap.set("n", "<leader>hk", builtin.keymaps, { desc = "Describe keymaps" })
			vim.keymap.set("n", "<leader>hh", builtin.help_tags, { desc = "Help tags" })
			vim.keymap.set("n", "<leader>hm", builtin.man_pages, { desc = "Man pages" })
			vim.keymap.set("n", "<leader>st", builtin.colorscheme, { desc = "Select theme" })
			-- vim.keymap.set("n", "/", builtin.current_buffer_fuzzy_find, { desc = "Fuzzy find in file" })
			vim.keymap.set("n", "*", fuzzy_find_under_cursor, { desc = "Fuzzy find in file" })
			vim.keymap.set("n", "#", fuzzy_find_under_cursor, { desc = "Fuzzy find in file" })

			-- Extensions keymaps
			vim.keymap.set("n", "<leader>ff", extensions.file_browser.file_browser, { desc = "File browser" })
			vim.keymap.set("n", "<leader>pp", extensions.project.project, { desc = "Project" })
			-- vim.keymap.set("n", "<M-x>", "<cmd>Telescope commands<cr>", { desc = "Commands" })
		end,
	},

	-- Flash, quickly jump to s specific location.
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "o", "x" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},

	-- Flash Telescope config
	{
		"nvim-telescope/telescope.nvim",
		optional = true,
		opts = function(_, opts)
			local function flash(prompt_bufnr)
				require("flash").jump({
					pattern = "^",
					label = { after = { 0, 0 } },
					search = {
						mode = "search",
						exclude = {
							function(win)
								return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
							end,
						},
					},
					action = function(match)
						local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
						picker:set_selection(match.pos[1] - 1)
					end,
				})
			end
			opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
				mappings = {
					n = { s = flash },
					i = { ["<c-s>"] = flash },
				},
			})
		end,
	},

	-- Buffer remove
	{
		"echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = {
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
    },
	},

	-- Move
	{
		"fedepujol/move.nvim",
		event = "BufEnter",
		keys = {
			{ "<M-Down>", "<Cmd>MoveLine(1)<CR>", desc = "Move line up" },
			{ "<M-Up>", "<Cmd>MoveLine(-1)<CR>", desc = "Move line down" },
			{ "<M-Left>", "<Cmd>MoveWord(-1)<CR>}", desc = "Move word left" },
			{ "<M-Right>", "<Cmd>MoveWord(1)<CR>}", desc = "Move word right" },

			-- Visual-mode commands
			{ "<M-Up>", "<Cmd>MoveBlock(-1)<CR>", mode = "v", desc = "Move block up" },
			{ "<M-Down>", "<Cmd>MoveBlock(1)<CR>", mode = "v", desc = "Move block down" },
			{ "<M-Left>", "<Cmd>MoveHBlock(-1)<CR>", mode = "v", desc = "Move block left" },
			{ "<M-Right>", "<Cmd>MoveHBlock(1)<CR>", mode = "v", desc = "Move block right" },
		},
	},

	-- nvim-ufo
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
		},
		event = "BufReadPost",
		config = function()
			require("ufo").setup({
				provider_selector = function(bufnr, filetype, buftype)
					return { "treesitter", "indent" }
				end,
			})
		end,
	},

  -- undo tree
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keys = {
      { "<leader>ou", "<cmd>UndotreeToggle<cr>", desc = "Undo Tree" },
    }
  }
}
