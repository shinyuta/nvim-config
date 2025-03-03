return {
	"gbprod/yanky.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("yanky").setup({
			ring = {
				storage = "shada",
			},
		})
	end,
}
