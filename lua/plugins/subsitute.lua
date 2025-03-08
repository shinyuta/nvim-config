return {
	"gbprod/substitute.nvim",
	event = { "BufReadPre", "BufNewFile" }, -- Only load for regular buffers
	opts = {
		-- your actual plugin config goes here (if you have any)
	},
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "snacks_dashboard",
			callback = function()
				vim.b.substitute_disable = true
			end,
		})
	end,
}
