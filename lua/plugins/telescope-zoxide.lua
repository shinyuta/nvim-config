return {
	"jvgrootveld/telescope-zoxide",
	dependencies = { "nvim-telescope/telescope.nvim" },
	cmd = "Telescope", -- Lazy-load when running :Telescope
	config = function()
		require("telescope").load_extension("zoxide")
	end,
}
