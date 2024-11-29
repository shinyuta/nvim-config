return {
	"sphamba/smear-cursor.nvim",

	opts = {
		-- Smear cursor color. Defaults to Cursor GUI color
		cursor_color = "#d3cdc3",

		-- Smear cursor when switching buffers
		smear_between_buffers = false,

		-- Smear cursor when moving within line or to neighbor lines
		smear_between_neighbor_lines = true,

		-- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
		-- Smears will blend better on all backgrounds.
		legacy_computing_symbols_support = false,

		stiffness = 0.8, -- 0.6      [0, 1]
		trailing_stiffness = 0.6, -- 0.3      [0, 1]
		trailing_exponent = 0, -- 0.1      >= 0
		distance_stop_animating = 0.5, -- 0.1      > 0
		hide_target_hack = false, -- true     boolean
	},
}
