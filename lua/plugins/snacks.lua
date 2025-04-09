return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = false },

		dashboard = {
			enabled = true,
			preset = {
				keys = {
					{ icon = "󰍂 ", key = "l", desc = "login", section = "session" },
					{
						icon = " ",
						key = "f",
						desc = "find",
						action = function()
							require("snacks").picker.files({
								layout = "telescope",
								win = {
									preview = {
										wo = { number = false, relativenumber = false }, -- disable line numbers in preview
									},
								},
							})
						end,
					},
					{ icon = " ", key = "q", desc = "quit", action = ":qa" },
				},
				header = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⡄⠀⠀⠀⠀⠀⠀⠀⣠⣄⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⡇⠀⠀⠀⠀⠀⠀⢰⣿⣿⡄⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⣿⣿⣿⡇⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢘⣿⣿⣿⣯⣤⣤⣤⣀⣀⣸⣿⣿⣿⡇⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⡿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⡏⢠⡦⠈⣿⣿⣿⣿⣿⣿⠟⠛⢻⣷⡄⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣦⣤⣾⣿⣿⣿⣿⣿⣿⠀⠿⢀⣿⣷⠄⠀⠀⠀
⢠⣄⠀⠀⠀⣼⣿⡆⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣿⣿⣿⡇⠀⠀⠀
⢸⣿⣷⣄⢀⣿⣿⣿⠀⠀⠀⢀⣿⣿⣿⠿⠋⠉⠁⠀⠀⠈⠉⠉⠻⢿⣿⣿⣿⣿⣿⣷⠀⠀⠀
⠀⣿⣿⠿⣿⣿⡿⣛⢷⠀⠀⢸⣿⣿⠏⢀⣤⣄⠀⣠⣤⡄⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣦⣄⠀
⠀⣿⣇⣀⣽⣿⣷⣤⣾⣧⠀⠘⣿⠏⠀⠛⠋⠙⠀⠛⠙⠛⠀⠾⠿⣷⢸⣿⣿⣿⣿⣿⣿⣿⡇
⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⡿⣿⣿⣿⣿⣿⡇
⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠐⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⡿⠁
⠀⢻⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠈⠢⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⡿⠋⠀⠀
⠀⠀⠉⠛⠛⠛⠛⠛⠛⠁⠀⠀⠀⠀⠀⠘⠻⢲⠦⠤⠤⠀⠀⠀⠀⣤⢴⡿⠟⠁⠀⠀⠀⠀⠀]],
			},
			sections = {
				{ section = "header", padding = 2 },
				{
					section = "startup",
					gap = 0,
					padding = 1,
					pane = 1,
					icon = " ",
				},
				{
					section = "keys",
					gap = 1,
					padding = 2,
				},
			},
		},

		animate = {
			enabled = true, -- ensure animations are active
			duration = 20, -- duration per step in ms
			easing = "linear", -- easing function (default is "linear")
			fps = 60, -- global frames per second for all animations
		},

		indent = {
			indent = {
				enabled = false, -- Turn off standard indent lines
			},
			scope = {
				enabled = true, -- Turn on scope lines
				priority = 200,
				char = "|",
				underline = false,
				only_current = true, -- Only show scope lines for the scope under cursor
				hl = "SnacksIndentScope",
			},
		},

		dim = {
			enabled = true,
			scope = {
				min_size = 5,
				max_size = 20,
				siblings = true,
			},
			animate = {
				enabled = vim.fn.has("nvim-0.10") == 1,
				easing = "outQuad",
				duration = {
					step = 20,
					total = 300,
				},
			},
			filter = function(buf)
				return vim.bo[buf].filetype ~= "markdown"
					and vim.g.snacks_dim ~= false
					and vim.b[buf].snacks_dim ~= false
					and vim.bo[buf].buftype == ""
			end,
		},

		notifier = {
			enabled = true,
			timeout = 2000,
			width = { min = 40, max = 0.6 },
			height = { min = 1, max = 0.6 },
			style = "compact",
		},

		explorer = { enabled = false },
		input = { enabled = false },

		picker = {
			enabled = true,
			ui_select = true, -- This makes snacks picker the default select interface
		},

		quickfile = { enabled = true },

		scroll = { enabled = false },

		statuscolumn = {
			enabled = true,
			left = { "mark", "sign" },
			right = { "fold", "git" },
			folds = {
				open = false,
				git_hl = false,
			},
			git = {
				patterns = { "GitSign", "MiniDiffSign" },
			},
			refresh = 50,
		},

		words = { enabled = false },

		styles = {
			notification = {
				wo = { wrap = true },
			},
		},
	},
}
