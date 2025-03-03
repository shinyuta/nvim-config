return {
	"epwalsh/obsidian.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	ft = "markdown", -- Obsidian only works inside markdown files anyway
	cmd = { -- Explicitly load if you run an Obsidian command
		"ObsidianNew",
		"ObsidianToday",
		"ObsidianYesterday",
		"ObsidianSearch",
		"ObsidianFollowLink",
		"ObsidianBacklinks",
		"ObsidianOpen",
		"ObsidianQuickSwitch",
	},
	config = function()
		require("obsidian").setup({
			workspaces = {
				{
					name = "wiki",
					path = "~/Desktop/wiki",
				},
			},
			daily_notes = {
				folder = "daily",
				template = "daily.md",
			},
			templates = {
				folder = "templates",
			},
			completion = {
				nvim_cmp = true,
			},
		})
	end,
}
