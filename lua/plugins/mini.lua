return {
	"echasnovski/mini.nvim",
	version = "*",
	config = function()
		require("mini.statusline").setup({
			use_icons = true,
			content = {
				active = function()
					local mode = MiniStatusline.section_mode({ trunc_width = 120 })

					-- Dynamically color the mode text, no background
					local current_mode = vim.fn.mode()
					local hl = ""

					if current_mode == "n" then
						hl = "%#MiniStatuslineModeNormal#"
					elseif current_mode == "i" then
						hl = "%#MiniStatuslineModeInsert#"
					elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
						hl = "%#MiniStatuslineModeVisual#"
					elseif current_mode == "R" then
						hl = "%#MiniStatuslineModeReplace#"
					elseif current_mode == "c" then
						hl = "%#MiniStatuslineModeCommand#"
					end

					-- Statusline layout (with transparent center)
					return table.concat({
						hl .. mode .. "%*", -- Colored mode text (no background)
						"  ",
						MiniStatusline.section_git({ trunc_width = 75 }),
						"  ",
						MiniStatusline.section_filename({ trunc_width = 140 }),
						"%=",
						MiniStatusline.section_fileinfo({ trunc_width = 120 }),
						"  ",
						MiniStatusline.section_location({ trunc_width = 75 }),
					})
				end,
			},
		})

		-- Define mode text colors (no background, just foreground color)
		vim.api.nvim_set_hl(0, "MiniStatuslineModeNormal", { fg = "#54C1DB", bg = "none", bold = true })
		vim.api.nvim_set_hl(0, "MiniStatuslineModeInsert", { fg = "#A9DD48", bg = "none", bold = true })
		vim.api.nvim_set_hl(0, "MiniStatuslineModeVisual", { fg = "#FD77DD", bg = "none", bold = true })
		vim.api.nvim_set_hl(0, "MiniStatuslineModeReplace", { fg = "#ff3045", bg = "none", bold = true })
		vim.api.nvim_set_hl(0, "MiniStatuslineModeCommand", { fg = "#f5dd58", bg = "none", bold = true })
		vim.api.nvim_set_hl(0, "MiniStatuslineFilename", { fg = "#d8dee9", bg = "none" })
		vim.api.nvim_set_hl(0, "MiniStatuslineInactive", { fg = "#100F14", bg = "none" })

		-- Other Mini modules
		require("mini.comment").setup()
		require("mini.indentscope").setup()
		require("mini.surround").setup()
		require("mini.pairs").setup()
		require("mini.ai").setup()
	end,
}
