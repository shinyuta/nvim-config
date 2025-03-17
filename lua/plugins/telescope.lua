return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local previewers = require("telescope.previewers")
			local actions = require("telescope.actions")
			local themes = require("telescope.themes")

			-- 🛠️ Custom Previewer (Skips Large Files)
			local new_maker = function(filepath, bufnr, opts)
				opts = opts or {}

				-- Check file size
				local stat = vim.loop.fs_stat(filepath)
				if stat and stat.size > 100 * 1024 then
					-- File is too large for preview
					return vim.schedule(function()
						vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "⚠️  File too large to preview" })
					end)
				end

				-- Default preview behavior for everything else
				previewers.buffer_previewer_maker(filepath, bufnr, opts)
			end

			require("telescope").setup({
				defaults = {
					layout_strategy = "bottom_pane", -- Minimal layout by default
					layout_config = {
						height = 0.70, -- Default height (overridden by keymaps)
					},
					sorting_strategy = "ascending",
					prompt_prefix = "🔍 ", -- Cleaner prompt
					selection_caret = "❯ ", -- Minimal selection indicator
					mappings = {
						n = {
							["d"] = actions.delete_buffer, -- Delete buffer with "d"
							["q"] = actions.close, -- Quit with "q"
						},
					},
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
						themes.get_ivy({ layout_config = { height = 0.75 } }),
					},
				},
			})

			require("telescope").load_extension("ui-select")

			-- 🔄 **Fix for `<C-b>` not working after `fz` or `fp`**
			vim.api.nvim_create_autocmd("WinLeave", {
				pattern = "*",
				callback = function()
					if vim.bo.filetype == "TelescopePrompt" then
						vim.cmd("stopinsert") -- Prevents telescope from blocking `<C-b>`
					end
				end,
			})

			-- 🌈 Custom Telescope Highlights
			local TelescopePrompt = {
				TelescopePromptTitle = { fg = "#FD77DD", bg = "none" },
				TelescopePreviewTitle = { fg = "#FD77DD", bg = "none" },
				TelescopeResultsTitle = { fg = "#FD77DD", bg = "none" },
				TelescopePromptBorder = { fg = "#FD77DD", bg = "none" },
				TelescopePreviewBorder = { fg = "#FD77DD", bg = "none" },
				TelescopeResultsBorder = { fg = "#FD77DD", bg = "none" },
			}
			for hl, col in pairs(TelescopePrompt) do
				vim.api.nvim_set_hl(0, hl, col)
			end
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
}
