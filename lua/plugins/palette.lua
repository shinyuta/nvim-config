return {
	"roobert/palette.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("palette").setup({
			-- Place transparency and italics here at the top level
			transparent_background = true,
			italics = true,

			palettes = {
				main = "custom_main_palette",
				accent = "custom_accent_palette",
				state = "custom_state_palette",
			},

			custom_palettes = {
				main = {
					custom_main_palette = {
						color0 = "#191724", -- Background
						color1 = "#191724", -- Background behind cursor line
						color2 = "#232A4D", -- Less prominent
						color3 = "#FD77DD", -- Pink (for brackets, etc.)
						color4 = "#54C1DB", -- Blue (for parentheses, operators)
						color5 = "#FAF9F6", -- Main text color
						color6 = "#6a6a6a", -- Comment color
						color7 = "#A9DD48", -- Minor
						color8 = "#FAF9F6", -- Extra
					},
				},
				accent = {
					custom_accent_palette = {
						accent0 = "#A9DD48", -- for numbers like 1000 above.
						accent1 = "#FD77DD", -- when using v line, changes text color of highlighted.
						accent2 = "#D9D87E",
						accent3 = "#A9DD48",
						accent4 = "#A9DD48", -- things like booleans
						accent5 = "#C9A1D3",
						accent6 = "#B8A1D9",
					},
				},
				state = {
					custom_state_palette = {
						error = "#ff5555",
						warning = "#f5dd58",
						hint = "#D9D87E",
						ok = "#A5D9A7",
						info = "#FD77DD", -- console popup color, notify
					},
				},
			},
		})

		vim.cmd([[colorscheme palette]])
		vim.cmd("highlight LineNr guifg=#FFFFFF") -- added to change line numbers to white (color3)
	end,
}
