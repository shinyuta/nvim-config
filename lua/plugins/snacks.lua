return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = false },

		-- DASHBOARD
		dashboard = {
			enabled = true,
			preset = {
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
				header = [[



███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
			},
			sections = {
				{ section = "header" },

				{ section = "startup", gap = 0, padding = 2, pane = 1 }, -- Ensures same gap as Git Status

				{ section = "keys", gap = 1, padding = 2 },

				{
					pane = 1,
					icon = " ",
					desc = "Browse Repo",
					padding = 1,
					key = "b",
					action = function()
						Snacks.gitbrowse()
					end,
				},

				function()
					local in_git = Snacks.git.get_root() ~= nil
					local cmds = {
						{
							icon = " ",
							title = "Git Status",
							cmd = "git --no-pager diff --stat -B -M -C",
							height = 10,
						},
					}
					return vim.tbl_map(function(cmd)
						return vim.tbl_extend("force", {
							section = "terminal",
							enabled = in_git,
							padding = 1, -- Reduce extra space
							gap = 1, -- Add small gap under Git Status (same as keys)
							ttl = 5 * 60,
							indent = 3,
						}, cmd)
					end, cmds)
				end,

				{
					section = "terminal",
					cmd = "echo -e '\n' && ascii-image-converter ~/.config/nvim/jinxdash.png --color --complex",
					random = 10,
					pane = 2,
					indent = 4,
					height = 30,
				},
			},
		},

		-- test
		notifier = {
			enabled = true,
			timeout = 2000, -- default timeout in ms
			width = { min = 40, max = 0.6 },
			height = { min = 1, max = 0.6 },
			style = "compact",
		},

		explorer = { enabled = false },
		indent = { enabled = false },
		input = { enabled = false },
		picker = { enabled = false },

		-- QUICKFILE
		quickfile = { enabled = true },

		scope = { enabled = false },
		scroll = { enabled = false },
		statuscolumn = { enabled = false },
		words = { enabled = false },

		-- STYLES
		styles = {
			notification = {
				wo = { wrap = true }, -- Wrap notifications
			},
		},
	},
}
