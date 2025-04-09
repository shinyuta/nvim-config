return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional for icons
	event = "VeryLazy",
	config = function()
		require("fzf-lua").setup({
			defaults = {
				git_icons = false,
				file_icons = true,
				color_icons = false,
			},
			winopts = {
				height = 0.85,
				width = 0.80,
				row = 0.35,
				col = 0.50,
				border = "rounded",
				preview = {
					layout = "horizontal",
					default = "bat",
				},
			},
			keymap = {
				fzf = {
					["ctrl-z"] = "abort",
					["ctrl-u"] = "unix-line-discard",
					["ctrl-f"] = "half-page-down",
					["ctrl-b"] = "half-page-up",
				},
			},
		})
	end,
}
