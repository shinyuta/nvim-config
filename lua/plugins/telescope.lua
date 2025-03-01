return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")

			-- Optional aesthetic tweaks
			local TelescopePrompt = {
				TelescopePromptTitle = { fg = "#A9DD48", bg = "none" },
				TelescopePreviewTitle = { fg = "#A9DD48", bg = "none" },
				TelescopeResultsTitle = { fg = "#A9DD48", bg = "none" },
				TelescopePromptBorder = { fg = "#A9DD48", bg = "none" },
				TelescopePreviewBorder = { fg = "#A9DD48", bg = "none" },
				TelescopeResultsBorder = { fg = "#A9DD48", bg = "none" },
			}
			for hl, col in pairs(TelescopePrompt) do
				vim.api.nvim_set_hl(0, hl, col)
			end
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		-- Removed this entirely because it is now covered in the main telescope.nvim config
	},
}
