-- Smooth scrolling.
return {
	"karb94/neoscroll.nvim",
	config = function()
		require("neoscroll").setup({
			mappings = {}, -- disables all default mappings
			performance_mode = true, -- Disable "Performance Mode" on all buffers.
		})
	end,
}
