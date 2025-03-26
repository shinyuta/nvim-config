return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = {
			-- Required for parsing markdown
			"nvim-treesitter/nvim-treesitter",
		},
		-- Optionally, limit to markdown files:
		ft = { "markdown" },

		---@type render.md.UserConfig
		opts = {
			render_modes = true,
			anti_conceal = {
				enabled = true,
				-- Which elements to always show, ignoring anti conceal behavior. Values can either be booleans
				-- to fix the behavior or string lists representing modes where anti conceal behavior will be
				-- ignored. Possible keys are:
				--  head_icon, head_background, head_border, code_language, code_background, code_border
				--  dash, bullet, check_icon, check_scope, quote, table_border, callout, link, sign
				ignore = {
					code_background = true,
					sign = true,
				},
				above = 0,
				below = 0,
			},
			completions = {
				blink = {
					enabled = true,
				},
			},

			-- FORMATTING
			quote = { repeat_linebreak = true },
			checkbox = {
				unchecked = { icon = "✘ " },
				checked = { icon = "✔ " },
				custom = { todo = { rendered = "◯ " } },
			},
			code = {
				width = "block",
				left_margin = 0.5,
				left_pad = 0.2,
				right_pad = 0.2,
			},
			heading = {
				sign = false,
				position = "inline",
				width = "block",
				left_margin = 0.5,
				left_pad = 0.2,
				right_pad = 0.2,
			},
			paragraph = {
				left_margin = 0.5,
				min_width = 30,
			},
		},
	},
}
