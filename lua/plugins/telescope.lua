return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local previewers = require("telescope.previewers")

			-- Custom previewer to skip large files and binaries
			local new_maker = function(filepath, bufnr, opts)
				opts = opts or {}

				-- Check file size
				local stat = vim.loop.fs_stat(filepath)
				if stat and stat.size > 100 * 1024 then
					-- File is too large for preview
					return vim.schedule(function()
						vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "⚠️ File too large to preview" })
					end)
				end

				-- Default preview behavior for everything else
				previewers.buffer_previewer_maker(filepath, bufnr, opts)
			end

			require("telescope").setup({
				defaults = {
					buffer_previewer_maker = new_maker,
					file_ignore_patterns = {
						"node_modules/.*",
						".git/.*",
						"%.jpg",
						"%.jpeg",
						"%.png",
						"%.svg",
						"%.gif",
						"%.pdf",
						"%.zip",
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")

			-- Optional aesthetic tweaks (kept from your config)
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
		-- This is covered in the main telescope config, but can be left here if you want explicit control
	},
}
