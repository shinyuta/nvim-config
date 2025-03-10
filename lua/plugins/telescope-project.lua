return {
	"nvim-telescope/telescope-project.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	lazy = true,
	config = function()
		require("telescope").setup({
			extensions = {
				project = {
					base_dirs = {
						{ path = "~/Desktop/notes/work", max_depth = 2 }, -- max_depth allows finding School itself
					},
					hidden_files = true,
					order_by = "recent",
					search_by = "title",
					theme = "dropdown",
				},
			},
		})

		require("telescope").load_extension("project")
	end,
}
