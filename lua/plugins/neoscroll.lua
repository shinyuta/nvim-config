-- Smooth scrolling.
return {
	"karb94/neoscroll.nvim",
	config = function()
		require("neoscroll").setup({
			performance_mode = true, -- Disable "Performance Mode" on all buffers.
		})
	end,
}
