return {
	"akinsho/toggleterm.nvim",
	version = "*",
	cmd = { "ToggleTerm", "TermExec" }, -- Lazy-load on use
	opts = {
		shade_terminals = true,
		direction = "float", -- Default mode is float (can be overridden per terminal)
		float_opts = {
			border = "curved",
		},
	},
}
