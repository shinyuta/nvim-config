return {
	"sphamba/smear-cursor.nvim",

	opts = {
		cursor_color = "#d3cdc3",
		stiffness = 0.5,
		trailing_stiffness = 0.49,
		never_draw_over_target = false,

		-- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
		-- Smears will blend better on all backgrounds.
		legacy_computing_symbols_support = true,
	},
}
